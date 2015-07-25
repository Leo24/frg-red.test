<?php

class acf_field_ngg extends acf_field {
	
	
	/*
	*  __construct
	*
	*  This function will setup the field type data
	*
	*  @type	function
	*  @date	23/11/2014
	*  @since	2.1
	*
	*  @param	n/a
	*  @return	n/a
	*/
	
	function __construct() {
		
		// vars
		$this->name = 'ngg';
		$this->label = __('NextGEN Gallery', 'acf-ngg');
		$this->category = 'relational';
		
		$this->defaults = array(
			'input_type'		=> 'select',
			'allow_null'		=> 0,
			//'input_size'      => 5,
			'multiple'			=> 'select',
			'multiple_size'     => 5,
			'nextgen_type'		=> 'Galleries and Albums',
			'ui'				=> 0,
			'ajax'				=> 0,
			'placeholder'		=> '',
			'disabled'			=> 0,
			'readonly'			=> 0,
		);
		
		// ajax
		//add_action('wp_ajax_acf/fields/select/query',				array($this, 'ajax_query'));
		//add_action('wp_ajax_nopriv_acf/fields/select/query',		array($this, 'ajax_query'));
		
		// action
		add_action( 'admin_enqueue_scripts', array($this, 'admin_enqueue_scripts') );
		
		// do not delete!
    	parent::__construct();
		
	}
	
	
	/*
	*  query_posts
	*
	*  description
	*
	*  @type	function
	*  @date	22/10/14
	*  @since	2.1
	*
	*  @param	n/a
	*  @return	n/a
	*/
	
	/*
	
	function ajax_query() {
		
			
	}
	
	*/
	
	/*
	*  render_field_settings()
	*
	*  Create extra settings for your field. These are visible when editing a field
	*
	*  @type	action
	*  @since	2.1
	*  @date	23/11/14
	*
	*  @param	$field (array) the $field being edited
	*  @return	n/a
	*/
	
	function render_field_settings( $field ) {

		acf_render_field_setting( $field, array(
			'label'			=> __('Allow Null?', 'acf'),
			'instructions'	=> '',
			'type'			=> 'radio',
			'name'			=> 'allow_null',
			'layout'		=> 'horizontal',
			'choices'		=> array(
						'1' => __( 'Yes' ),
						'0' => __( 'No' )
                  )	
		));
		
		acf_render_field_setting( $field, array(
			'label'			=> __('Nextgen Type'),
			'instructions'	=> 'Allow or restrict the Nextgen selection type.',
			'type'			=> 'select',
			'name'			=> 'nextgen_type',
			'layout'		=> 'horizontal',
			'choices' => array(
                        'Galleries and Albums'	=> __( 'Galleries and Albums' ),
                        'Galleries'				=> __( 'Galleries' ),
                        'Albums'				=> __( 'Albums' )
                  )	
		));
		
		// multiple
		acf_render_field_setting( $field, array(
			'label'			=> __('Select multiple values?', 'acf'),
			'instructions'	=> '',
			'type'			=> 'select',
			//'name'			=> 'input_type',
			'name'			=> 'multiple',
			'class'			=> 'acf-ngg-input-method',
			'layout'		=> 'horizontal',
			'choices' => array(
                        'select'		=> __( 'Select' ),
                        'multiselect'	=> __( 'Multi-Select' )
                  )
		));
		
		//if ($field['multiple'] == 'multiple') :
		
			// multiple_size
			acf_render_field_setting( $field, array(
				'label'			=> __('Multi-Select Size'),
				'instructions'	=> 'The number of rows to show at once in a multi-select.',
				'type'			=> 'select',
				//'name'			=> 'input_size',
				'name'			=> 'multiple_size',
				'class'			=> ($field['multiple'] == 'select') ? 'ngg-select' : 'ngg-select',
				'layout'		=> 'horizontal',
				'choices'		=> array_combine( range( 3, 15, 2 ), range( 3, 15, 2 ) )
			));
			
		//endif;
		
		// ui
		/*acf_render_field_setting( $field, array(
			'label'			=> __('Stylised UI', 'acf'),
			'instructions'	=> '',
			'type'			=> 'radio',
			'name'			=> 'ui',
			'choices'		=> array(
				1				=> __("Yes",'acf'),
				0				=> __("No",'acf'),
			),
			'layout'	=>	'horizontal',
		));*/


	}
	
	/*
	*  ngg_get_galleries()
	*
	*  Get all the NextGen/NextCellent Galleries
	*
	*  @type	function
	*  @since	2.1
	*  @date	23/11/14
	*
	*  @param	n/a
	*  @return	array of galleries
	*/
	
