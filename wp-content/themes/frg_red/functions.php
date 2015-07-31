<?php
/**
 * Twenty Thirteen functions and definitions
 *
 * Sets up the theme and provides some helper functions, which are used in the
 * theme as custom template tags. Others are attached to action and filter
 * hooks in WordPress to change core functionality.
 *
 * When using a child theme (see https://codex.wordpress.org/Theme_Development
 * and https://codex.wordpress.org/Child_Themes), you can override certain
 * functions (those wrapped in a function_exists() call) by defining them first
 * in your child theme's functions.php file. The child theme's functions.php
 * file is included before the parent theme's file, so the child theme
 * functions would be used.
 *
 * Functions that are not pluggable (not wrapped in function_exists()) are
 * instead attached to a filter or action hook.
 *
 * For more information on hooks, actions, and filters, @link https://codex.wordpress.org/Plugin_API
 *
 * @package WordPress
 * @subpackage Twenty_Thirteen
 * @since Twenty Thirteen 1.0
 */

/*
 * Set up the content width value based on the theme's design.
 *
 * @see frg_red_content_width() for template-specific adjustments.
 */
if ( ! isset( $content_width ) )
	$content_width = 604;

/**
 * Add support for a custom header image.
 */
require get_template_directory() . '/inc/custom-header.php';

/**
 * Twenty Thirteen only works in WordPress 3.6 or later.
 */
if ( version_compare( $GLOBALS['wp_version'], '3.6-alpha', '<' ) )
	require get_template_directory() . '/inc/back-compat.php';

/**
 * Twenty Thirteen setup.
 *
 * Sets up theme defaults and registers the various WordPress features that
 * Twenty Thirteen supports.
 *
 * @uses load_theme_textdomain() For translation/localization support.
 * @uses add_editor_style() To add Visual Editor stylesheets.
 * @uses add_theme_support() To add support for automatic feed links, post
 * formats, and post thumbnails.
 * @uses register_nav_menu() To add support for a navigation menu.
 * @uses set_post_thumbnail_size() To set a custom post thumbnail size.
 *
 * @since Twenty Thirteen 1.0
 */
function frg_red_setup() {
	/*
	 * Makes Twenty Thirteen available for translation.
	 *
	 * Translations can be added to the /languages/ directory.
	 * If you're building a theme based on Twenty Thirteen, use a find and
	 * replace to change 'frg_red' to the name of your theme in all
	 * template files.
	 */
	load_theme_textdomain( 'frg_red', get_template_directory() . '/languages' );

	/*
	 * This theme styles the visual editor to resemble the theme style,
	 * specifically font, colors, icons, and column width.
	 */
	add_editor_style( array( 'css/editor-style.css', 'genericons/genericons.css', frg_red_fonts_url() ) );

	// Adds RSS feed links to <head> for posts and comments.
	add_theme_support( 'automatic-feed-links' );

	/*
	 * Switches default core markup for search form, comment form,
	 * and comments to output valid HTML5.
	 */
	add_theme_support( 'html5', array(
		'search-form', 'comment-form', 'comment-list', 'gallery', 'caption'
	) );

	/*
	 * This theme supports all available post formats by default.
	 * See https://codex.wordpress.org/Post_Formats
	 */
	add_theme_support( 'post-formats', array(
		'aside', 'audio', 'chat', 'gallery', 'image', 'link', 'quote', 'status', 'video'
	) );

	// This theme uses wp_nav_menu() in one location.
	register_nav_menu( 'primary', __( 'Navigation Menu', 'frg_red' ) );

	/*
	 * This theme uses a custom image size for featured images, displayed on
	 * "standard" posts and pages.
	 */
	add_theme_support( 'post-thumbnails' );
	set_post_thumbnail_size( 604, 270, true );

	// This theme uses its own gallery styles.
	add_filter( 'use_default_gallery_style', '__return_false' );
}
add_action( 'after_setup_theme', 'frg_red_setup' );

