# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.17)
# Database: invntry
# Generation Time: 2014-05-29 05:30:09 +0000
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
  `asset_type` int(11) NOT NULL,
  `asset_tag1` varchar(20) DEFAULT NULL,
  `asset_tag2` varchar(20) DEFAULT NULL,
  `serial_number` varchar(200) DEFAULT NULL,
  `desc` varchar(100) DEFAULT NULL,
  `long_desc` text,
  `make_id` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `is_assignable` char(1) NOT NULL DEFAULT 'N',
  `purchase_date` date DEFAULT NULL,
  `purchase_value` decimal(11,2) DEFAULT NULL,
  `sale_date` date DEFAULT NULL,
  `sale_value` decimal(11,2) DEFAULT NULL,
  PRIMARY KEY (`asset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table asset_assignment
# ------------------------------------------------------------

CREATE TABLE `asset_assignment` (
  `line_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`line_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table asset_incident
# ------------------------------------------------------------

CREATE TABLE `asset_incident` (
  `incident_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` varchar(100) DEFAULT NULL,
  `asset_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `desc` text NOT NULL,
  `open_time` datetime NOT NULL,
  `close_time` datetime DEFAULT NULL,
  `old_serial_number` varchar(200) DEFAULT NULL,
  `repair_cost` decimal(11,2) NOT NULL DEFAULT '0.00',
  `user_pays_repair` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`incident_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table asset_mac
# ------------------------------------------------------------

CREATE TABLE `asset_mac` (
  `line_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) NOT NULL,
  `mac_address` char(17) NOT NULL DEFAULT '',
  PRIMARY KEY (`line_id`)
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




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
