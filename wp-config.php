<?php
/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, and ABSPATH. You can find more information by visiting
 * {@link https://codex.wordpress.org/Editing_wp-config.php Editing wp-config.php}
 * Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'frg_red');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', 'root');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'T_)]m;]B{z1QAd5d@sh@v%R:np;~^-,usX5dw@<Zzt%<(>Bp2-%1PMEQ;.+s0[Z+');
define('SECURE_AUTH_KEY',  'sAD*ZqRfA=F!Vl|*|.E/=!{%9UFXQ&srM|5)8+.?!&=,r3t+A;M`ItN&Mw$|!Kvo');
define('LOGGED_IN_KEY',    'F~R5*ZV!A-=upMoTTAB|T0v=Aq+02?$7~-;~l!?u+Uy68`~M [%G2pv6qf,g|({E');
define('NONCE_KEY',        'QnGztV=^!yyi;^ cW|s.za+WA.vC<4$vgj/T~~?1}kJmxo&8O=Q0mjNyp A`3Cpc');
define('AUTH_SALT',        'f3{f7Vku2bfy&-/]kPFI*-B}1-a!i+{Aft:sqc?_Ul[aR8]^5v+./-cOs#P@0d~@');
define('SECURE_AUTH_SALT', 'V]:|O#kP.-8aH>e!FyNn#lv9+BL;n%*eh@VB!.$UdCxF*{Do6#,p!e]odN1LNt+*');
define('LOGGED_IN_SALT',   'W($jpdE1vHG^e0j,ly9^@+vv4TER4-j.u}IB+j*{a2bi&EWKgI&|_-j[p+?6vNFs');
define('NONCE_SALT',       'J|;h_io/6ce[l g]#Ru_8-U(uS-CY)G|[t1R0zx>-&65&f`Ic$4LRQA:Lgj|@7p9');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'frg_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