	function ngg_get_galleries() {
		
		if ( class_exists('nggdb') ) {
      	
	        // Settings of NextGEN Gallery SQL query
	        $limit = 0;
	        $start = 0;
	        $order_by = 'title';
	        $order_dir = 'ASC';
	        $galleries = false;
			
	        // Seek to all NextGEN Galleries
	        $gallerylist = nggdb::find_all_galleries( $order_by, $order_dir, true, $limit, $start, false);
			return array( $gallerylist );
			
		}
		
	}
	
	
	/*
	*  ngg_get_albums()
	*
	*  Get all the NextGen/NextCellent Albums
	*
	*  @type	function
	*  @since	2.1
	*  @date	23/11/14
	*
	*  @param	n/a
	*  @return	array of albums
	*/
	
	function ngg_get_albums() {
		
		if ( class_exists('nggdb') ) {
      	
	        // Settings of NextGEN Albums SQL query
	        $limit = 0;
	        $start = 0;
	        $order_by = 'name';
	        $order_dir = 'ASC';
			
	        // Seek to all NextGEN Albums
	        $albums = nggdb::find_all_album( $order_by, $order_dir, $limit, $start);
			return array( $albums );
			
		}
		
	}
	
	
	
	/*
	*  render_field()
	*
	*  Create the HTML interface for your field
	*
	*  @param	$field (array) the $field being rendered
	*
	*  @type	action
	*  @since	2.1
	*  @date	23/11/14
	*
	*  @param	$field (array) the $field being edited
	*  @return	n/a
	*/
	
	function render_field( $field ) {
		
		$values_gallery = array();
        $values_album = array();
   
        $values = $field[ 'value' ];
		
		if ( !empty($values[0]) ) {
	        foreach ( $values as $form ) {
		        if ( in_array ( 'gallery', $form ) ) { $values_gallery[]=$form['ngg_id']; }
		        if ( in_array ( 'album', $form ) ) { $values_album[]=$form['ngg_id']; }
	        }
        }
		
		$galleries = $this->ngg_get_galleries();
		$galleries = $galleries[0];
		
		$albumlist = $this->ngg_get_albums();
		$albumlist = $albumlist[0];
		
	
		$field['placeholder']	= __("Select",'acf');
		
		
		
		// atts
		$atts = array(
			//'name'				=> $field['name'],
			'id'				=> $field['id'],
			'class'				=> $field['class'],
			'data-ui'			=> $field['ui'],
			'data-ajax'			=> $field['ajax'],
			'data-multiple'		=> $field['multiple'],
			'data-placeholder'	=> $field['placeholder'],
			'data-allow_null'	=> $field['allow_null']
		);
		
		// ui
		if( $field['ui'] ) {
		
			$atts['disabled'] = 'disabled';
			$atts['class'] .= ' acf-hidden';
			
		}
		
		// multiple
		if( $field['multiple'] == 'multiselect' ) {
		
			$atts['multiple']	= 'multiple';
			$atts['size']		= $field[ 'multiple_size' ];
			$atts['name']		.= '[]';
			
		} else {
			
			unset ($atts['multiple']);
		
		}
		
		// special atts
		foreach( array( 'readonly', 'disabled' ) as $k ) {
		
			if( !empty($field[ $k ]) ) {
			
				$atts[ $k ] = $k;
			}
			
		}
		
		// choices
		
		foreach( $galleries as $k => $v ) {
			if( is_array($v) ){
					
					// optgroup
					$els[] = array( 'type' => 'optgroup', 'label' => $v->title );
					
					if( !empty($v) ) {
						
						foreach( $v as $k2 => $v2 ) {
							
							$els[] = array( 'type' => 'option', 'value' => $k2, 'label' => $v2, 'selected' => in_array($k2, $field['value']) );
							
							$choices[] = $k2;
						}
						
					}
					
					$els[] = array( 'type' => '/optgroup' );
				
				} else {
					
					$els[] = array( 'type' => 'option', 'value' => $v->gid, 'label' => $v->title, 'selected' => in_array($v->gid, $field['value']) );
					
					$choices[$v->gid] = $v->title;
					
				}
		}
		
		
		// hidden input
		if( $field['ui'] ) {
			
			// find real value based on $choices and $field['value']
			//$real_value = array_intersect($field['value'], $choices);
		
			acf_hidden_input(array(
				'type'	=> 'hidden',
				'id'	=> $field['id'],
				'name'	=> $field['name'],
				'value'	=> implode(',', $choices)
			));
			
		} elseif( $field['multiple'] ) {
			
			acf_hidden_input(array(
				'type'	=> 'hidden',
				'name'	=> $field['name'],
			));
			
		}

		// html
		//print_r ($atts);
		echo '<select name="' . $field['name'] . '[]" ' . acf_esc_attr( $atts ) . '>';
		
		?>
		
            <?php if ( $field['nextgen_type'] == "Galleries and Albums" || $field['nextgen_type'] == "Galleries" ) : ?>
              
            <optgroup label="<?php _e('Galleries','nggallery'); ?>">
            	<?php foreach( $galleries as $gallery ) : ?>
            	<option value="<?php echo $gallery->gid; ?>,gallery"<?php if ( $values_gallery ) selected( in_array( $gallery->gid, $values_gallery ) ); ?>><?php echo $gallery->title; ?></option>
            	<?php endforeach; ?>
            </optgroup>
			<?php endif; ?>
			
			<?php if ( $field['nextgen_type'] == "Galleries and Albums" || $field['nextgen_type'] == "Albums" ) : ?>
			<optgroup label="<?php _e('Albums','nggallery'); ?>">
					<?php foreach( $albumlist as $album ) : ?>
				<option value="<?php echo $album->id.',album'; ?>"<?php if ( $values_album ) selected( in_array( $album->id, $values_album ) ); ?>><?php echo $album->name; ?></option>
				<?php endforeach; ?>
			</optgroup>
			<?php endif; ?>
			
		</select>
		<?php 

	}
	
		
	/*
	*  input_admin_enqueue_scripts()
	*
	*  This action is called in the admin_enqueue_scripts action on the edit screen where your field is created.
	*  Use this action to add CSS + JavaScript to assist your render_field() action.
	*
	*  @type	action (admin_enqueue_scripts)
	*  @since	3.6
	*  @date	23/01/13
	*
	*  @param	n/a
	*  @return	n/a
	*/

	
	
