-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 18-07-2014 a las 21:30:32
-- Versión del servidor: 5.1.41
-- Versión de PHP: 5.3.1

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `mrbs`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mrbs_area`
--

CREATE TABLE IF NOT EXISTS `mrbs_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  `area_name` varchar(30) DEFAULT NULL,
  `timezone` varchar(50) DEFAULT NULL,
  `area_admin_email` text,
  `resolution` int(11) DEFAULT NULL,
  `default_duration` int(11) DEFAULT NULL,
  `default_duration_all_day` tinyint(1) NOT NULL DEFAULT '0',
  `morningstarts` int(11) DEFAULT NULL,
  `morningstarts_minutes` int(11) DEFAULT NULL,
  `eveningends` int(11) DEFAULT NULL,
  `eveningends_minutes` int(11) DEFAULT NULL,
  `private_enabled` tinyint(1) DEFAULT NULL,
  `private_default` tinyint(1) DEFAULT NULL,
  `private_mandatory` tinyint(1) DEFAULT NULL,
  `private_override` varchar(32) DEFAULT NULL,
  `min_book_ahead_enabled` tinyint(1) DEFAULT NULL,
  `min_book_ahead_secs` int(11) DEFAULT NULL,
  `max_book_ahead_enabled` tinyint(1) DEFAULT NULL,
  `max_book_ahead_secs` int(11) DEFAULT NULL,
  `max_per_day_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `max_per_day` int(11) NOT NULL DEFAULT '0',
  `max_per_week_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `max_per_week` int(11) NOT NULL DEFAULT '0',
  `max_per_month_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `max_per_month` int(11) NOT NULL DEFAULT '0',
  `max_per_year_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `max_per_year` int(11) NOT NULL DEFAULT '0',
  `max_per_future_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `max_per_future` int(11) NOT NULL DEFAULT '0',
  `custom_html` text,
  `approval_enabled` tinyint(1) DEFAULT NULL,
  `reminders_enabled` tinyint(1) DEFAULT NULL,
  `enable_periods` tinyint(1) DEFAULT NULL,
  `confirmation_enabled` tinyint(1) DEFAULT NULL,
  `confirmed_default` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Volcar la base de datos para la tabla `mrbs_area`
--

INSERT INTO `mrbs_area` (`id`, `disabled`, `area_name`, `timezone`, `area_admin_email`, `resolution`, `default_duration`, `default_duration_all_day`, `morningstarts`, `morningstarts_minutes`, `eveningends`, `eveningends_minutes`, `private_enabled`, `private_default`, `private_mandatory`, `private_override`, `min_book_ahead_enabled`, `min_book_ahead_secs`, `max_book_ahead_enabled`, `max_book_ahead_secs`, `max_per_day_enabled`, `max_per_day`, `max_per_week_enabled`, `max_per_week`, `max_per_month_enabled`, `max_per_month`, `max_per_year_enabled`, `max_per_year`, `max_per_future_enabled`, `max_per_future`, `custom_html`, `approval_enabled`, `reminders_enabled`, `enable_periods`, `confirmation_enabled`, `confirmed_default`) VALUES
(11, 0, 'Consultorios', 'America/Argentina/Buenos_Aires', NULL, 3600, 3600, 0, 7, 0, 21, 0, 0, 0, 0, 'none', 0, 0, 0, 604800, 0, 1, 0, 5, 0, 10, 0, 50, 0, 100, NULL, 0, 1, 0, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mrbs_cantidad_max_reservas`
--

CREATE TABLE IF NOT EXISTS `mrbs_cantidad_max_reservas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `mrbs_cantidad_max_reservas`
--

INSERT INTO `mrbs_cantidad_max_reservas` (`id`, `cantidad`) VALUES
(1, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mrbs_entry`
--

