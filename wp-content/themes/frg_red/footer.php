<?php
/**
 * The template for displaying the footer
 *
 * Contains footer content and the closing of the #main and #page div elements.
 *
 * @package WordPress
 * @subpackage Twenty_Thirteen
 * @since Twenty Thirteen 1.0
 */
?>

		</div><!-- #main -->
		<footer id="colophon" class="site-footer" role="contentinfo">
			<?php get_sidebar( 'main' ); ?>
			<?php render_footer_info(); ?>

		</footer><!-- #colophon -->
	</div><!-- #page -->
<div class="site-info">
	<?php do_action( 'frg_red_credits' ); ?>
	<p class="copyright"><?php printf( __( '&#169 2014 %s', 'frg_red' ), 'Fort Rouge Glass' ); ?></p>
</div><!-- .site-info -->
	<?php wp_footer(); ?>
</body>
</html>