	function admin_enqueue_scripts() {
		
		$dir = plugin_dir_url( __FILE__ );
		
		// register & include JS
		wp_register_script( 'acf-ngg', "{$dir}js/input.js" );
		wp_enqueue_script('acf-ngg');
		
		
		// register & include CSS
		//wp_register_style( 'acf-ngg', "{$dir}css/acf-ngg.css" ); 
		//wp_enqueue_style('acf-ngg');
		
		
	}
	
	
	
	
	/*
	*  input_admin_head()
	*
	*  This action is called in the admin_head action on the edit screen where your field is created.
	*  Use this action to add CSS and JavaScript to assist your render_field() action.
	*
	*  @type	action (admin_head)
	*  @since	3.6
	*  @date	23/01/13
	*
	*  @param	n/a
	*  @return	n/a
	*/

	/*
		
	function input_admin_head() {
	
		
		
	}
	
	*/
	
	
	/*
   	*  input_form_data()
   	*
   	*  This function is called once on the 'input' page between the head and footer
   	*  There are 2 situations where ACF did not load during the 'acf/input_admin_enqueue_scripts' and 
   	*  'acf/input_admin_head' actions because ACF did not know it was going to be used. These situations are
   	*  seen on comments / user edit forms on the front end. This function will always be called, and includes
   	*  $args that related to the current screen such as $args['post_id']
   	*
   	*  @type	function
   	*  @date	6/03/2014
   	*  @since	5.0.0
   	*
   	*  @param	$args (array)
   	*  @return	n/a
   	*/
   	
   	/*
   	
   	function input_form_data( $args ) {
	   	
		
	
   	}
   	
   	*/
	
	
	/*
	*  input_admin_footer()
	*
	*  This action is called in the admin_footer action on the edit screen where your field is created.
	*  Use this action to add CSS and JavaScript to assist your render_field() action.
	*
	*  @type	action (admin_footer)
	*  @since	3.6
	*  @date	23/01/13
	*
	*  @param	n/a
	*  @return	n/a
	*/

	/*
		
	function input_admin_footer() {
	
		
		
	}
	
	*/
	
	
	/*
	*  field_group_admin_enqueue_scripts()
	*
	*  This action is called in the admin_enqueue_scripts action on the edit screen where your field is edited.
	*  Use this action to add CSS + JavaScript to assist your render_field_options() action.
	*
	*  @type	action (admin_enqueue_scripts)
	*  @since	3.6
	*  @date	23/01/13
	*
	*  @param	n/a
	*  @return	n/a
	*/

	/*
	
	function field_group_admin_enqueue_scripts() {
		
	}
	
	*/

	
	/*
	*  field_group_admin_head()
	*
	*  This action is called in the admin_head action on the edit screen where your field is edited.
	*  Use this action to add CSS and JavaScript to assist your render_field_options() action.
	*
	*  @type	action (admin_head)
	*  @since	3.6
	*  @date	23/01/13
	*
	*  @param	n/a
	*  @return	n/a
	*/

	/*
	
	function field_group_admin_head() {
	
	}
	
	*/


