-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.24-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.1.0.4944
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for erobotics
CREATE DATABASE IF NOT EXISTS `erobotics` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `erobotics`;


-- Dumping structure for table erobotics.cart_details
CREATE TABLE IF NOT EXISTS `cart_details` (
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table erobotics.cart_details: ~0 rows (approximately)
DELETE FROM `cart_details`;
/*!40000 ALTER TABLE `cart_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_details` ENABLE KEYS */;


-- Dumping structure for table erobotics.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_user_id` int(11) NOT NULL,
  `order_amount` float NOT NULL,
  `order_ship_name` varchar(100) NOT NULL,
  `order_ship_address` varchar(100) NOT NULL,
  `order_ship_address2` varchar(100) NOT NULL,
  `order_city` varchar(50) NOT NULL,
  `order_state` varchar(50) NOT NULL,
  `order_pincode` varchar(20) NOT NULL,
  `order_country` varchar(50) NOT NULL,
  `order_phone` varchar(20) NOT NULL,
  `order_fax` varchar(20) NOT NULL,
  `order_shipping` float NOT NULL,
  `order_tax` float NOT NULL,
  `order_email` varchar(100) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_shipped` tinyint(1) NOT NULL DEFAULT '0',
  `order_tracking_number` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table erobotics.orders: ~0 rows (approximately)
DELETE FROM `orders`;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;


-- Dumping structure for table erobotics.productcategories
CREATE TABLE IF NOT EXISTS `productcategories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table erobotics.productcategories: ~0 rows (approximately)
DELETE FROM `productcategories`;
/*!40000 ALTER TABLE `productcategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `productcategories` ENABLE KEYS */;


-- Dumping structure for table erobotics.productoptions
CREATE TABLE IF NOT EXISTS `productoptions` (
  `product_option_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `option_id` int(10) unsigned NOT NULL,
  `option_price_increment` double DEFAULT NULL,
  `option_group_id` int(11) NOT NULL,
  PRIMARY KEY (`product_option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table erobotics.productoptions: ~0 rows (approximately)
DELETE FROM `productoptions`;
/*!40000 ALTER TABLE `productoptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `productoptions` ENABLE KEYS */;


-- Dumping structure for table erobotics.products
CREATE TABLE IF NOT EXISTS `products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_name` varchar(100) DEFAULT NULL,
  `pro_price` float DEFAULT NULL,
  `pro_cart_desc` varchar(200) DEFAULT NULL,
  `pro_short_desc` varchar(200) DEFAULT NULL,
  `pro_long_desc` text,
  `pro_image` blob,
  `pro_category_id` int(11) DEFAULT NULL,
  `pro_update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `pro_stock` float DEFAULT NULL,
  `pro_live` tinyint(4) DEFAULT NULL,
  `product_video_id` int(11) DEFAULT NULL,
  `pro_location` varchar(100) DEFAULT NULL,
  `keywords` text,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table erobotics.products: ~0 rows (approximately)
DELETE FROM `products`;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;


-- Dumping structure for table erobotics.product_details
CREATE TABLE IF NOT EXISTS `product_details` (
  `product_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table erobotics.product_details: ~0 rows (approximately)
DELETE FROM `product_details`;
/*!40000 ALTER TABLE `product_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_details` ENABLE KEYS */;


-- Dumping structure for table erobotics.product_video_details
CREATE TABLE IF NOT EXISTS `product_video_details` (
  `product_video_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(50) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `updated_by` char(50) DEFAULT NULL,
  `last_updated` varchar(20) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_video_id`),
  KEY `FK_product_video_products` (`product_id`),
  CONSTRAINT `FK_product_video_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table erobotics.product_video_details: ~0 rows (approximately)
DELETE FROM `product_video_details`;
/*!40000 ALTER TABLE `product_video_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_video_details` ENABLE KEYS */;


-- Dumping structure for table erobotics.users
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(50) DEFAULT NULL,
  `user_password` varchar(50) DEFAULT NULL,
  `user_first_name` varchar(50) DEFAULT NULL,
  `user_last_name` varchar(50) DEFAULT NULL,
  `user_city` varchar(90) DEFAULT NULL,
  `user_state` varchar(20) DEFAULT NULL,
  `user_pincode` varchar(12) DEFAULT NULL,
  `user_email_verified` tinyint(1) DEFAULT '0',
  `user_registration_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_verification_code` varchar(20) DEFAULT NULL,
  `user_ip` varchar(50) DEFAULT NULL,
  `user_phone` varchar(20) DEFAULT NULL,
  `user_fax` varchar(20) DEFAULT NULL,
  `user_country` varchar(20) DEFAULT NULL,
  `user_address` varchar(100) DEFAULT NULL,
  `user_address2` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table erobotics.users: ~0 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
