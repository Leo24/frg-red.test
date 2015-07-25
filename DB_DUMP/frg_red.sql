-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 25, 2015 at 03:25 PM
-- Server version: 5.5.44-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `frg_red`
--

-- --------------------------------------------------------

--
-- Table structure for table `frg_commentmeta`
--

CREATE TABLE IF NOT EXISTS `frg_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `frg_comments`
--

CREATE TABLE IF NOT EXISTS `frg_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `frg_comments`
--

INSERT INTO `frg_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Mr WordPress', '', 'https://wordpress.org/', '', '2015-07-25 07:15:50', '2015-07-25 07:15:50', 'Hi, this is a comment.\nTo delete a comment, just log in and view the post&#039;s comments. There you will have the option to edit or delete them.', 0, '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `frg_links`
--

CREATE TABLE IF NOT EXISTS `frg_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `frg_ngg_album`
--

CREATE TABLE IF NOT EXISTS `frg_ngg_album` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `previewpic` bigint(20) NOT NULL DEFAULT '0',
  `albumdesc` mediumtext COLLATE utf8mb4_unicode_ci,
  `sortorder` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `pageid` bigint(20) NOT NULL DEFAULT '0',
  `extras_post_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `extras_post_id_key` (`extras_post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `frg_ngg_gallery`
--

