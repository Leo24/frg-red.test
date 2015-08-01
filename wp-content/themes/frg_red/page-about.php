<?php
/**
 * The template for displaying all pages
 *
 * This is the template that displays all pages by default.
 * Please note that this is the WordPress construct of pages and that other
 * 'pages' on your WordPress site will use a different template.
 *
 * @package WordPress
 * @subpackage Twenty_Thirteen
 * @since Twenty Thirteen 1.0
 */

get_header(); ?>

	<div id="primary" class="content-area">
		<div id="content" class="site-content" role="main">

			<?php /* The loop */ ?>
			<?php while ( have_posts() ) : the_post(); ?>

				<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
					<div class="center-block row">
					<header class="entry-header">
						<?php if ( has_post_thumbnail() && ! post_password_required() ) : ?>
							<div class="entry-thumbnail">
								<?php the_post_thumbnail(); ?>
							</div>
						<?php endif; ?>

						<?php if(is_front_page() == false): ?>
							<h1 class="entry-title"><?php the_title(); ?></h1>
						<?php endif; ?>
					</header><!-- .entry-header -->

					<div class="entry-content about-us-page col-lg-7 col-md-7 col-sm-8 col-xs-8">
						<?php the_content(); ?>
<!--						--><?php //wp_link_pages( array( 'before' => '<div class="page-links"><span class="page-links-title">' . __( 'Pages:', 'frg_red' ) . '</span>', 'after' => '</div>', 'link_before' => '<span>', 'link_after' => '</span>' ) ); ?>
					</div><!-- .entry-content -->


					<?php if ( is_active_sidebar( 'about_us_page_widget' ) ) : ?>
						<div class="about-us-page-widget widget-area col-lg-4 col-md-3 col-sm-8 col-xs-8" role="complementary">
							<?php dynamic_sidebar( 'about_us_page_widget' ); ?>
						</div><!-- #primary-sidebar -->
					<?php endif; ?>



					<footer class="entry-meta">
						<!--						--><?php //edit_post_link( __( 'Edit', 'frg_red' ), '<span class="edit-link">', '</span>' ); ?>
					</footer><!-- .entry-meta -->
						</div>
				</article><!-- #post -->

				<?php comments_template(); ?>
			<?php endwhile; ?>

		</div><!-- #content -->
	</div><!-- #primary -->

<?php get_sidebar(); ?>
<?php get_footer(); ?>