/**
 * Return the Google font stylesheet URL, if available.
 *
 * The use of Source Sans Pro and Bitter by default is localized. For languages
 * that use characters not supported by the font, the font can be disabled.
 *
 * @since Twenty Thirteen 1.0
 *
 * @return string Font stylesheet or empty string if disabled.
 */
function frg_red_fonts_url() {
	$fonts_url = '';

	/* Translators: If there are characters in your language that are not
	 * supported by Source Sans Pro, translate this to 'off'. Do not translate
	 * into your own language.
	 */
	$source_sans_pro = _x( 'on', 'Source Sans Pro font: on or off', 'frg_red' );

	/* Translators: If there are characters in your language that are not
	 * supported by Bitter, translate this to 'off'. Do not translate into your
	 * own language.
	 */
	$bitter = _x( 'on', 'Bitter font: on or off', 'frg_red' );

	if ( 'off' !== $source_sans_pro || 'off' !== $bitter ) {
		$font_families = array();

		if ( 'off' !== $source_sans_pro )
			$font_families[] = 'Source Sans Pro:300,400,700,300italic,400italic,700italic';

		if ( 'off' !== $bitter )
			$font_families[] = 'Bitter:400,700';

		$query_args = array(
			'family' => urlencode( implode( '|', $font_families ) ),
			'subset' => urlencode( 'latin,latin-ext' ),
		);
		$fonts_url = add_query_arg( $query_args, '//fonts.googleapis.com/css' );
	}

	return $fonts_url;
}

/**
 * Enqueue scripts and styles for the front end.
 *
 * @since Twenty Thirteen 1.0
 */
function frg_red_scripts_styles() {
	/*
	 * Adds JavaScript to pages with the comment form to support
	 * sites with threaded comments (when in use).
	 */
	if ( is_singular() && comments_open() && get_option( 'thread_comments' ) )
		wp_enqueue_script( 'comment-reply' );

	// Adds Masonry to handle vertical alignment of footer widgets.
	if ( is_active_sidebar( 'sidebar-1' ) )
		wp_enqueue_script( 'jquery-masonry' );

	// Loads JavaScript file with functionality specific to Twenty Thirteen.
	wp_enqueue_script( 'frg_red-script', get_template_directory_uri() . '/js/functions.js', array( 'jquery' ), '20150330', true );

	// Add Source Sans Pro and Bitter fonts, used in the main stylesheet.
	wp_enqueue_style( 'frg_red-fonts', frg_red_fonts_url(), array(), null );

	// Add Genericons font, used in the main stylesheet.
	wp_enqueue_style( 'genericons', get_template_directory_uri() . '/genericons/genericons.css', array(), '3.03' );

	// Loads our main stylesheet.
	wp_enqueue_style( 'frg_red-style', get_stylesheet_uri(), array(), '2013-07-18' );

	// Loads the Internet Explorer specific stylesheet.
	wp_enqueue_style( 'frg_red-ie', get_template_directory_uri() . '/css/ie.css', array( 'frg_red-style' ), '2013-07-18' );
	wp_style_add_data( 'frg_red-ie', 'conditional', 'lt IE 9' );
}
add_action( 'wp_enqueue_scripts', 'frg_red_scripts_styles' );

/**
 * Filter the page title.
 *
 * Creates a nicely formatted and more specific title element text for output
 * in head of document, based on current view.
 *
 * @since Twenty Thirteen 1.0
 *
 * @param string $title Default title text for current view.
 * @param string $sep   Optional separator.
 * @return string The filtered title.
 */
