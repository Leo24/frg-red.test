<?php

if( !class_exists( 'ACF_NGGallery_Field' ) && class_exists( 'acf_Field' ) ) :

/**
 * Advanced Custom Fields - NGGallery Field add-on
 * 
 * @author Ales loziak <ales.loziak@gmail.com>
 * @version 1.2
 */
class ACF_NGGallery_Field extends acf_Field {
	/**
	 * Base directory
	 * @var string
	 */
	private $base_dir;
	
	/**
	 * Relative Uri from the WordPress ABSPATH constant
	 * @var string
	 */
	private $base_uri_rel;
	
	/**
	 * Absolute Uri
	 * 
	 * This is used to create urls to CSS and JavaScript files.
	 * @var string
	 */
	private $base_uri_abs;
	
	/**
	 * WordPress Localization Text Domain
	 * 
	 * The textdomain for the field is controlled by the helper class.
	 * @var string
	 */
	private $l10n_domain;
	
	/**
	 * Class Constructor - Instantiates a new NGGallery Field
	 * @param Acf $parent Parent Acf class
	 */
	public function __construct( $parent ) {
		//Call parent constructor
		parent::__construct( $parent );
		
		//Get the textdomain from the Helper class
		$this->l10n_domain = ACF_NGGallery_Field_Helper::L10N_DOMAIN;
		
		//Base directory of this field
		$this->base_dir = rtrim( dirname( realpath( __FILE__ ) ), '/' );
		
		//Build the base relative uri by searching backwards until we encounter the wordpress ABSPATH
		$root = array_pop( explode( '/', rtrim( ABSPATH, '/' ) ) );
		$path_parts = explode( '/', $this->base_dir );
		$parts = array();
		while( $part = array_pop( $path_parts ) ) {
			if( $part == $root )
				break;
			array_unshift( $parts, $part );
		}
		$this->base_uri_rel = '/' . implode( '/', $parts );
		$this->base_uri_abs = get_site_url( null, $this->base_uri_rel );
		
		$this->name  = 'nggallery-field';
		
		$post_title = ( !class_exists('nggdb') ) ? '. ' . __( 'NextGEN Gallery plugin is not installed or activated!', $this->l10n_domain ) : false;
		$this->title = __( 'NextGEN Gallery'.$post_title, $this->l10n_domain );
		
		add_action( 'admin_print_scripts', array( &$this, 'admin_print_scripts' ), 12, 0 );
		add_action( 'admin_print_styles',  array( &$this, 'admin_print_styles' ),  12, 0 );
	}
	
	/**
	 * Registers and enqueues necessary CSS
	 * 
	 * This method is called by ACF when rendering a post add or edit screen.
	 * We also call this method on the Acf Field Options screen as well in order
	 * to style our Field options
	 * 
	 * @see acf_Field::admin_print_styles()
	 */
	public function admin_print_styles() {
		global $pagenow;
//		wp_register_style( 'acf-nggallery-field', $this->base_uri_abs . '/nggallery-field.css' );
		
		if( in_array( $pagenow, array( 'post.php', 'post-new.php' ) ) ) {
//			wp_enqueue_style( 'acf-nggallery-field' );
		}
	}
	
	/**
	 * Registers and enqueues necessary JavaScript
	 * 
	 * This method is called by ACF when rendering a post add or edit screen.
	 * We also call this method on the Acf Field Options screen as well in order
	 * to add the necessary JavaScript for nggallery selection.
	 * 
	 * @see acf_Field::admin_print_scripts()
	 */
	public function admin_print_scripts() {
		global $pagenow;
//		wp_register_script( 'acf-nggallery-field', $this->base_uri_abs . '/nggallery-field.js', array( 'jquery' ) );
		
		if( in_array( $pagenow, array( 'post.php', 'post-new.php' ) ) ) {
//			wp_enqueue_script( 'acf-nggallery-field' );
		}
	}
	
	/**
	 * Populates the fields array with defaults for this field type
	 * 
	 * @param array $field
	 * @return array
	 */
	private function set_field_defaults( &$field ) {
		//$field[ 'nggallery' ]        = ( array_key_exists( 'nggallery', $field ) && isset( $field[ 'nggallery' ] ) ) ? $field[ 'nggallery' ] : 0;
		$field[ 'nggallery' ]		= 0;
		$field[ 'input_type' ]      = ( array_key_exists( 'input_type', $field ) && isset( $field[ 'input_type' ] ) ) ? $field[ 'input_type' ] : 'select';
		$field[ 'input_size' ]      = ( array_key_exists( 'input_size', $field ) && isset( $field[ 'input_size' ] ) ) ? (int) $field[ 'input_size' ] : 5;
		$field[ 'allow_null' ]		= isset($field['allow_null']) ? $field['allow_null'] : false;
		return $field;
	}
	
