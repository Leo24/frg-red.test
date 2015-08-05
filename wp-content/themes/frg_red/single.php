<?php
/**
 * The template for displaying all single posts
 *
 * @package WordPress
 * @subpackage Twenty_Thirteen
 * @since Twenty Thirteen 1.0
 */

get_header(); ?>

	<div id="primary" class="content-area">
		<div id="content" class="site-content col-lg-4 col-md-5 col-sm-5 col-xs-5" role="main">

			<?php /* The loop */ ?>
			<?php while ( have_posts() ) : the_post(); ?>

				<?php get_template_part( 'content-single-page', get_post_format() ); ?>


			<?php endwhile; ?>

		</div><!-- #content -->

		<div class="gallery col-lg-8 col-md-6 col-sm-6 col-xs-6">
<?php
		$post_id = get_the_ID();
		$post_fields = get_fields($post_id);
			if($post_fields && !empty($post_fields)){
				echo do_shortcode($post_fields['post_gallery']);
			}
?>

		</div>

	</div><!-- #primary -->

<?php get_sidebar(); ?>
<?php get_footer(); ?>