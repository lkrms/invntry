# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.6.21)
# Database: invntry
# Generation Time: 2014-11-02 23:28:02 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table asset
# ------------------------------------------------------------

CREATE TABLE `asset` (
  `asset_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `asset_type` int(11) unsigned NOT NULL,
  `asset_tag1` varchar(20) DEFAULT NULL,
  `asset_tag2` varchar(20) DEFAULT NULL,
  `serial_number` varchar(200) DEFAULT NULL,
  `desc` varchar(100) DEFAULT NULL,
  `long_desc` text,
  `make_id` int(11) unsigned DEFAULT NULL,
  `model_id` int(11) unsigned DEFAULT NULL,
  `is_assignable` char(1) NOT NULL DEFAULT 'N',
  `purchase_date` date DEFAULT NULL,
  `purchase_value` decimal(11,2) DEFAULT NULL,
  `sale_date` date DEFAULT NULL,
  `sale_value` decimal(11,2) DEFAULT NULL,
  PRIMARY KEY (`asset_id`),
  KEY `idx_asset_asset_type` (`asset_type`),
  KEY `idx_asset_make_id` (`make_id`),
  KEY `idx_asset_model_id` (`model_id`),
  CONSTRAINT `fk_asset_asset_type` FOREIGN KEY (`asset_type`) REFERENCES `ref_asset_type` (`type_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_asset_make_id` FOREIGN KEY (`make_id`) REFERENCES `ref_asset_make` (`make_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_asset_model_id` FOREIGN KEY (`model_id`) REFERENCES `ref_asset_model` (`model_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table asset_assignment
# ------------------------------------------------------------

CREATE TABLE `asset_assignment` (
  `line_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`line_id`),
  KEY `idx_asset_assignment_asset_id` (`asset_id`),
  KEY `idx_asset_assignment_user_id` (`user_id`),
  CONSTRAINT `fk_asset_assignment_asset_id` FOREIGN KEY (`asset_id`) REFERENCES `asset` (`asset_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_asset_assignment_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table asset_incident
# ------------------------------------------------------------

CREATE TABLE `asset_incident` (
  `incident_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` varchar(100) DEFAULT NULL,
  `asset_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `desc` text NOT NULL,
  `open_time` datetime NOT NULL,
  `close_time` datetime DEFAULT NULL,
  `old_serial_number` varchar(200) DEFAULT NULL,
  `repair_cost` decimal(11,2) NOT NULL DEFAULT '0.00',
  `user_pays_repair` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`incident_id`),
  KEY `idx_asset_incident_asset_id` (`asset_id`),
  KEY `idx_asset_incident_user_id` (`user_id`),
  CONSTRAINT `fk_asset_incident_asset_id` FOREIGN KEY (`asset_id`) REFERENCES `asset` (`asset_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_asset_incident_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table asset_mac
# ------------------------------------------------------------

CREATE TABLE `asset_mac` (
  `line_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) unsigned NOT NULL,
  `mac_address` char(17) NOT NULL DEFAULT '',
  `is_wifi` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`line_id`),
  UNIQUE KEY `idx_asset_mac_mac_address` (`mac_address`),
  KEY `idx_asset_mac_asset_id` (`asset_id`),
  CONSTRAINT `fk_asset_mac_asset_id` FOREIGN KEY (`asset_id`) REFERENCES `asset` (`asset_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table ref_asset_make
# ------------------------------------------------------------

CREATE TABLE `ref_asset_make` (
  `make_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `make_name` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`make_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table ref_asset_model
# ------------------------------------------------------------

CREATE TABLE `ref_asset_model` (
  `model_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `make_id` int(11) NOT NULL,
  `model_name` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table ref_asset_type
# ------------------------------------------------------------

CREATE TABLE `ref_asset_type` (
  `type_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table user
# ------------------------------------------------------------

CREATE TABLE `user` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `source_id` int(11) unsigned DEFAULT NULL,
  `guid` varchar(36) DEFAULT NULL,
  `username` varchar(200) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `can_login` char(1) NOT NULL DEFAULT 'N',
  `last_sync` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `idx_user_username` (`username`),
  KEY `idx_source_id` (`source_id`),
  CONSTRAINT `fk_user_source_id` FOREIGN KEY (`source_id`) REFERENCES `user_source` (`source_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table user_source
# ------------------------------------------------------------

CREATE TABLE `user_source` (
  `source_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `desc` varchar(100) NOT NULL DEFAULT '',
  `long_desc` text,
  PRIMARY KEY (`source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
