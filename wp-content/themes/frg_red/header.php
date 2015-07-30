<?php
/**
 * The Header template for our theme
 *
 * Displays all of the <head> section and everything up till <div id="main">
 *
 * @package WordPress
 * @subpackage Twenty_Thirteen
 * @since Twenty Thirteen 1.0
 */
?><!DOCTYPE html>
<!--[if IE 7]>
<html class="ie ie7" <?php language_attributes(); ?>>
<![endif]-->
<!--[if IE 8]>
<html class="ie ie8" <?php language_attributes(); ?>>
<![endif]-->
<!--[if !(IE 7) & !(IE 8)]><!-->
<html <?php language_attributes(); ?>>
<!--<![endif]-->
<head>
	<meta charset="<?php bloginfo( 'charset' ); ?>">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title><?php wp_title( '|', true, 'right' ); ?></title>
	<link rel="profile" href="http://gmpg.org/xfn/11">
	<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>">
	<link rel="shortcut icon" and ends with /favicon.ico" />
	<!--[if lt IE 9]>
	<script src="<?php echo get_template_directory_uri(); ?>/js/html5.js"></script>
	<![endif]-->
	<?php wp_head(); ?>
</head>

<body <?php body_class(); ?>>
	<div id="page" class="hfeed site container">
		<header id="masthead" class="site-header row" role="banner">
<!--			<a class="home-link" href="--><?php //echo esc_url( home_url( '/' ) ); ?><!--" title="--><?php //echo esc_attr( get_bloginfo( 'name', 'display' ) ); ?><!--" rel="home">-->
<!--				<h1 class="site-title">--><?php //bloginfo( 'name' ); ?><!--</h1>-->
<!--				<h2 class="site-description">--><?php //bloginfo( 'description' ); ?><!--</h2>-->
<!--			</a>-->

			<?php get_header_info(is_front_page());?>

			<?php
			if(is_front_page()):
				if ( is_active_sidebar( 'menus_slider_widget' ) ) : ?>
					<div id="primary-sidebar" class="primary-sidebar widget-area center-block col-lg-9 col-md-11 col-sm-8 col-xs-8" role="complementary">
						<?php dynamic_sidebar( 'menus_slider_widget' ); ?>
					</div><!-- #primary-sidebar -->
				<?php endif; ?>
<!--			--><?php //endif; ?>

			<?php else:
//			if(is_front_page() == false):
				?>
			<div id="navbar" class="navbar">
				<nav id="site-navigation" class="navigation main-navigation" role="navigation">
					<button class="menu-toggle"><?php _e( 'Menu', 'frg_red' ); ?></button>
<!--					<a class="screen-reader-text skip-link" href="#content" title="--><?php //esc_attr_e( 'Skip to content', 'frg_red' ); ?><!--">--><?php //_e( 'Skip to content', 'frg_red' ); ?><!--</a>-->
					<?php wp_nav_menu( array( 'theme_location' => 'primary', 'menu_class' => 'nav-menu', 'menu_id' => 'primary-menu' ) ); ?>
<!--					--><?php //get_search_form(); ?>
				</nav><!-- #site-navigation -->
			</div><!-- #navbar -->
			<?php endif;?>
		</header><!-- #masthead -->

		<div id="main" class="site-main">