	/**
	 * Creates the nggallery field for inside post metaboxes
	 * 
	 * @see acf_Field::create_field()
	 */
	public function create_field( $field ) {
		global $ngg, $nggdb, $wp_query;
		
		$this->set_field_defaults( $field );
		
		$values = $field[ 'value' ];
		
		if ( !empty($values[0]) ):
			
			foreach ( $values as $form ) {
					
				if ( in_array ( 'gallery', $form ) )
					$values_gallery[]=$form['ngg_id'];
			
				if ( in_array ( 'album', $form ) )
					$values_album[]=$form['ngg_id'];
					
			}
			
		endif;
		
		if ( class_exists('nggdb') ) :
		
			// Settings of NextGEN Gallery SQL query
			$limit = 0;
			$start = 0;
			$order_by = 'title';
			$order_dir = 'ASC';
			
			// Seek to all NextGEN Galleries
			$gallerylist = $nggdb->find_all_galleries( $order_by, $order_dir , TRUE, $limit, $start, false);
			$albumlist = $nggdb->find_all_album( 'name', $order_dir, $limit, $start);
			
			$haystack = array( 'select', 'multiselect' );
			if( in_array( $field[ 'input_type' ],  $haystack ) ) :
			?>
				<select name="<?php echo $field[ 'name' ]; ?>[]" id="<?php echo $field[ 'name' ]; ?>" class="<?php echo $field[ 'class' ]; ?>" <?php echo ( $field[ 'input_type' ] == 'multiselect' ) ? 'multiple="multiple" size="' . $field[ 'input_size' ] . '"' : ''; ?>>
					<?php if($field['allow_null'] == '1') echo '
						<option value="null"> - Select - </option>';
					?>
					
					<optgroup label="<?php _e('Galleries','nggallery'); ?>">
					<?php foreach( $gallerylist as $gallery ) : ?>
						<option value="<?php echo $gallery->gid.',gallery'; ?>"<?php if ( $values_gallery ) selected( in_array( $gallery->gid, $values_gallery ) ); ?>><?php echo $gallery->title; ?></option>
					<?php endforeach; ?>
					</optgroup>
					<optgroup label="<?php _e('Albums','nggallery'); ?>">
					<?php foreach( $albumlist as $album ) : ?>
						<option value="<?php echo $album->id.',album'; ?>"<?php if ( $values_album ) selected( in_array( $album->id, $values_album ) ); ?>><?php echo $album->name; ?></option>
					<?php endforeach; ?>
					</optgroup>
				</select>
			<?php
			endif;
			
		else:
		?>
				<select name="<?php echo $field[ 'name' ]; ?>[]" id="<?php echo $field[ 'name' ]; ?>" class="<?php echo $field[ 'class' ]; ?>">
					<option value="0" disabled="true"><?php _e( 'NextGEN Gallery plugin is not installed or activated!', $this->l10n_domain ); ?></option>
				</select>
		<?php
		endif;
				
	}
	
	/**
	 * Builds the field options
	 * 
	 * @see acf_Field::create_options()
	 * @param string $key
	 * @param array $field
	 */
	public function create_options( $key, $field ) {
		$this->set_field_defaults( $field );
		
		?>
			<tr class="field_option field_option_<?php echo $this->name; ?>">
			<td class="label">
				<label><?php _e("Allow Null?",'acf'); ?></label>
			</td>
			<td>
				<?php 
				$this->parent->create_field(array(
					'type'	=>	'radio',
					'name'	=>	'fields['.$key.'][allow_null]',
					'value'	=>	$field['allow_null'],
					'choices'	=>	array(
						'1'	=>	'Yes',
						'0'	=>	'No',
					),
					'layout'	=>	'horizontal',
				));
				?>
			</td>
		</tr>
			<tr class="field_option field_option_<?php echo $this->name; ?>">
				<td class="label">
					<label><?php _e( 'Input Method' , $this->l10n_domain ); ?></label>
					<p class="description"><?php _e( '', $this->l10n_domain ); ?></p>
				</td>
				<td>
					<?php 
						$this->parent->create_field( array(
							'type'    => 'select',
							'name'    => "fields[{$key}][input_type]",
							'value'   => $field[ 'input_type' ],
							'class'   => "nggallery_input_type nggallery_input_type_{$key}",
							'choices' => array(
								'select'      => 'Select',
								'multiselect' => 'Multi-Select',
								//'token'       => 'Input Tokenizer',
							)
						) );
					?>
				</td>
			</tr>
			<tr id="nggallery_input_size[<?php echo $key; ?>]" class="field_option field_option_<?php echo $this->name; ?> nggallery_input_size nggallery_input_size_<?php echo $key; ?>">
				<td class="label">
					<label><?php _e( 'Multi-Select Size' , $this->l10n_domain ); ?></label>
					<p class="description"><?php _e( 'The number of rows to show at once in a multi-select.', $this->l10n_domain ); ?></p>
				</td>
				<td>
					<?php 
						$this->parent->create_field( array(
							'type'    => 'select',
							'name'    => "fields[{$key}][input_size]",
							'value'   => $field[ 'input_size' ],
							'choices' => array_combine( range( 3, 15, 2 ), range( 3, 15, 2 ) ),
						) );
					?>
				</td>
			</tr>
			<script type='text/javascript'> 
    
    			jQuery(document).ready(function() {
    				
    				if ( jQuery('.nggallery_input_type_<?php echo $key; ?>').val()=='select' ) jQuery('.nggallery_input_size_<?php echo $key; ?>').hide();
					else jQuery('.nggallery_input_size_<?php echo $key; ?>').show();
    				
    				jQuery('.nggallery_input_type_<?php echo $key; ?>').change(function() {
						if ( jQuery('.nggallery_input_type_<?php echo $key; ?>').val()=='select' ) jQuery('.nggallery_input_size_<?php echo $key; ?>').hide();
						else jQuery('.nggallery_input_size_<?php echo $key; ?>').show();
					});
    			});
				
			</script>
		<?php
	}
	
