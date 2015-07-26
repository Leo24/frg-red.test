<?php

class acf_nggallery_field_plugin
{
   /**
   * WordPress Localization Text Domain
   *
   * Used in wordpress localization and translation methods.
   * @var string
   */
   const L10N_DOMAIN = 'acf-nggallery-field';

   /*
   *  Construct
   *
   *  @description: 
   *  @since: 3.6
   *  @created: 1/04/13
   */
   
   function __construct()
   {
      $mofile = trailingslashit(dirname(__File__)) . 'lang/' . self::L10N_DOMAIN . '-' . get_locale() . '.mo';
      load_textdomain( self::L10N_DOMAIN, $mofile );
      
      add_action('acf/register_fields', array($this, 'register_field_v4'));  

   }
   
}

error_log("calling Plugin Construct");
new acf_nggallery_field_plugin();

class ACF_NGGallery_Field extends acf_field
{
   // vars
   var $settings   // will hold info such as dir / path
      , $defaults // will hold default field options
      , $domain   // holds the language domain
      , $lang;
      
   /*
   *  __construct
   *
   *  Set name / label needed for actions / filters
   *
   *  @since   3.6
   *  @date 23/01/13
   */
   
   function __construct()
   {

      //Get the textdomain from the Helper class
      $this->l10n_domain = acf_nggallery_field_plugin::L10N_DOMAIN;


      // vars
      $this->name = 'nggallery-field';
      $this->category = __("Relational", 'acf'); // Basic, Content, Choice, etc

      $post_title = ( !class_exists('nggdb') ) ? '. ' . __( 'NextGEN Gallery plugin is not installed or activated!', $this->l10n_domain ) : false;
      $this->title = __( 'NextGEN Gallery'.$post_title, $this->l10n_domain );
      $this->label = __( 'NextGEN Gallery'.$post_title, $this->l10n_domain );
      
      $this->defaults = array(
           'input_type'       => 'select'
         , 'allow_null'       => true
         , 'input_size'       => 5
         , 'nextgen_type'   => 'Galleries and Albums'
      );

      
      
      // do not delete!
      parent::__construct();
      
      
      // settings
      $this->settings = array(
         'path'      => apply_filters('acf/helpers/get_path', __FILE__)
         , 'dir'     => apply_filters('acf/helpers/get_dir', __FILE__)
         , 'version' => '1.0.0'
      );

   }
   
   
   /*
   *  create_options()
   *
   *  Create extra options for your field. This is rendered when editing a field.
   *  The value of $field['name'] can be used (like bellow) to save extra data to the $field
   *
   *  @type action
   *  @since   3.6
   *  @date 23/01/13
   *
   *  @param   $field   - an array holding all the field's data
   */
   
   function create_options( $field )
   {

      $field = array_merge($this->defaults, $field);
      $key = $field['name'];
      
      ?>
      <tr class="field_option field_option_<?php echo $this->name; ?>">
         <td class="label">
            <label for=""><?php _e( "Allow Null?", $this->domain ); ?></label>
         </td>
         <td>
            <?php
            do_action('acf/create_field', array(
                  'type'      => 'radio'
                  , 'name'    => 'fields['.$key.'][allow_null]'
                  , 'value'   => $field['allow_null']
                  , 'layout'  => 'horizontal'
                  , 'choices' => array(
                        '1'    => __( 'Yes', $this->domain )
                        , '0' => __( 'No', $this->domain )
                  )
               ) );
            ?>
         </td>
      </tr>
        
        <tr class="field_option field_option_<?php echo $this->name; ?>">
         <td class="label">
            <label><?php _e( 'Nextgen Type' , $this->domain ); ?></label>
            <p class="description"><?php _e( 'Allow or restrict the Nextgen selection type', $this->domain ); ?></p>
         </td>
         <td>
                <?php
            do_action('acf/create_field', array(
                  'type'      => 'select'
                  , 'name'    => 'fields['.$key.'][nextgen_type]'
                  , 'value'   => $field['nextgen_type']
                  , 'layout'  => 'horizontal'
                  , 'class'   => "nggallery_nextgen_type nggallery_nextgen_type_{$key}"
                  , 'choices' => array(
                        'Galleries and Albums'    => __( 'Galleries and Albums', $this->domain )
                        , 'Galleries' => __( 'Galleries', $this->domain )
                        , 'Albums' => __( 'Albums', $this->domain )
                  )
               ) );
            ?>
         </td>
      </tr>
        
        <tr class="field_option field_option_<?php echo $this->name; ?>">
         <td class="label">
            <label><?php _e( 'Input Method' , $this->domain ); ?></label>
            <p class="description"><?php _e( '', $this->domain ); ?></p>
         </td>
         <td>
                <?php
            do_action('acf/create_field', array(
                  'type'      => 'select'
                  , 'name'    => 'fields['.$key.'][input_type]'
                  , 'value'   => $field['input_type']
                  , 'layout'  => 'horizontal'
                  , 'class'   => "nggallery_input_type nggallery_input_type_{$key}"
                  , 'choices' => array(
                        'select'    => __( 'Select', $this->domain )
                        , 'multiselect' => __( 'Multi-Select', $this->domain )
                  )
               ) );
            ?>
         </td>
      </tr>

      <tr id="nggallery_input_size[<?php echo $key; ?>]" class="field_option field_option_<?php echo $this->name; ?> nggallery_input_size nggallery_input_size_<?php echo $key; ?>">
         <td class="label">
            <label><?php _e( 'Multi-Select Size' , $this->domain ); ?></label>
            <p class="description"><?php _e( 'The number of rows to show at once in a multi-select.', $this->domain ); ?></p>
         </td>
         <td>
               <?php
            do_action('acf/create_field', array(
                  'type'      => 'select'
                  , 'name'    => 'fields['.$key.'][input_size]'
                  , 'value'   => $field['input_size']
                  , 'layout'  => 'horizontal'
                  , 'choices' => array_combine( range( 3, 15, 2 ), range( 3, 15, 2 ) )
               ) );
            ?>
         </td>
      </tr>
        <script type='text/javascript'>
         jQuery(document).ready(function($) {
               
            if ( $('.nggallery_input_type_<?php echo $key; ?>').val() == 'select' ) { $('.nggallery_input_size_<?php echo $key; ?>').hide(); }
            else  { $('.nggallery_input_size_<?php echo $key; ?>').show(); }

            $('.nggallery_input_type_<?php echo $key; ?>').change(function() {
               if ( $(this).val() == 'select' ) { $('.nggallery_input_size_<?php echo $key; ?>').hide(); }
               else { $('.nggallery_input_size_<?php echo $key; ?>').show(); }
            });
         });      
      </script>
<?php

   }



