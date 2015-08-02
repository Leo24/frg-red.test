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
					<div class="row">
						<header class="entry-header">
							<?php if ( has_post_thumbnail() && ! post_password_required() ) : ?>
								<div class="entry-thumbnail">
									<?php the_post_thumbnail(); ?>
								</div>
							<?php endif; ?>

							<h1 class="entry-title contact-page"><?php the_title(); ?></h1>

						</header><!-- .entry-header -->

						<div class="entry-content contact-page col-lg-6 col-md-6 col-sm-6 col-xs-10">
							<?php the_content(); ?>
							<div class="contact-form">
								<?php contact_page_form(); ?>
							</div>

						</div><!-- .entry-content -->



						<div id="google-map" class="google-map col-lg-6 col-md-6 col-sm-6 col-xs-10">
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
										});
									}
									// call the function
									load();
									//]]>
								</script>
							<?php endif; ?>
								<?php render_contact_info();?>
						</div>



						<footer class="entry-meta">
						</footer><!-- .entry-meta -->
					</div>
				</article><!-- #post -->

				<?php comments_template(); ?>
			<?php endwhile; ?>

		</div><!-- #content -->
	</div><!-- #primary -->

<?php get_sidebar(); ?>
<?php get_footer(); ?>