function frg_red_wp_title( $title, $sep ) {
	global $paged, $page;

	if ( is_feed() )
		return $title;

	// Add the site name.
	$title .= get_bloginfo( 'name', 'display' );

	// Add the site description for the home/front page.
	$site_description = get_bloginfo( 'description', 'display' );
	if ( $site_description && ( is_home() || is_front_page() ) )
		$title = "$title $sep $site_description";

	// Add a page number if necessary.
	if ( ( $paged >= 2 || $page >= 2 ) && ! is_404() )
		$title = "$title $sep " . sprintf( __( 'Page %s', 'frg_red' ), max( $paged, $page ) );

	return $title;
}
add_filter( 'wp_title', 'frg_red_wp_title', 10, 2 );

/**
 * Register two widget areas.
 *
 * @since Twenty Thirteen 1.0
 */
//function frg_red_widgets_init() {
//	register_sidebar( array(
//		'name'          => __( 'Main Widget Area', 'frg_red' ),
//		'id'            => 'sidebar-1',
//		'description'   => __( 'Appears in the footer section of the site.', 'frg_red' ),
//		'before_widget' => '<aside id="%1$s" class="widget %2$s">',
//		'after_widget'  => '</aside>',
//		'before_title'  => '<h3 class="widget-title">',
//		'after_title'   => '</h3>',
//	) );
//
//	register_sidebar( array(
//		'name'          => __( 'Secondary Widget Area', 'frg_red' ),
//		'id'            => 'sidebar-2',
//		'description'   => __( 'Appears on posts and pages in the sidebar.', 'frg_red' ),
//		'before_widget' => '<aside id="%1$s" class="widget %2$s">',
//		'after_widget'  => '</aside>',
//		'before_title'  => '<h3 class="widget-title">',
//		'after_title'   => '</h3>',
//	) );
//}
//add_action( 'widgets_init', 'frg_red_widgets_init' );

if ( ! function_exists( 'frg_red_paging_nav' ) ) :
/**
 * Display navigation to next/previous set of posts when applicable.
 *
 * @since Twenty Thirteen 1.0
 */
function frg_red_paging_nav() {
	global $wp_query;

	// Don't print empty markup if there's only one page.
	if ( $wp_query->max_num_pages < 2 )
		return;
	?>
	<nav class="navigation paging-navigation" role="navigation">
		<h1 class="screen-reader-text"><?php _e( 'Posts navigation', 'frg_red' ); ?></h1>
		<div class="nav-links">

			<?php if ( get_next_posts_link() ) : ?>
			<div class="nav-previous"><?php next_posts_link( __( '<span class="meta-nav">&larr;</span> Older posts', 'frg_red' ) ); ?></div>
			<?php endif; ?>

			<?php if ( get_previous_posts_link() ) : ?>
			<div class="nav-next"><?php previous_posts_link( __( 'Newer posts <span class="meta-nav">&rarr;</span>', 'frg_red' ) ); ?></div>
			<?php endif; ?>

		</div><!-- .nav-links -->
	</nav><!-- .navigation -->
	<?php
}
endif;

if ( ! function_exists( 'frg_red_post_nav' ) ) :
/**
 * Display navigation to next/previous post when applicable.
*
* @since Twenty Thirteen 1.0
*/
function frg_red_post_nav() {
	global $post;

	// Don't print empty markup if there's nowhere to navigate.
	$previous = ( is_attachment() ) ? get_post( $post->post_parent ) : get_adjacent_post( false, '', true );
	$next     = get_adjacent_post( false, '', false );

	if ( ! $next && ! $previous )
		return;
	?>
	<nav class="navigation post-navigation" role="navigation">
		<h1 class="screen-reader-text"><?php _e( 'Post navigation', 'frg_red' ); ?></h1>
		<div class="nav-links">

			<?php previous_post_link( '%link', _x( '<span class="meta-nav">&larr;</span> %title', 'Previous post link', 'frg_red' ) ); ?>
			<?php next_post_link( '%link', _x( '%title <span class="meta-nav">&rarr;</span>', 'Next post link', 'frg_red' ) ); ?>

		</div><!-- .nav-links -->
	</nav><!-- .navigation -->
	<?php
}
endif;

