-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 25-11-2022 a las 22:45:02
-- Versión del servidor: 5.7.36
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cajero`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banco`
--

DROP TABLE IF EXISTS `banco`;
CREATE TABLE IF NOT EXISTS `banco` (
  `numero_banco` int(11) NOT NULL,
  `nombre_banco` varchar(2000) NOT NULL,
  `cantidad_cuentas` int(11) DEFAULT NULL,
  `maximo_transaccion` int(11) NOT NULL,
  `minimo_transaccion` int(11) NOT NULL,
  `cobro_transaccion` int(11) NOT NULL,
  `interes_anio` int(11) NOT NULL,
  PRIMARY KEY (`numero_banco`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `banco`
--

INSERT INTO `banco` (`numero_banco`, `nombre_banco`, `cantidad_cuentas`, `maximo_transaccion`, `minimo_transaccion`, `cobro_transaccion`, `interes_anio`) VALUES
(1, 'Banco cajero', 0, 300, 1, 2000, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta`
--

DROP TABLE IF EXISTS `cuenta`;
CREATE TABLE IF NOT EXISTS `cuenta` (
  `numero_cuenta` int(11) NOT NULL,
  `numero_banco` int(11) NOT NULL,
  `cedula_duenio` int(11) NOT NULL,
  `tipo_cuenta` int(11) NOT NULL,
  `saldo_cuenta` int(11) NOT NULL,
  `fecha_apertura` date NOT NULL,
  PRIMARY KEY (`numero_cuenta`),
  KEY `numero_banco` (`numero_banco`),
  KEY `cedula_duenio` (`cedula_duenio`),
  KEY `tipo_cuenta` (`tipo_cuenta`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros`
--

DROP TABLE IF EXISTS `parametros`;
CREATE TABLE IF NOT EXISTS `parametros` (
  `id_parametro` int(11) NOT NULL,
  `valor_parametro` int(11) NOT NULL,
  PRIMARY KEY (`id_parametro`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `numero_cedula` int(11) NOT NULL,
  `nombre_persona` varchar(2000) NOT NULL,
  `apellido_persona` varchar(2000) NOT NULL,
  `profesion_persona` varchar(2000) NOT NULL,
  `numero_cuenta` int(11) NOT NULL,
  PRIMARY KEY (`numero_cedula`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`numero_cedula`, `nombre_persona`, `apellido_persona`, `profesion_persona`, `numero_cuenta`) VALUES
(1061371490, 'Elizabeth', 'Clavijo Alzate', 'Tecnologa', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transaccion`
--

DROP TABLE IF EXISTS `transaccion`;
CREATE TABLE IF NOT EXISTS `transaccion` (
  `id_transaccion` int(11) NOT NULL AUTO_INCREMENT,
  `monto_transaccion` int(11) NOT NULL,
  `numero_cuenta_transaccion` int(11) NOT NULL,
  `tipo_transaccion` int(11) NOT NULL,
  `fecha_transaccion` date NOT NULL,
  `cedula_realiza` int(11) NOT NULL,
  PRIMARY KEY (`id_transaccion`),
  KEY `numero_cuenta_transaccion` (`numero_cuenta_transaccion`),
  KEY `cedula_realiza` (`cedula_realiza`),
  KEY `tipo_transaccion` (`tipo_transaccion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