	/**
	 * (non-PHPdoc)
	 * @see acf_Field::update_value()
	 */
	public function update_value( $post_id, $field, $value ) {
			
		$this->set_field_defaults( $field );
		
		foreach( $value as $key=>$item ) {
			$items = explode( ',', $item );
			foreach( $items as $item ) {
				if( is_numeric( $item ) )
					$values[$key]['ngg_id'] = intval ( $item );
				else
					$values[$key]['ngg_form'] = strval( $item );
				}
		}
		
		parent::update_value( $post_id, $field, $values );
	}
	
	/**
	 * Returns the values of the field
	 * 
	 * @see acf_Field::get_value()
	 * @param int $post_id
	 * @param array $field
	 * @return mixed  
	 */
	public function get_value( $post_id, $field ) {
		$value = (array) parent::get_value( $post_id, $field );
		return $value;
	}
	
	/**
	 * Returns the value of the field for the advanced custom fields API
	 * 
	 * @see acf_Field::get_value_for_api()
	 * @param int $post_id
	 * @param array $field
	 * @return string
	 */
	public function get_value_for_api( $post_id, $field ) {
		return parent::get_value_for_api($post_id, $field);
	}
}

endif; //class_exists 'ACF_NGGallery_Field'

if( !class_exists( 'ACF_NGGallery_Field_Helper' ) ) :

/**
 * Advanced Custom Fields - nggallery Field Helper
 * 
 * @author Brian Zoetewey <brian.zoetewey@ccci.org>
 */
class ACF_NGGallery_Field_Helper {
	/**
	 * Singleton instance
	 * @var ACF_NGGallery_Field_Helper
	 */
	private static $instance;
	
	/**
	 * Returns the ACF_NGGallery_Field_Helper singleton
	 * 
	 * <code>$obj = ACF_NGGallery_Field_Helper::singleton();</code>
	 * @return ACF_NGGallery_Field_Helper
	 */
	public static function singleton() {
		if( !isset( self::$instance ) ) {
			$class = __CLASS__;
			self::$instance = new $class();
		}
		return self::$instance;
	}
	
	/**
	 * Prevent cloning of the ACF_NGGallery_Field_Helper object
	 * @internal
	 */
	private function __clone() {
	}
	
	/**
	* WordPress Localization Text Domain
	*
	* Used in wordpress localization and translation methods.
	* @var string
	*/
	const L10N_DOMAIN = 'acf-nggallery-field';
	
	/**
	 * Language directory path
	 * 
	 * Used to build the path for WordPress localization files.
	 * @var string
	 */
	private $lang_dir;
	
	/**
	 * Constructor
	 */
	private function __construct() {
		$this->lang_dir = rtrim( dirname( realpath( __FILE__ ) ), '/' ) . '/languages';
		
		add_action( 'init', array( &$this, 'register_field' ),  5, 0 );
		add_action( 'init', array( &$this, 'load_textdomain' ), 2, 0 );
	}
	
	/**
	 * Registers the Field with Advanced Custom Fields
	 */
	public function register_field() {
		if( function_exists( 'register_field' ) ) {
			register_field( 'ACF_NGGallery_Field', __FILE__ );
		}
	}
	
	/**
	 * Loads the textdomain for the current locale if it exists
	 */
	public function load_textdomain() {
		$locale = get_locale();
		$mofile = $this->lang_dir . '/' . self::L10N_DOMAIN . '-' . $locale . '.mo';
		load_textdomain( self::L10N_DOMAIN, $mofile );
	}
}
endif; //class_exists 'ACF_NGGallery_Field_Helper'

//Instantiate the Addon Helper class
ACF_NGGallery_Field_Helper::singleton();