if ( ! function_exists( 'frg_red_entry_meta' ) ) :
/**
 * Print HTML with meta information for current post: categories, tags, permalink, author, and date.
 *
 * Create your own frg_red_entry_meta() to override in a child theme.
 *
 * @since Twenty Thirteen 1.0
 */
function frg_red_entry_meta() {
	if ( is_sticky() && is_home() && ! is_paged() )
		echo '<span class="featured-post">' . esc_html__( 'Sticky', 'frg_red' ) . '</span>';

	if ( ! has_post_format( 'link' ) && 'post' == get_post_type() )
		frg_red_entry_date();

	// Translators: used between list items, there is a space after the comma.
	$categories_list = get_the_category_list( __( ', ', 'frg_red' ) );
	if ( $categories_list ) {
		echo '<span class="categories-links">' . $categories_list . '</span>';
	}

	// Translators: used between list items, there is a space after the comma.
	$tag_list = get_the_tag_list( '', __( ', ', 'frg_red' ) );
	if ( $tag_list ) {
		echo '<span class="tags-links">' . $tag_list . '</span>';
	}

	// Post author
	if ( 'post' == get_post_type() ) {
		printf( '<span class="author vcard"><a class="url fn n" href="%1$s" title="%2$s" rel="author">%3$s</a></span>',
			esc_url( get_author_posts_url( get_the_author_meta( 'ID' ) ) ),
			esc_attr( sprintf( __( 'View all posts by %s', 'frg_red' ), get_the_author() ) ),
			get_the_author()
		);
	}
}
endif;

if ( ! function_exists( 'frg_red_entry_date' ) ) :
/**
 * Print HTML with date information for current post.
 *
 * Create your own frg_red_entry_date() to override in a child theme.
 *
 * @since Twenty Thirteen 1.0
 *
 * @param boolean $echo (optional) Whether to echo the date. Default true.
 * @return string The HTML-formatted post date.
 */
function frg_red_entry_date( $echo = true ) {
	if ( has_post_format( array( 'chat', 'status' ) ) )
		$format_prefix = _x( '%1$s on %2$s', '1: post format name. 2: date', 'frg_red' );
	else
		$format_prefix = '%2$s';

	$date = sprintf( '<span class="date"><a href="%1$s" title="%2$s" rel="bookmark"><time class="entry-date" datetime="%3$s">%4$s</time></a></span>',
		esc_url( get_permalink() ),
		esc_attr( sprintf( __( 'Permalink to %s', 'frg_red' ), the_title_attribute( 'echo=0' ) ) ),
		esc_attr( get_the_date( 'c' ) ),
		esc_html( sprintf( $format_prefix, get_post_format_string( get_post_format() ), get_the_date() ) )
	);

	if ( $echo )
		echo $date;

	return $date;
}
endif;

if ( ! function_exists( 'frg_red_the_attached_image' ) ) :
/**
 * Print the attached image with a link to the next attached image.
 *
 * @since Twenty Thirteen 1.0
 */
function frg_red_the_attached_image() {
	/**
	 * Filter the image attachment size to use.
	 *
	 * @since Twenty thirteen 1.0
	 *
	 * @param array $size {
	 *     @type int The attachment height in pixels.
	 *     @type int The attachment width in pixels.
	 * }
	 */
	$attachment_size     = apply_filters( 'frg_red_attachment_size', array( 724, 724 ) );
	$next_attachment_url = wp_get_attachment_url();
	$post                = get_post();

	/*
	 * Grab the IDs of all the image attachments in a gallery so we can get the URL
	 * of the next adjacent image in a gallery, or the first image (if we're
	 * looking at the last image in a gallery), or, in a gallery of one, just the
	 * link to that image file.
	 */
	$attachment_ids = get_posts( array(
		'post_parent'    => $post->post_parent,
		'fields'         => 'ids',
		'numberposts'    => -1,
		'post_status'    => 'inherit',
		'post_type'      => 'attachment',
		'post_mime_type' => 'image',
		'order'          => 'ASC',
		'orderby'        => 'menu_order ID',
	) );

	// If there is more than 1 attachment in a gallery...
	if ( count( $attachment_ids ) > 1 ) {
		foreach ( $attachment_ids as $attachment_id ) {
			if ( $attachment_id == $post->ID ) {
				$next_id = current( $attachment_ids );
				break;
			}
		}

		// get the URL of the next image attachment...
		if ( $next_id )
			$next_attachment_url = get_attachment_link( $next_id );

		// or get the URL of the first image attachment.
		else
			$next_attachment_url = get_attachment_link( reset( $attachment_ids ) );
	}

	printf( '<a href="%1$s" title="%2$s" rel="attachment">%3$s</a>',
		esc_url( $next_attachment_url ),
		the_title_attribute( array( 'echo' => false ) ),
		wp_get_attachment_image( $post->ID, $attachment_size )
	);
}
endif;

