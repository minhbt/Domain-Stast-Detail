-- phpMyAdmin SQL Dump
-- version 3.4.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 07, 2012 at 02:08 PM
-- Server version: 5.1.52
-- PHP Version: 5.2.16

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mwixi`
--

-- --------------------------------------------------------

--
-- Table structure for table `wixi_domain_stats`
--

DROP TABLE IF EXISTS `wixi_domain_stats`;
CREATE TABLE IF NOT EXISTS `wixi_domain_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ds_name` varchar(200) DEFAULT NULL,
  `ds_lastupdate` datetime DEFAULT NULL,
  `description` varchar(200) NOT NULL COMMENT 'Sort name',
  `registration_date` date DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `num_script` int(4) NOT NULL,
  `executed_script` int(4) NOT NULL,
  `executed_script_tem` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2159 ;

-- --------------------------------------------------------

--
-- Table structure for table `wixi_domain_stats_detail`
--

DROP TABLE IF EXISTS `wixi_domain_stats_detail`;
CREATE TABLE IF NOT EXISTS `wixi_domain_stats_detail` (
  `ds_id` int(11) NOT NULL,
  `g_id` int(11) NOT NULL,
  `index` double DEFAULT NULL,
  `rank` double DEFAULT NULL,
  `links` double DEFAULT NULL,
  `fail_listed` varchar(45) DEFAULT NULL,
  `adult` varchar(45) DEFAULT NULL,
  KEY `fk_ds_dsdetail` (`ds_id`),
  KEY `fk_group_dsdetail` (`g_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wixi_group`
--

DROP TABLE IF EXISTS `wixi_group`;
CREATE TABLE IF NOT EXISTS `wixi_group` (
  `idgroup` int(11) NOT NULL AUTO_INCREMENT,
  `g_name` varchar(200) DEFAULT NULL,
  `g_scriptInterval` int(4) DEFAULT NULL,
  `g_timeout` int(4) NOT NULL,
  `g_stoppedON` int(11) NOT NULL COMMENT '= startTinme + $cron_interval',
  PRIMARY KEY (`idgroup`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `wixi_group`
--

INSERT INTO `wixi_group` (`idgroup`, `g_name`, `g_scriptInterval`, `g_timeout`, `g_stoppedON`) VALUES
(1, 'Google', 5, 0, 0),
(2, 'Yahoo', 5, 0, 0),
(3, 'Bing', 5, 0, 0),
(4, 'Alexa', 5, 0, 0),
(5, 'Other', 5, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wixi_script`
--

DROP TABLE IF EXISTS `wixi_script`;
CREATE TABLE IF NOT EXISTS `wixi_script` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `g_id` int(11) DEFAULT NULL,
  `s_name` varchar(45) DEFAULT NULL,
  `s_path` text,
  `s_class` varchar(45) DEFAULT NULL,
  `s_enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_group_script` (`g_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `wixi_script`
--

INSERT INTO `wixi_script` (`id`, `g_id`, `s_name`, `s_path`, `s_class`, `s_enabled`) VALUES
(6, 1, 'Google Page Rank', 'wixi_scripts/googlepagerank.php', 'GOOGLE_PAGERANK', 1),
(7, 1, 'Google  links', 'wixi_scripts/googlelinks.php', 'GOOGLE_LINKS', 1),
(8, 1, 'Google Index', 'wixi_scripts/googleindexs.php', 'GOOGLE_INDEXS', 1),
(9, 1, 'Domain Age', 'wixi_scripts/phpwhois/whois.php', 'DOMAIN_AGE', 1),
(11, 1, 'Google Fail Listed', 'wixi_scripts/faillisted.php', 'FAILLISED', 1),
(12, 2, 'Yahoo Index', 'wixi_scripts/yahooindexs.php', 'YAHOO_INDEXS', 1),
(13, 2, 'Yahoo Link', 'wixi_scripts/yahoolinks.php', 'YAHOO_LINKS', 1),
(14, 3, 'Bing Index', 'wixi_scripts/bingindexs.php', 'BING_INDEXS', 1),
(15, 3, 'Bing link', 'wixi_scripts/binglinks.php', 'BING_LINKS', 1),
(16, 4, 'Alexa Traffic Rank', 'wixi_scripts/alexarank.php', 'ALEXA_RANK', 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `wixi_domain_stats_detail`
--
ALTER TABLE `wixi_domain_stats_detail`
  ADD CONSTRAINT `fk_ds_dsdetail` FOREIGN KEY (`ds_id`) REFERENCES `wixi_domain_stats` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_group_dsdetail` FOREIGN KEY (`g_id`) REFERENCES `wixi_group` (`idgroup`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `wixi_script`
--
ALTER TABLE `wixi_script`
  ADD CONSTRAINT `fk_group_script` FOREIGN KEY (`g_id`) REFERENCES `wixi_group` (`idgroup`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
