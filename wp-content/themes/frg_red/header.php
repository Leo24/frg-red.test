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
			<?php get_header_info(is_front_page());?>
			<?php
			if(is_front_page()):
				if ( is_active_sidebar( 'menus_slider_widget' ) ) : ?>
					<div id="primary-sidebar" class="primary-sidebar widget-area center-block col-lg-9 col-md-11 col-sm-8 col-xs-8" role="complementary">
						<?php dynamic_sidebar( 'menus_slider_widget' ); ?>
					</div><!-- #primary-sidebar -->
				<?php endif; ?>
<!--			--><?php //endif; ?>

			<?php elseif(is_single() == false):
				?>
			<div id="navbar" class="">
				<nav id="site-navigation" class="navigation main-navigation" role="navigation">
					<?php wp_nav_menu( array( 'theme_location' => 'primary', 'menu_class' => 'nav-menu', 'menu_id' => 'primary-menu', 'menu' => 'Page Menu'  ) ); ?>
				</nav><!-- #site-navigation -->
			</div><!-- #navbar -->

			<?php else:?>
				<div id="navbar" class="">
					<nav id="site-navigation" class="navigation main-navigation" role="navigation">
						<?php wp_nav_menu( array( 'theme_location' => 'primary', 'menu_class' => 'nav-menu', 'menu_id' => 'primary-menu', 'menu' => 'Single Page Menu' ) ); ?>
					</nav><!-- #site-navigation -->
				</div><!-- #navbar -->
			<?php endif;?>
		</header><!-- #masthead -->

		<div id="main" class="site-main">