/**
 * Return the post URL.
 *
 * @uses get_url_in_content() to get the URL in the post meta (if it exists) or
 * the first link found in the post content.
 *
 * Falls back to the post permalink if no URL is found in the post.
 *
 * @since Twenty Thirteen 1.0
 *
 * @return string The Link format URL.
 */
function frg_red_get_link_url() {
	$content = get_the_content();
	$has_url = get_url_in_content( $content );

	return ( $has_url ) ? $has_url : apply_filters( 'the_permalink', get_permalink() );
}

if ( ! function_exists( 'frg_red_excerpt_more' ) && ! is_admin() ) :
/**
 * Replaces "[...]" (appended to automatically generated excerpts) with ...
 * and a Continue reading link.
 *
 * @since Twenty Thirteen 1.4
 *
 * @param string $more Default Read More excerpt link.
 * @return string Filtered Read More excerpt link.
 */
function frg_red_excerpt_more( $more ) {
	$link = sprintf( '<a href="%1$s" class="more-link">%2$s</a>',
		esc_url( get_permalink( get_the_ID() ) ),
			/* translators: %s: Name of current post */
			sprintf( __( 'Continue reading %s <span class="meta-nav">&rarr;</span>', 'frg_red' ), '<span class="screen-reader-text">' . get_the_title( get_the_ID() ) . '</span>' )
		);
	return ' &hellip; ' . $link;
}
add_filter( 'excerpt_more', 'frg_red_excerpt_more' );
endif;

/**
 * Extend the default WordPress body classes.
 *
 * Adds body classes to denote:
 * 1. Single or multiple authors.
 * 2. Active widgets in the sidebar to change the layout and spacing.
 * 3. When avatars are disabled in discussion settings.
 *
 * @since Twenty Thirteen 1.0
 *
 * @param array $classes A list of existing body class values.
 * @return array The filtered body class list.
 */
function frg_red_body_class( $classes ) {
	if ( ! is_multi_author() )
		$classes[] = 'single-author';

	if ( is_active_sidebar( 'sidebar-2' ) && ! is_attachment() && ! is_404() )
		$classes[] = 'sidebar';

	if ( ! get_option( 'show_avatars' ) )
		$classes[] = 'no-avatars';

	return $classes;
}
add_filter( 'body_class', 'frg_red_body_class' );

/**
 * Adjust content_width value for video post formats and attachment templates.
 *
 * @since Twenty Thirteen 1.0
 */
function frg_red_content_width() {
	global $content_width;

	if ( is_attachment() )
		$content_width = 724;
	elseif ( has_post_format( 'audio' ) )
		$content_width = 484;
}
add_action( 'template_redirect', 'frg_red_content_width' );

/**
 * Add postMessage support for site title and description for the Customizer.
 *
 * @since Twenty Thirteen 1.0
 *
 * @param WP_Customize_Manager $wp_customize Customizer object.
 */
