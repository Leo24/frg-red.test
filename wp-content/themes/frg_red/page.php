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

					<div class="entry-content">
						<?php the_content(); ?>
						<?php wp_link_pages( array( 'before' => '<div class="page-links"><span class="page-links-title">' . __( 'Pages:', 'frg_red' ) . '</span>', 'after' => '</div>', 'link_before' => '<span>', 'link_after' => '</span>' ) ); ?>


						<?php
						if(is_front_page()):
							if ( is_active_sidebar( 'home_bottom_news_blocks' ) ) : ?>
								<div id="home-bottom-widget" class="home-bottom-widget row" role="complementary">
									<ul class="widget-wrapper">
										<?php dynamic_sidebar( 'home_bottom_news_blocks' ); ?>
									</ul>
								</div><!-- #primary-sidebar -->
							<?php endif; ?>
						<?php endif; ?>



<?php if(is_page('contact-page')):?>
						<div id="view1">
							<?php
							$location = get_field('google_map');
							if( ! empty($location) ):
								?>
								<div id="map" style="width: 100%; height: 350px;"></div>
								<script src='http://maps.googleapis.com/maps/api/js?sensor=false' type='text/javascript'></script>

								<script type="text/javascript">
									//<![CDATA[
									function load() {
										var lat = <?php echo $location['lat']; ?>;
										var lng = <?php echo $location['lng']; ?>;
// coordinates to latLng
										var latlng = new google.maps.LatLng(lat, lng);
// map Options
										var myOptions = {
											zoom: 9,
											center: latlng,
											mapTypeId: google.maps.MapTypeId.ROADMAP
										};
//draw a map
										var map = new google.maps.Map(document.getElementById("map"), myOptions);
										var marker = new google.maps.Marker({
											position: map.getCenter(),
											map: map
										});z
									}
									// call the function
									load();
									//]]>
								</script>
							<?php endif; ?>
						</div>
	<?php render_contact_info();?>

<?php endif;?>



					</div><!-- .entry-content -->

					<footer class="entry-meta">
<!--						--><?php //edit_post_link( __( 'Edit', 'frg_red' ), '<span class="edit-link">', '</span>' ); ?>
					</footer><!-- .entry-meta -->
				</article><!-- #post -->

				<?php comments_template(); ?>
			<?php endwhile; ?>

		</div><!-- #content -->
	</div><!-- #primary -->

<?php get_sidebar(); ?>
<?php get_footer(); ?>