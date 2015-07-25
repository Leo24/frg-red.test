<?php

/*
Plugin Name:      	Advanced Custom Fields: NextGEN Gallery Field add-on
Plugin URI:       	http://wordpress.org/extend/plugins/advanced-custom-fields-nextgen-gallery-field-add-on/
Description:      	This plugin is an add-on for Advanced Custom Fields. It provides a dropdown of NextGEN Gallery and the ability to map the selected NextGEN Gallery to the post. From 2.1 support NextCellent gallery and ACF PRO v5.
Version:          	2.1
Requires at least:	3.0 or higher
Tested up to:     	4.1.0
Author:           	Ales Loziak, Robert Kleinschmager
Author URI:       	http://www.apollo1.cz
License:          	GPLv2 or later
License URI:      	http://www.gnu.org/licenses/gpl-2.0.html
*/


// 1. set text domain
// Reference: https://codex.wordpress.org/Function_Reference/load_plugin_textdomain
load_plugin_textdomain( 'acf-ngg', false, dirname( plugin_basename(__FILE__) ) . '/lang/' ); 


// 2. Include field type for ACF5
// @param	string 		$version = 5 and can be ignored until ACF6 exists
function register_acf5( $version ) {
	
	include_once('acf-ngg-v5.php');
	
}
add_action('acf/include_field_types', 'register_acf5');	




// 3. Include field type for ACF4
function register_acf4() {
	
	include_once('acf-ngg-v4.php');
	
}
add_action('acf/register_fields', 'register_acf4');	



// 4. Include field type for ACF3
function register_acf3() {
	
	if( function_exists( 'register_field' ) ) {
         register_field( 'ACF_NGGallery_Field', dirname(__File__) . '/acf-ngg-v3.php' );
      }

}
add_action('init', 'register_acf3');

	
?>