function frg_red_customize_register( $wp_customize ) {
	$wp_customize->get_setting( 'blogname' )->transport         = 'postMessage';
	$wp_customize->get_setting( 'blogdescription' )->transport  = 'postMessage';
	$wp_customize->get_setting( 'header_textcolor' )->transport = 'postMessage';
}
add_action( 'customize_register', 'frg_red_customize_register' );

/**
 * Enqueue Javascript postMessage handlers for the Customizer.
 *
 * Binds JavaScript handlers to make the Customizer preview
 * reload changes asynchronously.
 *
 * @since Twenty Thirteen 1.0
 */
function frg_red_customize_preview_js() {
	wp_enqueue_script( 'frg_red-customizer', get_template_directory_uri() . '/js/theme-customizer.js', array( 'customize-preview' ), '20141120', true );
}
add_action( 'customize_preview_init', 'frg_red_customize_preview_js' );



/**
 * Register our menus and slider widget area.
 *
 */
function menus_slider_widget_init() {

	register_sidebar( array(
		'name'          => 'Home menu-slider',
		'id'            => 'menus_slider_widget',
		'before_widget' => '<div>',
		'after_widget'  => '</div>',
		'before_title'  => '<h2 class="menus-slider">',
		'after_title'   => '</h2>',
	) );

	register_sidebar( array(
		'name'          => 'Home bottom news blocks',
		'id'            => 'home_bottom_news_blocks',
		'before_widget' => '<li class="bottom-news-block center-block  col-lg-4 col-md-5 col-sm-8 col-xs-8">',
		'after_widget'  => '</li>',
		'before_title'  => '<h2>',
		'after_title'   => '</h2>',
	) );


}
add_action( 'widgets_init', 'menus_slider_widget_init' );


add_action( 'init', 'create_post_type_contact_info' );
function create_post_type_contact_info() {
	register_post_type( 'header_info',
		array(
			'labels' => array(
				'name' => __( 'Header info' ),
				'singular_name' => __( 'header_info' )
			),
			'public' => true,
			'has_archive' => true,
		)
	);
}

add_action( 'init', 'create_post_type_footer_info' );
function create_post_type_footer_info() {
	register_post_type( 'footer_info',
		array(
			'labels' => array(
				'name' => __( 'Footer info' ),
				'singular_name' => __( 'footer_info' )
			),
			'public' => true,
			'has_archive' => true,
		)
	);
}

function get_header_info($param){
$args = array(
	'post_title'	   => 'Header info',
	'category'         => '',
	'category_name'    => '',
	'post_type'        => 'header_info',

);
$header_info = get_posts($args);
	$header_info_fields = get_fields($header_info[0]->ID);
	if($param){
		$contact_info_fields = get_contact_page_info();
		echo'<div class="contact-header-info center-block col-lg-3 col-md-12 col-sm-12 col-xs-12">
				<div class=""><img class="img-responsive center-block" src="'.$header_info_fields['site_logo']['url'].'"/></div>
				<div class=""><p class="company-name">'.$header_info_fields['company_name'].'</p></div>
				<div class=""><p class="product-description">'.$header_info_fields['product_description'].'</p></div>
				<div class=""><p class="tagline">'.$header_info_fields['tagline'].'</p></div>
				<div class=""><p class="phone-number">' . $contact_info_fields['phone_number_1'] . '</p></div>
				<div class=""><p class="adress">' . $contact_info_fields['adress'] . '</p></div>
				<div class=""><p class="email">' . $contact_info_fields['email'] . '</p></div>
				<div class="welcome-massage">'.$header_info_fields['welcome_message'].'</div>
				<div class=""><a class="gallery-link btn btn-default center-block " href="'.$header_info_fields['gallery_link'].'" rel="gallery">view gallery</a></div>
			</div>';
	}else{
		echo'<div class="contact-header-info center-block col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<div class="col-lg-3"><img src="'.$header_info_fields['site_logo']['url'].'"/></div>
		<div class="col-lg-3"><p class="company-name">'.$header_info_fields['company_name'].'</p></div>
		<div class="col-lg-3"><p class="product-description">'.$header_info_fields['product_description'].'</p></div>
		<div class="col-lg-3"><p class="tagline">'.$header_info_fields['tagline'].'</p></div>
		<div class="col-lg-3"><p class="tagline">'.$header_info_fields['reflect_tagline'].'</p></div>
		<div class="col-lg-3"><p class="tagline">'.$header_info_fields['request_quote_image'].'</p></div>
		<div class="col-lg-3"><p class="tagline">'.$header_info_fields['request_quote_button_text'].'</p></div>

	</div>';
	}

}

