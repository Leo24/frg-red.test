=== Advanced Custom Fields: NextGEN Gallery Field add-on ===
Contributors: aloziak, Omicron7, barclay_reg, jayque9
Donate link: http://www.apollo1.cz/
Tags: acf, acf add-on, nextgen gallery, custom field, nextgen gallery field
Requires at least: 3.0 or higher
Tested up to: 4.1.0
Stable tag: trunk
License: GPLv2 or later
License URI: http://www.gnu.org/licenses/gpl-2.0.html

Adds a NextGEN Gallery Field to Advanced Custom Fields. Select one or more NextGEN Galleries and assign them to the post.

== Description ==

This is an add-on for the [Advanced Custom Fields](http://wordpress.org/extend/plugins/advanced-custom-fields/) WordPress plugin and will not provide any functionality to WordPress unless advanced Custom Fields is installed and activated.

The NextGEN Gallery field provides a dropdown (select or multi-select) of NextGEN Gallery names (galleries and albums) and the ability to map the selected NextGEN Gallery to the post.
The get_value() API returns an array of the selected NextGEN Gallery IDs and the form – album or gallery.

Support ACF5 Pro, ACF4, ACF3, NextCellent Gallery - NextGEN Legacy.

<strong>!!! Version 1.1 !!! </strong>
This version changes get_value() API returned value. You must change your template files. !!!

The get_value() API returns a following array:
`Array (
	[0] => Array (
		[ngg_id] => 8  ( NextGEN Gallery 'gallery' or 'album' ID )
		[ngg_form] => gallery  ( 'gallery' or 'album' )
	)
)`


= Example =
These examples should show a NextGEN Gallery gallery or NextGEN Gallery album.

For version 1.1 and later
`<?php
	foreach ( get_field ( 'nextgen_gallery_id' ) as $nextgen_gallery_id ) :
		if ( $nextgen_gallery_id['ngg_form'] == 'album' ) {
			echo nggShowAlbum( $nextgen_gallery_id['ngg_id'] ); //NextGEN Gallery album
		} elseif ( $nextgen_gallery_id['ngg_form'] == 'gallery' ) {
			 echo nggShowGallery( $nextgen_gallery_id['ngg_id'] ); //NextGEN Gallery gallery
		}
	endforeach;
?>`

For version 1.0.2 and earlier
`<?php
	foreach (get_field ('portfolio_nextgen_gallery_id') as $nextgen_gallery_id) :
		echo nggShowGallery( $nextgen_gallery_id );
	endforeach;
?>`

== Installation ==

The NextGEN Gallery Field plugin can be used as WordPress plugin or included in other plugins or themes.
There is no need to call the Advanced Custom Fields `register_field()` method for this field.

* WordPress plugin
	1. Download the plugin and extract it to `/wp-content/plugins/` directory.
	2. Activate the plugin through the `Plugins` menu in WordPress.

== Frequently Asked Questions ==

= I've activated the plugin, but nothing happens! =

Make sure you have [Advanced Custom Fields](http://wordpress.org/extend/plugins/advanced-custom-fields/) installed and
activated. This is not a standalone plugin for WordPress, it only adds additional functionality to Advanced Custom Fields.

= I just see on my post/page the name of the NextGEN Gallery Add-on only and no more nexts fields?

Make sure you have [NextGEN Gallery plugin](http://wordpress.org/extend/plugins/nextgen-gallery/) installed and
activated. This is not a standalone plugin for WordPress. It only adds additional functionality to Advanced Custom Fields and works together with NextGEN Gallery plugin.

= Are my field definitions and post data lost, if I upgrade from ACF 3- to ACF 4+ =

At least all data of this custom field are keept and save. You can reuse and view you existing field definitions and gallery selections within posts, even after upgrading [Advanced Custom Fields](http://wordpress.org/extend/plugins/advanced-custom-fields/) to it's newest version.

Make sure you have [Advanced Custom Fields](http://wordpress.org/extend/plugins/advanced-custom-fields/) installed and
activated. This is not a standalone plugin for WordPress, it only adds additional functionality to Advanced Custom Fields.

== Screenshots ==

1. NextGEN Gallery Field.
2. Adding a NextGEN Gallery to a page.

== Changelog ==

= 2.1 =
* ACF PRO v5 support
* NextCellent Gallery - NextGEN Legacy support

= 2.0 =
* Compatiblity to ACF4 and backward compatibilty to ACF3
* Added option to restict selectable galleries (Albums, Galleries or both)

= 1.2.1 =
* [Fixed] Wrong data type error message – http://wordpress.org/support/topic/plugin-advanced-custom-fields-nextgen-gallery-field-add-on-wrong-data-type-error-message?replies=3

= 1.2 =
* Hide "Multi-Select Size" field when is used "Select" as an "Input Method".
* Ready for localization

= 1.1.2 =
* [Fixed] Keying mistake at line :179

= 1.1.1 =
* [Fixed] Null array (error message at line :181) when new NextGEN Gallery field is initiate

= 1.1 =
* Add option to select NextGen Gallery album
* Check if the NextGEN Gallery plugin is installed.

= 1.0.2 =
* [Fixed] The sample code in the instruction.

= 1.0.1 =
* [Fixed] The installer package.

= 1.0 =
* Initial Release