CREATE TABLE IF NOT EXISTS `mrbs_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(11) NOT NULL DEFAULT '0',
  `entry_type` int(11) NOT NULL DEFAULT '0',
  `repeat_id` int(11) NOT NULL DEFAULT '0',
  `room_id` int(11) NOT NULL DEFAULT '1',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` varchar(80) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL,
  `psychologist_id` int(11) DEFAULT NULL,
  `pago_id` int(11) DEFAULT NULL,
  `type` char(1) NOT NULL DEFAULT 'E',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `reminded` int(11) DEFAULT NULL,
  `info_time` int(11) DEFAULT NULL,
  `info_user` varchar(80) DEFAULT NULL,
  `info_text` text,
  `ical_uid` varchar(255) NOT NULL DEFAULT '',
  `ical_sequence` smallint(6) NOT NULL DEFAULT '0',
  `ical_recur_id` varchar(16) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idxStartTime` (`start_time`),
  KEY `idxEndTime` (`end_time`),
  KEY `user_id` (`user_id`),
  KEY `psychologist_id` (`psychologist_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=176 ;

--
-- Volcar la base de datos para la tabla `mrbs_entry`
--

INSERT INTO `mrbs_entry` (`id`, `start_time`, `end_time`, `entry_type`, `repeat_id`, `room_id`, `timestamp`, `create_by`, `user_id`, `psychologist_id`, `pago_id`, `type`, `status`, `reminded`, `info_time`, `info_user`, `info_text`, `ical_uid`, `ical_sequence`, `ical_recur_id`) VALUES
(4, 1403528400, 1403532000, 0, 0, 10, '2014-06-25 20:11:03', 'pepe', 3, 3, NULL, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53a9c7d977fa3-a75a52f7@localhost', 0, ''),
(5, 1403532000, 1403535600, 0, 0, 10, '2014-06-25 20:11:03', 'pepe', 3, 3, NULL, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53a9c7d977fa3-a75a52f7@localhost', 0, ''),
(6, 1403535600, 1403539200, 0, 0, 10, '2014-06-25 20:11:03', 'pepe', 3, 3, NULL, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53a9c7d977fa3-a75a52f7@localhost', 0, ''),
(7, 1403539200, 1403542800, 0, 0, 10, '2014-06-25 20:54:54', 'pepe', 3, 3, NULL, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53a9c7d977fa3-a75a52f7@localhost', 0, ''),
(8, 1403542800, 1403546400, 0, 0, 10, '2014-06-25 20:54:54', 'pepe', 3, 3, NULL, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53a9c7d977fa3-a75a52f7@localhost', 0, ''),
(9, 1403546400, 1403550000, 0, 0, 10, '2014-06-25 20:54:54', 'pepe', 3, 3, NULL, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53a9c7d977fa3-a75a52f7@localhost', 0, ''),
(10, 1403550000, 1403553600, 0, 0, 10, '2014-06-25 20:11:03', 'pepe', 3, 3, NULL, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53a9c7d977fa3-a75a52f7@localhost', 0, ''),
(11, 1403553600, 1403557200, 0, 0, 10, '2014-06-25 20:11:03', 'pepe', 3, 3, NULL, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53a9c7d977fa3-a75a52f7@localhost', 0, ''),
(12, 1403557200, 1403560800, 0, 0, 10, '2014-06-25 20:11:03', 'pepe', 3, 3, NULL, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53a9c7d977fa3-a75a52f7@localhost', 0, ''),
(13, 1403560800, 1403564400, 0, 0, 10, '2014-06-25 20:11:03', 'pepe', 3, 3, NULL, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53a9c7d977fa3-a75a52f7@localhost', 0, ''),
(14, 1403564400, 1403568000, 0, 0, 10, '2014-06-25 20:11:03', 'pepe', 3, 3, NULL, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53a9c7d977fa3-a75a52f7@localhost', 0, ''),
(15, 1403568000, 1403571600, 0, 0, 10, '2014-06-25 20:11:03', 'pepe', 3, 3, NULL, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53a9c7d977fa3-a75a52f7@localhost', 0, ''),
(17, 1404216000, 1404219600, 0, 0, 10, '2014-06-25 20:11:03', 'pepe', 3, 3, NULL, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53a9e347169c4-48e95c45@localhost', 0, ''),
(18, 1404219600, 1404223200, 0, 0, 10, '2014-06-25 20:11:03', 'pepe', 3, 3, NULL, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53a9e347169c4-48e95c45@localhost', 0, ''),
(19, 1404223200, 1404226800, 0, 0, 10, '2014-06-25 20:11:03', 'pepe', 3, 3, NULL, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53a9e347169c4-48e95c45@localhost', 0, ''),
(20, 1404226800, 1404230400, 0, 0, 10, '2014-06-25 20:11:03', 'pepe', 3, 3, NULL, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53a9e347169c4-48e95c45@localhost', 0, ''),
(21, 1404230400, 1404234000, 0, 0, 10, '2014-06-25 20:11:03', 'pepe', 3, 3, NULL, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53a9e347169c4-48e95c45@localhost', 0, ''),
(22, 1404234000, 1404237600, 0, 0, 10, '2014-06-25 20:11:03', 'pepe', 3, 3, NULL, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53a9e347169c4-48e95c45@localhost', 0, ''),
(23, 1404237600, 1404241200, 0, 0, 10, '2014-06-25 20:11:03', 'pepe', 3, 3, NULL, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53a9e347169c4-48e95c45@localhost', 0, ''),
(24, 1404241200, 1404244800, 0, 0, 10, '2014-06-25 20:11:03', 'pepe', 3, 3, NULL, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53a9e347169c4-48e95c45@localhost', 0, ''),
(25, 1403604000, 1403607600, 0, 0, 10, '2014-06-25 20:54:54', 'manuel', 4, 3, NULL, 'I', 0, NULL, NULL, NULL, NULL, 'MRBS-53a9e3a97a5f6-cf866614@localhost', 0, ''),
(27, 1403611200, 1403614800, 0, 0, 10, '2014-06-25 20:11:03', 'manuel', 4, 3, NULL, 'I', 0, NULL, NULL, NULL, NULL, 'MRBS-53a9e3a97a5f6-cf866614@localhost', 0, ''),
(28, 1403614800, 1403618400, 0, 0, 10, '2014-06-25 20:11:03', 'manuel', 4, 3, NULL, 'I', 0, NULL, NULL, NULL, NULL, 'MRBS-53a9e3a97a5f6-cf866614@localhost', 0, ''),
(29, 1403618400, 1403622000, 0, 0, 10, '2014-06-25 20:11:03', 'manuel', 4, 3, NULL, 'I', 0, NULL, NULL, NULL, NULL, 'MRBS-53a9e3a97a5f6-cf866614@localhost', 0, ''),
(30, 1404302400, 1404306000, 0, 0, 10, '2014-06-25 20:11:03', 'pepe', 3, 3, NULL, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53a9ec18d5b2c-3cc69741@localhost', 0, ''),
(31, 1404306000, 1404309600, 0, 0, 10, '2014-06-25 20:11:03', 'pepe', 3, 3, NULL, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53a9ec18d5b2c-3cc69741@localhost', 0, ''),
(32, 1404309600, 1404313200, 0, 0, 10, '2014-06-25 20:11:03', 'pepe', 3, 3, NULL, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53a9ec18d5b2c-3cc69741@localhost', 0, ''),
(33, 1404313200, 1404316800, 0, 0, 10, '2014-06-25 20:11:03', 'pepe', 3, 3, NULL, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53a9ec18d5b2c-3cc69741@localhost', 0, ''),
(34, 1404316800, 1404320400, 0, 0, 10, '2014-06-25 20:11:03', 'pepe', 3, 3, NULL, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53a9ec18d5b2c-3cc69741@localhost', 0, ''),
(35, 1404320400, 1404324000, 0, 0, 10, '2014-06-25 20:11:03', 'pepe', 3, 3, NULL, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53a9ec18d5b2c-3cc69741@localhost', 0, ''),
(36, 1404324000, 1404327600, 0, 0, 10, '2014-06-25 20:11:03', 'pepe', 3, 3, NULL, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53a9ec18d5b2c-3cc69741@localhost', 0, ''),
(37, 1404327600, 1404331200, 0, 0, 10, '2014-06-25 20:11:03', 'pepe', 3, 3, NULL, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53a9ec18d5b2c-3cc69741@localhost', 0, ''),
(38, 1404331200, 1404334800, 0, 0, 10, '2014-06-25 20:11:03', 'pepe', 3, 3, NULL, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53a9ec18d5b2c-3cc69741@localhost', 0, ''),
(39, 1404334800, 1404338400, 0, 0, 10, '2014-06-25 20:11:03', 'pepe', 3, 3, NULL, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53a9ec18d5b2c-3cc69741@localhost', 0, ''),
(46, 1403643600, 1403647200, 1, 4, 10, '2014-07-10 17:06:24', 'manuel', 4, 5, 3, 'I', 0, NULL, NULL, NULL, NULL, 'MRBS-53ab3d5b51933-918317b5@localhost', 1, '20140624T210000Z'),
(47, 1403730000, 1403733600, 1, 4, 10, '2014-06-28 16:29:29', 'manuel', 4, 5, 1, 'I', 0, NULL, NULL, NULL, NULL, 'MRBS-53ab3d5b51933-918317b5@localhost', 1, '20140625T210000Z'),
(48, 1404853200, 1404856800, 1, 4, 10, '2014-06-28 16:29:29', 'manuel', 4, 5, 1, 'I', 0, NULL, NULL, NULL, NULL, 'MRBS-53ab3d5b51933-918317b5@localhost', 1, '20140708T210000Z'),
(49, 1404939600, 1404943200, 1, 4, 10, '2014-06-28 19:53:55', 'manuel', 4, 5, 2, 'I', 0, NULL, NULL, NULL, NULL, 'MRBS-53ab3d5b51933-918317b5@localhost', 1, '20140709T210000Z'),
(54, 1403870400, 1403874000, 0, 0, 10, '2014-07-10 17:06:24', 'pepa', 5, 5, 3, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53ac29a4e45fa-dca49d1a@localhost', 0, ''),
(86, 1403701200, 1403704800, 1, 14, 10, '2014-06-26 12:58:13', 'pepa', 5, 5, NULL, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53ac3e2970c04-084a8a9a@localhost', 1, '20140625T130000Z'),
(87, 1403787600, 1403791200, 1, 14, 10, '2014-06-26 12:58:13', 'pepa', 5, 5, NULL, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53ac3e2970c04-084a8a9a@localhost', 1, '20140626T130000Z'),
(88, 1403715600, 1403719200, 1, 15, 10, '2014-06-26 12:58:54', 'pepa', 5, 5, NULL, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53ac3e0096890-17d63b16@localhost', 2, '20140625T170000Z'),
(89, 1404478800, 1404482400, 0, 0, 10, '2014-07-02 18:30:17', 'manuel', 4, 5, NULL, 'I', 0, NULL, NULL, NULL, NULL, 'MRBS-53b47a01ab345-c850c535@localhost', 0, ''),
(90, 1404493200, 1404496800, 0, 0, 10, '2014-07-02 18:31:20', 'manuel', 4, 5, NULL, 'I', 0, NULL, NULL, NULL, NULL, 'MRBS-53b47a403ff9f-a07c2f3b@localhost', 0, ''),
(94, 1404385200, 1404388800, 0, 0, 10, '2014-07-02 18:35:05', 'manuel', 4, NULL, NULL, 'N', 0, NULL, NULL, NULL, NULL, 'MRBS-53b47b2106a2f-624ec1c8@localhost', 0, ''),
(95, 1404388800, 1404392400, 0, 0, 10, '2014-07-02 18:35:05', 'manuel', 4, NULL, NULL, 'N', 0, NULL, NULL, NULL, NULL, 'MRBS-53b47b2106a2f-624ec1c8@localhost', 0, ''),
(96, 1404392400, 1404396000, 0, 0, 10, '2014-07-02 18:35:05', 'manuel', 4, NULL, NULL, 'N', 0, NULL, NULL, NULL, NULL, 'MRBS-53b47b2106a2f-624ec1c8@localhost', 0, ''),
(97, 1404396000, 1404399600, 0, 0, 10, '2014-07-02 18:35:05', 'manuel', 4, NULL, NULL, 'N', 0, NULL, NULL, NULL, NULL, 'MRBS-53b47b2106a2f-624ec1c8@localhost', 0, ''),
(98, 1404399600, 1404403200, 0, 0, 10, '2014-07-02 18:35:05', 'manuel', 4, NULL, NULL, 'N', 0, NULL, NULL, NULL, NULL, 'MRBS-53b47b2106a2f-624ec1c8@localhost', 0, ''),
(99, 1404403200, 1404406800, 0, 0, 10, '2014-07-02 18:35:05', 'manuel', 4, NULL, NULL, 'N', 0, NULL, NULL, NULL, NULL, 'MRBS-53b47b2106a2f-624ec1c8@localhost', 0, ''),
(100, 1404406800, 1404410400, 0, 0, 10, '2014-07-02 18:35:05', 'manuel', 4, NULL, NULL, 'N', 0, NULL, NULL, NULL, NULL, 'MRBS-53b47b2106a2f-624ec1c8@localhost', 0, ''),
(101, 1404410400, 1404414000, 0, 0, 10, '2014-07-02 18:35:05', 'manuel', 4, NULL, NULL, 'N', 0, NULL, NULL, NULL, NULL, 'MRBS-53b47b2106a2f-624ec1c8@localhost', 0, ''),
(102, 1404414000, 1404417600, 0, 0, 10, '2014-07-02 18:35:05', 'manuel', 4, NULL, NULL, 'N', 0, NULL, NULL, NULL, NULL, 'MRBS-53b47b2106a2f-624ec1c8@localhost', 0, ''),
(103, 1404151200, 1404154800, 0, 0, 10, '2014-07-02 18:45:08', 'manuel', 4, 5, NULL, 'I', 0, NULL, NULL, NULL, NULL, 'MRBS-53b47d7ca4460-ef72d539@localhost', 0, ''),
(104, 1404507600, 1404511200, 0, 0, 10, '2014-07-02 20:12:35', 'manuel', 4, 5, NULL, 'I', 0, NULL, NULL, NULL, NULL, 'MRBS-53b491fbde786-c0c783b5@localhost', 0, ''),
(105, 1404824400, 1404828000, 0, 0, 10, '2014-07-07 19:25:32', 'manuel', 4, 5, NULL, 'I', 0, NULL, NULL, NULL, NULL, 'MRBS-53bb1e74353f3-996a7fa0@localhost', 0, ''),
(109, 1404842400, 1404846000, 0, 0, 10, '2014-07-08 12:20:00', 'pepe', 3, 3, NULL, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53bc0c38f1597-298f5874@localhost', 0, ''),
(112, 1405076400, 1405080000, 0, 0, 10, '2014-07-08 12:31:22', 'pepa', 5, 5, NULL, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53bc0ee20e94b-bf2fb7d1@localhost', 0, ''),
(118, 1405098000, 1405101600, 0, 0, 10, '2014-07-08 12:31:22', 'pepa', 5, 5, NULL, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53bc0ee20e94b-bf2fb7d1@localhost', 0, ''),
(120, 1405105200, 1405108800, 0, 0, 10, '2014-07-08 12:31:22', 'pepa', 5, 5, NULL, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53bc0ee20e94b-bf2fb7d1@localhost', 0, ''),
(122, 1405112400, 1405116000, 0, 0, 10, '2014-07-08 12:31:22', 'pepa', 5, 5, NULL, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53bc0ee20e94b-bf2fb7d1@localhost', 0, ''),
(123, 1405116000, 1405119600, 0, 0, 10, '2014-07-08 12:31:22', 'pepa', 5, 5, NULL, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53bc0ee20e94b-bf2fb7d1@localhost', 0, ''),
(124, 1405119600, 1405123200, 0, 0, 10, '2014-07-08 12:31:22', 'pepa', 5, 5, NULL, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53bc0ee20e94b-bf2fb7d1@localhost', 0, ''),
(126, 1405087200, 1405090800, 0, 0, 10, '2014-07-08 12:35:08', 'pepa', 5, 5, NULL, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53bc0fc42eb65-a1d4c20b@localhost', 0, ''),
(139, 1405159200, 1405162800, 0, 0, 10, '2014-07-08 14:48:16', 'pepa', 5, 5, NULL, 'E', 0, NULL, NULL, NULL, NULL, 'MRBS-53bc2ef81539b-6687cb56@localhost', 0, ''),
(157, 1405170000, 1405173600, 0, 0, 10, '2014-07-08 15:19:41', 'manuel', 4, 3, NULL, 'I', 0, NULL, NULL, NULL, NULL, 'MRBS-53bc3655ab1f6-da2bd66b@localhost', 0, ''),
(158, 1405173600, 1405177200, 0, 0, 10, '2014-07-08 15:19:41', 'manuel', 4, 3, NULL, 'I', 0, NULL, NULL, NULL, NULL, 'MRBS-53bc3655ab1f6-da2bd66b@localhost', 0, ''),
(159, 1405177200, 1405180800, 0, 0, 10, '2014-07-08 15:19:41', 'manuel', 4, 3, NULL, 'I', 0, NULL, NULL, NULL, NULL, 'MRBS-53bc3655ab1f6-da2bd66b@localhost', 0, ''),
(166, 1405022400, 1405026000, 0, 0, 10, '2014-07-10 19:21:46', 'manuel', 4, 3, NULL, 'I', 0, NULL, NULL, NULL, NULL, 'MRBS-53bf1212576f6-651468b3@localhost', 0, ''),
(168, 1404993600, 1404997200, 0, 0, 10, '2014-07-10 20:15:50', 'manuel', 4, 5, NULL, 'I', 0, NULL, NULL, NULL, NULL, 'MRBS-53bf1ebe49417-e9a8f256@localhost', 0, ''),
(169, 1404925200, 1404928800, 0, 0, 10, '2014-07-10 20:17:25', 'manuel', 4, 5, NULL, 'I', 0, NULL, NULL, NULL, NULL, 'MRBS-53bf1f1d4b370-36ad8b5f@localhost', 0, ''),
(170, 1404727200, 1404730800, 0, 0, 10, '2014-07-16 19:19:27', 'manuel', 4, NULL, NULL, 'N', 0, NULL, NULL, NULL, NULL, 'MRBS-53c6fa87e3aa1-1c303b0e@localhost', 0, ''),
(171, 1404730800, 1404734400, 0, 0, 10, '2014-07-16 19:19:28', 'manuel', 4, NULL, NULL, 'N', 0, NULL, NULL, NULL, NULL, 'MRBS-53c6fa87e3aa1-1c303b0e@localhost', 0, ''),
(172, 1404734400, 1404738000, 0, 0, 10, '2014-07-16 19:19:28', 'manuel', 4, NULL, NULL, 'N', 0, NULL, NULL, NULL, NULL, 'MRBS-53c6fa87e3aa1-1c303b0e@localhost', 0, ''),
(173, 1404738000, 1404741600, 0, 0, 10, '2014-07-16 19:19:28', 'manuel', 4, NULL, NULL, 'N', 0, NULL, NULL, NULL, NULL, 'MRBS-53c6fa87e3aa1-1c303b0e@localhost', 0, ''),
(174, 1404741600, 1404745200, 0, 0, 10, '2014-07-16 19:19:28', 'manuel', 4, NULL, NULL, 'N', 0, NULL, NULL, NULL, NULL, 'MRBS-53c6fa87e3aa1-1c303b0e@localhost', 0, ''),
(175, 1404745200, 1404748800, 0, 0, 10, '2014-07-16 19:19:28', 'manuel', 4, NULL, NULL, 'N', 0, NULL, NULL, NULL, NULL, 'MRBS-53c6fa87e3aa1-1c303b0e@localhost', 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mrbs_pago`
--

CREATE TABLE IF NOT EXISTS `mrbs_pago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` int(11) NOT NULL,
  `cobrador_id` int(11) NOT NULL,
  `monto_reservas` float NOT NULL,
  `descuento` float NOT NULL,
  `total` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cobrador_id` (`cobrador_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcar la base de datos para la tabla `mrbs_pago`
--

INSERT INTO `mrbs_pago` (`id`, `fecha`, `cobrador_id`, `monto_reservas`, `descuento`, `total`) VALUES
(1, 2014, 4, 30, 15, 15),
(2, 2014, 4, 15, 0, 15),
(3, 2014, 4, 30, 0, 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mrbs_repeat`
--

CREATE TABLE IF NOT EXISTS `mrbs_repeat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(11) NOT NULL DEFAULT '0',
  `rep_type` int(11) NOT NULL DEFAULT '0',
  `end_date` int(11) NOT NULL DEFAULT '0',
  `rep_opt` varchar(32) NOT NULL DEFAULT '',
  `room_id` int(11) NOT NULL DEFAULT '1',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` varchar(80) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL,
  `psychologist_id` int(11) DEFAULT NULL,
  `pago_id` int(11) DEFAULT NULL,
  `type` char(1) NOT NULL DEFAULT 'E',
  `rep_num_weeks` smallint(6) DEFAULT NULL,
  `month_absolute` smallint(6) DEFAULT NULL,
  `month_relative` varchar(4) DEFAULT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `reminded` int(11) DEFAULT NULL,
  `info_time` int(11) DEFAULT NULL,
  `info_user` varchar(80) DEFAULT NULL,
  `info_text` text,
  `ical_uid` varchar(255) NOT NULL DEFAULT '',
  `ical_sequence` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `psychologist_id` (`psychologist_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Volcar la base de datos para la tabla `mrbs_repeat`
--

INSERT INTO `mrbs_repeat` (`id`, `start_time`, `end_time`, `rep_type`, `end_date`, `rep_opt`, `room_id`, `timestamp`, `create_by`, `user_id`, `psychologist_id`, `pago_id`, `type`, `rep_num_weeks`, `month_absolute`, `month_relative`, `status`, `reminded`, `info_time`, `info_user`, `info_text`, `ical_uid`, `ical_sequence`) VALUES
(4, 1403643600, 1403647200, 2, 1405285200, '0011000', 10, '2014-06-25 18:22:05', 'manuel', 4, 5, NULL, 'I', 2, NULL, NULL, 0, NULL, NULL, NULL, NULL, 'MRBS-53ab3d5b51933-918317b5@localhost', 1),
(14, 1403701200, 1403704800, 1, 1403787600, '0', 10, '2014-06-26 12:58:13', 'pepa', 5, 5, NULL, 'E', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, 'MRBS-53ac3e2970c04-084a8a9a@localhost', 1),
(15, 1403715600, 1403719200, 1, 1403715600, '0', 10, '2014-06-26 12:58:54', 'pepa', 5, 5, NULL, 'E', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, 'MRBS-53ac3e0096890-17d63b16@localhost', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mrbs_room`
--

CREATE TABLE IF NOT EXISTS `mrbs_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  `area_id` int(11) NOT NULL DEFAULT '0',
  `room_name` varchar(25) NOT NULL DEFAULT '',
  `sort_key` varchar(25) NOT NULL DEFAULT '',
  `description` varchar(60) DEFAULT NULL,
  `capacity` int(11) NOT NULL DEFAULT '0',
  `room_admin_email` text,
  `custom_html` text,
  PRIMARY KEY (`id`),
  KEY `idxSortKey` (`sort_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Volcar la base de datos para la tabla `mrbs_room`
--

INSERT INTO `mrbs_room` (`id`, `disabled`, `area_id`, `room_name`, `sort_key`, `description`, `capacity`, `room_admin_email`, `custom_html`) VALUES
(10, 0, 11, 'Consultorio', 'Consultorio', '', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mrbs_users`
--

CREATE TABLE IF NOT EXISTS `mrbs_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` smallint(6) NOT NULL DEFAULT '0',
  `real_name` varchar(50) NOT NULL DEFAULT '',
  `real_lastname` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(30) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `deshabilitado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `id_2` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcar la base de datos para la tabla `mrbs_users`
--

INSERT INTO `mrbs_users` (`id`, `level`, `real_name`, `real_lastname`, `name`, `password`, `email`, `deshabilitado`) VALUES
(2, 2, 'Martin', 'Ciafardini', 'martin', '925d7518fc597af0e43f5606f9a51512', 'martinciafardini@gmail.com', 0),
(3, 1, 'Pepe', 'Gonzalez', 'pepe', '926e27eecdbc7a18858b3798ba99bddd', 'martinciafardini@gmail.com', 0),
(4, 2, 'Manuel', 'De la Penna', 'manuel', '96917805fd060e3766a9a1b834639d35', 'manueldelapenna@gmail.com', 0),
(5, 1, 'Pepa', 'Lopez', 'pepa', '281ffbf5eb2a3916b9c1eb8f28637836', 'manu_dela@hotmail.com', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mrbs_valor_consultorio`
--

CREATE TABLE IF NOT EXISTS `mrbs_valor_consultorio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `precio` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `mrbs_valor_consultorio`
--

INSERT INTO `mrbs_valor_consultorio` (`id`, `precio`) VALUES
(1, 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mrbs_variables`
--

CREATE TABLE IF NOT EXISTS `mrbs_variables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variable_name` varchar(80) DEFAULT NULL,
  `variable_content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `mrbs_variables`
--

INSERT INTO `mrbs_variables` (`id`, `variable_name`, `variable_content`) VALUES
(1, 'db_version', '35'),
(2, 'local_db_version', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mrbs_zoneinfo`
--

CREATE TABLE IF NOT EXISTS `mrbs_zoneinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timezone` varchar(255) NOT NULL DEFAULT '',
  `outlook_compatible` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `vtimezone` text,
  `last_updated` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `mrbs_zoneinfo`
--

INSERT INTO `mrbs_zoneinfo` (`id`, `timezone`, `outlook_compatible`, `vtimezone`, `last_updated`) VALUES
(1, 'America/Argentina/Buenos_Aires', 1, 'BEGIN:VTIMEZONE\r\nTZID:America/Argentina/Buenos_Aires\r\nTZURL:http://tzurl.org/zoneinfo-outlook/America/Argentina/Buenos_Aires\r\nX-LIC-LOCATION:America/Argentina/Buenos_Aires\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0300\r\nTZOFFSETTO:-0300\r\nTZNAME:ART\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE', 1404342770);

--
-- Filtros para las tablas descargadas (dump)
--

--
-- Filtros para la tabla `mrbs_entry`
--
ALTER TABLE `mrbs_entry`
  ADD CONSTRAINT `mrbs_entry_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `mrbs_users` (`id`),
  ADD CONSTRAINT `mrbs_entry_ibfk_4` FOREIGN KEY (`psychologist_id`) REFERENCES `mrbs_users` (`id`);

--
-- Filtros para la tabla `mrbs_pago`
--
ALTER TABLE `mrbs_pago`
  ADD CONSTRAINT `mrbs_pago_ibfk_1` FOREIGN KEY (`cobrador_id`) REFERENCES `mrbs_users` (`id`);

--
-- Filtros para la tabla `mrbs_repeat`
--
ALTER TABLE `mrbs_repeat`
  ADD CONSTRAINT `mrbs_repeat_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `mrbs_users` (`id`),
  ADD CONSTRAINT `mrbs_repeat_ibfk_4` FOREIGN KEY (`psychologist_id`) REFERENCES `mrbs_users` (`id`);
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