CREATE TABLE IF NOT EXISTS `frg_ngg_gallery` (
  `gid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` mediumtext COLLATE utf8mb4_unicode_ci,
  `title` mediumtext COLLATE utf8mb4_unicode_ci,
  `galdesc` mediumtext COLLATE utf8mb4_unicode_ci,
  `pageid` bigint(20) NOT NULL DEFAULT '0',
  `previewpic` bigint(20) NOT NULL DEFAULT '0',
  `author` bigint(20) NOT NULL DEFAULT '0',
  `extras_post_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`gid`),
  KEY `extras_post_id_key` (`extras_post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `frg_ngg_pictures`
--

CREATE TABLE IF NOT EXISTS `frg_ngg_pictures` (
  `pid` bigint(20) NOT NULL AUTO_INCREMENT,
  `image_slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_id` bigint(20) NOT NULL DEFAULT '0',
  `galleryid` bigint(20) NOT NULL DEFAULT '0',
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `alttext` mediumtext COLLATE utf8mb4_unicode_ci,
  `imagedate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `exclude` tinyint(4) DEFAULT '0',
  `sortorder` bigint(20) NOT NULL DEFAULT '0',
  `meta_data` longtext COLLATE utf8mb4_unicode_ci,
  `extras_post_id` bigint(20) NOT NULL DEFAULT '0',
  `updated_at` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `extras_post_id_key` (`extras_post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `frg_options`
--

CREATE TABLE IF NOT EXISTS `frg_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=480 ;

--
-- Dumping data for table `frg_options`
--

INSERT INTO `frg_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://frg-red.test', 'yes'),
(2, 'home', 'http://frg-red.test', 'yes'),
(3, 'blogname', 'FRG-RED', 'yes'),
(4, 'blogdescription', 'Just another WordPress site', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'leo2410ua@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '0', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(29, 'gzipcompression', '0', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:6:{i:0;s:63:"advanced-custom-fields-nextgen-gallery-field-add-on/acf-ngg.php";i:1;s:30:"advanced-custom-fields/acf.php";i:2;s:43:"all-in-one-seo-pack/all_in_one_seo_pack.php";i:3;s:36:"contact-form-7/wp-contact-form-7.php";i:4;s:29:"nextgen-gallery/nggallery.php";i:5;s:53:"simple-custom-post-order/simple-custom-post-order.php";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'advanced_edit', '0', 'yes'),
(37, 'comment_max_links', '2', 'yes'),
(38, 'gmt_offset', '0', 'yes'),
(39, 'default_email_category', '1', 'yes'),
(40, 'recently_edited', '', 'no'),
(41, 'template', 'frg_red', 'yes'),
(42, 'stylesheet', 'frg_red', 'yes'),
(43, 'comment_whitelist', '1', 'yes'),
(44, 'blacklist_keys', '', 'no'),
(45, 'comment_registration', '0', 'yes'),
(46, 'html_type', 'text/html', 'yes'),
(47, 'use_trackback', '0', 'yes'),
(48, 'default_role', 'subscriber', 'yes'),
(49, 'db_version', '31536', 'yes'),
(50, 'uploads_use_yearmonth_folders', '1', 'yes'),
(51, 'upload_path', '', 'yes'),
(52, 'blog_public', '0', 'yes'),
(53, 'default_link_category', '2', 'yes'),
(54, 'show_on_front', 'posts', 'yes'),
(55, 'tag_base', '', 'yes'),
(56, 'show_avatars', '1', 'yes'),
(57, 'avatar_rating', 'G', 'yes'),
(58, 'upload_url_path', '', 'yes'),
(59, 'thumbnail_size_w', '150', 'yes'),
(60, 'thumbnail_size_h', '150', 'yes'),
(61, 'thumbnail_crop', '1', 'yes'),
(62, 'medium_size_w', '300', 'yes'),
(63, 'medium_size_h', '300', 'yes'),
(64, 'avatar_default', 'mystery', 'yes'),
(65, 'large_size_w', '1024', 'yes'),
(66, 'large_size_h', '1024', 'yes'),
(67, 'image_default_link_type', 'file', 'yes'),
(68, 'image_default_size', '', 'yes'),
(69, 'image_default_align', '', 'yes'),
(70, 'close_comments_for_old_posts', '0', 'yes'),
(71, 'close_comments_days_old', '14', 'yes'),
(72, 'thread_comments', '1', 'yes'),
(73, 'thread_comments_depth', '5', 'yes'),
(74, 'page_comments', '0', 'yes'),
(75, 'comments_per_page', '50', 'yes'),
(76, 'default_comments_page', 'newest', 'yes'),
(77, 'comment_order', 'asc', 'yes'),
(78, 'sticky_posts', 'a:0:{}', 'yes'),
(79, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(80, 'widget_text', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(81, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(82, 'uninstall_plugins', 'a:1:{s:53:"simple-custom-post-order/simple-custom-post-order.php";s:18:"scporder_uninstall";}', 'no'),
(83, 'timezone_string', '', 'yes'),
(84, 'page_for_posts', '0', 'yes'),
(85, 'page_on_front', '0', 'yes'),
(86, 'default_post_format', '0', 'yes'),
(87, 'link_manager_enabled', '0', 'yes'),
(88, 'initial_db_version', '31536', 'yes'),
(89, 'frg_user_roles', 'a:7:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:142:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:24:"NextGEN Gallery overview";b:1;s:19:"NextGEN Use TinyMCE";b:1;s:21:"NextGEN Upload images";b:1;s:22:"NextGEN Manage gallery";b:1;s:19:"NextGEN Manage tags";b:1;s:29:"NextGEN Manage others gallery";b:1;s:18:"NextGEN Edit album";b:1;s:20:"NextGEN Change style";b:1;s:22:"NextGEN Change options";b:1;s:24:"NextGEN Attach Interface";b:1;s:18:"manage_woocommerce";b:1;s:24:"view_woocommerce_reports";b:1;s:12:"edit_product";b:1;s:12:"read_product";b:1;s:14:"delete_product";b:1;s:13:"edit_products";b:1;s:20:"edit_others_products";b:1;s:16:"publish_products";b:1;s:21:"read_private_products";b:1;s:15:"delete_products";b:1;s:23:"delete_private_products";b:1;s:25:"delete_published_products";b:1;s:22:"delete_others_products";b:1;s:21:"edit_private_products";b:1;s:23:"edit_published_products";b:1;s:20:"manage_product_terms";b:1;s:18:"edit_product_terms";b:1;s:20:"delete_product_terms";b:1;s:20:"assign_product_terms";b:1;s:15:"edit_shop_order";b:1;s:15:"read_shop_order";b:1;s:17:"delete_shop_order";b:1;s:16:"edit_shop_orders";b:1;s:23:"edit_others_shop_orders";b:1;s:19:"publish_shop_orders";b:1;s:24:"read_private_shop_orders";b:1;s:18:"delete_shop_orders";b:1;s:26:"delete_private_shop_orders";b:1;s:28:"delete_published_shop_orders";b:1;s:25:"delete_others_shop_orders";b:1;s:24:"edit_private_shop_orders";b:1;s:26:"edit_published_shop_orders";b:1;s:23:"manage_shop_order_terms";b:1;s:21:"edit_shop_order_terms";b:1;s:23:"delete_shop_order_terms";b:1;s:23:"assign_shop_order_terms";b:1;s:16:"edit_shop_coupon";b:1;s:16:"read_shop_coupon";b:1;s:18:"delete_shop_coupon";b:1;s:17:"edit_shop_coupons";b:1;s:24:"edit_others_shop_coupons";b:1;s:20:"publish_shop_coupons";b:1;s:25:"read_private_shop_coupons";b:1;s:19:"delete_shop_coupons";b:1;s:27:"delete_private_shop_coupons";b:1;s:29:"delete_published_shop_coupons";b:1;s:26:"delete_others_shop_coupons";b:1;s:25:"edit_private_shop_coupons";b:1;s:27:"edit_published_shop_coupons";b:1;s:24:"manage_shop_coupon_terms";b:1;s:22:"edit_shop_coupon_terms";b:1;s:24:"delete_shop_coupon_terms";b:1;s:24:"assign_shop_coupon_terms";b:1;s:17:"edit_shop_webhook";b:1;s:17:"read_shop_webhook";b:1;s:19:"delete_shop_webhook";b:1;s:18:"edit_shop_webhooks";b:1;s:25:"edit_others_shop_webhooks";b:1;s:21:"publish_shop_webhooks";b:1;s:26:"read_private_shop_webhooks";b:1;s:20:"delete_shop_webhooks";b:1;s:28:"delete_private_shop_webhooks";b:1;s:30:"delete_published_shop_webhooks";b:1;s:27:"delete_others_shop_webhooks";b:1;s:26:"edit_private_shop_webhooks";b:1;s:28:"edit_published_shop_webhooks";b:1;s:25:"manage_shop_webhook_terms";b:1;s:23:"edit_shop_webhook_terms";b:1;s:25:"delete_shop_webhook_terms";b:1;s:25:"assign_shop_webhook_terms";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}s:8:"customer";a:2:{s:4:"name";s:8:"Customer";s:12:"capabilities";a:3:{s:4:"read";b:1;s:10:"edit_posts";b:0;s:12:"delete_posts";b:0;}}s:12:"shop_manager";a:2:{s:4:"name";s:12:"Shop Manager";s:12:"capabilities";a:110:{s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:4:"read";b:1;s:18:"read_private_pages";b:1;s:18:"read_private_posts";b:1;s:10:"edit_users";b:1;s:10:"edit_posts";b:1;s:10:"edit_pages";b:1;s:20:"edit_published_posts";b:1;s:20:"edit_published_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"edit_private_posts";b:1;s:17:"edit_others_posts";b:1;s:17:"edit_others_pages";b:1;s:13:"publish_posts";b:1;s:13:"publish_pages";b:1;s:12:"delete_posts";b:1;s:12:"delete_pages";b:1;s:20:"delete_private_pages";b:1;s:20:"delete_private_posts";b:1;s:22:"delete_published_pages";b:1;s:22:"delete_published_posts";b:1;s:19:"delete_others_posts";b:1;s:19:"delete_others_pages";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:17:"moderate_comments";b:1;s:15:"unfiltered_html";b:1;s:12:"upload_files";b:1;s:6:"export";b:1;s:6:"import";b:1;s:10:"list_users";b:1;s:18:"manage_woocommerce";b:1;s:24:"view_woocommerce_reports";b:1;s:12:"edit_product";b:1;s:12:"read_product";b:1;s:14:"delete_product";b:1;s:13:"edit_products";b:1;s:20:"edit_others_products";b:1;s:16:"publish_products";b:1;s:21:"read_private_products";b:1;s:15:"delete_products";b:1;s:23:"delete_private_products";b:1;s:25:"delete_published_products";b:1;s:22:"delete_others_products";b:1;s:21:"edit_private_products";b:1;s:23:"edit_published_products";b:1;s:20:"manage_product_terms";b:1;s:18:"edit_product_terms";b:1;s:20:"delete_product_terms";b:1;s:20:"assign_product_terms";b:1;s:15:"edit_shop_order";b:1;s:15:"read_shop_order";b:1;s:17:"delete_shop_order";b:1;s:16:"edit_shop_orders";b:1;s:23:"edit_others_shop_orders";b:1;s:19:"publish_shop_orders";b:1;s:24:"read_private_shop_orders";b:1;s:18:"delete_shop_orders";b:1;s:26:"delete_private_shop_orders";b:1;s:28:"delete_published_shop_orders";b:1;s:25:"delete_others_shop_orders";b:1;s:24:"edit_private_shop_orders";b:1;s:26:"edit_published_shop_orders";b:1;s:23:"manage_shop_order_terms";b:1;s:21:"edit_shop_order_terms";b:1;s:23:"delete_shop_order_terms";b:1;s:23:"assign_shop_order_terms";b:1;s:16:"edit_shop_coupon";b:1;s:16:"read_shop_coupon";b:1;s:18:"delete_shop_coupon";b:1;s:17:"edit_shop_coupons";b:1;s:24:"edit_others_shop_coupons";b:1;s:20:"publish_shop_coupons";b:1;s:25:"read_private_shop_coupons";b:1;s:19:"delete_shop_coupons";b:1;s:27:"delete_private_shop_coupons";b:1;s:29:"delete_published_shop_coupons";b:1;s:26:"delete_others_shop_coupons";b:1;s:25:"edit_private_shop_coupons";b:1;s:27:"edit_published_shop_coupons";b:1;s:24:"manage_shop_coupon_terms";b:1;s:22:"edit_shop_coupon_terms";b:1;s:24:"delete_shop_coupon_terms";b:1;s:24:"assign_shop_coupon_terms";b:1;s:17:"edit_shop_webhook";b:1;s:17:"read_shop_webhook";b:1;s:19:"delete_shop_webhook";b:1;s:18:"edit_shop_webhooks";b:1;s:25:"edit_others_shop_webhooks";b:1;s:21:"publish_shop_webhooks";b:1;s:26:"read_private_shop_webhooks";b:1;s:20:"delete_shop_webhooks";b:1;s:28:"delete_private_shop_webhooks";b:1;s:30:"delete_published_shop_webhooks";b:1;s:27:"delete_others_shop_webhooks";b:1;s:26:"edit_private_shop_webhooks";b:1;s:28:"edit_published_shop_webhooks";b:1;s:25:"manage_shop_webhook_terms";b:1;s:23:"edit_shop_webhook_terms";b:1;s:25:"delete_shop_webhook_terms";b:1;s:25:"assign_shop_webhook_terms";b:1;}}}', 'yes'),
(90, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(91, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(92, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(93, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(94, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'sidebars_widgets', 'a:6:{s:18:"orphaned_widgets_1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:0:{}s:9:"sidebar-2";a:0:{}s:19:"menus_slider_widget";a:3:{i:0;s:10:"nav_menu-2";i:1;s:7:"pages-2";i:2;s:10:"nav_menu-3";}s:13:"array_version";i:3;}', 'yes'),
(97, 'cron', 'a:9:{i:1437831603;a:1:{s:29:"ngg_delete_expired_transients";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"ngg_custom";s:4:"args";a:0:{}s:8:"interval";i:900;}}}i:1437851751;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1437852540;a:1:{s:20:"wp_maybe_auto_update";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1437856233;a:1:{s:28:"woocommerce_cleanup_sessions";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1437868800;a:1:{s:27:"woocommerce_scheduled_sales";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1437894965;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1437899433;a:1:{s:30:"woocommerce_tracker_send_event";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1437901238;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(101, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:1:{i:0;O:8:"stdClass":10:{s:8:"response";s:6:"latest";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-4.2.3.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-4.2.3.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-4.2.3-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-4.2.3-new-bundled.zip";s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"4.2.3";s:7:"version";s:5:"4.2.3";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.1";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1437808560;s:15:"version_checked";s:5:"4.2.3";s:12:"translations";a:0:{}}', 'yes'),
(106, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1437825988;s:7:"checked";a:4:{s:7:"frg_red";s:0:"";s:13:"twentyfifteen";s:3:"1.2";s:14:"twentyfourteen";s:3:"1.4";s:14:"twentythirteen";s:3:"1.5";}s:8:"response";a:0:{}s:12:"translations";a:0:{}}', 'yes'),
(107, '_site_transient_update_plugins', 'O:8:"stdClass":5:{s:12:"last_checked";i:1437817259;s:7:"checked";a:10:{s:30:"advanced-custom-fields/acf.php";s:5:"4.4.2";s:63:"advanced-custom-fields-nextgen-gallery-field-add-on/acf-ngg.php";s:3:"2.1";s:19:"akismet/akismet.php";s:5:"3.1.1";s:43:"all-in-one-seo-pack/all_in_one_seo_pack.php";s:7:"2.2.7.1";s:36:"contact-form-7/wp-contact-form-7.php";s:5:"4.2.1";s:9:"hello.php";s:3:"1.6";s:29:"nextgen-gallery/nggallery.php";s:5:"2.1.2";s:53:"simple-custom-post-order/simple-custom-post-order.php";s:3:"2.3";s:25:"ultimate-tinymce/main.php";s:3:"5.7";s:27:"woocommerce/woocommerce.php";s:6:"2.3.13";}s:8:"response";a:1:{s:19:"akismet/akismet.php";O:8:"stdClass":6:{s:2:"id";s:2:"15";s:4:"slug";s:7:"akismet";s:6:"plugin";s:19:"akismet/akismet.php";s:11:"new_version";s:5:"3.1.3";s:3:"url";s:38:"https://wordpress.org/plugins/akismet/";s:7:"package";s:56:"https://downloads.wordpress.org/plugin/akismet.3.1.3.zip";}}s:12:"translations";a:0:{}s:9:"no_update";a:9:{s:30:"advanced-custom-fields/acf.php";O:8:"stdClass":6:{s:2:"id";s:5:"21367";s:4:"slug";s:22:"advanced-custom-fields";s:6:"plugin";s:30:"advanced-custom-fields/acf.php";s:11:"new_version";s:5:"4.4.2";s:3:"url";s:53:"https://wordpress.org/plugins/advanced-custom-fields/";s:7:"package";s:65:"https://downloads.wordpress.org/plugin/advanced-custom-fields.zip";}s:63:"advanced-custom-fields-nextgen-gallery-field-add-on/acf-ngg.php";O:8:"stdClass":6:{s:2:"id";s:5:"32126";s:4:"slug";s:51:"advanced-custom-fields-nextgen-gallery-field-add-on";s:6:"plugin";s:63:"advanced-custom-fields-nextgen-gallery-field-add-on/acf-ngg.php";s:11:"new_version";s:3:"2.1";s:3:"url";s:82:"https://wordpress.org/plugins/advanced-custom-fields-nextgen-gallery-field-add-on/";s:7:"package";s:94:"https://downloads.wordpress.org/plugin/advanced-custom-fields-nextgen-gallery-field-add-on.zip";}s:43:"all-in-one-seo-pack/all_in_one_seo_pack.php";O:8:"stdClass":6:{s:2:"id";s:3:"520";s:4:"slug";s:19:"all-in-one-seo-pack";s:6:"plugin";s:43:"all-in-one-seo-pack/all_in_one_seo_pack.php";s:11:"new_version";s:7:"2.2.7.1";s:3:"url";s:50:"https://wordpress.org/plugins/all-in-one-seo-pack/";s:7:"package";s:62:"https://downloads.wordpress.org/plugin/all-in-one-seo-pack.zip";}s:36:"contact-form-7/wp-contact-form-7.php";O:8:"stdClass":6:{s:2:"id";s:3:"790";s:4:"slug";s:14:"contact-form-7";s:6:"plugin";s:36:"contact-form-7/wp-contact-form-7.php";s:11:"new_version";s:5:"4.2.1";s:3:"url";s:45:"https://wordpress.org/plugins/contact-form-7/";s:7:"package";s:63:"https://downloads.wordpress.org/plugin/contact-form-7.4.2.1.zip";}s:9:"hello.php";O:8:"stdClass":6:{s:2:"id";s:4:"3564";s:4:"slug";s:11:"hello-dolly";s:6:"plugin";s:9:"hello.php";s:11:"new_version";s:3:"1.6";s:3:"url";s:42:"https://wordpress.org/plugins/hello-dolly/";s:7:"package";s:58:"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip";}s:29:"nextgen-gallery/nggallery.php";O:8:"stdClass":6:{s:2:"id";s:3:"592";s:4:"slug";s:15:"nextgen-gallery";s:6:"plugin";s:29:"nextgen-gallery/nggallery.php";s:11:"new_version";s:5:"2.1.2";s:3:"url";s:46:"https://wordpress.org/plugins/nextgen-gallery/";s:7:"package";s:64:"https://downloads.wordpress.org/plugin/nextgen-gallery.2.1.2.zip";}s:53:"simple-custom-post-order/simple-custom-post-order.php";O:8:"stdClass":6:{s:2:"id";s:5:"42644";s:4:"slug";s:24:"simple-custom-post-order";s:6:"plugin";s:53:"simple-custom-post-order/simple-custom-post-order.php";s:11:"new_version";s:3:"2.3";s:3:"url";s:55:"https://wordpress.org/plugins/simple-custom-post-order/";s:7:"package";s:67:"https://downloads.wordpress.org/plugin/simple-custom-post-order.zip";}s:25:"ultimate-tinymce/main.php";O:8:"stdClass":6:{s:2:"id";s:5:"27096";s:4:"slug";s:16:"ultimate-tinymce";s:6:"plugin";s:25:"ultimate-tinymce/main.php";s:11:"new_version";s:3:"5.7";s:3:"url";s:47:"https://wordpress.org/plugins/ultimate-tinymce/";s:7:"package";s:63:"https://downloads.wordpress.org/plugin/ultimate-tinymce.5.7.zip";}s:27:"woocommerce/woocommerce.php";O:8:"stdClass":6:{s:2:"id";s:5:"25331";s:4:"slug";s:11:"woocommerce";s:6:"plugin";s:27:"woocommerce/woocommerce.php";s:11:"new_version";s:6:"2.3.13";s:3:"url";s:42:"https://wordpress.org/plugins/woocommerce/";s:7:"package";s:61:"https://downloads.wordpress.org/plugin/woocommerce.2.3.13.zip";}}}', 'yes'),
(109, '_site_transient_timeout_browser_af078f48fe7bac652eef3a9d7053ae6d', '1438413366', 'yes'),
(110, '_site_transient_browser_af078f48fe7bac652eef3a9d7053ae6d', 'a:9:{s:8:"platform";s:5:"Linux";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"44.0.2403.89";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(112, 'can_compress_scripts', '0', 'yes'),
(131, '_site_transient_timeout_browser_3e11404a8a85315b8c77f46c9aedcae6', '1438416458', 'yes'),
(132, '_site_transient_browser_3e11404a8a85315b8c77f46c9aedcae6', 'a:9:{s:8:"platform";s:5:"Linux";s:4:"name";s:6:"Chrome";s:7:"version";s:13:"43.0.2357.130";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(133, 'recently_activated', 'a:2:{s:9:"hello.php";i:1437813111;s:27:"woocommerce/woocommerce.php";i:1437813057;}', 'yes'),
(134, '_site_transient_timeout_poptags_40cd750bba9870f18aada2478b24840a', '1437823130', 'yes'),
(135, '_site_transient_poptags_40cd750bba9870f18aada2478b24840a', 'a:40:{s:6:"widget";a:3:{s:4:"name";s:6:"widget";s:4:"slug";s:6:"widget";s:5:"count";s:4:"5223";}s:4:"post";a:3:{s:4:"name";s:4:"Post";s:4:"slug";s:4:"post";s:5:"count";s:4:"3269";}s:6:"plugin";a:3:{s:4:"name";s:6:"plugin";s:4:"slug";s:6:"plugin";s:5:"count";s:4:"3204";}s:5:"admin";a:3:{s:4:"name";s:5:"admin";s:4:"slug";s:5:"admin";s:5:"count";s:4:"2734";}s:5:"posts";a:3:{s:4:"name";s:5:"posts";s:4:"slug";s:5:"posts";s:5:"count";s:4:"2503";}s:7:"sidebar";a:3:{s:4:"name";s:7:"sidebar";s:4:"slug";s:7:"sidebar";s:5:"count";s:4:"2001";}s:9:"shortcode";a:3:{s:4:"name";s:9:"shortcode";s:4:"slug";s:9:"shortcode";s:5:"count";s:4:"1906";}s:6:"google";a:3:{s:4:"name";s:6:"google";s:4:"slug";s:6:"google";s:5:"count";s:4:"1836";}s:7:"twitter";a:3:{s:4:"name";s:7:"twitter";s:4:"slug";s:7:"twitter";s:5:"count";s:4:"1787";}s:6:"images";a:3:{s:4:"name";s:6:"images";s:4:"slug";s:6:"images";s:5:"count";s:4:"1769";}s:4:"page";a:3:{s:4:"name";s:4:"page";s:4:"slug";s:4:"page";s:5:"count";s:4:"1738";}s:8:"comments";a:3:{s:4:"name";s:8:"comments";s:4:"slug";s:8:"comments";s:5:"count";s:4:"1728";}s:5:"image";a:3:{s:4:"name";s:5:"image";s:4:"slug";s:5:"image";s:5:"count";s:4:"1621";}s:8:"facebook";a:3:{s:4:"name";s:8:"Facebook";s:4:"slug";s:8:"facebook";s:5:"count";s:4:"1419";}s:3:"seo";a:3:{s:4:"name";s:3:"seo";s:4:"slug";s:3:"seo";s:5:"count";s:4:"1357";}s:9:"wordpress";a:3:{s:4:"name";s:9:"wordpress";s:4:"slug";s:9:"wordpress";s:5:"count";s:4:"1299";}s:5:"links";a:3:{s:4:"name";s:5:"links";s:4:"slug";s:5:"links";s:5:"count";s:4:"1207";}s:6:"social";a:3:{s:4:"name";s:6:"social";s:4:"slug";s:6:"social";s:5:"count";s:4:"1165";}s:7:"gallery";a:3:{s:4:"name";s:7:"gallery";s:4:"slug";s:7:"gallery";s:5:"count";s:4:"1150";}s:5:"email";a:3:{s:4:"name";s:5:"email";s:4:"slug";s:5:"email";s:5:"count";s:4:"1021";}s:7:"widgets";a:3:{s:4:"name";s:7:"widgets";s:4:"slug";s:7:"widgets";s:5:"count";s:3:"975";}s:11:"woocommerce";a:3:{s:4:"name";s:11:"woocommerce";s:4:"slug";s:11:"woocommerce";s:5:"count";s:3:"942";}s:5:"pages";a:3:{s:4:"name";s:5:"pages";s:4:"slug";s:5:"pages";s:5:"count";s:3:"932";}s:6:"jquery";a:3:{s:4:"name";s:6:"jquery";s:4:"slug";s:6:"jquery";s:5:"count";s:3:"896";}s:3:"rss";a:3:{s:4:"name";s:3:"rss";s:4:"slug";s:3:"rss";s:5:"count";s:3:"865";}s:5:"media";a:3:{s:4:"name";s:5:"media";s:4:"slug";s:5:"media";s:5:"count";s:3:"853";}s:5:"video";a:3:{s:4:"name";s:5:"video";s:4:"slug";s:5:"video";s:5:"count";s:3:"806";}s:4:"ajax";a:3:{s:4:"name";s:4:"AJAX";s:4:"slug";s:4:"ajax";s:5:"count";s:3:"791";}s:7:"content";a:3:{s:4:"name";s:7:"content";s:4:"slug";s:7:"content";s:5:"count";s:3:"767";}s:5:"login";a:3:{s:4:"name";s:5:"login";s:4:"slug";s:5:"login";s:5:"count";s:3:"743";}s:9:"ecommerce";a:3:{s:4:"name";s:9:"ecommerce";s:4:"slug";s:9:"ecommerce";s:5:"count";s:3:"738";}s:10:"javascript";a:3:{s:4:"name";s:10:"javascript";s:4:"slug";s:10:"javascript";s:5:"count";s:3:"736";}s:10:"buddypress";a:3:{s:4:"name";s:10:"buddypress";s:4:"slug";s:10:"buddypress";s:5:"count";s:3:"695";}s:5:"photo";a:3:{s:4:"name";s:5:"photo";s:4:"slug";s:5:"photo";s:5:"count";s:3:"687";}s:4:"feed";a:3:{s:4:"name";s:4:"feed";s:4:"slug";s:4:"feed";s:5:"count";s:3:"682";}s:4:"link";a:3:{s:4:"name";s:4:"link";s:4:"slug";s:4:"link";s:5:"count";s:3:"669";}s:7:"youtube";a:3:{s:4:"name";s:7:"youtube";s:4:"slug";s:7:"youtube";s:5:"count";s:3:"649";}s:8:"security";a:3:{s:4:"name";s:8:"security";s:4:"slug";s:8:"security";s:5:"count";s:3:"645";}s:4:"spam";a:3:{s:4:"name";s:4:"spam";s:4:"slug";s:4:"spam";s:5:"count";s:3:"640";}s:6:"photos";a:3:{s:4:"name";s:6:"photos";s:4:"slug";s:6:"photos";s:5:"count";s:3:"639";}}', 'yes'),
(136, 'ngg_transient_groups', 'a:7:{s:9:"__counter";i:7;s:3:"MVC";a:2:{s:2:"id";i:2;s:7:"enabled";b:1;}s:16:"col_in_frg_posts";a:2:{s:2:"id";i:3;s:7:"enabled";b:1;}s:19:"displayed_galleries";a:2:{s:2:"id";i:4;s:7:"enabled";b:1;}s:27:"displayed_gallery_rendering";a:2:{s:2:"id";i:5;s:7:"enabled";b:1;}s:23:"col_in_frg_ngg_pictures";a:2:{s:2:"id";i:6;s:7:"enabled";b:1;}s:22:"col_in_frg_ngg_gallery";a:2:{s:2:"id";i:7;s:7:"enabled";b:1;}}', 'yes'),
(137, 'ngg_options', 'a:68:{s:11:"gallerypath";s:19:"wp-content/gallery/";s:11:"wpmuCSSfile";s:13:"nggallery.css";s:9:"wpmuStyle";b:0;s:9:"wpmuRoles";b:0;s:16:"wpmuImportFolder";b:0;s:13:"wpmuZipUpload";b:0;s:14:"wpmuQuotaCheck";b:0;s:17:"datamapper_driver";s:22:"custom_post_datamapper";s:21:"gallerystorage_driver";s:25:"ngglegacy_gallery_storage";s:20:"maximum_entity_count";i:500;s:17:"router_param_slug";s:9:"nggallery";s:22:"router_param_separator";s:2:"--";s:19:"router_param_prefix";s:0:"";s:9:"deleteImg";b:1;s:9:"swfUpload";b:1;s:13:"usePermalinks";b:0;s:13:"permalinkSlug";s:9:"nggallery";s:14:"graphicLibrary";s:2:"gd";s:14:"imageMagickDir";s:15:"/usr/local/bin/";s:11:"useMediaRSS";b:0;s:18:"galleries_in_feeds";b:0;s:12:"activateTags";i:0;s:10:"appendType";s:4:"tags";s:9:"maxImages";i:7;s:14:"relatedHeading";s:24:"<h3>Related Images:</h3>";s:10:"thumbwidth";i:240;s:11:"thumbheight";i:160;s:8:"thumbfix";b:1;s:12:"thumbquality";i:100;s:8:"imgWidth";i:800;s:9:"imgHeight";i:600;s:10:"imgQuality";i:100;s:9:"imgBackup";b:1;s:13:"imgAutoResize";b:0;s:9:"galImages";s:2:"20";s:17:"galPagedGalleries";i:0;s:10:"galColumns";i:0;s:12:"galShowSlide";b:1;s:12:"galTextSlide";s:16:"[Show slideshow]";s:14:"galTextGallery";s:17:"[Show thumbnails]";s:12:"galShowOrder";s:7:"gallery";s:7:"galSort";s:9:"sortorder";s:10:"galSortDir";s:3:"ASC";s:10:"galNoPages";b:1;s:13:"galImgBrowser";i:0;s:12:"galHiddenImg";i:0;s:10:"galAjaxNav";i:0;s:11:"thumbEffect";s:8:"fancybox";s:9:"thumbCode";s:41:"class="ngg-fancybox" rel="%GALLERY_NAME%"";s:18:"thumbEffectContext";s:14:"nextgen_images";s:5:"wmPos";s:8:"botRight";s:6:"wmXpos";i:5;s:6:"wmYpos";i:5;s:6:"wmType";i:0;s:6:"wmPath";s:0:"";s:6:"wmFont";s:9:"arial.ttf";s:6:"wmSize";i:10;s:6:"wmText";s:7:"FRG-RED";s:7:"wmColor";s:6:"000000";s:8:"wmOpaque";s:3:"100";s:7:"slideFX";s:4:"fade";s:7:"irWidth";i:600;s:8:"irHeight";i:400;s:12:"irRotatetime";i:10;s:11:"activateCSS";i:1;s:7:"CSSfile";s:13:"nggallery.css";s:22:"dynamic_thumbnail_slug";s:13:"nextgen-image";s:23:"dynamic_stylesheet_slug";s:12:"nextgen-dcss";}', 'yes'),
(139, 'photocrati_auto_update_admin_update_list', '', 'yes'),
(140, 'photocrati_auto_update_admin_check_date', '', 'yes'),
(141, 'ngg_db_version', '1.8.1', 'yes'),
(144, 'pope_module_list', 'a:35:{i:0;s:17:"photocrati-fs|0.4";i:1;s:19:"photocrati-i18n|0.1";i:2;s:25:"photocrati-validation|0.1";i:3;s:21:"photocrati-router|0.7";i:4;s:32:"photocrati-wordpress_routing|0.6";i:5;s:23:"photocrati-security|0.2";i:6;s:31:"photocrati-nextgen_settings|0.8";i:7;s:18:"photocrati-mvc|0.5";i:8;s:19:"photocrati-ajax|0.8";i:9;s:25:"photocrati-datamapper|0.8";i:10;s:30:"photocrati-nextgen-legacy|0.14";i:11;s:28:"photocrati-nextgen-data|0.10";i:12;s:33:"photocrati-dynamic_thumbnails|0.6";i:13;s:28:"photocrati-nextgen_admin|0.9";i:14;s:39:"photocrati-nextgen_gallery_display|0.13";i:15;s:34:"photocrati-frame_communication|0.4";i:16;s:30:"photocrati-attach_to_post|0.11";i:17;s:38:"photocrati-nextgen_addgallery_page|0.6";i:18;s:36:"photocrati-nextgen_other_options|0.8";i:19;s:33:"photocrati-nextgen_pagination|0.3";i:20;s:33:"photocrati-dynamic_stylesheet|0.3";i:21;s:23:"photocrati-mediarss|0.4";i:22;s:34:"photocrati-nextgen_pro_upgrade|0.4";i:23;s:20:"photocrati-cache|0.2";i:24;s:24:"photocrati-lightbox|0.14";i:25;s:38:"photocrati-nextgen_basic_templates|0.5";i:26;s:37:"photocrati-nextgen_basic_gallery|0.13";i:27;s:42:"photocrati-nextgen_basic_imagebrowser|0.10";i:28;s:39:"photocrati-nextgen_basic_singlepic|0.11";i:29;s:38:"photocrati-nextgen_basic_tagcloud|0.11";i:30;s:35:"photocrati-nextgen_basic_album|0.10";i:31;s:21:"photocrati-widget|0.5";i:32;s:33:"photocrati-third_party_compat|0.4";i:33;s:29:"photocrati-nextgen_xmlrpc|0.4";i:34;s:20:"photocrati-wpcli|0.1";}', 'yes'),
(174, 'woocommerce_default_country', 'GB', 'yes'),
(175, 'woocommerce_allowed_countries', 'all', 'yes'),
(176, 'woocommerce_specific_allowed_countries', '', 'yes'),
(177, 'woocommerce_default_customer_address', 'geolocation', 'yes'),
(178, 'woocommerce_demo_store', 'no', 'yes'),
(179, 'woocommerce_demo_store_notice', 'This is a demo store for testing purposes &mdash; no orders shall be fulfilled.', 'no'),
(180, 'woocommerce_api_enabled', 'yes', 'yes'),
(181, 'woocommerce_currency', 'GBP', 'yes'),
(182, 'woocommerce_currency_pos', 'left', 'yes'),
(183, 'woocommerce_price_thousand_sep', ',', 'yes'),
(184, 'woocommerce_price_decimal_sep', '.', 'yes'),
(185, 'woocommerce_price_num_decimals', '2', 'yes'),
(186, 'woocommerce_weight_unit', 'kg', 'yes'),
(187, 'woocommerce_dimension_unit', 'cm', 'yes'),
(188, 'woocommerce_enable_review_rating', 'yes', 'no'),
(189, 'woocommerce_review_rating_required', 'yes', 'no'),
(190, 'woocommerce_review_rating_verification_label', 'yes', 'no'),
(191, 'woocommerce_review_rating_verification_required', 'no', 'no'),
(192, 'woocommerce_shop_page_id', '', 'yes'),
(193, 'woocommerce_shop_page_display', '', 'yes'),
(194, 'woocommerce_category_archive_display', '', 'yes'),
(195, 'woocommerce_default_catalog_orderby', 'menu_order', 'yes'),
(196, 'woocommerce_cart_redirect_after_add', 'no', 'yes'),
(197, 'woocommerce_enable_ajax_add_to_cart', 'yes', 'yes'),
(198, 'shop_catalog_image_size', 'a:3:{s:5:"width";s:3:"300";s:6:"height";s:3:"300";s:4:"crop";i:1;}', 'yes'),
(199, 'shop_single_image_size', 'a:3:{s:5:"width";s:3:"600";s:6:"height";s:3:"600";s:4:"crop";i:1;}', 'yes'),
(200, 'shop_thumbnail_image_size', 'a:3:{s:5:"width";s:3:"180";s:6:"height";s:3:"180";s:4:"crop";i:1;}', 'yes'),
(201, 'woocommerce_enable_lightbox', 'yes', 'yes'),
(202, 'woocommerce_manage_stock', 'yes', 'yes'),
(203, 'woocommerce_hold_stock_minutes', '60', 'no'),
(204, 'woocommerce_notify_low_stock', 'yes', 'no'),
(205, 'woocommerce_notify_no_stock', 'yes', 'no'),
(206, 'woocommerce_stock_email_recipient', 'leo2410ua@gmail.com', 'no'),
(207, 'woocommerce_notify_low_stock_amount', '2', 'no'),
(208, 'woocommerce_notify_no_stock_amount', '0', 'no'),
(209, 'woocommerce_hide_out_of_stock_items', 'no', 'yes'),
(210, 'woocommerce_stock_format', '', 'yes'),
(211, 'woocommerce_file_download_method', 'force', 'no'),
(212, 'woocommerce_downloads_require_login', 'no', 'no'),
(213, 'woocommerce_downloads_grant_access_after_payment', 'yes', 'no'),
(214, 'woocommerce_calc_taxes', 'no', 'yes'),
(215, 'woocommerce_prices_include_tax', 'no', 'yes'),
(216, 'woocommerce_tax_based_on', 'shipping', 'yes'),
(217, 'woocommerce_shipping_tax_class', 'title', 'yes'),
(218, 'woocommerce_tax_round_at_subtotal', 'no', 'yes'),
(219, 'woocommerce_tax_classes', 'Reduced Rate\nZero Rate', 'yes'),
(220, 'woocommerce_tax_display_shop', 'excl', 'yes'),
(221, 'woocommerce_tax_display_cart', 'excl', 'no'),
(222, 'woocommerce_price_display_suffix', '', 'yes'),
(223, 'woocommerce_tax_total_display', 'itemized', 'no'),
(224, 'woocommerce_enable_coupons', 'yes', 'no'),
(225, 'woocommerce_enable_guest_checkout', 'yes', 'no'),
(226, 'woocommerce_force_ssl_checkout', 'no', 'yes'),
(227, 'woocommerce_unforce_ssl_checkout', 'no', 'yes'),
(228, 'woocommerce_cart_page_id', '', 'yes'),
(229, 'woocommerce_checkout_page_id', '', 'yes'),
(230, 'woocommerce_terms_page_id', '', 'no'),
(231, 'woocommerce_checkout_pay_endpoint', 'order-pay', 'yes'),
(232, 'woocommerce_checkout_order_received_endpoint', 'order-received', 'yes'),
(233, 'woocommerce_myaccount_add_payment_method_endpoint', 'add-payment-method', 'yes'),
(234, 'woocommerce_calc_shipping', 'yes', 'yes'),
(235, 'woocommerce_enable_shipping_calc', 'yes', 'no'),
(236, 'woocommerce_shipping_cost_requires_address', 'no', 'no'),
(237, 'woocommerce_shipping_method_format', '', 'no'),
(238, 'woocommerce_ship_to_destination', 'billing', 'no'),
(239, 'woocommerce_ship_to_countries', '', 'yes'),
(240, 'woocommerce_specific_ship_to_countries', '', 'yes'),
(241, 'woocommerce_myaccount_page_id', '', 'yes'),
(242, 'woocommerce_myaccount_view_order_endpoint', 'view-order', 'yes'),
(243, 'woocommerce_myaccount_edit_account_endpoint', 'edit-account', 'yes'),
(244, 'woocommerce_myaccount_edit_address_endpoint', 'edit-address', 'yes'),
(245, 'woocommerce_myaccount_lost_password_endpoint', 'lost-password', 'yes'),
(246, 'woocommerce_logout_endpoint', 'customer-logout', 'yes'),
(247, 'woocommerce_enable_signup_and_login_from_checkout', 'yes', 'no'),
(248, 'woocommerce_enable_myaccount_registration', 'no', 'no'),
(249, 'woocommerce_enable_checkout_login_reminder', 'yes', 'no'),
(250, 'woocommerce_registration_generate_username', 'yes', 'no'),
(251, 'woocommerce_registration_generate_password', 'no', 'no'),
(252, 'woocommerce_email_from_name', 'FRG-RED', 'no'),
(253, 'woocommerce_email_from_address', 'leo2410ua@gmail.com', 'no'),
(254, 'woocommerce_email_header_image', '', 'no'),
(255, 'woocommerce_email_footer_text', 'FRG-RED - Powered by WooCommerce', 'no'),
(256, 'woocommerce_email_base_color', '#557da1', 'no'),
(257, 'woocommerce_email_background_color', '#f5f5f5', 'no'),
(258, 'woocommerce_email_body_background_color', '#fdfdfd', 'no'),
(259, 'woocommerce_email_text_color', '#505050', 'no'),
(261, 'woocommerce_db_version', '2.3.13', 'yes'),
(262, 'woocommerce_version', '2.3.13', 'yes'),
(263, 'woocommerce_admin_notices', 'a:2:{i:0;s:7:"install";i:1;s:8:"tracking";}', 'yes'),
(271, 'woocommerce_meta_box_errors', 'a:0:{}', 'yes'),
(272, 'acf_version', '4.4.2', 'yes'),
(273, 'aioseop_options', 'a:89:{s:12:"aiosp_donate";N;s:16:"aiosp_home_title";N;s:22:"aiosp_home_description";s:0:"";s:20:"aiosp_togglekeywords";i:0;s:19:"aiosp_home_keywords";N;s:26:"aiosp_use_static_home_info";i:0;s:9:"aiosp_can";i:1;s:30:"aiosp_no_paged_canonical_links";i:0;s:31:"aiosp_customize_canonical_links";i:0;s:22:"aiosp_can_set_protocol";s:4:"auto";s:20:"aiosp_rewrite_titles";i:1;s:20:"aiosp_force_rewrites";i:1;s:24:"aiosp_use_original_title";i:0;s:16:"aiosp_cap_titles";i:1;s:14:"aiosp_cap_cats";i:1;s:28:"aiosp_home_page_title_format";s:12:"%page_title%";s:23:"aiosp_page_title_format";s:27:"%page_title% | %blog_title%";s:23:"aiosp_post_title_format";s:27:"%post_title% | %blog_title%";s:27:"aiosp_category_title_format";s:31:"%category_title% | %blog_title%";s:26:"aiosp_archive_title_format";s:30:"%archive_title% | %blog_title%";s:23:"aiosp_date_title_format";s:21:"%date% | %blog_title%";s:25:"aiosp_author_title_format";s:23:"%author% | %blog_title%";s:22:"aiosp_tag_title_format";s:20:"%tag% | %blog_title%";s:25:"aiosp_search_title_format";s:23:"%search% | %blog_title%";s:24:"aiosp_description_format";s:13:"%description%";s:22:"aiosp_404_title_format";s:33:"Nothing found for %request_words%";s:18:"aiosp_paged_format";s:14:" - Part %page%";s:17:"aiosp_enablecpost";s:2:"on";s:17:"aiosp_cpostactive";a:2:{i:0;s:4:"post";i:1;s:4:"page";}s:19:"aiosp_cpostadvanced";i:0;s:18:"aiosp_cpostnoindex";a:0:{}s:19:"aiosp_cpostnofollow";a:0:{}s:16:"aiosp_cpostnoodp";a:0:{}s:17:"aiosp_cpostnoydir";a:0:{}s:17:"aiosp_cposttitles";i:0;s:21:"aiosp_posttypecolumns";a:2:{i:0;s:4:"post";i:1;s:4:"page";}s:15:"aiosp_admin_bar";s:2:"on";s:23:"aiosp_custom_menu_order";s:2:"on";s:19:"aiosp_google_verify";s:0:"";s:17:"aiosp_bing_verify";s:0:"";s:22:"aiosp_pinterest_verify";s:0:"";s:22:"aiosp_google_publisher";s:0:"";s:28:"aiosp_google_disable_profile";i:0;s:29:"aiosp_google_sitelinks_search";N;s:26:"aiosp_google_set_site_name";N;s:30:"aiosp_google_specify_site_name";N;s:28:"aiosp_google_author_advanced";i:0;s:28:"aiosp_google_author_location";a:1:{i:0;s:3:"all";}s:29:"aiosp_google_enable_publisher";s:2:"on";s:30:"aiosp_google_specify_publisher";N;s:25:"aiosp_google_analytics_id";N;s:32:"aiosp_ga_use_universal_analytics";i:0;s:25:"aiosp_ga_advanced_options";s:2:"on";s:15:"aiosp_ga_domain";N;s:21:"aiosp_ga_multi_domain";i:0;s:21:"aiosp_ga_addl_domains";N;s:21:"aiosp_ga_anonymize_ip";N;s:28:"aiosp_ga_display_advertising";N;s:22:"aiosp_ga_exclude_users";N;s:29:"aiosp_ga_track_outbound_links";i:0;s:25:"aiosp_ga_link_attribution";i:0;s:27:"aiosp_ga_enhanced_ecommerce";i:0;s:20:"aiosp_use_categories";i:0;s:26:"aiosp_use_tags_as_keywords";i:1;s:32:"aiosp_dynamic_postspage_keywords";i:1;s:22:"aiosp_category_noindex";i:1;s:26:"aiosp_archive_date_noindex";i:1;s:28:"aiosp_archive_author_noindex";i:1;s:18:"aiosp_tags_noindex";i:0;s:20:"aiosp_search_noindex";i:0;s:17:"aiosp_404_noindex";i:0;s:17:"aiosp_tax_noindex";a:0:{}s:23:"aiosp_paginated_noindex";i:0;s:24:"aiosp_paginated_nofollow";i:0;s:11:"aiosp_noodp";i:0;s:12:"aiosp_noydir";i:0;s:18:"aiosp_skip_excerpt";i:0;s:27:"aiosp_generate_descriptions";i:1;s:20:"aiosp_run_shortcodes";i:0;s:33:"aiosp_hide_paginated_descriptions";i:0;s:32:"aiosp_dont_truncate_descriptions";i:0;s:19:"aiosp_schema_markup";i:1;s:20:"aiosp_unprotect_meta";i:0;s:14:"aiosp_ex_pages";s:0:"";s:20:"aiosp_post_meta_tags";s:0:"";s:20:"aiosp_page_meta_tags";s:0:"";s:21:"aiosp_front_meta_tags";s:0:"";s:20:"aiosp_home_meta_tags";s:0:"";s:12:"aiosp_do_log";N;}', 'yes'),
(274, '_site_transient_timeout_available_translations', '1437823980', 'yes');
INSERT INTO `frg_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(275, '_site_transient_available_translations', 'a:59:{s:2:"ar";a:8:{s:8:"language";s:2:"ar";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-05-26 06:57:37";s:12:"english_name";s:6:"Arabic";s:11:"native_name";s:14:"العربية";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.2/ar.zip";s:3:"iso";a:2:{i:1;s:2:"ar";i:2;s:3:"ara";}s:7:"strings";a:1:{s:8:"continue";s:16:"المتابعة";}}s:2:"az";a:8:{s:8:"language";s:2:"az";s:7:"version";s:5:"4.2.3";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:11:"Azerbaijani";s:11:"native_name";s:16:"Azərbaycan dili";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.3/az.zip";s:3:"iso";a:2:{i:1;s:2:"az";i:2;s:3:"aze";}s:7:"strings";a:1:{s:8:"continue";s:5:"Davam";}}s:5:"bg_BG";a:8:{s:8:"language";s:5:"bg_BG";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-05-27 06:36:25";s:12:"english_name";s:9:"Bulgarian";s:11:"native_name";s:18:"Български";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/bg_BG.zip";s:3:"iso";a:2:{i:1;s:2:"bg";i:2;s:3:"bul";}s:7:"strings";a:1:{s:8:"continue";s:22:"Продължение";}}s:5:"bs_BA";a:8:{s:8:"language";s:5:"bs_BA";s:7:"version";s:5:"4.2.3";s:7:"updated";s:19:"2015-07-08 17:43:43";s:12:"english_name";s:7:"Bosnian";s:11:"native_name";s:8:"Bosanski";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.3/bs_BA.zip";s:3:"iso";a:2:{i:1;s:2:"bs";i:2;s:3:"bos";}s:7:"strings";a:1:{s:8:"continue";s:7:"Nastavi";}}s:2:"ca";a:8:{s:8:"language";s:2:"ca";s:7:"version";s:5:"4.2.3";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:7:"Catalan";s:11:"native_name";s:7:"Català";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.3/ca.zip";s:3:"iso";a:2:{i:1;s:2:"ca";i:2;s:3:"cat";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continua";}}s:2:"cy";a:8:{s:8:"language";s:2:"cy";s:7:"version";s:5:"4.2.3";s:7:"updated";s:19:"2015-07-08 11:08:34";s:12:"english_name";s:5:"Welsh";s:11:"native_name";s:7:"Cymraeg";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.3/cy.zip";s:3:"iso";a:2:{i:1;s:2:"cy";i:2;s:3:"cym";}s:7:"strings";a:1:{s:8:"continue";s:6:"Parhau";}}s:5:"da_DK";a:8:{s:8:"language";s:5:"da_DK";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-06-03 00:26:43";s:12:"english_name";s:6:"Danish";s:11:"native_name";s:5:"Dansk";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/da_DK.zip";s:3:"iso";a:2:{i:1;s:2:"da";i:2;s:3:"dan";}s:7:"strings";a:1:{s:8:"continue";s:12:"Forts&#230;t";}}s:5:"de_CH";a:8:{s:8:"language";s:5:"de_CH";s:7:"version";s:5:"4.2.3";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:20:"German (Switzerland)";s:11:"native_name";s:17:"Deutsch (Schweiz)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.3/de_CH.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:10:"Fortfahren";}}s:12:"de_DE_formal";a:8:{s:8:"language";s:12:"de_DE_formal";s:7:"version";s:5:"4.2.3";s:7:"updated";s:19:"2015-07-24 13:33:41";s:12:"english_name";s:15:"German (Formal)";s:11:"native_name";s:13:"Deutsch (Sie)";s:7:"package";s:71:"https://downloads.wordpress.org/translation/core/4.2.3/de_DE_formal.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:10:"Fortfahren";}}s:5:"de_DE";a:8:{s:8:"language";s:5:"de_DE";s:7:"version";s:5:"4.2.3";s:7:"updated";s:19:"2015-07-24 13:10:37";s:12:"english_name";s:6:"German";s:11:"native_name";s:7:"Deutsch";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.3/de_DE.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:10:"Fortfahren";}}s:2:"el";a:8:{s:8:"language";s:2:"el";s:7:"version";s:5:"4.2.3";s:7:"updated";s:19:"2015-07-22 11:37:31";s:12:"english_name";s:5:"Greek";s:11:"native_name";s:16:"Ελληνικά";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.3/el.zip";s:3:"iso";a:2:{i:1;s:2:"el";i:2;s:3:"ell";}s:7:"strings";a:1:{s:8:"continue";s:16:"Συνέχεια";}}s:5:"en_GB";a:8:{s:8:"language";s:5:"en_GB";s:7:"version";s:5:"4.2.3";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:12:"English (UK)";s:11:"native_name";s:12:"English (UK)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.3/en_GB.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_CA";a:8:{s:8:"language";s:5:"en_CA";s:7:"version";s:5:"4.2.3";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:16:"English (Canada)";s:11:"native_name";s:16:"English (Canada)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.3/en_CA.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_AU";a:8:{s:8:"language";s:5:"en_AU";s:7:"version";s:5:"4.2.3";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:19:"English (Australia)";s:11:"native_name";s:19:"English (Australia)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.3/en_AU.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:2:"eo";a:8:{s:8:"language";s:2:"eo";s:7:"version";s:5:"4.2.3";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:9:"Esperanto";s:11:"native_name";s:9:"Esperanto";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.3/eo.zip";s:3:"iso";a:2:{i:1;s:2:"eo";i:2;s:3:"epo";}s:7:"strings";a:1:{s:8:"continue";s:8:"Daŭrigi";}}s:5:"es_MX";a:8:{s:8:"language";s:5:"es_MX";s:7:"version";s:5:"4.2.3";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:16:"Spanish (Mexico)";s:11:"native_name";s:19:"Español de México";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.3/es_MX.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_ES";a:8:{s:8:"language";s:5:"es_ES";s:7:"version";s:5:"4.2.3";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:15:"Spanish (Spain)";s:11:"native_name";s:8:"Español";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.3/es_ES.zip";s:3:"iso";a:1:{i:1;s:2:"es";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_PE";a:8:{s:8:"language";s:5:"es_PE";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-04-25 13:39:01";s:12:"english_name";s:14:"Spanish (Peru)";s:11:"native_name";s:17:"Español de Perú";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/es_PE.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_CL";a:8:{s:8:"language";s:5:"es_CL";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-04 19:47:01";s:12:"english_name";s:15:"Spanish (Chile)";s:11:"native_name";s:17:"Español de Chile";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.0/es_CL.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:2:"et";a:8:{s:8:"language";s:2:"et";s:7:"version";s:5:"4.2.3";s:7:"updated";s:19:"2015-07-05 20:09:08";s:12:"english_name";s:8:"Estonian";s:11:"native_name";s:5:"Eesti";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.3/et.zip";s:3:"iso";a:2:{i:1;s:2:"et";i:2;s:3:"est";}s:7:"strings";a:1:{s:8:"continue";s:6:"Jätka";}}s:2:"eu";a:8:{s:8:"language";s:2:"eu";s:7:"version";s:5:"4.2.3";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:6:"Basque";s:11:"native_name";s:7:"Euskara";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.3/eu.zip";s:3:"iso";a:2:{i:1;s:2:"eu";i:2;s:3:"eus";}s:7:"strings";a:1:{s:8:"continue";s:8:"Jarraitu";}}s:5:"fa_IR";a:8:{s:8:"language";s:5:"fa_IR";s:7:"version";s:5:"4.2.3";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:7:"Persian";s:11:"native_name";s:10:"فارسی";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.3/fa_IR.zip";s:3:"iso";a:2:{i:1;s:2:"fa";i:2;s:3:"fas";}s:7:"strings";a:1:{s:8:"continue";s:10:"ادامه";}}s:2:"fi";a:8:{s:8:"language";s:2:"fi";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-05-15 10:49:37";s:12:"english_name";s:7:"Finnish";s:11:"native_name";s:5:"Suomi";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.2/fi.zip";s:3:"iso";a:2:{i:1;s:2:"fi";i:2;s:3:"fin";}s:7:"strings";a:1:{s:8:"continue";s:5:"Jatka";}}s:5:"fr_FR";a:8:{s:8:"language";s:5:"fr_FR";s:7:"version";s:5:"4.2.3";s:7:"updated";s:19:"2015-07-10 14:16:27";s:12:"english_name";s:15:"French (France)";s:11:"native_name";s:9:"Français";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.3/fr_FR.zip";s:3:"iso";a:1:{i:1;s:2:"fr";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuer";}}s:2:"gd";a:8:{s:8:"language";s:2:"gd";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-05 17:37:43";s:12:"english_name";s:15:"Scottish Gaelic";s:11:"native_name";s:9:"Gàidhlig";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.0/gd.zip";s:3:"iso";a:3:{i:1;s:2:"gd";i:2;s:3:"gla";i:3;s:3:"gla";}s:7:"strings";a:1:{s:8:"continue";s:15:"Lean air adhart";}}s:5:"gl_ES";a:8:{s:8:"language";s:5:"gl_ES";s:7:"version";s:5:"4.2.3";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:8:"Galician";s:11:"native_name";s:6:"Galego";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.3/gl_ES.zip";s:3:"iso";a:2:{i:1;s:2:"gl";i:2;s:3:"glg";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:3:"haz";a:8:{s:8:"language";s:3:"haz";s:7:"version";s:5:"4.1.6";s:7:"updated";s:19:"2015-03-26 15:20:27";s:12:"english_name";s:8:"Hazaragi";s:11:"native_name";s:15:"هزاره گی";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1.6/haz.zip";s:3:"iso";a:1:{i:2;s:3:"haz";}s:7:"strings";a:1:{s:8:"continue";s:10:"ادامه";}}s:5:"he_IL";a:8:{s:8:"language";s:5:"he_IL";s:7:"version";s:5:"4.2.3";s:7:"updated";s:19:"2015-07-12 08:05:04";s:12:"english_name";s:6:"Hebrew";s:11:"native_name";s:16:"עִבְרִית";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.3/he_IL.zip";s:3:"iso";a:1:{i:1;s:2:"he";}s:7:"strings";a:1:{s:8:"continue";s:12:"להמשיך";}}s:2:"hr";a:8:{s:8:"language";s:2:"hr";s:7:"version";s:5:"4.2.3";s:7:"updated";s:19:"2015-07-07 17:26:35";s:12:"english_name";s:8:"Croatian";s:11:"native_name";s:8:"Hrvatski";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.3/hr.zip";s:3:"iso";a:2:{i:1;s:2:"hr";i:2;s:3:"hrv";}s:7:"strings";a:1:{s:8:"continue";s:7:"Nastavi";}}s:5:"hu_HU";a:8:{s:8:"language";s:5:"hu_HU";s:7:"version";s:5:"4.2.3";s:7:"updated";s:19:"2015-07-23 11:42:14";s:12:"english_name";s:9:"Hungarian";s:11:"native_name";s:6:"Magyar";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.3/hu_HU.zip";s:3:"iso";a:2:{i:1;s:2:"hu";i:2;s:3:"hun";}s:7:"strings";a:1:{s:8:"continue";s:7:"Tovább";}}s:5:"id_ID";a:8:{s:8:"language";s:5:"id_ID";s:7:"version";s:5:"4.2.3";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:10:"Indonesian";s:11:"native_name";s:16:"Bahasa Indonesia";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.3/id_ID.zip";s:3:"iso";a:2:{i:1;s:2:"id";i:2;s:3:"ind";}s:7:"strings";a:1:{s:8:"continue";s:9:"Lanjutkan";}}s:5:"is_IS";a:8:{s:8:"language";s:5:"is_IS";s:7:"version";s:5:"4.2.3";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:9:"Icelandic";s:11:"native_name";s:9:"Íslenska";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.3/is_IS.zip";s:3:"iso";a:2:{i:1;s:2:"is";i:2;s:3:"isl";}s:7:"strings";a:1:{s:8:"continue";s:6:"Áfram";}}s:5:"it_IT";a:8:{s:8:"language";s:5:"it_IT";s:7:"version";s:5:"4.2.3";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:7:"Italian";s:11:"native_name";s:8:"Italiano";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.3/it_IT.zip";s:3:"iso";a:2:{i:1;s:2:"it";i:2;s:3:"ita";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continua";}}s:2:"ja";a:8:{s:8:"language";s:2:"ja";s:7:"version";s:5:"4.2.3";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:8:"Japanese";s:11:"native_name";s:9:"日本語";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.3/ja.zip";s:3:"iso";a:1:{i:1;s:2:"ja";}s:7:"strings";a:1:{s:8:"continue";s:9:"続ける";}}s:5:"ko_KR";a:8:{s:8:"language";s:5:"ko_KR";s:7:"version";s:5:"4.2.3";s:7:"updated";s:19:"2015-07-23 22:21:58";s:12:"english_name";s:6:"Korean";s:11:"native_name";s:9:"한국어";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.3/ko_KR.zip";s:3:"iso";a:2:{i:1;s:2:"ko";i:2;s:3:"kor";}s:7:"strings";a:1:{s:8:"continue";s:6:"계속";}}s:5:"lt_LT";a:8:{s:8:"language";s:5:"lt_LT";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-04-23 15:23:08";s:12:"english_name";s:10:"Lithuanian";s:11:"native_name";s:15:"Lietuvių kalba";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/lt_LT.zip";s:3:"iso";a:2:{i:1;s:2:"lt";i:2;s:3:"lit";}s:7:"strings";a:1:{s:8:"continue";s:6:"Tęsti";}}s:5:"my_MM";a:8:{s:8:"language";s:5:"my_MM";s:7:"version";s:5:"4.1.6";s:7:"updated";s:19:"2015-03-26 15:57:42";s:12:"english_name";s:17:"Myanmar (Burmese)";s:11:"native_name";s:15:"ဗမာစာ";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.6/my_MM.zip";s:3:"iso";a:2:{i:1;s:2:"my";i:2;s:3:"mya";}s:7:"strings";a:1:{s:8:"continue";s:54:"ဆက်လက်လုပ်ေဆာင်ပါ။";}}s:5:"nb_NO";a:8:{s:8:"language";s:5:"nb_NO";s:7:"version";s:5:"4.2.3";s:7:"updated";s:19:"2015-07-23 22:03:44";s:12:"english_name";s:19:"Norwegian (Bokmål)";s:11:"native_name";s:13:"Norsk bokmål";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.3/nb_NO.zip";s:3:"iso";a:2:{i:1;s:2:"nb";i:2;s:3:"nob";}s:7:"strings";a:1:{s:8:"continue";s:8:"Fortsett";}}s:5:"nl_NL";a:8:{s:8:"language";s:5:"nl_NL";s:7:"version";s:5:"4.2.3";s:7:"updated";s:19:"2015-07-16 14:25:19";s:12:"english_name";s:5:"Dutch";s:11:"native_name";s:10:"Nederlands";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.3/nl_NL.zip";s:3:"iso";a:2:{i:1;s:2:"nl";i:2;s:3:"nld";}s:7:"strings";a:1:{s:8:"continue";s:8:"Doorgaan";}}s:5:"nn_NO";a:8:{s:8:"language";s:5:"nn_NO";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-06-08 07:10:14";s:12:"english_name";s:19:"Norwegian (Nynorsk)";s:11:"native_name";s:13:"Norsk nynorsk";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/nn_NO.zip";s:3:"iso";a:2:{i:1;s:2:"nn";i:2;s:3:"nno";}s:7:"strings";a:1:{s:8:"continue";s:9:"Hald fram";}}s:3:"oci";a:8:{s:8:"language";s:3:"oci";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-06-10 17:07:58";s:12:"english_name";s:7:"Occitan";s:11:"native_name";s:7:"Occitan";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.2.2/oci.zip";s:3:"iso";a:2:{i:1;s:2:"oc";i:2;s:3:"oci";}s:7:"strings";a:1:{s:8:"continue";s:9:"Contunhar";}}s:5:"pl_PL";a:8:{s:8:"language";s:5:"pl_PL";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-05-09 10:15:05";s:12:"english_name";s:6:"Polish";s:11:"native_name";s:6:"Polski";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/pl_PL.zip";s:3:"iso";a:2:{i:1;s:2:"pl";i:2;s:3:"pol";}s:7:"strings";a:1:{s:8:"continue";s:9:"Kontynuuj";}}s:2:"ps";a:8:{s:8:"language";s:2:"ps";s:7:"version";s:5:"4.1.6";s:7:"updated";s:19:"2015-03-29 22:19:48";s:12:"english_name";s:6:"Pashto";s:11:"native_name";s:8:"پښتو";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.1.6/ps.zip";s:3:"iso";a:1:{i:1;s:2:"ps";}s:7:"strings";a:1:{s:8:"continue";s:8:"دوام";}}s:5:"pt_PT";a:8:{s:8:"language";s:5:"pt_PT";s:7:"version";s:5:"4.2.3";s:7:"updated";s:19:"2015-07-22 10:25:51";s:12:"english_name";s:21:"Portuguese (Portugal)";s:11:"native_name";s:10:"Português";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.3/pt_PT.zip";s:3:"iso";a:1:{i:1;s:2:"pt";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"pt_BR";a:8:{s:8:"language";s:5:"pt_BR";s:7:"version";s:5:"4.2.3";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:19:"Portuguese (Brazil)";s:11:"native_name";s:20:"Português do Brasil";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.3/pt_BR.zip";s:3:"iso";a:2:{i:1;s:2:"pt";i:2;s:3:"por";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"ro_RO";a:8:{s:8:"language";s:5:"ro_RO";s:7:"version";s:5:"4.2.3";s:7:"updated";s:19:"2015-07-08 14:53:48";s:12:"english_name";s:8:"Romanian";s:11:"native_name";s:8:"Română";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.3/ro_RO.zip";s:3:"iso";a:2:{i:1;s:2:"ro";i:2;s:3:"ron";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuă";}}s:5:"ru_RU";a:8:{s:8:"language";s:5:"ru_RU";s:7:"version";s:5:"4.2.3";s:7:"updated";s:19:"2015-07-23 15:41:00";s:12:"english_name";s:7:"Russian";s:11:"native_name";s:14:"Русский";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.3/ru_RU.zip";s:3:"iso";a:2:{i:1;s:2:"ru";i:2;s:3:"rus";}s:7:"strings";a:1:{s:8:"continue";s:20:"Продолжить";}}s:5:"sk_SK";a:8:{s:8:"language";s:5:"sk_SK";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-05-26 09:29:23";s:12:"english_name";s:6:"Slovak";s:11:"native_name";s:11:"Slovenčina";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.2/sk_SK.zip";s:3:"iso";a:2:{i:1;s:2:"sk";i:2;s:3:"slk";}s:7:"strings";a:1:{s:8:"continue";s:12:"Pokračovať";}}s:5:"sl_SI";a:8:{s:8:"language";s:5:"sl_SI";s:7:"version";s:5:"4.1.6";s:7:"updated";s:19:"2015-03-26 16:25:46";s:12:"english_name";s:9:"Slovenian";s:11:"native_name";s:13:"Slovenščina";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.6/sl_SI.zip";s:3:"iso";a:2:{i:1;s:2:"sl";i:2;s:3:"slv";}s:7:"strings";a:1:{s:8:"continue";s:10:"Nadaljujte";}}s:2:"sq";a:8:{s:8:"language";s:2:"sq";s:7:"version";s:5:"4.2.2";s:7:"updated";s:19:"2015-05-29 08:27:12";s:12:"english_name";s:8:"Albanian";s:11:"native_name";s:5:"Shqip";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.2/sq.zip";s:3:"iso";a:2:{i:1;s:2:"sq";i:2;s:3:"sqi";}s:7:"strings";a:1:{s:8:"continue";s:6:"Vazhdo";}}s:5:"sr_RS";a:8:{s:8:"language";s:5:"sr_RS";s:7:"version";s:5:"4.2.3";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:7:"Serbian";s:11:"native_name";s:23:"Српски језик";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.3/sr_RS.zip";s:3:"iso";a:2:{i:1;s:2:"sr";i:2;s:3:"srp";}s:7:"strings";a:1:{s:8:"continue";s:14:"Настави";}}s:5:"sv_SE";a:8:{s:8:"language";s:5:"sv_SE";s:7:"version";s:5:"4.2.3";s:7:"updated";s:19:"2015-07-12 00:55:52";s:12:"english_name";s:7:"Swedish";s:11:"native_name";s:7:"Svenska";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.3/sv_SE.zip";s:3:"iso";a:2:{i:1;s:2:"sv";i:2;s:3:"swe";}s:7:"strings";a:1:{s:8:"continue";s:9:"Fortsätt";}}s:2:"th";a:8:{s:8:"language";s:2:"th";s:7:"version";s:5:"4.2.3";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:4:"Thai";s:11:"native_name";s:9:"ไทย";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.3/th.zip";s:3:"iso";a:2:{i:1;s:2:"th";i:2;s:3:"tha";}s:7:"strings";a:1:{s:8:"continue";s:15:"ต่อไป";}}s:2:"tl";a:8:{s:8:"language";s:2:"tl";s:7:"version";s:5:"4.2.3";s:7:"updated";s:19:"2015-07-06 10:10:09";s:12:"english_name";s:7:"Tagalog";s:11:"native_name";s:7:"Tagalog";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.3/tl.zip";s:3:"iso";a:2:{i:1;s:2:"tl";i:2;s:3:"tgl";}s:7:"strings";a:1:{s:8:"continue";s:10:"Magpatuloy";}}s:5:"tr_TR";a:8:{s:8:"language";s:5:"tr_TR";s:7:"version";s:5:"4.2.3";s:7:"updated";s:19:"2015-07-22 10:57:52";s:12:"english_name";s:7:"Turkish";s:11:"native_name";s:8:"Türkçe";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.3/tr_TR.zip";s:3:"iso";a:2:{i:1;s:2:"tr";i:2;s:3:"tur";}s:7:"strings";a:1:{s:8:"continue";s:5:"Devam";}}s:5:"ug_CN";a:8:{s:8:"language";s:5:"ug_CN";s:7:"version";s:5:"4.1.6";s:7:"updated";s:19:"2015-03-26 16:45:38";s:12:"english_name";s:6:"Uighur";s:11:"native_name";s:9:"Uyƣurqə";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.6/ug_CN.zip";s:3:"iso";a:2:{i:1;s:2:"ug";i:2;s:3:"uig";}s:7:"strings";a:1:{s:8:"continue";s:26:"داۋاملاشتۇرۇش";}}s:2:"uk";a:8:{s:8:"language";s:2:"uk";s:7:"version";s:5:"4.2.3";s:7:"updated";s:19:"2015-07-05 10:51:50";s:12:"english_name";s:9:"Ukrainian";s:11:"native_name";s:20:"Українська";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.2.3/uk.zip";s:3:"iso";a:2:{i:1;s:2:"uk";i:2;s:3:"ukr";}s:7:"strings";a:1:{s:8:"continue";s:20:"Продовжити";}}s:5:"zh_CN";a:8:{s:8:"language";s:5:"zh_CN";s:7:"version";s:5:"4.2.3";s:7:"updated";s:19:"2015-07-04 19:52:42";s:12:"english_name";s:15:"Chinese (China)";s:11:"native_name";s:12:"简体中文";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.3/zh_CN.zip";s:3:"iso";a:2:{i:1;s:2:"zh";i:2;s:3:"zho";}s:7:"strings";a:1:{s:8:"continue";s:6:"继续";}}s:5:"zh_TW";a:8:{s:8:"language";s:5:"zh_TW";s:7:"version";s:5:"4.2.3";s:7:"updated";s:19:"2015-07-23 13:52:20";s:12:"english_name";s:16:"Chinese (Taiwan)";s:11:"native_name";s:12:"繁體中文";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.3/zh_TW.zip";s:3:"iso";a:2:{i:1;s:2:"zh";i:2;s:3:"zho";}s:7:"strings";a:1:{s:8:"continue";s:6:"繼續";}}}', 'yes'),
(276, 'rewrite_rules', 'a:173:{s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:48:"ngg_tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:46:"index.php?ngg_tag=$matches[1]&feed=$matches[2]";s:43:"ngg_tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:46:"index.php?ngg_tag=$matches[1]&feed=$matches[2]";s:36:"ngg_tag/([^/]+)/page/?([0-9]{1,})/?$";s:47:"index.php?ngg_tag=$matches[1]&paged=$matches[2]";s:18:"ngg_tag/([^/]+)/?$";s:29:"index.php?ngg_tag=$matches[1]";s:37:"ngg_album/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:47:"ngg_album/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:67:"ngg_album/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:62:"ngg_album/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:62:"ngg_album/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:30:"ngg_album/([^/]+)/trackback/?$";s:36:"index.php?ngg_album=$matches[1]&tb=1";s:38:"ngg_album/([^/]+)/page/?([0-9]{1,})/?$";s:49:"index.php?ngg_album=$matches[1]&paged=$matches[2]";s:45:"ngg_album/([^/]+)/comment-page-([0-9]{1,})/?$";s:49:"index.php?ngg_album=$matches[1]&cpage=$matches[2]";s:30:"ngg_album/([^/]+)(/[0-9]+)?/?$";s:48:"index.php?ngg_album=$matches[1]&page=$matches[2]";s:26:"ngg_album/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:36:"ngg_album/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:56:"ngg_album/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:51:"ngg_album/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:51:"ngg_album/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:39:"ngg_gallery/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:49:"ngg_gallery/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:69:"ngg_gallery/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:64:"ngg_gallery/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:64:"ngg_gallery/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:32:"ngg_gallery/([^/]+)/trackback/?$";s:38:"index.php?ngg_gallery=$matches[1]&tb=1";s:40:"ngg_gallery/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?ngg_gallery=$matches[1]&paged=$matches[2]";s:47:"ngg_gallery/([^/]+)/comment-page-([0-9]{1,})/?$";s:51:"index.php?ngg_gallery=$matches[1]&cpage=$matches[2]";s:32:"ngg_gallery/([^/]+)(/[0-9]+)?/?$";s:50:"index.php?ngg_gallery=$matches[1]&page=$matches[2]";s:28:"ngg_gallery/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:38:"ngg_gallery/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:58:"ngg_gallery/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:53:"ngg_gallery/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:53:"ngg_gallery/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:40:"ngg_pictures/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:50:"ngg_pictures/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:70:"ngg_pictures/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:65:"ngg_pictures/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:65:"ngg_pictures/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:"ngg_pictures/([^/]+)/trackback/?$";s:39:"index.php?ngg_pictures=$matches[1]&tb=1";s:41:"ngg_pictures/([^/]+)/page/?([0-9]{1,})/?$";s:52:"index.php?ngg_pictures=$matches[1]&paged=$matches[2]";s:48:"ngg_pictures/([^/]+)/comment-page-([0-9]{1,})/?$";s:52:"index.php?ngg_pictures=$matches[1]&cpage=$matches[2]";s:33:"ngg_pictures/([^/]+)(/[0-9]+)?/?$";s:51:"index.php?ngg_pictures=$matches[1]&page=$matches[2]";s:29:"ngg_pictures/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:39:"ngg_pictures/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:59:"ngg_pictures/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:54:"ngg_pictures/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:54:"ngg_pictures/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:44:"lightbox_library/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:54:"lightbox_library/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:74:"lightbox_library/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:69:"lightbox_library/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:69:"lightbox_library/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:37:"lightbox_library/([^/]+)/trackback/?$";s:43:"index.php?lightbox_library=$matches[1]&tb=1";s:45:"lightbox_library/([^/]+)/page/?([0-9]{1,})/?$";s:56:"index.php?lightbox_library=$matches[1]&paged=$matches[2]";s:52:"lightbox_library/([^/]+)/comment-page-([0-9]{1,})/?$";s:56:"index.php?lightbox_library=$matches[1]&cpage=$matches[2]";s:37:"lightbox_library/([^/]+)(/[0-9]+)?/?$";s:55:"index.php?lightbox_library=$matches[1]&page=$matches[2]";s:33:"lightbox_library/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:43:"lightbox_library/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:63:"lightbox_library/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:58:"lightbox_library/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:58:"lightbox_library/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:45:"displayed_gallery/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:55:"displayed_gallery/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:75:"displayed_gallery/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:70:"displayed_gallery/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:70:"displayed_gallery/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:38:"displayed_gallery/([^/]+)/trackback/?$";s:44:"index.php?displayed_gallery=$matches[1]&tb=1";s:46:"displayed_gallery/([^/]+)/page/?([0-9]{1,})/?$";s:57:"index.php?displayed_gallery=$matches[1]&paged=$matches[2]";s:53:"displayed_gallery/([^/]+)/comment-page-([0-9]{1,})/?$";s:57:"index.php?displayed_gallery=$matches[1]&cpage=$matches[2]";s:38:"displayed_gallery/([^/]+)(/[0-9]+)?/?$";s:56:"index.php?displayed_gallery=$matches[1]&page=$matches[2]";s:34:"displayed_gallery/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:44:"displayed_gallery/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:64:"displayed_gallery/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:59:"displayed_gallery/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:59:"displayed_gallery/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:40:"display_type/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:50:"display_type/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:70:"display_type/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:65:"display_type/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:65:"display_type/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:"display_type/([^/]+)/trackback/?$";s:39:"index.php?display_type=$matches[1]&tb=1";s:41:"display_type/([^/]+)/page/?([0-9]{1,})/?$";s:52:"index.php?display_type=$matches[1]&paged=$matches[2]";s:48:"display_type/([^/]+)/comment-page-([0-9]{1,})/?$";s:52:"index.php?display_type=$matches[1]&cpage=$matches[2]";s:33:"display_type/([^/]+)(/[0-9]+)?/?$";s:51:"index.php?display_type=$matches[1]&page=$matches[2]";s:29:"display_type/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:39:"display_type/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:59:"display_type/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:54:"display_type/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:54:"display_type/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:46:"gal_display_source/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:56:"gal_display_source/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:76:"gal_display_source/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:71:"gal_display_source/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:71:"gal_display_source/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:39:"gal_display_source/([^/]+)/trackback/?$";s:45:"index.php?gal_display_source=$matches[1]&tb=1";s:47:"gal_display_source/([^/]+)/page/?([0-9]{1,})/?$";s:58:"index.php?gal_display_source=$matches[1]&paged=$matches[2]";s:54:"gal_display_source/([^/]+)/comment-page-([0-9]{1,})/?$";s:58:"index.php?gal_display_source=$matches[1]&cpage=$matches[2]";s:39:"gal_display_source/([^/]+)(/[0-9]+)?/?$";s:57:"index.php?gal_display_source=$matches[1]&page=$matches[2]";s:35:"gal_display_source/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:45:"gal_display_source/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:65:"gal_display_source/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"gal_display_source/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"gal_display_source/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:12:"robots\\.txt$";s:18:"index.php?robots=1";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:58:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:68:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:88:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:83:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:83:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$";s:85:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1";s:77:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]";s:72:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]";s:65:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$";s:98:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]";s:72:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$";s:98:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(/[0-9]+)?/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]";s:47:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:57:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:77:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]";s:51:"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]";s:38:"([0-9]{4})/comment-page-([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&cpage=$matches[2]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)(/[0-9]+)?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";}', 'yes'),
(280, 'current_theme', 'FRG RED', 'yes'),
(281, 'theme_mods_frg_red', 'a:2:{i:0;b:0;s:18:"nav_menu_locations";a:1:{s:7:"primary";i:6;}}', 'yes'),
(282, 'theme_switched', '', 'yes'),
(289, 'theme_mods_responsive', 'a:2:{i:0;b:0;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1437813857;s:4:"data";a:2:{s:19:"wp_inactive_widgets";a:0:{}s:18:"orphaned_widgets_1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}}}}', 'yes'),
(293, 'frg_red_theme_options', 'a:34:{s:10:"breadcrumb";b:0;s:10:"cta_button";b:0;s:12:"minified_css";b:0;s:10:"front_page";i:1;s:13:"home_headline";N;s:16:"home_subheadline";N;s:17:"home_content_area";N;s:8:"cta_text";N;s:7:"cta_url";N;s:16:"featured_content";N;s:24:"google_site_verification";s:0:"";s:22:"bing_site_verification";s:0:"";s:23:"yahoo_site_verification";s:0:"";s:23:"site_statistics_tracker";s:0:"";s:11:"twitter_uid";s:0:"";s:12:"facebook_uid";s:0:"";s:12:"linkedin_uid";s:0:"";s:11:"youtube_uid";s:0:"";s:11:"stumble_uid";s:0:"";s:7:"rss_uid";s:0:"";s:15:"google_plus_uid";s:0:"";s:13:"instagram_uid";s:0:"";s:13:"pinterest_uid";s:0:"";s:8:"yelp_uid";s:0:"";s:9:"vimeo_uid";s:0:"";s:14:"foursquare_uid";s:0:"";s:18:"frg_red_inline_css";s:0:"";s:22:"frg_red_inline_js_head";s:0:"";s:28:"frg_red_inline_css_js_footer";s:0:"";s:26:"static_page_layout_default";s:7:"default";s:26:"single_post_layout_default";s:7:"default";s:31:"blog_posts_index_layout_default";s:7:"default";s:14:"googleplus_uid";s:0:"";s:15:"stumbleupon_uid";s:0:"";}', 'yes'),
(294, 'widget_calendar', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(295, 'widget_nav_menu', 'a:4:{i:1;a:0:{}i:2;a:1:{s:8:"nav_menu";i:7;}i:3;a:1:{s:8:"nav_menu";i:19;}s:12:"_multiwidget";i:1;}', 'yes'),
(296, 'widget_ngg-mrssw', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(297, 'widget_slideshow', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(298, 'widget_ngg-images', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(299, 'widget_pages', 'a:3:{i:1;a:0:{}i:2;a:3:{s:5:"title";s:0:"";s:6:"sortby";s:10:"post_title";s:7:"exclude";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(301, 'widget_tag_cloud', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(303, 'theme_mods_twentyfifteen', 'a:1:{s:16:"sidebars_widgets";a:2:{s:4:"time";i:1437814391;s:4:"data";a:2:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}}}}', 'yes'),
(306, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:"auto_add";a:0:{}}', 'yes'),
(325, 'wpcf7', 'a:1:{s:7:"version";s:5:"4.2.1";}', 'yes'),
(345, 'category_children', 'a:0:{}', 'yes'),
(363, 'scporder_install', '1', 'yes'),
(364, 'scporder_options', 'a:2:{s:7:"objects";a:1:{i:0;s:4:"post";}s:4:"tags";a:1:{i:0;s:8:"category";}}', 'yes'),
(460, '_site_transient_timeout_theme_roots', '1437829697', 'yes'),
(461, '_site_transient_theme_roots', 'a:4:{s:7:"frg_red";s:7:"/themes";s:13:"twentyfifteen";s:7:"/themes";s:14:"twentyfourteen";s:7:"/themes";s:14:"twentythirteen";s:7:"/themes";}', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `frg_postmeta`
--

CREATE TABLE IF NOT EXISTS `frg_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=400 ;

--
-- Dumping data for table `frg_postmeta`
--

INSERT INTO `frg_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 4, 'title', 'NextGEN Basic Thumbnails'),
(3, 4, 'preview_image_relpath', '/nextgen-gallery/products/photocrati_nextgen/modules/nextgen_basic_gallery/static/thumb_preview.jpg'),
(4, 4, 'default_source', 'galleries'),
(5, 4, 'view_order', '10000'),
(6, 4, 'name', 'photocrati-nextgen_basic_thumbnails'),
(7, 4, 'installed_at_version', '2.1.2'),
(8, 4, 'hidden_from_ui', ''),
(9, 4, '__defaults_set', '1'),
(10, 4, 'filter', 'raw'),
(11, 4, 'entity_types', 'WyJpbWFnZSJd'),
(12, 4, 'id_field', 'ID'),
(13, 4, 'settings', 'eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJpbWFnZXNfcGVyX3BhZ2UiOiIyMCIsIm51bWJlcl9vZl9jb2x1bW5zIjowLCJ0aHVtYm5haWxfd2lkdGgiOjI0MCwidGh1bWJuYWlsX2hlaWdodCI6MTYwLCJzaG93X2FsbF9pbl9saWdodGJveCI6MCwiYWpheF9wYWdpbmF0aW9uIjowLCJ1c2VfaW1hZ2Vicm93c2VyX2VmZmVjdCI6MCwidGVtcGxhdGUiOiIiLCJkaXNwbGF5X25vX2ltYWdlc19lcnJvciI6MSwiZGlzYWJsZV9wYWdpbmF0aW9uIjowLCJzaG93X3NsaWRlc2hvd19saW5rIjoxLCJzbGlkZXNob3dfbGlua190ZXh0IjoiW1Nob3cgc2xpZGVzaG93XSIsIm92ZXJyaWRlX3RodW1ibmFpbF9zZXR0aW5ncyI6MCwidGh1bWJuYWlsX3F1YWxpdHkiOiIxMDAiLCJ0aHVtYm5haWxfY3JvcCI6MSwidGh1bWJuYWlsX3dhdGVybWFyayI6MCwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciJ9'),
(14, 5, 'title', 'NextGEN Basic Slideshow'),
(15, 5, 'preview_image_relpath', '/nextgen-gallery/products/photocrati_nextgen/modules/nextgen_basic_gallery/static/slideshow_preview.jpg'),
(16, 5, 'default_source', 'galleries'),
(17, 5, 'view_order', '10010'),
(18, 5, 'name', 'photocrati-nextgen_basic_slideshow'),
(19, 5, 'installed_at_version', '2.1.2'),
(20, 5, 'hidden_from_ui', ''),
(21, 5, '__defaults_set', '1'),
(22, 5, 'filter', 'raw'),
(23, 5, 'entity_types', 'WyJpbWFnZSJd'),
(24, 5, 'id_field', 'ID'),
(25, 5, 'settings', 'eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJnYWxsZXJ5X3dpZHRoIjo2MDAsImdhbGxlcnlfaGVpZ2h0Ijo0MDAsInRodW1ibmFpbF93aWR0aCI6MjQwLCJ0aHVtYm5haWxfaGVpZ2h0IjoxNjAsImN5Y2xlX2ludGVydmFsIjoxMCwiY3ljbGVfZWZmZWN0IjpudWxsLCJlZmZlY3RfY29kZSI6ImNsYXNzPVwibmdnLWZhbmN5Ym94XCIgcmVsPVwiJUdBTExFUllfTkFNRSVcIiIsInNob3dfdGh1bWJuYWlsX2xpbmsiOjEsInRodW1ibmFpbF9saW5rX3RleHQiOiJbU2hvdyB0aHVtYm5haWxzXSIsInRlbXBsYXRlIjoiIiwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciJ9'),
(26, 6, 'title', 'NextGEN Basic ImageBrowser'),
(27, 6, 'preview_image_relpath', '/nextgen-gallery/products/photocrati_nextgen/modules/nextgen_basic_imagebrowser/static/preview.jpg'),
(28, 6, 'default_source', 'galleries'),
(29, 6, 'view_order', '10020'),
(30, 6, 'name', 'photocrati-nextgen_basic_imagebrowser'),
(31, 6, 'installed_at_version', '2.1.2'),
(32, 6, 'hidden_from_ui', ''),
(33, 6, '__defaults_set', '1'),
(34, 6, 'filter', 'raw'),
(35, 6, 'entity_types', 'WyJpbWFnZSJd'),
(36, 6, 'id_field', 'ID'),
(37, 6, 'settings', 'eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJ0ZW1wbGF0ZSI6IiIsIm5nZ190cmlnZ2Vyc19kaXNwbGF5IjoibmV2ZXIifQ=='),
(38, 7, 'title', 'NextGEN Basic SinglePic'),
(39, 7, 'preview_image_relpath', '/nextgen-gallery/products/photocrati_nextgen/modules/nextgen_basic_singlepic/static/preview.gif'),
(40, 7, 'default_source', 'galleries'),
(41, 7, 'view_order', '10060'),
(42, 7, 'hidden_from_ui', '1'),
(43, 7, 'name', 'photocrati-nextgen_basic_singlepic'),
(44, 7, 'installed_at_version', '2.1.2'),
(45, 7, '__defaults_set', '1'),
(46, 7, 'filter', 'raw'),
(47, 7, 'entity_types', 'WyJpbWFnZSJd'),
(48, 7, 'id_field', 'ID'),
(49, 7, 'settings', 'eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJ3aWR0aCI6IiIsImhlaWdodCI6IiIsIm1vZGUiOiIiLCJkaXNwbGF5X3dhdGVybWFyayI6MCwiZGlzcGxheV9yZWZsZWN0aW9uIjowLCJmbG9hdCI6IiIsImxpbmsiOiIiLCJsaW5rX3RhcmdldCI6Il9ibGFuayIsInF1YWxpdHkiOjEwMCwiY3JvcCI6MCwidGVtcGxhdGUiOiIiLCJuZ2dfdHJpZ2dlcnNfZGlzcGxheSI6Im5ldmVyIn0='),
(50, 8, 'title', 'NextGEN Basic TagCloud'),
(51, 8, 'preview_image_relpath', '/nextgen-gallery/products/photocrati_nextgen/modules/nextgen_basic_tagcloud/static/preview.gif'),
(52, 8, 'default_source', 'tags'),
(53, 8, 'view_order', '10100'),
(54, 8, 'name', 'photocrati-nextgen_basic_tagcloud'),
(55, 8, 'installed_at_version', '2.1.2'),
(56, 8, 'hidden_from_ui', ''),
(57, 8, '__defaults_set', '1'),
(58, 8, 'filter', 'raw'),
(59, 8, 'entity_types', 'WyJpbWFnZSJd'),
(60, 8, 'id_field', 'ID'),
(61, 8, 'settings', 'eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJkaXNwbGF5X3R5cGUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfdGh1bWJuYWlscyIsIm51bWJlciI6NDUsIm5nZ190cmlnZ2Vyc19kaXNwbGF5IjoibmV2ZXIifQ=='),
(62, 9, 'title', 'NextGEN Basic Compact Album'),
(63, 9, 'preview_image_relpath', '/nextgen-gallery/products/photocrati_nextgen/modules/nextgen_basic_album/static/compact_preview.jpg'),
(64, 9, 'default_source', 'albums'),
(65, 9, 'view_order', '10200'),
(66, 9, 'name', 'photocrati-nextgen_basic_compact_album'),
(67, 9, 'installed_at_version', '2.1.2'),
(68, 9, 'hidden_from_ui', ''),
(69, 9, '__defaults_set', '1'),
(70, 9, 'filter', 'raw'),
(71, 9, 'entity_types', 'WyJhbGJ1bSIsImdhbGxlcnkiXQ=='),
(72, 9, 'id_field', 'ID'),
(73, 9, 'settings', 'eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJnYWxsZXJpZXNfcGVyX3BhZ2UiOjAsImVuYWJsZV9icmVhZGNydW1icyI6MSwiZGlzYWJsZV9wYWdpbmF0aW9uIjowLCJ0ZW1wbGF0ZSI6IiIsImdhbGxlcnlfZGlzcGxheV90eXBlIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX3RodW1ibmFpbHMiLCJnYWxsZXJ5X2Rpc3BsYXlfdGVtcGxhdGUiOiIiLCJuZ2dfdHJpZ2dlcnNfZGlzcGxheSI6Im5ldmVyIn0='),
(74, 10, 'title', 'NextGEN Basic Extended Album'),
(75, 10, 'preview_image_relpath', '/nextgen-gallery/products/photocrati_nextgen/modules/nextgen_basic_album/static/extended_preview.jpg'),
(76, 10, 'default_source', 'albums'),
(77, 10, 'view_order', '10210'),
(78, 10, 'name', 'photocrati-nextgen_basic_extended_album'),
(79, 10, 'installed_at_version', '2.1.2'),
(80, 10, 'hidden_from_ui', ''),
(81, 10, '__defaults_set', '1'),
(82, 10, 'filter', 'raw'),
(83, 10, 'entity_types', 'WyJhbGJ1bSIsImdhbGxlcnkiXQ=='),
(84, 10, 'id_field', 'ID'),
(85, 10, 'settings', 'eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJnYWxsZXJpZXNfcGVyX3BhZ2UiOjAsImVuYWJsZV9icmVhZGNydW1icyI6MSwiZGlzYWJsZV9wYWdpbmF0aW9uIjowLCJ0ZW1wbGF0ZSI6IiIsIm92ZXJyaWRlX3RodW1ibmFpbF9zZXR0aW5ncyI6MCwidGh1bWJuYWlsX3dpZHRoIjoyNDAsInRodW1ibmFpbF9oZWlnaHQiOjE2MCwidGh1bWJuYWlsX3F1YWxpdHkiOjEwMCwidGh1bWJuYWlsX2Nyb3AiOnRydWUsInRodW1ibmFpbF93YXRlcm1hcmsiOjAsImdhbGxlcnlfZGlzcGxheV90eXBlIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX3RodW1ibmFpbHMiLCJnYWxsZXJ5X2Rpc3BsYXlfdGVtcGxhdGUiOiIiLCJuZ2dfdHJpZ2dlcnNfZGlzcGxheSI6Im5ldmVyIn0='),
(86, 11, '_menu_item_type', 'custom'),
(87, 11, '_menu_item_menu_item_parent', '0'),
(88, 11, '_menu_item_object_id', '11'),
(89, 11, '_menu_item_object', 'custom'),
(90, 11, '_menu_item_target', ''),
(91, 11, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(92, 11, '_menu_item_xfn', ''),
(93, 11, '_menu_item_url', 'http://frg-red.test/'),
(104, 2, '_edit_lock', '1437826484:1'),
(105, 15, '_form', '<p>Your Name (required)<br />\n    [text* your-name] </p>\n\n<p>Your Email (required)<br />\n    [email* your-email] </p>\n\n<p>Subject<br />\n    [text your-subject] </p>\n\n<p>Your Message<br />\n    [textarea your-message] </p>\n\n<p>[submit "Send"]</p>'),
(106, 15, '_mail', 'a:8:{s:7:"subject";s:14:"[your-subject]";s:6:"sender";s:36:"[your-name] <wordpress@frg-red.test>";s:4:"body";s:164:"From: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on FRG-RED (http://frg-red.test)";s:9:"recipient";s:19:"leo2410ua@gmail.com";s:18:"additional_headers";s:22:"Reply-To: [your-email]";s:11:"attachments";s:0:"";s:8:"use_html";i:0;s:13:"exclude_blank";i:0;}'),
(107, 15, '_mail_2', 'a:9:{s:6:"active";b:0;s:7:"subject";s:14:"[your-subject]";s:6:"sender";s:32:"FRG-RED <wordpress@frg-red.test>";s:4:"body";s:106:"Message Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on FRG-RED (http://frg-red.test)";s:9:"recipient";s:12:"[your-email]";s:18:"additional_headers";s:29:"Reply-To: leo2410ua@gmail.com";s:11:"attachments";s:0:"";s:8:"use_html";i:0;s:13:"exclude_blank";i:0;}'),
(108, 15, '_messages', 'a:8:{s:12:"mail_sent_ok";s:43:"Your message was sent successfully. Thanks.";s:12:"mail_sent_ng";s:93:"Failed to send your message. Please try later or contact the administrator by another method.";s:16:"validation_error";s:74:"Validation errors occurred. Please confirm the fields and submit it again.";s:4:"spam";s:93:"Failed to send your message. Please try later or contact the administrator by another method.";s:12:"accept_terms";s:35:"Please accept the terms to proceed.";s:16:"invalid_required";s:34:"Please fill in the required field.";s:16:"invalid_too_long";s:23:"This input is too long.";s:17:"invalid_too_short";s:24:"This input is too short.";}'),
(109, 15, '_additional_settings', ''),
(110, 15, '_locale', 'en_US'),
(111, 16, '_edit_last', '1'),
(112, 16, '_edit_lock', '1437816311:1'),
(114, 18, '_edit_last', '1'),
(115, 18, '_edit_lock', '1437816868:1'),
(117, 20, '_edit_last', '1'),
(118, 20, '_edit_lock', '1437816897:1'),
(120, 22, '_edit_last', '1'),
(122, 22, '_edit_lock', '1437816921:1'),
(124, 24, '_edit_last', '1'),
(125, 24, '_edit_lock', '1437816945:1'),
(127, 26, '_edit_last', '1'),
(128, 26, '_edit_lock', '1437816968:1'),
(130, 28, '_edit_last', '1'),
(131, 28, '_edit_lock', '1437816990:1'),
(133, 30, '_edit_last', '1'),
(135, 30, '_edit_lock', '1437817018:1'),
(136, 32, '_edit_last', '1'),
(137, 32, '_edit_lock', '1437817036:1'),
(139, 34, '_edit_last', '1'),
(141, 34, '_edit_lock', '1437823886:1'),
(142, 36, '_edit_last', '1'),
(143, 36, '_edit_lock', '1437826692:1'),
(144, 38, '_edit_last', '1'),
(145, 38, '_edit_lock', '1437826446:1'),
(146, 41, '_edit_last', '1'),
(147, 41, 'field_55b374cdf9146', 'a:12:{s:3:"key";s:19:"field_55b374cdf9146";s:5:"label";s:10:"Google map";s:4:"name";s:10:"google_map";s:4:"type";s:10:"google_map";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:10:"center_lat";s:0:"";s:10:"center_lng";s:0:"";s:4:"zoom";s:0:"";s:6:"height";s:0:"";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:1;}'),
(149, 41, 'position', 'normal'),
(150, 41, 'layout', 'no_box'),
(151, 41, 'hide_on_screen', 'a:12:{i:0;s:7:"excerpt";i:1;s:13:"custom_fields";i:2;s:10:"discussion";i:3;s:8:"comments";i:4;s:9:"revisions";i:5;s:4:"slug";i:6;s:6:"author";i:7;s:6:"format";i:8;s:14:"featured_image";i:9;s:10:"categories";i:10;s:4:"tags";i:11;s:15:"send-trackbacks";}'),
(152, 41, '_edit_lock', '1437826517:1'),
(153, 42, 'google_map', 'a:3:{s:7:"address";s:40:"380 Osborne Street, Winnipeg, MB, Canada";s:3:"lat";s:10:"49.8718626";s:3:"lng";s:18:"-97.13954810000001";}'),
(154, 42, '_google_map', 'field_55b374cdf9146'),
(155, 36, 'google_map', 'a:3:{s:7:"address";s:40:"380 Osborne Street, Winnipeg, MB, Canada";s:3:"lat";s:10:"49.8718626";s:3:"lng";s:18:"-97.13954810000001";}'),
(156, 36, '_google_map', 'field_55b374cdf9146'),
(159, 44, 'google_map', 'a:3:{s:7:"address";s:40:"380 Osborne Street, Winnipeg, MB, Canada";s:3:"lat";s:10:"49.8718626";s:3:"lng";s:18:"-97.13954810000001";}'),
(160, 44, '_google_map', 'field_55b374cdf9146'),
(161, 41, 'field_55b37b3c005ef', 'a:14:{s:3:"key";s:19:"field_55b37b3c005ef";s:5:"label";s:12:"Contact form";s:4:"name";s:12:"contact_form";s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:10:"formatting";s:4:"html";s:9:"maxlength";s:0:"";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:0;}'),
(163, 45, 'google_map', 'a:3:{s:7:"address";s:40:"380 Osborne Street, Winnipeg, MB, Canada";s:3:"lat";s:10:"49.8718626";s:3:"lng";s:18:"-97.13954810000001";}'),
(164, 45, '_google_map', 'field_55b374cdf9146'),
(165, 45, 'contact_form', '[contact-form-7 id="15" title="Contact form 1"]'),
(166, 45, '_contact_form', 'field_55b37b3c005ef'),
(167, 36, 'contact_form', '[contact-form-7 id="15" title="Contact form 1"]'),
(168, 36, '_contact_form', 'field_55b37b3c005ef'),
(170, 46, '_menu_item_type', 'custom'),
(171, 46, '_menu_item_menu_item_parent', '0'),
(172, 46, '_menu_item_object_id', '46'),
(173, 46, '_menu_item_object', 'custom'),
(174, 46, '_menu_item_target', ''),
(175, 46, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(176, 46, '_menu_item_xfn', ''),
(177, 46, '_menu_item_url', 'http://frg-red.test/'),
(179, 47, '_menu_item_type', 'taxonomy'),
(180, 47, '_menu_item_menu_item_parent', '0'),
(181, 47, '_menu_item_object_id', '8'),
(182, 47, '_menu_item_object', 'category'),
(183, 47, '_menu_item_target', ''),
(184, 47, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(185, 47, '_menu_item_xfn', ''),
(186, 47, '_menu_item_url', ''),
(188, 48, '_menu_item_type', 'taxonomy'),
(189, 48, '_menu_item_menu_item_parent', '0'),
(190, 48, '_menu_item_object_id', '14'),
(191, 48, '_menu_item_object', 'category'),
(192, 48, '_menu_item_target', ''),
(193, 48, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(194, 48, '_menu_item_xfn', ''),
(195, 48, '_menu_item_url', ''),
(197, 49, '_menu_item_type', 'taxonomy'),
(198, 49, '_menu_item_menu_item_parent', '0'),
(199, 49, '_menu_item_object_id', '13'),
(200, 49, '_menu_item_object', 'category'),
(201, 49, '_menu_item_target', ''),
(202, 49, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(203, 49, '_menu_item_xfn', ''),
(204, 49, '_menu_item_url', ''),
(205, 49, '_menu_item_orphaned', '1437826340'),
(206, 50, '_menu_item_type', 'taxonomy'),
(207, 50, '_menu_item_menu_item_parent', '0'),
(208, 50, '_menu_item_object_id', '11'),
(209, 50, '_menu_item_object', 'category'),
(210, 50, '_menu_item_target', ''),
(211, 50, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(212, 50, '_menu_item_xfn', ''),
(213, 50, '_menu_item_url', ''),
(215, 51, '_menu_item_type', 'taxonomy'),
(216, 51, '_menu_item_menu_item_parent', '0'),
(217, 51, '_menu_item_object_id', '9'),
(218, 51, '_menu_item_object', 'category'),
(219, 51, '_menu_item_target', ''),
(220, 51, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(221, 51, '_menu_item_xfn', ''),
(222, 51, '_menu_item_url', ''),
(224, 52, '_menu_item_type', 'taxonomy'),
(225, 52, '_menu_item_menu_item_parent', '0'),
(226, 52, '_menu_item_object_id', '12'),
(227, 52, '_menu_item_object', 'category'),
(228, 52, '_menu_item_target', ''),
(229, 52, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(230, 52, '_menu_item_xfn', ''),
(231, 52, '_menu_item_url', ''),
(233, 53, '_menu_item_type', 'taxonomy'),
(234, 53, '_menu_item_menu_item_parent', '0'),
(235, 53, '_menu_item_object_id', '10'),
(236, 53, '_menu_item_object', 'category'),
(237, 53, '_menu_item_target', ''),
(238, 53, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(239, 53, '_menu_item_xfn', ''),
(240, 53, '_menu_item_url', ''),
(242, 54, '_menu_item_type', 'post_type'),
(243, 54, '_menu_item_menu_item_parent', '0'),
(244, 54, '_menu_item_object_id', '38'),
(245, 54, '_menu_item_object', 'page'),
(246, 54, '_menu_item_target', ''),
(247, 54, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(248, 54, '_menu_item_xfn', ''),
(249, 54, '_menu_item_url', ''),
(251, 55, '_menu_item_type', 'taxonomy'),
(252, 55, '_menu_item_menu_item_parent', '0'),
(253, 55, '_menu_item_object_id', '16'),
(254, 55, '_menu_item_object', 'category'),
(255, 55, '_menu_item_target', ''),
(256, 55, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(257, 55, '_menu_item_xfn', ''),
(258, 55, '_menu_item_url', ''),
(260, 56, '_menu_item_type', 'taxonomy'),
(261, 56, '_menu_item_menu_item_parent', '0'),
(262, 56, '_menu_item_object_id', '17'),
(263, 56, '_menu_item_object', 'category'),
(264, 56, '_menu_item_target', ''),
(265, 56, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(266, 56, '_menu_item_xfn', ''),
(267, 56, '_menu_item_url', ''),
(269, 57, '_menu_item_type', 'taxonomy'),
(270, 57, '_menu_item_menu_item_parent', '0'),
(271, 57, '_menu_item_object_id', '18'),
(272, 57, '_menu_item_object', 'category'),
(273, 57, '_menu_item_target', ''),
(274, 57, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(275, 57, '_menu_item_xfn', ''),
(276, 57, '_menu_item_url', ''),
(278, 58, '_menu_item_type', 'taxonomy'),
(279, 58, '_menu_item_menu_item_parent', '0'),
(280, 58, '_menu_item_object_id', '15'),
(281, 58, '_menu_item_object', 'category'),
(282, 58, '_menu_item_target', ''),
(283, 58, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(284, 58, '_menu_item_xfn', ''),
(285, 58, '_menu_item_url', ''),
(296, 41, 'rule', 'a:5:{s:5:"param";s:4:"page";s:8:"operator";s:2:"==";s:5:"value";s:2:"36";s:8:"order_no";i:0;s:8:"group_no";i:0;}'),
(297, 61, '_menu_item_type', 'custom'),
(298, 61, '_menu_item_menu_item_parent', '0'),
(299, 61, '_menu_item_object_id', '61'),
(300, 61, '_menu_item_object', 'custom'),
(301, 61, '_menu_item_target', ''),
(302, 61, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(303, 61, '_menu_item_xfn', ''),
(304, 61, '_menu_item_url', 'http://frg-red.test/contact-page/'),
(306, 62, '_menu_item_type', 'post_type'),
(307, 62, '_menu_item_menu_item_parent', '0'),
(308, 62, '_menu_item_object_id', '36'),
(309, 62, '_menu_item_object', 'page'),
(310, 62, '_menu_item_target', ''),
(311, 62, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(312, 62, '_menu_item_xfn', ''),
(313, 62, '_menu_item_url', ''),
(315, 63, 'contact_form', '[contact-form-7 id="15" title="Contact form 1"]'),
(316, 63, '_contact_form', 'field_55b37b3c005ef'),
(317, 63, 'google_map', 'a:3:{s:7:"address";s:40:"380 Osborne Street, Winnipeg, MB, Canada";s:3:"lat";s:10:"49.8718626";s:3:"lng";s:18:"-97.13954810000001";}'),
(318, 63, '_google_map', 'field_55b374cdf9146'),
(319, 64, '_menu_item_type', 'post_type'),
(320, 64, '_menu_item_menu_item_parent', '0'),
(321, 64, '_menu_item_object_id', '38'),
(322, 64, '_menu_item_object', 'page'),
(323, 64, '_menu_item_target', ''),
(324, 64, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(325, 64, '_menu_item_xfn', ''),
(326, 64, '_menu_item_url', ''),
(328, 65, '_menu_item_type', 'taxonomy'),
(329, 65, '_menu_item_menu_item_parent', '0'),
(330, 65, '_menu_item_object_id', '14'),
(331, 65, '_menu_item_object', 'category'),
(332, 65, '_menu_item_target', ''),
(333, 65, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(334, 65, '_menu_item_xfn', ''),
(335, 65, '_menu_item_url', ''),
(337, 66, '_menu_item_type', 'taxonomy'),
(338, 66, '_menu_item_menu_item_parent', '0'),
(339, 66, '_menu_item_object_id', '13'),
(340, 66, '_menu_item_object', 'category'),
(341, 66, '_menu_item_target', ''),
(342, 66, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(343, 66, '_menu_item_xfn', ''),
(344, 66, '_menu_item_url', ''),
(346, 67, '_menu_item_type', 'taxonomy'),
(347, 67, '_menu_item_menu_item_parent', '0'),
(348, 67, '_menu_item_object_id', '11'),
(349, 67, '_menu_item_object', 'category'),
(350, 67, '_menu_item_target', ''),
(351, 67, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(352, 67, '_menu_item_xfn', ''),
(353, 67, '_menu_item_url', ''),
(355, 68, '_menu_item_type', 'taxonomy'),
(356, 68, '_menu_item_menu_item_parent', '0'),
(357, 68, '_menu_item_object_id', '9'),
(358, 68, '_menu_item_object', 'category'),
(359, 68, '_menu_item_target', ''),
(360, 68, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(361, 68, '_menu_item_xfn', ''),
(362, 68, '_menu_item_url', ''),
(364, 69, '_menu_item_type', 'taxonomy'),
(365, 69, '_menu_item_menu_item_parent', '0'),
(366, 69, '_menu_item_object_id', '12'),
(367, 69, '_menu_item_object', 'category'),
(368, 69, '_menu_item_target', ''),
(369, 69, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(370, 69, '_menu_item_xfn', ''),
(371, 69, '_menu_item_url', ''),
(373, 70, '_menu_item_type', 'taxonomy'),
(374, 70, '_menu_item_menu_item_parent', '0'),
(375, 70, '_menu_item_object_id', '10'),
(376, 70, '_menu_item_object', 'category'),
(377, 70, '_menu_item_target', ''),
(378, 70, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(379, 70, '_menu_item_xfn', ''),
(380, 70, '_menu_item_url', ''),
(382, 71, '_menu_item_type', 'taxonomy'),
(383, 71, '_menu_item_menu_item_parent', '0'),
(384, 71, '_menu_item_object_id', '8'),
(385, 71, '_menu_item_object', 'category'),
(386, 71, '_menu_item_target', ''),
(387, 71, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(388, 71, '_menu_item_xfn', ''),
(389, 71, '_menu_item_url', ''),
(391, 72, '_menu_item_type', 'post_type'),
(392, 72, '_menu_item_menu_item_parent', '0'),
(393, 72, '_menu_item_object_id', '36'),
(394, 72, '_menu_item_object', 'page'),
(395, 72, '_menu_item_target', ''),
(396, 72, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(397, 72, '_menu_item_xfn', ''),
(398, 72, '_menu_item_url', '');

-- --------------------------------------------------------

--
-- Table structure for table `frg_posts`
--

CREATE TABLE IF NOT EXISTS `frg_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=73 ;

--
-- Dumping data for table `frg_posts`
--

INSERT INTO `frg_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2015-07-25 07:15:50', '2015-07-25 07:15:50', 'Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2015-07-25 07:15:50', '2015-07-25 07:15:50', '', 0, 'http://frg-red.test/?p=1', 11, 'post', '', 1),
(2, 1, '2015-07-25 07:15:50', '2015-07-25 07:15:50', 'This is an example page. It''s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I''m a bike messenger by day, aspiring actor by night, and this is my blog. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin'' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href="http://frg-red.test/wp-admin/">your dashboard</a> to delete this page and create new pages for your content. Have fun!', 'Sample Page', '', 'publish', 'open', 'open', '', 'sample-page', '', '', '2015-07-25 07:15:50', '2015-07-25 07:15:50', '', 0, 'http://frg-red.test/?page_id=2', 0, 'page', '', 0),
(3, 1, '2015-07-25 07:16:06', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-07-25 07:16:06', '0000-00-00 00:00:00', '', 0, 'http://frg-red.test/?p=3', 0, 'post', '', 0),
(4, 1, '2015-07-25 08:23:39', '0000-00-00 00:00:00', 'eyJ0aXRsZSI6Ik5leHRHRU4gQmFzaWMgVGh1bWJuYWlscyIsImVudGl0eV90eXBlcyI6WyJpbWFnZSJdLCJwcmV2aWV3X2ltYWdlX3JlbHBhdGgiOiJcL25leHRnZW4tZ2FsbGVyeVwvcHJvZHVjdHNcL3Bob3RvY3JhdGlfbmV4dGdlblwvbW9kdWxlc1wvbmV4dGdlbl9iYXNpY19nYWxsZXJ5XC9zdGF0aWNcL3RodW1iX3ByZXZpZXcuanBnIiwiZGVmYXVsdF9zb3VyY2UiOiJnYWxsZXJpZXMiLCJ2aWV3X29yZGVyIjoxMDAwMCwibmFtZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY190aHVtYm5haWxzIiwiaW5zdGFsbGVkX2F0X3ZlcnNpb24iOiIyLjEuMiIsImlkX2ZpZWxkIjoiSUQiLCJzZXR0aW5ncyI6eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJpbWFnZXNfcGVyX3BhZ2UiOiIyMCIsIm51bWJlcl9vZl9jb2x1bW5zIjowLCJ0aHVtYm5haWxfd2lkdGgiOjI0MCwidGh1bWJuYWlsX2hlaWdodCI6MTYwLCJzaG93X2FsbF9pbl9saWdodGJveCI6MCwiYWpheF9wYWdpbmF0aW9uIjowLCJ1c2VfaW1hZ2Vicm93c2VyX2VmZmVjdCI6MCwidGVtcGxhdGUiOiIiLCJkaXNwbGF5X25vX2ltYWdlc19lcnJvciI6MSwiZGlzYWJsZV9wYWdpbmF0aW9uIjowLCJzaG93X3NsaWRlc2hvd19saW5rIjoxLCJzbGlkZXNob3dfbGlua190ZXh0IjoiW1Nob3cgc2xpZGVzaG93XSIsIm92ZXJyaWRlX3RodW1ibmFpbF9zZXR0aW5ncyI6MCwidGh1bWJuYWlsX3F1YWxpdHkiOiIxMDAiLCJ0aHVtYm5haWxfY3JvcCI6MSwidGh1bWJuYWlsX3dhdGVybWFyayI6MCwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciJ9LCJoaWRkZW5fZnJvbV91aSI6ZmFsc2UsIl9fZGVmYXVsdHNfc2V0Ijp0cnVlfQ==', 'NextGEN Basic Thumbnails', '', 'draft', 'open', 'open', '', '', '', '', '2015-07-25 08:23:39', '0000-00-00 00:00:00', 'eyJ0aXRsZSI6Ik5leHRHRU4gQmFzaWMgVGh1bWJuYWlscyIsImVudGl0eV90eXBlcyI6WyJpbWFnZSJdLCJwcmV2aWV3X2ltYWdlX3JlbHBhdGgiOiJcL25leHRnZW4tZ2FsbGVyeVwvcHJvZHVjdHNcL3Bob3RvY3JhdGlfbmV4dGdlblwvbW9kdWxlc1wvbmV4dGdlbl9iYXNpY19nYWxsZXJ5XC9zdGF0aWNcL3RodW1iX3ByZXZpZXcuanBnIiwiZGVmYXVsdF9zb3VyY2UiOiJnYWxsZXJpZXMiLCJ2aWV3X29yZGVyIjoxMDAwMCwibmFtZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY190aHVtYm5haWxzIiwiaW5zdGFsbGVkX2F0X3ZlcnNpb24iOiIyLjEuMiIsImlkX2ZpZWxkIjoiSUQiLCJzZXR0aW5ncyI6eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJpbWFnZXNfcGVyX3BhZ2UiOiIyMCIsIm51bWJlcl9vZl9jb2x1bW5zIjowLCJ0aHVtYm5haWxfd2lkdGgiOjI0MCwidGh1bWJuYWlsX2hlaWdodCI6MTYwLCJzaG93X2FsbF9pbl9saWdodGJveCI6MCwiYWpheF9wYWdpbmF0aW9uIjowLCJ1c2VfaW1hZ2Vicm93c2VyX2VmZmVjdCI6MCwidGVtcGxhdGUiOiIiLCJkaXNwbGF5X25vX2ltYWdlc19lcnJvciI6MSwiZGlzYWJsZV9wYWdpbmF0aW9uIjowLCJzaG93X3NsaWRlc2hvd19saW5rIjoxLCJzbGlkZXNob3dfbGlua190ZXh0IjoiW1Nob3cgc2xpZGVzaG93XSIsIm92ZXJyaWRlX3RodW1ibmFpbF9zZXR0aW5ncyI6MCwidGh1bWJuYWlsX3F1YWxpdHkiOiIxMDAiLCJ0aHVtYm5haWxfY3JvcCI6MSwidGh1bWJuYWlsX3dhdGVybWFyayI6MCwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciJ9LCJoaWRkZW5fZnJvbV91aSI6ZmFsc2UsIl9fZGVmYXVsdHNfc2V0Ijp0cnVlfQ==', 0, 'http://frg-red.test/?post_type=display_type&p=4', 0, 'display_type', '', 0),
(5, 1, '2015-07-25 08:23:39', '0000-00-00 00:00:00', 'eyJ0aXRsZSI6Ik5leHRHRU4gQmFzaWMgU2xpZGVzaG93IiwiZW50aXR5X3R5cGVzIjpbImltYWdlIl0sInByZXZpZXdfaW1hZ2VfcmVscGF0aCI6IlwvbmV4dGdlbi1nYWxsZXJ5XC9wcm9kdWN0c1wvcGhvdG9jcmF0aV9uZXh0Z2VuXC9tb2R1bGVzXC9uZXh0Z2VuX2Jhc2ljX2dhbGxlcnlcL3N0YXRpY1wvc2xpZGVzaG93X3ByZXZpZXcuanBnIiwiZGVmYXVsdF9zb3VyY2UiOiJnYWxsZXJpZXMiLCJ2aWV3X29yZGVyIjoxMDAxMCwibmFtZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY19zbGlkZXNob3ciLCJpbnN0YWxsZWRfYXRfdmVyc2lvbiI6IjIuMS4yIiwiaWRfZmllbGQiOiJJRCIsInNldHRpbmdzIjp7InVzZV9saWdodGJveF9lZmZlY3QiOnRydWUsImdhbGxlcnlfd2lkdGgiOjYwMCwiZ2FsbGVyeV9oZWlnaHQiOjQwMCwidGh1bWJuYWlsX3dpZHRoIjoyNDAsInRodW1ibmFpbF9oZWlnaHQiOjE2MCwiY3ljbGVfaW50ZXJ2YWwiOjEwLCJjeWNsZV9lZmZlY3QiOm51bGwsImVmZmVjdF9jb2RlIjoiY2xhc3M9XCJuZ2ctZmFuY3lib3hcIiByZWw9XCIlR0FMTEVSWV9OQU1FJVwiIiwic2hvd190aHVtYm5haWxfbGluayI6MSwidGh1bWJuYWlsX2xpbmtfdGV4dCI6IltTaG93IHRodW1ibmFpbHNdIiwidGVtcGxhdGUiOiIiLCJuZ2dfdHJpZ2dlcnNfZGlzcGxheSI6Im5ldmVyIn0sImhpZGRlbl9mcm9tX3VpIjpmYWxzZSwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'NextGEN Basic Slideshow', '', 'draft', 'open', 'open', '', '', '', '', '2015-07-25 08:23:39', '0000-00-00 00:00:00', 'eyJ0aXRsZSI6Ik5leHRHRU4gQmFzaWMgU2xpZGVzaG93IiwiZW50aXR5X3R5cGVzIjpbImltYWdlIl0sInByZXZpZXdfaW1hZ2VfcmVscGF0aCI6IlwvbmV4dGdlbi1nYWxsZXJ5XC9wcm9kdWN0c1wvcGhvdG9jcmF0aV9uZXh0Z2VuXC9tb2R1bGVzXC9uZXh0Z2VuX2Jhc2ljX2dhbGxlcnlcL3N0YXRpY1wvc2xpZGVzaG93X3ByZXZpZXcuanBnIiwiZGVmYXVsdF9zb3VyY2UiOiJnYWxsZXJpZXMiLCJ2aWV3X29yZGVyIjoxMDAxMCwibmFtZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY19zbGlkZXNob3ciLCJpbnN0YWxsZWRfYXRfdmVyc2lvbiI6IjIuMS4yIiwiaWRfZmllbGQiOiJJRCIsInNldHRpbmdzIjp7InVzZV9saWdodGJveF9lZmZlY3QiOnRydWUsImdhbGxlcnlfd2lkdGgiOjYwMCwiZ2FsbGVyeV9oZWlnaHQiOjQwMCwidGh1bWJuYWlsX3dpZHRoIjoyNDAsInRodW1ibmFpbF9oZWlnaHQiOjE2MCwiY3ljbGVfaW50ZXJ2YWwiOjEwLCJjeWNsZV9lZmZlY3QiOm51bGwsImVmZmVjdF9jb2RlIjoiY2xhc3M9XCJuZ2ctZmFuY3lib3hcIiByZWw9XCIlR0FMTEVSWV9OQU1FJVwiIiwic2hvd190aHVtYm5haWxfbGluayI6MSwidGh1bWJuYWlsX2xpbmtfdGV4dCI6IltTaG93IHRodW1ibmFpbHNdIiwidGVtcGxhdGUiOiIiLCJuZ2dfdHJpZ2dlcnNfZGlzcGxheSI6Im5ldmVyIn0sImhpZGRlbl9mcm9tX3VpIjpmYWxzZSwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://frg-red.test/?post_type=display_type&p=5', 0, 'display_type', '', 0),
(6, 1, '2015-07-25 08:23:39', '0000-00-00 00:00:00', 'eyJ0aXRsZSI6Ik5leHRHRU4gQmFzaWMgSW1hZ2VCcm93c2VyIiwiZW50aXR5X3R5cGVzIjpbImltYWdlIl0sInByZXZpZXdfaW1hZ2VfcmVscGF0aCI6IlwvbmV4dGdlbi1nYWxsZXJ5XC9wcm9kdWN0c1wvcGhvdG9jcmF0aV9uZXh0Z2VuXC9tb2R1bGVzXC9uZXh0Z2VuX2Jhc2ljX2ltYWdlYnJvd3Nlclwvc3RhdGljXC9wcmV2aWV3LmpwZyIsImRlZmF1bHRfc291cmNlIjoiZ2FsbGVyaWVzIiwidmlld19vcmRlciI6MTAwMjAsIm5hbWUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfaW1hZ2Vicm93c2VyIiwiaW5zdGFsbGVkX2F0X3ZlcnNpb24iOiIyLjEuMiIsImlkX2ZpZWxkIjoiSUQiLCJzZXR0aW5ncyI6eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJ0ZW1wbGF0ZSI6IiIsIm5nZ190cmlnZ2Vyc19kaXNwbGF5IjoibmV2ZXIifSwiaGlkZGVuX2Zyb21fdWkiOmZhbHNlLCJfX2RlZmF1bHRzX3NldCI6dHJ1ZX0=', 'NextGEN Basic ImageBrowser', '', 'draft', 'open', 'open', '', '', '', '', '2015-07-25 08:23:39', '0000-00-00 00:00:00', 'eyJ0aXRsZSI6Ik5leHRHRU4gQmFzaWMgSW1hZ2VCcm93c2VyIiwiZW50aXR5X3R5cGVzIjpbImltYWdlIl0sInByZXZpZXdfaW1hZ2VfcmVscGF0aCI6IlwvbmV4dGdlbi1nYWxsZXJ5XC9wcm9kdWN0c1wvcGhvdG9jcmF0aV9uZXh0Z2VuXC9tb2R1bGVzXC9uZXh0Z2VuX2Jhc2ljX2ltYWdlYnJvd3Nlclwvc3RhdGljXC9wcmV2aWV3LmpwZyIsImRlZmF1bHRfc291cmNlIjoiZ2FsbGVyaWVzIiwidmlld19vcmRlciI6MTAwMjAsIm5hbWUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfaW1hZ2Vicm93c2VyIiwiaW5zdGFsbGVkX2F0X3ZlcnNpb24iOiIyLjEuMiIsImlkX2ZpZWxkIjoiSUQiLCJzZXR0aW5ncyI6eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJ0ZW1wbGF0ZSI6IiIsIm5nZ190cmlnZ2Vyc19kaXNwbGF5IjoibmV2ZXIifSwiaGlkZGVuX2Zyb21fdWkiOmZhbHNlLCJfX2RlZmF1bHRzX3NldCI6dHJ1ZX0=', 0, 'http://frg-red.test/?post_type=display_type&p=6', 0, 'display_type', '', 0),
(7, 1, '2015-07-25 08:23:39', '0000-00-00 00:00:00', 'eyJ0aXRsZSI6Ik5leHRHRU4gQmFzaWMgU2luZ2xlUGljIiwiZW50aXR5X3R5cGVzIjpbImltYWdlIl0sInByZXZpZXdfaW1hZ2VfcmVscGF0aCI6IlwvbmV4dGdlbi1nYWxsZXJ5XC9wcm9kdWN0c1wvcGhvdG9jcmF0aV9uZXh0Z2VuXC9tb2R1bGVzXC9uZXh0Z2VuX2Jhc2ljX3NpbmdsZXBpY1wvc3RhdGljXC9wcmV2aWV3LmdpZiIsImRlZmF1bHRfc291cmNlIjoiZ2FsbGVyaWVzIiwidmlld19vcmRlciI6MTAwNjAsImhpZGRlbl9mcm9tX3VpIjp0cnVlLCJuYW1lIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX3NpbmdsZXBpYyIsImluc3RhbGxlZF9hdF92ZXJzaW9uIjoiMi4xLjIiLCJpZF9maWVsZCI6IklEIiwic2V0dGluZ3MiOnsidXNlX2xpZ2h0Ym94X2VmZmVjdCI6dHJ1ZSwid2lkdGgiOiIiLCJoZWlnaHQiOiIiLCJtb2RlIjoiIiwiZGlzcGxheV93YXRlcm1hcmsiOjAsImRpc3BsYXlfcmVmbGVjdGlvbiI6MCwiZmxvYXQiOiIiLCJsaW5rIjoiIiwibGlua190YXJnZXQiOiJfYmxhbmsiLCJxdWFsaXR5IjoxMDAsImNyb3AiOjAsInRlbXBsYXRlIjoiIiwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciJ9LCJfX2RlZmF1bHRzX3NldCI6dHJ1ZX0=', 'NextGEN Basic SinglePic', '', 'draft', 'open', 'open', '', '', '', '', '2015-07-25 08:23:39', '0000-00-00 00:00:00', 'eyJ0aXRsZSI6Ik5leHRHRU4gQmFzaWMgU2luZ2xlUGljIiwiZW50aXR5X3R5cGVzIjpbImltYWdlIl0sInByZXZpZXdfaW1hZ2VfcmVscGF0aCI6IlwvbmV4dGdlbi1nYWxsZXJ5XC9wcm9kdWN0c1wvcGhvdG9jcmF0aV9uZXh0Z2VuXC9tb2R1bGVzXC9uZXh0Z2VuX2Jhc2ljX3NpbmdsZXBpY1wvc3RhdGljXC9wcmV2aWV3LmdpZiIsImRlZmF1bHRfc291cmNlIjoiZ2FsbGVyaWVzIiwidmlld19vcmRlciI6MTAwNjAsImhpZGRlbl9mcm9tX3VpIjp0cnVlLCJuYW1lIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX3NpbmdsZXBpYyIsImluc3RhbGxlZF9hdF92ZXJzaW9uIjoiMi4xLjIiLCJpZF9maWVsZCI6IklEIiwic2V0dGluZ3MiOnsidXNlX2xpZ2h0Ym94X2VmZmVjdCI6dHJ1ZSwid2lkdGgiOiIiLCJoZWlnaHQiOiIiLCJtb2RlIjoiIiwiZGlzcGxheV93YXRlcm1hcmsiOjAsImRpc3BsYXlfcmVmbGVjdGlvbiI6MCwiZmxvYXQiOiIiLCJsaW5rIjoiIiwibGlua190YXJnZXQiOiJfYmxhbmsiLCJxdWFsaXR5IjoxMDAsImNyb3AiOjAsInRlbXBsYXRlIjoiIiwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciJ9LCJfX2RlZmF1bHRzX3NldCI6dHJ1ZX0=', 0, 'http://frg-red.test/?post_type=display_type&p=7', 0, 'display_type', '', 0),
(8, 1, '2015-07-25 08:23:39', '0000-00-00 00:00:00', 'eyJ0aXRsZSI6Ik5leHRHRU4gQmFzaWMgVGFnQ2xvdWQiLCJlbnRpdHlfdHlwZXMiOlsiaW1hZ2UiXSwicHJldmlld19pbWFnZV9yZWxwYXRoIjoiXC9uZXh0Z2VuLWdhbGxlcnlcL3Byb2R1Y3RzXC9waG90b2NyYXRpX25leHRnZW5cL21vZHVsZXNcL25leHRnZW5fYmFzaWNfdGFnY2xvdWRcL3N0YXRpY1wvcHJldmlldy5naWYiLCJkZWZhdWx0X3NvdXJjZSI6InRhZ3MiLCJ2aWV3X29yZGVyIjoxMDEwMCwibmFtZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY190YWdjbG91ZCIsImluc3RhbGxlZF9hdF92ZXJzaW9uIjoiMi4xLjIiLCJpZF9maWVsZCI6IklEIiwic2V0dGluZ3MiOnsidXNlX2xpZ2h0Ym94X2VmZmVjdCI6dHJ1ZSwiZGlzcGxheV90eXBlIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX3RodW1ibmFpbHMiLCJudW1iZXIiOjQ1LCJuZ2dfdHJpZ2dlcnNfZGlzcGxheSI6Im5ldmVyIn0sImhpZGRlbl9mcm9tX3VpIjpmYWxzZSwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'NextGEN Basic TagCloud', '', 'draft', 'open', 'open', '', '', '', '', '2015-07-25 08:23:39', '0000-00-00 00:00:00', 'eyJ0aXRsZSI6Ik5leHRHRU4gQmFzaWMgVGFnQ2xvdWQiLCJlbnRpdHlfdHlwZXMiOlsiaW1hZ2UiXSwicHJldmlld19pbWFnZV9yZWxwYXRoIjoiXC9uZXh0Z2VuLWdhbGxlcnlcL3Byb2R1Y3RzXC9waG90b2NyYXRpX25leHRnZW5cL21vZHVsZXNcL25leHRnZW5fYmFzaWNfdGFnY2xvdWRcL3N0YXRpY1wvcHJldmlldy5naWYiLCJkZWZhdWx0X3NvdXJjZSI6InRhZ3MiLCJ2aWV3X29yZGVyIjoxMDEwMCwibmFtZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY190YWdjbG91ZCIsImluc3RhbGxlZF9hdF92ZXJzaW9uIjoiMi4xLjIiLCJpZF9maWVsZCI6IklEIiwic2V0dGluZ3MiOnsidXNlX2xpZ2h0Ym94X2VmZmVjdCI6dHJ1ZSwiZGlzcGxheV90eXBlIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX3RodW1ibmFpbHMiLCJudW1iZXIiOjQ1LCJuZ2dfdHJpZ2dlcnNfZGlzcGxheSI6Im5ldmVyIn0sImhpZGRlbl9mcm9tX3VpIjpmYWxzZSwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://frg-red.test/?post_type=display_type&p=8', 0, 'display_type', '', 0),
(9, 1, '2015-07-25 08:23:40', '0000-00-00 00:00:00', 'eyJ0aXRsZSI6Ik5leHRHRU4gQmFzaWMgQ29tcGFjdCBBbGJ1bSIsImVudGl0eV90eXBlcyI6WyJhbGJ1bSIsImdhbGxlcnkiXSwicHJldmlld19pbWFnZV9yZWxwYXRoIjoiXC9uZXh0Z2VuLWdhbGxlcnlcL3Byb2R1Y3RzXC9waG90b2NyYXRpX25leHRnZW5cL21vZHVsZXNcL25leHRnZW5fYmFzaWNfYWxidW1cL3N0YXRpY1wvY29tcGFjdF9wcmV2aWV3LmpwZyIsImRlZmF1bHRfc291cmNlIjoiYWxidW1zIiwidmlld19vcmRlciI6MTAyMDAsIm5hbWUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfY29tcGFjdF9hbGJ1bSIsImluc3RhbGxlZF9hdF92ZXJzaW9uIjoiMi4xLjIiLCJpZF9maWVsZCI6IklEIiwic2V0dGluZ3MiOnsidXNlX2xpZ2h0Ym94X2VmZmVjdCI6dHJ1ZSwiZ2FsbGVyaWVzX3Blcl9wYWdlIjowLCJlbmFibGVfYnJlYWRjcnVtYnMiOjEsImRpc2FibGVfcGFnaW5hdGlvbiI6MCwidGVtcGxhdGUiOiIiLCJnYWxsZXJ5X2Rpc3BsYXlfdHlwZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY190aHVtYm5haWxzIiwiZ2FsbGVyeV9kaXNwbGF5X3RlbXBsYXRlIjoiIiwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciJ9LCJoaWRkZW5fZnJvbV91aSI6ZmFsc2UsIl9fZGVmYXVsdHNfc2V0Ijp0cnVlfQ==', 'NextGEN Basic Compact Album', '', 'draft', 'open', 'open', '', '', '', '', '2015-07-25 08:23:40', '0000-00-00 00:00:00', 'eyJ0aXRsZSI6Ik5leHRHRU4gQmFzaWMgQ29tcGFjdCBBbGJ1bSIsImVudGl0eV90eXBlcyI6WyJhbGJ1bSIsImdhbGxlcnkiXSwicHJldmlld19pbWFnZV9yZWxwYXRoIjoiXC9uZXh0Z2VuLWdhbGxlcnlcL3Byb2R1Y3RzXC9waG90b2NyYXRpX25leHRnZW5cL21vZHVsZXNcL25leHRnZW5fYmFzaWNfYWxidW1cL3N0YXRpY1wvY29tcGFjdF9wcmV2aWV3LmpwZyIsImRlZmF1bHRfc291cmNlIjoiYWxidW1zIiwidmlld19vcmRlciI6MTAyMDAsIm5hbWUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfY29tcGFjdF9hbGJ1bSIsImluc3RhbGxlZF9hdF92ZXJzaW9uIjoiMi4xLjIiLCJpZF9maWVsZCI6IklEIiwic2V0dGluZ3MiOnsidXNlX2xpZ2h0Ym94X2VmZmVjdCI6dHJ1ZSwiZ2FsbGVyaWVzX3Blcl9wYWdlIjowLCJlbmFibGVfYnJlYWRjcnVtYnMiOjEsImRpc2FibGVfcGFnaW5hdGlvbiI6MCwidGVtcGxhdGUiOiIiLCJnYWxsZXJ5X2Rpc3BsYXlfdHlwZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY190aHVtYm5haWxzIiwiZ2FsbGVyeV9kaXNwbGF5X3RlbXBsYXRlIjoiIiwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciJ9LCJoaWRkZW5fZnJvbV91aSI6ZmFsc2UsIl9fZGVmYXVsdHNfc2V0Ijp0cnVlfQ==', 0, 'http://frg-red.test/?post_type=display_type&p=9', 0, 'display_type', '', 0),
(10, 1, '2015-07-25 08:23:40', '0000-00-00 00:00:00', 'eyJ0aXRsZSI6Ik5leHRHRU4gQmFzaWMgRXh0ZW5kZWQgQWxidW0iLCJlbnRpdHlfdHlwZXMiOlsiYWxidW0iLCJnYWxsZXJ5Il0sInByZXZpZXdfaW1hZ2VfcmVscGF0aCI6IlwvbmV4dGdlbi1nYWxsZXJ5XC9wcm9kdWN0c1wvcGhvdG9jcmF0aV9uZXh0Z2VuXC9tb2R1bGVzXC9uZXh0Z2VuX2Jhc2ljX2FsYnVtXC9zdGF0aWNcL2V4dGVuZGVkX3ByZXZpZXcuanBnIiwiZGVmYXVsdF9zb3VyY2UiOiJhbGJ1bXMiLCJ2aWV3X29yZGVyIjoxMDIxMCwibmFtZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY19leHRlbmRlZF9hbGJ1bSIsImluc3RhbGxlZF9hdF92ZXJzaW9uIjoiMi4xLjIiLCJpZF9maWVsZCI6IklEIiwic2V0dGluZ3MiOnsidXNlX2xpZ2h0Ym94X2VmZmVjdCI6dHJ1ZSwiZ2FsbGVyaWVzX3Blcl9wYWdlIjowLCJlbmFibGVfYnJlYWRjcnVtYnMiOjEsImRpc2FibGVfcGFnaW5hdGlvbiI6MCwidGVtcGxhdGUiOiIiLCJvdmVycmlkZV90aHVtYm5haWxfc2V0dGluZ3MiOjAsInRodW1ibmFpbF93aWR0aCI6MjQwLCJ0aHVtYm5haWxfaGVpZ2h0IjoxNjAsInRodW1ibmFpbF9xdWFsaXR5IjoxMDAsInRodW1ibmFpbF9jcm9wIjp0cnVlLCJ0aHVtYm5haWxfd2F0ZXJtYXJrIjowLCJnYWxsZXJ5X2Rpc3BsYXlfdHlwZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY190aHVtYm5haWxzIiwiZ2FsbGVyeV9kaXNwbGF5X3RlbXBsYXRlIjoiIiwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciJ9LCJoaWRkZW5fZnJvbV91aSI6ZmFsc2UsIl9fZGVmYXVsdHNfc2V0Ijp0cnVlfQ==', 'NextGEN Basic Extended Album', '', 'draft', 'open', 'open', '', '', '', '', '2015-07-25 08:23:40', '0000-00-00 00:00:00', 'eyJ0aXRsZSI6Ik5leHRHRU4gQmFzaWMgRXh0ZW5kZWQgQWxidW0iLCJlbnRpdHlfdHlwZXMiOlsiYWxidW0iLCJnYWxsZXJ5Il0sInByZXZpZXdfaW1hZ2VfcmVscGF0aCI6IlwvbmV4dGdlbi1nYWxsZXJ5XC9wcm9kdWN0c1wvcGhvdG9jcmF0aV9uZXh0Z2VuXC9tb2R1bGVzXC9uZXh0Z2VuX2Jhc2ljX2FsYnVtXC9zdGF0aWNcL2V4dGVuZGVkX3ByZXZpZXcuanBnIiwiZGVmYXVsdF9zb3VyY2UiOiJhbGJ1bXMiLCJ2aWV3X29yZGVyIjoxMDIxMCwibmFtZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY19leHRlbmRlZF9hbGJ1bSIsImluc3RhbGxlZF9hdF92ZXJzaW9uIjoiMi4xLjIiLCJpZF9maWVsZCI6IklEIiwic2V0dGluZ3MiOnsidXNlX2xpZ2h0Ym94X2VmZmVjdCI6dHJ1ZSwiZ2FsbGVyaWVzX3Blcl9wYWdlIjowLCJlbmFibGVfYnJlYWRjcnVtYnMiOjEsImRpc2FibGVfcGFnaW5hdGlvbiI6MCwidGVtcGxhdGUiOiIiLCJvdmVycmlkZV90aHVtYm5haWxfc2V0dGluZ3MiOjAsInRodW1ibmFpbF93aWR0aCI6MjQwLCJ0aHVtYm5haWxfaGVpZ2h0IjoxNjAsInRodW1ibmFpbF9xdWFsaXR5IjoxMDAsInRodW1ibmFpbF9jcm9wIjp0cnVlLCJ0aHVtYm5haWxfd2F0ZXJtYXJrIjowLCJnYWxsZXJ5X2Rpc3BsYXlfdHlwZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY190aHVtYm5haWxzIiwiZ2FsbGVyeV9kaXNwbGF5X3RlbXBsYXRlIjoiIiwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciJ9LCJoaWRkZW5fZnJvbV91aSI6ZmFsc2UsIl9fZGVmYXVsdHNfc2V0Ijp0cnVlfQ==', 0, 'http://frg-red.test/?post_type=display_type&p=10', 0, 'display_type', '', 0),
(11, 1, '2015-07-25 08:54:47', '2015-07-25 08:54:47', '', 'Home', '', 'publish', 'open', 'open', '', 'home', '', '', '2015-07-25 12:26:39', '2015-07-25 12:26:39', '', 0, 'http://frg-red.test/?p=11', 1, 'nav_menu_item', '', 0),
(13, 1, '2015-07-25 09:00:38', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-07-25 09:00:38', '0000-00-00 00:00:00', '', 0, 'http://frg-red.test/?page_id=13', 0, 'page', '', 0),
(14, 1, '2015-07-25 09:02:33', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-07-25 09:02:33', '0000-00-00 00:00:00', '', 0, 'http://frg-red.test/?post_type=acf&p=14', 0, 'acf', '', 0),
(15, 1, '2015-07-25 09:04:07', '2015-07-25 09:04:07', '<p>Your Name (required)<br />\n    [text* your-name] </p>\n\n<p>Your Email (required)<br />\n    [email* your-email] </p>\n\n<p>Subject<br />\n    [text your-subject] </p>\n\n<p>Your Message<br />\n    [textarea your-message] </p>\n\n<p>[submit "Send"]</p>\n[your-subject]\n[your-name] <wordpress@frg-red.test>\nFrom: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on FRG-RED (http://frg-red.test)\nleo2410ua@gmail.com\nReply-To: [your-email]\n\n0\n0\n\n[your-subject]\nFRG-RED <wordpress@frg-red.test>\nMessage Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on FRG-RED (http://frg-red.test)\n[your-email]\nReply-To: leo2410ua@gmail.com\n\n0\n0\nYour message was sent successfully. Thanks.\nFailed to send your message. Please try later or contact the administrator by another method.\nValidation errors occurred. Please confirm the fields and submit it again.\nFailed to send your message. Please try later or contact the administrator by another method.\nPlease accept the terms to proceed.\nPlease fill in the required field.\nThis input is too long.\nThis input is too short.', 'Contact form 1', '', 'publish', 'open', 'open', '', 'contact-form-1', '', '', '2015-07-25 09:04:07', '2015-07-25 09:04:07', '', 0, 'http://frg-red.test/?post_type=wpcf7_contact_form&p=15', 0, 'wpcf7_contact_form', '', 0),
(16, 1, '2015-07-25 09:26:54', '2015-07-25 09:26:54', '<div>\r\n<div class="rc">\r\n\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\n</div>\r\n</div>\r\n&nbsp;', 'Glass Repairs', '', 'publish', 'open', 'open', '', 'glass-repairs', '', '', '2015-07-25 09:26:54', '2015-07-25 09:26:54', '', 0, 'http://frg-red.test/?p=16', 10, 'post', '', 0),
(17, 1, '2015-07-25 09:26:54', '2015-07-25 09:26:54', '<div>\r\n<div class="rc">\r\n\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\n</div>\r\n</div>\r\n&nbsp;', 'Glass Repairs', '', 'inherit', 'open', 'open', '', '16-revision-v1', '', '', '2015-07-25 09:26:54', '2015-07-25 09:26:54', '', 16, 'http://frg-red.test/2015/07/25/16-revision-v1/', 0, 'revision', '', 0),
(18, 1, '2015-07-25 09:36:50', '2015-07-25 09:36:50', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'Showers', '', 'publish', 'open', 'open', '', 'showers', '', '', '2015-07-25 09:36:50', '2015-07-25 09:36:50', '', 0, 'http://frg-red.test/?p=18', 9, 'post', '', 0),
(19, 1, '2015-07-25 09:36:50', '2015-07-25 09:36:50', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'Showers', '', 'inherit', 'open', 'open', '', '18-revision-v1', '', '', '2015-07-25 09:36:50', '2015-07-25 09:36:50', '', 18, 'http://frg-red.test/2015/07/25/18-revision-v1/', 0, 'revision', '', 0),
(20, 1, '2015-07-25 09:37:05', '2015-07-25 09:37:05', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'Mirrors', '', 'publish', 'open', 'open', '', 'mirrors', '', '', '2015-07-25 09:37:05', '2015-07-25 09:37:05', '', 0, 'http://frg-red.test/?p=20', 8, 'post', '', 0),
(21, 1, '2015-07-25 09:37:05', '2015-07-25 09:37:05', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'Mirrors', '', 'inherit', 'open', 'open', '', '20-revision-v1', '', '', '2015-07-25 09:37:05', '2015-07-25 09:37:05', '', 20, 'http://frg-red.test/2015/07/25/20-revision-v1/', 0, 'revision', '', 0),
(22, 1, '2015-07-25 09:37:27', '2015-07-25 09:37:27', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'Auto Glass', '', 'publish', 'open', 'open', '', 'auto-glass', '', '', '2015-07-25 09:37:43', '2015-07-25 09:37:43', '', 0, 'http://frg-red.test/?p=22', 7, 'post', '', 0),
(23, 1, '2015-07-25 09:37:27', '2015-07-25 09:37:27', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'Auto Glass', '', 'inherit', 'open', 'open', '', '22-revision-v1', '', '', '2015-07-25 09:37:27', '2015-07-25 09:37:27', '', 22, 'http://frg-red.test/2015/07/25/22-revision-v1/', 0, 'revision', '', 0),
(24, 1, '2015-07-25 09:38:07', '2015-07-25 09:38:07', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'Backsplashes', '', 'publish', 'open', 'open', '', 'backsplashes', '', '', '2015-07-25 09:38:07', '2015-07-25 09:38:07', '', 0, 'http://frg-red.test/?p=24', 6, 'post', '', 0),
(25, 1, '2015-07-25 09:38:07', '2015-07-25 09:38:07', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'Backsplashes', '', 'inherit', 'open', 'open', '', '24-revision-v1', '', '', '2015-07-25 09:38:07', '2015-07-25 09:38:07', '', 24, 'http://frg-red.test/2015/07/25/24-revision-v1/', 0, 'revision', '', 0),
(26, 1, '2015-07-25 09:38:25', '2015-07-25 09:38:25', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'Custom Solutions', '', 'publish', 'open', 'open', '', 'custom-solutions', '', '', '2015-07-25 09:38:25', '2015-07-25 09:38:25', '', 0, 'http://frg-red.test/?p=26', 5, 'post', '', 0),
(27, 1, '2015-07-25 09:38:25', '2015-07-25 09:38:25', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'Custom Solutions', '', 'inherit', 'open', 'open', '', '26-revision-v1', '', '', '2015-07-25 09:38:25', '2015-07-25 09:38:25', '', 26, 'http://frg-red.test/2015/07/25/26-revision-v1/', 0, 'revision', '', 0),
(28, 1, '2015-07-25 09:38:47', '2015-07-25 09:38:47', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'Glass Doors', '', 'publish', 'open', 'open', '', 'glass-doors', '', '', '2015-07-25 09:38:47', '2015-07-25 09:38:47', '', 0, 'http://frg-red.test/?p=28', 4, 'post', '', 0),
(29, 1, '2015-07-25 09:38:47', '2015-07-25 09:38:47', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'Glass Doors', '', 'inherit', 'open', 'open', '', '28-revision-v1', '', '', '2015-07-25 09:38:47', '2015-07-25 09:38:47', '', 28, 'http://frg-red.test/2015/07/25/28-revision-v1/', 0, 'revision', '', 0),
(30, 1, '2015-07-25 09:39:07', '2015-07-25 09:39:07', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'Mirrors', '', 'publish', 'open', 'open', '', 'mirrors-2', '', '', '2015-07-25 09:39:07', '2015-07-25 09:39:07', '', 0, 'http://frg-red.test/?p=30', 3, 'post', '', 0),
(31, 1, '2015-07-25 09:39:07', '2015-07-25 09:39:07', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'Mirrors', '', 'inherit', 'open', 'open', '', '30-revision-v1', '', '', '2015-07-25 09:39:07', '2015-07-25 09:39:07', '', 30, 'http://frg-red.test/2015/07/25/30-revision-v1/', 0, 'revision', '', 0),
(32, 1, '2015-07-25 09:39:34', '2015-07-25 09:39:34', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'Other Products', '', 'publish', 'open', 'open', '', 'other-products', '', '', '2015-07-25 09:39:34', '2015-07-25 09:39:34', '', 0, 'http://frg-red.test/?p=32', 2, 'post', '', 0),
(33, 1, '2015-07-25 09:39:34', '2015-07-25 09:39:34', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'Other Products', '', 'inherit', 'open', 'open', '', '32-revision-v1', '', '', '2015-07-25 09:39:34', '2015-07-25 09:39:34', '', 32, 'http://frg-red.test/2015/07/25/32-revision-v1/', 0, 'revision', '', 0),
(34, 1, '2015-07-25 09:39:49', '2015-07-25 09:39:49', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'Partitions', '', 'publish', 'open', 'open', '', 'partitions', '', '', '2015-07-25 09:39:49', '2015-07-25 09:39:49', '', 0, 'http://frg-red.test/?p=34', 1, 'post', '', 0),
(35, 1, '2015-07-25 09:39:49', '2015-07-25 09:39:49', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'Partitions', '', 'inherit', 'open', 'open', '', '34-revision-v1', '', '', '2015-07-25 09:39:49', '2015-07-25 09:39:49', '', 34, 'http://frg-red.test/2015/07/25/34-revision-v1/', 0, 'revision', '', 0),
(36, 1, '2015-07-25 11:33:21', '2015-07-25 11:33:21', 'We would be happy to assist you. Please email or call one of the contacts below with any questions you may have about our glass services.   Or if you interested in receiving a free quote by email, please fill out the "Request A Quote" from below.\r\n\r\n&nbsp;', 'Contact Us', '', 'publish', 'open', 'open', '', 'contact-page', '', '', '2015-07-25 12:20:19', '2015-07-25 12:20:19', '', 0, 'http://frg-red.test/?page_id=36', 0, 'page', '', 0),
(37, 1, '2015-07-25 11:33:21', '2015-07-25 11:33:21', '', 'Contact Page', '', 'inherit', 'open', 'open', '', '36-revision-v1', '', '', '2015-07-25 11:33:21', '2015-07-25 11:33:21', '', 36, 'http://frg-red.test/2015/07/25/36-revision-v1/', 0, 'revision', '', 0),
(38, 1, '2015-07-25 11:33:38', '2015-07-25 11:33:38', '', 'About Us', '', 'publish', 'open', 'open', '', 'about', '', '', '2015-07-25 12:15:59', '2015-07-25 12:15:59', '', 0, 'http://frg-red.test/?page_id=38', 0, 'page', '', 0),
(39, 1, '2015-07-25 11:33:38', '2015-07-25 11:33:38', '', 'About', '', 'inherit', 'open', 'open', '', '38-revision-v1', '', '', '2015-07-25 11:33:38', '2015-07-25 11:33:38', '', 38, 'http://frg-red.test/2015/07/25/38-revision-v1/', 0, 'revision', '', 0),
(40, 1, '2015-07-25 11:34:07', '2015-07-25 11:34:07', '[contact-form-7 id="15" title="Contact form 1"]', 'Contact Page', '', 'inherit', 'open', 'open', '', '36-revision-v1', '', '', '2015-07-25 11:34:07', '2015-07-25 11:34:07', '', 36, 'http://frg-red.test/2015/07/25/36-revision-v1/', 0, 'revision', '', 0),
(41, 1, '2015-07-25 11:37:30', '2015-07-25 11:37:30', '', 'ContactUs Page Custom fields', '', 'publish', 'closed', 'closed', '', 'acf_contactus-page-custom-fields', '', '', '2015-07-25 12:17:38', '2015-07-25 12:17:38', '', 0, 'http://frg-red.test/?post_type=acf&#038;p=41', 0, 'acf', '', 0),
(42, 1, '2015-07-25 11:42:28', '2015-07-25 11:42:28', '[contact-form-7 id="15" title="Contact form 1"]', 'Contact Page', '', 'inherit', 'open', 'open', '', '36-revision-v1', '', '', '2015-07-25 11:42:28', '2015-07-25 11:42:28', '', 36, 'http://frg-red.test/2015/07/25/36-revision-v1/', 0, 'revision', '', 0),
(43, 1, '2015-07-25 12:03:39', '2015-07-25 12:03:39', 'We would be happy to assist you. Please email or call one of the contacts below with any questions you may have about our glass services.   Or if you interested in receiving a free quote by email, please fill out the "Request A Quote" from below.\n\n[contact-form-7 id="15" title="Contact form 1"]', 'Contact US', '', 'inherit', 'open', 'open', '', '36-autosave-v1', '', '', '2015-07-25 12:03:39', '2015-07-25 12:03:39', '', 36, 'http://frg-red.test/2015/07/25/36-autosave-v1/', 0, 'revision', '', 0),
(44, 1, '2015-07-25 12:03:45', '2015-07-25 12:03:45', 'We would be happy to assist you. Please email or call one of the contacts below with any questions you may have about our glass services.   Or if you interested in receiving a free quote by email, please fill out the "Request A Quote" from below.\r\n\r\n[contact-form-7 id="15" title="Contact form 1"]', 'Contact US', '', 'inherit', 'open', 'open', '', '36-revision-v1', '', '', '2015-07-25 12:03:45', '2015-07-25 12:03:45', '', 36, 'http://frg-red.test/2015/07/25/36-revision-v1/', 0, 'revision', '', 0),
(45, 1, '2015-07-25 12:05:21', '2015-07-25 12:05:21', 'We would be happy to assist you. Please email or call one of the contacts below with any questions you may have about our glass services.   Or if you interested in receiving a free quote by email, please fill out the "Request A Quote" from below.\r\n\r\n&nbsp;', 'Contact US', '', 'inherit', 'open', 'open', '', '36-revision-v1', '', '', '2015-07-25 12:05:21', '2015-07-25 12:05:21', '', 36, 'http://frg-red.test/2015/07/25/36-revision-v1/', 0, 'revision', '', 0),
(46, 1, '2015-07-25 12:13:52', '2015-07-25 12:13:52', '', 'Home', '', 'publish', 'open', 'open', '', 'home-2', '', '', '2015-07-25 12:13:52', '2015-07-25 12:13:52', '', 0, 'http://frg-red.test/?p=46', 1, 'nav_menu_item', '', 0),
(47, 1, '2015-07-25 12:13:52', '2015-07-25 12:13:52', ' ', '', '', 'publish', 'open', 'open', '', '47', '', '', '2015-07-25 12:13:52', '2015-07-25 12:13:52', '', 0, 'http://frg-red.test/?p=47', 2, 'nav_menu_item', '', 0),
(48, 1, '2015-07-25 12:13:53', '2015-07-25 12:13:53', ' ', '', '', 'publish', 'open', 'open', '', '48', '', '', '2015-07-25 12:13:53', '2015-07-25 12:13:53', '', 0, 'http://frg-red.test/?p=48', 7, 'nav_menu_item', '', 0),
(49, 1, '2015-07-25 12:12:20', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-07-25 12:12:20', '0000-00-00 00:00:00', '', 0, 'http://frg-red.test/?p=49', 1, 'nav_menu_item', '', 0),
(50, 1, '2015-07-25 12:13:53', '2015-07-25 12:13:53', 'We offer a variety of glass doors for interior or exterior use. Nothing says a modern quite like a frameless glass door. They are an excellent way to add a modern touch to a traditional home or cap off contemporary build. All our doors are made with 10mm tempered safety glass and can with frames or frameless. Whether you are interested in frameless glass pivot door or an ultra-modern sliding glass door with exposed stainless steel hardware, we have the product for you. We specialize in custom designs to fit your needs. Feel free to browse our selection and contact us to receive a free quote.', '', '', 'publish', 'open', 'open', '', '50', '', '', '2015-07-25 12:13:53', '2015-07-25 12:13:53', '', 0, 'http://frg-red.test/?p=50', 5, 'nav_menu_item', '', 0),
(51, 1, '2015-07-25 12:13:52', '2015-07-25 12:13:52', ' ', '', '', 'publish', 'open', 'open', '', '51', '', '', '2015-07-25 12:13:52', '2015-07-25 12:13:52', '', 0, 'http://frg-red.test/?p=51', 3, 'nav_menu_item', '', 0),
(52, 1, '2015-07-25 12:13:53', '2015-07-25 12:13:53', ' ', '', '', 'publish', 'open', 'open', '', '52', '', '', '2015-07-25 12:13:53', '2015-07-25 12:13:53', '', 0, 'http://frg-red.test/?p=52', 6, 'nav_menu_item', '', 0),
(53, 1, '2015-07-25 12:13:53', '2015-07-25 12:13:53', '', 'Railings & Starecases', '', 'publish', 'open', 'open', '', 'railings-starecases', '', '', '2015-07-25 12:13:53', '2015-07-25 12:13:53', '', 0, 'http://frg-red.test/?p=53', 4, 'nav_menu_item', '', 0),
(54, 1, '2015-07-25 12:18:56', '2015-07-25 12:18:56', ' ', '', '', 'publish', 'open', 'open', '', 'about', '', '', '2015-07-25 12:20:01', '2015-07-25 12:20:01', '', 0, 'http://frg-red.test/?p=54', 1, 'nav_menu_item', '', 0),
(55, 1, '2015-07-25 12:18:56', '2015-07-25 12:18:56', ' ', '', '', 'publish', 'open', 'open', '', '55', '', '', '2015-07-25 12:20:01', '2015-07-25 12:20:01', '', 0, 'http://frg-red.test/?p=55', 3, 'nav_menu_item', '', 0),
(56, 1, '2015-07-25 12:18:57', '2015-07-25 12:18:57', ' ', '', '', 'publish', 'open', 'open', '', '56', '', '', '2015-07-25 12:20:01', '2015-07-25 12:20:01', '', 0, 'http://frg-red.test/?p=56', 4, 'nav_menu_item', '', 0),
(57, 1, '2015-07-25 12:18:57', '2015-07-25 12:18:57', ' ', '', '', 'publish', 'open', 'open', '', '57', '', '', '2015-07-25 12:20:01', '2015-07-25 12:20:01', '', 0, 'http://frg-red.test/?p=57', 5, 'nav_menu_item', '', 0),
(58, 1, '2015-07-25 12:18:57', '2015-07-25 12:18:57', '', 'Windows & Doors', '', 'publish', 'open', 'open', '', 'windows-doors', '', '', '2015-07-25 12:20:01', '2015-07-25 12:20:01', '', 0, 'http://frg-red.test/?p=58', 2, 'nav_menu_item', '', 0),
(60, 1, '2015-07-25 12:15:20', '2015-07-25 12:15:20', '', 'About Us', '', 'inherit', 'open', 'open', '', '38-revision-v1', '', '', '2015-07-25 12:15:20', '2015-07-25 12:15:20', '', 38, 'http://frg-red.test/2015/07/25/38-revision-v1/', 0, 'revision', '', 0),
(61, 1, '2015-07-25 12:18:57', '2015-07-25 12:18:57', '', 'Request a Quote', '', 'publish', 'open', 'open', '', 'request-a-quote', '', '', '2015-07-25 12:20:01', '2015-07-25 12:20:01', '', 0, 'http://frg-red.test/?p=61', 6, 'nav_menu_item', '', 0),
(62, 1, '2015-07-25 12:19:50', '2015-07-25 12:19:50', '', 'Contact Us', '', 'publish', 'open', 'open', '', '62', '', '', '2015-07-25 12:20:01', '2015-07-25 12:20:01', '', 0, 'http://frg-red.test/?p=62', 7, 'nav_menu_item', '', 0),
(63, 1, '2015-07-25 12:20:19', '2015-07-25 12:20:19', 'We would be happy to assist you. Please email or call one of the contacts below with any questions you may have about our glass services.   Or if you interested in receiving a free quote by email, please fill out the "Request A Quote" from below.\r\n\r\n&nbsp;', 'Contact Us', '', 'inherit', 'open', 'open', '', '36-revision-v1', '', '', '2015-07-25 12:20:19', '2015-07-25 12:20:19', '', 36, 'http://frg-red.test/2015/07/25/36-revision-v1/', 0, 'revision', '', 0),
(64, 1, '2015-07-25 12:21:28', '2015-07-25 12:21:28', '', 'About FRG', '', 'publish', 'open', 'open', '', 'about-frg', '', '', '2015-07-25 12:26:40', '2015-07-25 12:26:40', '', 0, 'http://frg-red.test/?p=64', 2, 'nav_menu_item', '', 0),
(65, 1, '2015-07-25 12:23:01', '2015-07-25 12:23:01', ' ', '', '', 'publish', 'open', 'open', '', '65', '', '', '2015-07-25 12:26:40', '2015-07-25 12:26:40', '', 0, 'http://frg-red.test/?p=65', 9, 'nav_menu_item', '', 0),
(66, 1, '2015-07-25 12:23:01', '2015-07-25 12:23:01', ' ', '', '', 'publish', 'open', 'open', '', '66', '', '', '2015-07-25 12:26:40', '2015-07-25 12:26:40', '', 0, 'http://frg-red.test/?p=66', 8, 'nav_menu_item', '', 0),
(67, 1, '2015-07-25 12:23:00', '2015-07-25 12:23:00', 'We offer a variety of glass doors for interior or exterior use. Nothing says a modern quite like a frameless glass door. They are an excellent way to add a modern touch to a traditional home or cap off contemporary build. All our doors are made with 10mm tempered safety glass and can with frames or frameless. Whether you are interested in frameless glass pivot door or an ultra-modern sliding glass door with exposed stainless steel hardware, we have the product for you. We specialize in custom designs to fit your needs. Feel free to browse our selection and contact us to receive a free quote.', '', '', 'publish', 'open', 'open', '', '67', '', '', '2015-07-25 12:26:40', '2015-07-25 12:26:40', '', 0, 'http://frg-red.test/?p=67', 6, 'nav_menu_item', '', 0),
(68, 1, '2015-07-25 12:23:00', '2015-07-25 12:23:00', ' ', '', '', 'publish', 'open', 'open', '', '68', '', '', '2015-07-25 12:26:40', '2015-07-25 12:26:40', '', 0, 'http://frg-red.test/?p=68', 4, 'nav_menu_item', '', 0),
(69, 1, '2015-07-25 12:23:00', '2015-07-25 12:23:00', ' ', '', '', 'publish', 'open', 'open', '', '69', '', '', '2015-07-25 12:26:40', '2015-07-25 12:26:40', '', 0, 'http://frg-red.test/?p=69', 7, 'nav_menu_item', '', 0),
(70, 1, '2015-07-25 12:23:00', '2015-07-25 12:23:00', '', 'Railings & Starecases', '', 'publish', 'open', 'open', '', 'railings-starecases-2', '', '', '2015-07-25 12:26:40', '2015-07-25 12:26:40', '', 0, 'http://frg-red.test/?p=70', 5, 'nav_menu_item', '', 0),
(71, 1, '2015-07-25 12:23:00', '2015-07-25 12:23:00', ' ', '', '', 'publish', 'open', 'open', '', '71', '', '', '2015-07-25 12:26:40', '2015-07-25 12:26:40', '', 0, 'http://frg-red.test/?p=71', 3, 'nav_menu_item', '', 0),
(72, 1, '2015-07-25 12:23:01', '2015-07-25 12:23:01', ' ', '', '', 'publish', 'open', 'open', '', '72', '', '', '2015-07-25 12:26:40', '2015-07-25 12:26:40', '', 0, 'http://frg-red.test/?p=72', 10, 'nav_menu_item', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `frg_terms`
--

CREATE TABLE IF NOT EXISTS `frg_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  `term_order` int(4) DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=20 ;

--
-- Dumping data for table `frg_terms`
--

INSERT INTO `frg_terms` (`term_id`, `name`, `slug`, `term_group`, `term_order`) VALUES
(1, 'Uncategorized', 'uncategorized', 0, 12),
(2, 'simple', 'simple', 0, 0),
(3, 'grouped', 'grouped', 0, 0),
(4, 'variable', 'variable', 0, 0),
(5, 'external', 'external', 0, 0),
(6, 'Page Menu', 'page-menu', 0, 0),
(7, 'Main Page Menu-Slider-Top', 'main-page-menu-slider-top', 0, 0),
(8, 'Showers', 'showers', 0, 10),
(9, 'Mirrors', 'mirrors', 0, 6),
(10, 'Railings &amp; Starecases', 'railings_starecases', 0, 9),
(11, 'Glass Doors', 'glass_doors', 0, 4),
(12, 'Partitions', 'partitions', 0, 8),
(13, 'Backsplashes', 'backsplashes', 0, 2),
(14, 'Custom Solutions', 'custom_solutions', 0, 1),
(15, 'Windows &amp; Doors', 'windows_doors', 0, 11),
(16, 'Auto Glass', 'auto_glass', 0, 3),
(17, 'Glass Repairs', 'glass_repairs', 0, 5),
(18, 'Other Products', 'other_products', 0, 7),
(19, 'Main Page Menu-Top-Slider-bottom', 'main-page-menu-top-slider-bottom', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `frg_term_relationships`
--

CREATE TABLE IF NOT EXISTS `frg_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `frg_term_relationships`
--

INSERT INTO `frg_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(11, 6, 0),
(16, 17, 0),
(18, 1, 0),
(20, 1, 0),
(22, 16, 0),
(24, 13, 0),
(26, 14, 0),
(28, 11, 0),
(30, 9, 0),
(32, 18, 0),
(34, 12, 0),
(46, 7, 0),
(47, 7, 0),
(48, 7, 0),
(50, 7, 0),
(51, 7, 0),
(52, 7, 0),
(53, 7, 0),
(54, 19, 0),
(55, 19, 0),
(56, 19, 0),
(57, 19, 0),
(58, 19, 0),
(61, 19, 0),
(62, 19, 0),
(64, 6, 0),
(65, 6, 0),
(66, 6, 0),
(67, 6, 0),
(68, 6, 0),
(69, 6, 0),
(70, 6, 0),
(71, 6, 0),
(72, 6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `frg_term_taxonomy`
--

CREATE TABLE IF NOT EXISTS `frg_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=20 ;

--
-- Dumping data for table `frg_term_taxonomy`
--

INSERT INTO `frg_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 3),
(2, 2, 'product_type', '', 0, 0),
(3, 3, 'product_type', '', 0, 0),
(4, 4, 'product_type', '', 0, 0),
(5, 5, 'product_type', '', 0, 0),
(6, 6, 'nav_menu', '', 0, 10),
(7, 7, 'nav_menu', '', 0, 7),
(8, 8, 'category', '', 0, 0),
(9, 9, 'category', '', 0, 1),
(10, 10, 'category', '', 0, 0),
(11, 11, 'category', 'We offer a variety of glass doors for interior or exterior use. Nothing says a modern quite like a frameless glass door. They are an excellent way to add a modern touch to a traditional home or cap off contemporary build. All our doors are made with 10mm tempered safety glass and can with frames or frameless. Whether you are interested in frameless glass pivot door or an ultra-modern sliding glass door with exposed stainless steel hardware, we have the product for you. We specialize in custom designs to fit your needs. Feel free to browse our selection and contact us to receive a free quote.', 0, 1),
(12, 12, 'category', '', 0, 1),
(13, 13, 'category', '', 0, 1),
(14, 14, 'category', '', 0, 1),
(15, 15, 'category', '', 0, 0),
(16, 16, 'category', '', 0, 1),
(17, 17, 'category', '', 0, 1),
(18, 18, 'category', '', 0, 1),
(19, 19, 'nav_menu', '', 0, 7);

-- --------------------------------------------------------

--
-- Table structure for table `frg_usermeta`
--

CREATE TABLE IF NOT EXISTS `frg_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=23 ;

--
-- Dumping data for table `frg_usermeta`
--

INSERT INTO `frg_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'fresh'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'true'),
(10, 1, 'frg_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(11, 1, 'frg_user_level', '10'),
(12, 1, 'dismissed_wp_pointers', 'wp360_locks,wp390_widgets,aioseop_menu_220,aioseop_welcome_220,wp410_dfw'),
(13, 1, 'show_welcome_panel', '1'),
(14, 1, 'session_tokens', 'a:2:{s:64:"f12572bc9e4005b8c661393345d47a57813e8ba314f1f6d00fb6b4bc6f0c41b2";a:4:{s:10:"expiration";i:1439018165;s:2:"ip";s:9:"127.0.0.1";s:2:"ua";s:104:"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.89 Safari/537.36";s:5:"login";i:1437808565;}s:64:"cadf06258c813835de914e1218db319edc0746f82091767719c859a0578ce2c9";a:4:{s:10:"expiration";i:1439021257;s:2:"ip";s:9:"127.0.0.1";s:2:"ua";s:135:"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/43.0.2357.130 Chrome/43.0.2357.130 Safari/537.36";s:5:"login";i:1437811657;}}'),
(15, 1, 'frg_dashboard_quick_press_last_post_id', '3'),
(16, 1, 'managenav-menuscolumnshidden', 'a:4:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";}'),
(17, 1, 'metaboxhidden_nav-menus', 'a:3:{i:0;s:8:"add-post";i:1;s:12:"add-post_tag";i:2;s:11:"add-ngg_tag";}'),
(18, 1, 'closedpostboxes_post', 'a:1:{i:0;s:9:"formatdiv";}'),
(19, 1, 'metaboxhidden_post', 'a:7:{i:0;s:11:"postexcerpt";i:1;s:13:"trackbacksdiv";i:2;s:10:"postcustom";i:3;s:16:"commentstatusdiv";i:4;s:11:"commentsdiv";i:5;s:7:"slugdiv";i:6;s:9:"authordiv";}'),
(20, 1, 'meta-box-order_post', 'a:4:{s:15:"acf_after_title";s:0:"";s:4:"side";s:61:"submitdiv,categorydiv,tagsdiv-post_tag,postimagediv,formatdiv";s:6:"normal";s:83:"postexcerpt,trackbacksdiv,postcustom,commentstatusdiv,commentsdiv,slugdiv,authordiv";s:8:"advanced";s:5:"aiosp";}'),
(21, 1, 'screen_layout_post', '2'),
(22, 1, 'nav_menu_recently_edited', '19');

-- --------------------------------------------------------

--
-- Table structure for table `frg_users`
--

CREATE TABLE IF NOT EXISTS `frg_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `frg_users`
--

INSERT INTO `frg_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$BmdCZlhzvidIvDAwSgwgt1Wrdm5obD.', 'admin', 'leo2410ua@gmail.com', '', '2015-07-25 07:15:50', '', 0, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `frg_woocommerce_attribute_taxonomies`
--

CREATE TABLE IF NOT EXISTS `frg_woocommerce_attribute_taxonomies` (
  `attribute_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attribute_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_label` longtext COLLATE utf8mb4_unicode_ci,
  `attribute_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_orderby` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_public` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`attribute_id`),
  KEY `attribute_name` (`attribute_name`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `frg_woocommerce_downloadable_product_permissions`
--

CREATE TABLE IF NOT EXISTS `frg_woocommerce_downloadable_product_permissions` (
  `permission_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `download_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL DEFAULT '0',
  `order_key` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `downloads_remaining` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_granted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access_expires` datetime DEFAULT NULL,
  `download_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`permission_id`),
  KEY `download_order_key_product` (`product_id`,`order_id`,`order_key`(191),`download_id`),
  KEY `download_order_product` (`download_id`,`order_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `frg_woocommerce_order_itemmeta`
--

CREATE TABLE IF NOT EXISTS `frg_woocommerce_order_itemmeta` (
  `meta_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_item_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `order_item_id` (`order_item_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `frg_woocommerce_order_items`
--

CREATE TABLE IF NOT EXISTS `frg_woocommerce_order_items` (
  `order_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_item_name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_item_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `order_id` bigint(20) NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `frg_woocommerce_tax_rates`
--

CREATE TABLE IF NOT EXISTS `frg_woocommerce_tax_rates` (
  `tax_rate_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tax_rate_country` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_state` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_priority` bigint(20) NOT NULL,
  `tax_rate_compound` int(1) NOT NULL DEFAULT '0',
  `tax_rate_shipping` int(1) NOT NULL DEFAULT '1',
  `tax_rate_order` bigint(20) NOT NULL,
  `tax_rate_class` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`tax_rate_id`),
  KEY `tax_rate_country` (`tax_rate_country`(191)),
  KEY `tax_rate_state` (`tax_rate_state`(191)),
  KEY `tax_rate_class` (`tax_rate_class`(191)),
  KEY `tax_rate_priority` (`tax_rate_priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `frg_woocommerce_tax_rate_locations`
--

CREATE TABLE IF NOT EXISTS `frg_woocommerce_tax_rate_locations` (
  `location_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `location_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_rate_id` bigint(20) NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `tax_rate_id` (`tax_rate_id`),
  KEY `location_type` (`location_type`),
  KEY `location_type_code` (`location_type`,`location_code`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `frg_woocommerce_termmeta`
--

CREATE TABLE IF NOT EXISTS `frg_woocommerce_termmeta` (
  `meta_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `woocommerce_term_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `woocommerce_term_id` (`woocommerce_term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;