   /*
   *  create_field()
   *
   *  Create the HTML interface for your field
   *
   *  @param   $field - an array holding all the field's data
   *
   *  @type action
   *  @since   3.6
   *  @date 23/01/13
   */

   function create_field( $field ) {
      global $ngg, $nggdb, $wp_query;
      
      $values_gallery = array();
      $values_album = array();
   
      $values = $field[ 'value' ];

        if ( !empty($values[0]) ) {
        foreach ( $values as $form ) {
         if ( in_array ( 'gallery', $form ) ) { $values_gallery[]=$form['ngg_id']; }
         if ( in_array ( 'album', $form ) ) { $values_album[]=$form['ngg_id']; }
        }
       }
   
      if ( class_exists('nggdb') ) {
      
        // Settings of NextGEN Gallery SQL query
        $limit = 0;
        $start = 0;
        $order_by = 'title';
        $order_dir = 'ASC';
         
        // Seek to all NextGEN Galleries
        $gallerylist = $nggdb->find_all_galleries( $order_by, $order_dir , TRUE, $limit, $start, false);
        $albumlist = $nggdb->find_all_album( 'name', $order_dir, $limit, $start);


?>
          <select name="<?php echo $field[ 'name' ]; ?>[]" id="<?php echo $field['id']; ?>" class="<?php echo $field[ 'class' ]; ?>" <?php echo ( $field[ 'input_type' ] == 'multiselect' ) ? 'multiple="multiple" size="' . $field[ 'input_size' ] . '"' : ''; ?>>
            <?php if($field['allow_null'] == '1') echo '
               <option value="null"> - Select - </option>';
            ?>

                <?php if ( $field['nextgen_type'] == "Galleries and Albums" || $field['nextgen_type'] == "Galleries" ) { ?>
              <optgroup label="<?php _e('Galleries','nggallery'); ?>">
              <?php foreach( $gallerylist as $gallery ) : ?>
               <option value="<?php echo $gallery->gid.',gallery'; ?>"<?php if ( $values_gallery ) selected( in_array( $gallery->gid, $values_gallery ) ); ?>><?php echo $gallery->title; ?></option>
              <?php endforeach; ?>
              </optgroup>
                <?php } ?>
                
                <?php if ( $field['nextgen_type'] == "Galleries and Albums" || $field['nextgen_type'] == "Albums" ) { ?>
              <optgroup label="<?php _e('Albums','nggallery'); ?>">
              <?php foreach( $albumlist as $album ) : ?>
               <option value="<?php echo $album->id.',album'; ?>"<?php if ( $values_album ) selected( in_array( $album->id, $values_album ) ); ?>><?php echo $album->name; ?></option>
              <?php endforeach; ?>
              </optgroup>
                <?php } ?>
                
          </select>
<?php 
      } else {
?>
            <select name="<?php echo $field[ 'name' ]; ?>[]" id="<?php echo $field[ 'name' ]; ?>" class="<?php echo $field[ 'class' ]; ?>">
               <option value="0" disabled="true"><?php _e( 'NextGEN Gallery plugin is not installed or activated!', $this->domain ); ?></option>
            </select>
<?php
      } //if ( class_exists('nggdb') )

   }
   
   

   /*
   *  update_value()
   *
   *  This filter is applied to the $value before it is updated in the db
   *
   *  @type filter
   *  @since   3.6
   *  @date 23/01/13
   *
   *  @param   $value - the value which will be saved in the database
   *  @param   $field - the field array holding all the field options
   *  @param   $post_id - the $post_id of which the value will be saved
   *
   *  @return  $value - the modified value
   */

   function update_value( $value, $post_id ) {
//    $field = array_merge( $this->defaults, $field );
//    extract( $field, EXTR_SKIP ); //Declare each item in $field as its own variable i.e.: $name, $value, $label, $time_format, $date_format and $show_week_number

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
   *  format_value_for_api()
   *
   *  This filter is applied to the $value after it is loaded from the db and before it is passed back to the api functions such as the_field
   *
   *  @type filter
   *  @since   3.6
   *  @date 23/01/13
   *
   *  @param   $value   - the value which was loaded from the database
   *  @param   $post_id - the $post_id from which the value was loaded
   *  @param   $field   - the field array holding all the field options
   *
   *  @return  $value   - the modified value
   */
   
   function format_value_for_api( $value, $post_id, $field )
   {
      if ( $value[0]['ngg_form'] == 'null' ) {
         $value = false;
      }
   
      return $value;
   }
   
   

}


// create field
new ACF_NGGallery_Field();

?>