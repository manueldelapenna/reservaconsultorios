-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 02-07-2014 a las 13:46:33
-- Versión del servidor: 5.5.8
-- Versión de PHP: 5.3.5

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcar la base de datos para la tabla `mrbs_area`
--

INSERT INTO `mrbs_area` (`id`, `disabled`, `area_name`, `timezone`, `area_admin_email`, `resolution`, `default_duration`, `default_duration_all_day`, `morningstarts`, `morningstarts_minutes`, `eveningends`, `eveningends_minutes`, `private_enabled`, `private_default`, `private_mandatory`, `private_override`, `min_book_ahead_enabled`, `min_book_ahead_secs`, `max_book_ahead_enabled`, `max_book_ahead_secs`, `max_per_day_enabled`, `max_per_day`, `max_per_week_enabled`, `max_per_week`, `max_per_month_enabled`, `max_per_month`, `max_per_year_enabled`, `max_per_year`, `max_per_future_enabled`, `max_per_future`, `custom_html`, `approval_enabled`, `reminders_enabled`, `enable_periods`, `confirmation_enabled`, `confirmed_default`) VALUES
(6, 0, 'Consultorios', 'America/Argentina/Buenos_Aires', NULL, 3600, 3600, 0, 7, 0, 21, 0, 0, 0, 0, 'none', 0, 0, 0, 604800, 0, 1, 0, 5, 0, 10, 0, 50, 0, 100, NULL, 0, 1, 0, 0, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- Volcar la base de datos para la tabla `mrbs_entry`
--

INSERT INTO `mrbs_entry` (`id`, `start_time`, `end_time`, `entry_type`, `repeat_id`, `room_id`, `timestamp`, `create_by`, `user_id`, `psychologist_id`, `pago_id`, `type`, `status`, `reminded`, `info_time`, `info_user`, `info_text`, `ical_uid`, `ical_sequence`, `ical_recur_id`) VALUES
(6, 1403618400, 1403622000, 1, 3, 4, '2014-06-23 14:47:13', 'manuel', 4, 3, NULL, 'I', 0, NULL, NULL, NULL, NULL, 'MRBS-53a868218148a-146f7dd4@localhost', 0, '20140624T140000Z'),
(7, 1403704800, 1403708400, 1, 3, 4, '2014-06-23 14:47:13', 'manuel', 4, 3, NULL, 'I', 0, NULL, NULL, NULL, NULL, 'MRBS-53a868218148a-146f7dd4@localhost', 0, '20140625T140000Z'),
(8, 1403791200, 1403794800, 1, 3, 4, '2014-06-23 14:47:13', 'manuel', 4, 3, NULL, 'I', 0, NULL, NULL, NULL, NULL, 'MRBS-53a868218148a-146f7dd4@localhost', 0, '20140626T140000Z'),
(9, 1403877600, 1403881200, 1, 3, 4, '2014-06-23 14:47:13', 'manuel', 4, 3, NULL, 'I', 0, NULL, NULL, NULL, NULL, 'MRBS-53a868218148a-146f7dd4@localhost', 0, '20140627T140000Z'),
(10, 1403632800, 1403636400, 1, 4, 4, '2014-06-23 14:48:45', 'manuel', 4, 5, NULL, 'I', 0, NULL, NULL, NULL, NULL, 'MRBS-53a8687dae843-b21f9f98@localhost', 0, '20140624T180000Z'),
(11, 1403719200, 1403722800, 1, 4, 4, '2014-06-23 14:48:45', 'manuel', 4, 5, NULL, 'I', 0, NULL, NULL, NULL, NULL, 'MRBS-53a8687dae843-b21f9f98@localhost', 0, '20140625T180000Z'),
(12, 1403805600, 1403809200, 1, 4, 4, '2014-06-23 14:48:45', 'manuel', 4, 5, NULL, 'I', 0, NULL, NULL, NULL, NULL, 'MRBS-53a8687dae843-b21f9f98@localhost', 0, '20140626T180000Z'),
(13, 1403892000, 1403895600, 1, 4, 4, '2014-06-23 14:48:45', 'manuel', 4, 5, NULL, 'I', 0, NULL, NULL, NULL, NULL, 'MRBS-53a8687dae843-b21f9f98@localhost', 0, '20140627T180000Z'),
(14, 1403607600, 1403611200, 0, 0, 4, '2014-06-23 14:50:14', 'manuel', 4, 3, NULL, 'I', 0, NULL, NULL, NULL, NULL, 'MRBS-53a868d631881-4a3fd911@localhost', 0, ''),
(15, 1403823600, 1403827200, 0, 0, 4, '2014-06-23 14:51:45', 'manuel', 4, 5, NULL, 'I', 0, NULL, NULL, NULL, NULL, 'MRBS-53a86931353e6-a01dfc71@localhost', 0, ''),
(16, 1403784000, 1403787600, 0, 0, 4, '2014-06-23 14:53:21', 'manuel', 4, 3, NULL, 'I', 0, NULL, NULL, NULL, NULL, 'MRBS-53a86991e9cb3-09060616@localhost', 0, ''),
(18, 1404295200, 1404298800, 0, 0, 4, '2014-07-02 12:56:33', 'manuel', 4, NULL, NULL, 'N', 0, NULL, NULL, NULL, NULL, 'MRBS-53b42bb1e7de0-6766aa27@localhost', 0, ''),
(23, 1404489600, 1404493200, 0, 0, 4, '2014-07-02 13:00:09', 'manuel', 4, 5, NULL, 'I', 0, NULL, NULL, NULL, NULL, 'MRBS-53b42c8992282-ca4b3353@localhost', 0, ''),
(24, 1404475200, 1404478800, 0, 0, 4, '2014-07-02 13:00:30', 'manuel', 4, 3, NULL, 'I', 0, NULL, NULL, NULL, NULL, 'MRBS-53b42c9e83f64-0ffd15f0@localhost', 0, ''),
(27, 1404482400, 1404486000, 0, 0, 4, '2014-07-02 13:03:31', 'manuel', 4, 5, NULL, 'I', 0, NULL, NULL, NULL, NULL, 'MRBS-53b42d53d03b2-265c2b6a@localhost', 0, ''),
(28, 1404298800, 1404302400, 0, 0, 4, '2014-07-02 13:10:05', 'manuel', 4, NULL, NULL, 'N', 0, NULL, NULL, NULL, NULL, 'MRBS-53b42edd7d0bb-a3eb043e@localhost', 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mrbs_pago`
--

CREATE TABLE IF NOT EXISTS `mrbs_pago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `cobrador_id` int(11) NOT NULL,
  `monto_reservas` float NOT NULL,
  `descuento` float NOT NULL,
  `total` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cobrador_id` (`cobrador_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mrbs_pago`
--


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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcar la base de datos para la tabla `mrbs_repeat`
--

INSERT INTO `mrbs_repeat` (`id`, `start_time`, `end_time`, `rep_type`, `end_date`, `rep_opt`, `room_id`, `timestamp`, `create_by`, `user_id`, `psychologist_id`, `pago_id`, `type`, `rep_num_weeks`, `month_absolute`, `month_relative`, `status`, `reminded`, `info_time`, `info_user`, `info_text`, `ical_uid`, `ical_sequence`) VALUES
(1, 1403704800, 1403708400, 1, 1403964000, '0', 4, '2014-06-23 13:21:02', 'manuel', 4, 3, NULL, 'I', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, 'MRBS-53a853ee2e15c-9b644ca9@localhost', 0),
(3, 1403618400, 1403622000, 1, 1403877600, '0', 4, '2014-06-23 14:47:13', 'manuel', 4, 3, NULL, 'I', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, 'MRBS-53a868218148a-146f7dd4@localhost', 0),
(4, 1403632800, 1403636400, 1, 1403892000, '0', 4, '2014-06-23 14:48:45', 'manuel', 4, 5, NULL, 'I', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, 'MRBS-53a8687dae843-b21f9f98@localhost', 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcar la base de datos para la tabla `mrbs_room`
--

INSERT INTO `mrbs_room` (`id`, `disabled`, `area_id`, `room_name`, `sort_key`, `description`, `capacity`, `room_admin_email`, `custom_html`) VALUES
(4, 0, 6, 'Consultorio 1', 'Consultorio 1', '', 0, NULL, NULL);

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
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `id_2` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcar la base de datos para la tabla `mrbs_users`
--

INSERT INTO `mrbs_users` (`id`, `level`, `real_name`, `real_lastname`, `name`, `password`, `email`) VALUES
(2, 2, 'Martin', 'Ciafardini', 'martin', '925d7518fc597af0e43f5606f9a51512', 'martinciafardini@gmail.com'),
(3, 1, 'Pepe', 'Gonzalez', 'pepe', '926e27eecdbc7a18858b3798ba99bddd', 'pepe@pepe.com'),
(4, 2, 'Manuel', 'De la Penna', 'manuel', '96917805fd060e3766a9a1b834639d35', 'manueldelapenna@gmail.com'),
(5, 1, 'Pepa', 'Lopez', 'pepa', '281ffbf5eb2a3916b9c1eb8f28637836', 'pepa@pepa.com');

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
(1, 'America/Argentina/Buenos_Aires', 1, 'BEGIN:VTIMEZONE\r\nTZID:America/Argentina/Buenos_Aires\r\nTZURL:http://tzurl.org/zoneinfo-outlook/America/Argentina/Buenos_Aires\r\nX-LIC-LOCATION:America/Argentina/Buenos_Aires\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:-0300\r\nTZOFFSETTO:-0300\r\nTZNAME:ART\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE', 1401920034);

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