	/*
	*  load_value()
	*
	*  This filter is applied to the $value after it is loaded from the db
	*
	*  @type	filter
	*  @since	3.6
	*  @date	23/01/13
	*
	*  @param	$value (mixed) the value found in the database
	*  @param	$post_id (mixed) the $post_id from which the value was loaded
	*  @param	$field (array) the field array holding all the field options
	*  @return	$value
	*/
	
	/*
	
	function load_value( $value, $post_id, $field ) {
		
		return $value;
		
	}
	
	*/
	
	
	/*
	*  update_value()
	*
	*  This filter is applied to the $value before it is saved in the db
	*
	*  @type	filter
	*  @since	2.1
	*  @date	23/11/14
	*
	*  @param	$value (mixed) the value found in the database
	*  @param	$post_id (mixed) the $post_id from which the value was loaded
	*  @param	$field (array) the field array holding all the field options
	*  @return	$value
	*/
	
	
	
	function update_value( $value, $post_id, $field ) {
		
		$values = array();

	      foreach( $value as $key=>$item ) {
	         $items = explode( ',', $item );
	         foreach( $items as $item ) {
	            if ( is_numeric( $item ) )
	               $values[$key]['ngg_id'] = intval ( $item );
	            else
	               $values[$key]['ngg_form'] = strval( $item );
	            }
	      }
	
	      return $values;
		
	}
	
	
	
	
	/*
	*  format_value()
	*
	*  This filter is appied to the $value after it is loaded from the db and before it is returned to the template
	*
	*  @type	filter
	*  @since	2.1
	*  @date	23/11/14
	*
	*  @param	$value (mixed) the value which was loaded from the database
	*  @param	$post_id (mixed) the $post_id from which the value was loaded
	*  @param	$field (array) the field array holding all the field options
	*
	*  @return	$value (mixed) the modified value
	*/
		
	
	function format_value( $value, $post_id, $field ) {
		
		if ( $value[0]['ngg_form'] == 'null' ) {
	         $value = false;
		}

		// return
		return $value;
		
	}
	
	
	
	
	/*
	*  validate_value()
	*
	*  This filter is used to perform validation on the value prior to saving.
	*  All values are validated regardless of the field's required setting. This allows you to validate and return
	*  messages to the user if the value is not correct
	*
	*  @type	filter
	*  @date	11/02/2014
	*  @since	5.0.0
	*
	*  @param	$valid (boolean) validation status based on the value and the field's required setting
	*  @param	$value (mixed) the $_POST value
	*  @param	$field (array) the field array holding all the field options
	*  @param	$input (string) the corresponding input name for $_POST value
	*  @return	$valid
	*/
	
	/*
	
	function validate_value( $valid, $value, $field, $input ){
		
		// Basic usage
		if( $value < $field['custom_minimum_setting'] )
		{
			$valid = false;
		}
		
		
		// Advanced usage
		if( $value < $field['custom_minimum_setting'] )
		{
			$valid = __('The value is too little!','acf-FIELD_NAME'),
		}
		
		
		// return
		return $valid;
		
	}
	
	*/
	
	
	/*
	*  delete_value()
	*
	*  This action is fired after a value has been deleted from the db.
	*  Please note that saving a blank value is treated as an update, not a delete
	*
	*  @type	action
	*  @date	6/03/2014
	*  @since	5.0.0
	*
	*  @param	$post_id (mixed) the $post_id from which the value was deleted
	*  @param	$key (string) the $meta_key which the value was deleted
	*  @return	n/a
	*/
	
	/*
	
	function delete_value( $post_id, $key ) {
		
		
		
	}
	
	*/
	
	
	/*
	*  load_field()
	*
	*  This filter is applied to the $field after it is loaded from the database
	*
	*  @type	filter
	*  @date	23/01/2013
	*  @since	3.6.0	
	*
	*  @param	$field (array) the field array holding all the field options
	*  @return	$field
	*/
	
	/*
	
	function load_field( $field ) {
		
		return $field;
		
	}	
	
	*/
	
	
	/*
	*  update_field()
	*
	*  This filter is applied to the $field before it is saved to the database
	*
	*  @type	filter
	*  @date	23/01/2013
	*  @since	3.6.0
	*
	*  @param	$field (array) the field array holding all the field options
	*  @return	$field
	*/
	
	/*
	
	function update_field( $field ) {
		
		return $field;
		
	}	
	
	*/
	
	
	/*
	*  delete_field()
	*
	*  This action is fired after a field is deleted from the database
	*
	*  @type	action
	*  @date	11/02/2014
	*  @since	5.0.0
	*
	*  @param	$field (array) the field array holding all the field options
	*  @return	n/a
	*/
	
	/*
	
	function delete_field( $field ) {
		
		
		
	}	
	
	*/
	
	
}


// create field
new acf_field_ngg();

?>