function render_contact_info(){
	$contact_info_fields = get_contact_page_info();
	echo '<div class="contact-info">
		<div class><p class="phone-number">' . $contact_info_fields['phone_number_1'] . '</p></div>
		<div class><p class="time-to-call">' . $contact_info_fields['time_to_call'] . '</p></div>
		<div class><p class="phone-number">' . $contact_info_fields['phone_number_2'] . '</p></div>
		<div class><p class="adress">' . $contact_info_fields['adress'] . '</p></div>
		<div class><p class="email">' . $contact_info_fields['email'] . '</p></div>
	</div>';

}

function render_footer_info(){
	$contact_info_fields = get_contact_page_info();
$args = array(
	'post_title'	   => 'Footer info',
	'category'         => '',
	'category_name'    => '',
	'post_type'        => 'footer_info',
);
$footer_info = get_posts($args);
	$footer_info_fields = get_fields($footer_info[0]->ID);
	echo'<div class="footer-info row">
				<div class="left-block col-lg-6 col-md-6 col-sm-6 col-xs-6">
					<div class="left-block-image"><a href="'.$footer_info_fields['link_for_left_footer_image'].'"><img src="'.$footer_info_fields['left_footer_image']['url'].'"/></a></div>
					<div class="adress"><p>' . $contact_info_fields['adress'] . '</p></div>
					<div class="phone-number"><p>' . $contact_info_fields['phone_number_1'].'</p></div>
					<div class="email"><p>' . $contact_info_fields['email'] . '</p></div>
				</div>
				<div class="right-block pull-right col-lg-6 col-md-6 col-sm-6 col-xs-6">
					<div class="right-block-image"><a href="'.$footer_info_fields['link_for_right_footer_image'].'"><img src="'.$footer_info_fields['right_footer_image']['url'].'"/></a></div>
					<div class="right-block-info">'.$footer_info_fields['info_for_right_footer_image'].'</div>
				</div>
		</div>';

}



function get_contact_page_info(){
	$args = array(
		'post_type'        => 'page',
	);
	$contact_info = get_posts($args);
	foreach($contact_info as  $key => $page){
		if($page->post_title == 'Contact Us'){
			$contact_info_fields = get_fields($page->ID);
		}
	}

	return $contact_info_fields;
}

//function my_scripts_enqueue() {
//	wp_register_script( 'bootstrap-js', '://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js', array('jquery'), NULL, true );
//	wp_register_style( 'bootstrap-css', '://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css', false, NULL, 'all' );
//
//	wp_enqueue_script( 'bootstrap-js' );
//	wp_enqueue_style( 'bootstrap-css' );
//}
//add_action( 'wp_enqueue_scripts', 'my_scripts_enqueue' );

function my_scripts_enqueue() {
	wp_register_script( 'bootstrap-js', get_template_directory_uri().'/js/bootstrap/js/bootstrap.js', array('jquery'), NULL, true );
	wp_register_style( 'bootstrap-css',  get_template_directory_uri().'/css/bootstrap/css/bootstrap.css', false, NULL, 'all' );

	wp_enqueue_script( 'bootstrap-js' );
	wp_enqueue_style( 'bootstrap-css' );
}
add_action( 'wp_enqueue_scripts', 'my_scripts_enqueue' );