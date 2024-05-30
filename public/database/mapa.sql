-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-05-2024 a las 20:22:17
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mapa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mapa`
--

CREATE TABLE `mapa` (
  `Entidad` varchar(19) DEFAULT NULL,
  `	% de total Cantidad junto con Entidad` varchar(6) DEFAULT NULL,
  `	Cantidad` decimal(5,1) DEFAULT NULL,
  `	Clasificación de Cantidad junto con Entidad` decimal(4,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `mapa`
--

INSERT INTO `mapa` (`Entidad`, `	% de total Cantidad junto con Entidad`, `	Cantidad`, `	Clasificación de Cantidad junto con Entidad`) VALUES
('Aguascalientes', '	3.8%', 58.0, 9.0),
('Baja California', '	8.5%', 130.0, 4.0),
('Baja California Sur', '	0.1%', 1.0, 31.0),
('Campeche', '	0.1%', 1.0, 31.0),
('Chiapas', '	2.6%', 40.0, 12.0),
('Chihuahua', '	7.6%', 117.0, 5.0),
('Ciudad de México', '	11.0%', 168.0, 2.0),
('Coahuila', '	1.4%', 21.0, 19.0),
('Colima', '	1.0%', 15.0, 24.0),
('Durango', '	2.0%', 30.0, 15.0),
('Guanajuato', '	3.8%', 59.0, 8.0),
('Guerrero', '	4.0%', 62.0, 7.0),
('Hidalgo', '	1.1%', 17.0, 22.0),
('Jalisco', '	2.7%', 42.0, 11.0),
('México', '	14.6%', 224.0, 1.0),
('Michoacán', '	2.0%', 31.0, 14.0),
('Morelos', '	3.3%', 50.0, 10.0),
('Nayarit', '	2.6%', 40.0, 12.0),
('Nuevo León', '	1.9%', 29.0, 17.0),
('Oaxaca', '	0.7%', 11.0, 27.0),
('Puebla', '	1.3%', 20.0, 20.0),
('Querétaro', '	0.7%', 11.0, 27.0),
('Quintana Roo', '	2.0%', 30.0, 15.0),
('San Luis Potosí', '	1.0%', 15.0, 24.0),
('Sinaloa', '	0.5%', 8.0, 29.0),
('Sonora', '	10.7%', 164.0, 3.0),
('Tabasco', '	1.2%', 18.0, 21.0),
('Tamaulipas', '	0.9%', 14.0, 26.0),
('Tlaxcala', '	0.1%', 2.0, 30.0),
('Veracruz', '	1.0%', 16.0, 23.0),
('Yucatán', '	1.8%', 27.0, 18.0),
('Zacatecas', '	4.1%', 63.0, 6.0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
