-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-05-2024 a las 04:11:45
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
-- Base de datos: `nodejs-login`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(1, 'e', 'ernestoterancarrasco@gmail.com', '$2b$10$o68P9/i.BA/XHp/V310eJOSRTrM3Tc1Jll7m53sPZm3xYBla/iR4q'),
(2, 'erne', 'a@gmail.com', '$2b$10$rSMFp6FiUGYxFdl8dgBfhOsdcV8whlF5ijrXUgjZdZmeHNjWcwPCG'),
(3, 'e', 'e@gmail.com', '$2b$10$9w85vZz4DCuiGksTjZwfaeflQnFyQLGdyVU5X6TDfkT6UQsp6dqmi'),
(4, 'w2', 'w@gmail.com', '$2b$10$.MGmCBtk3rGQFow7.HqoAu7k28eIuM2QovkyHb5.8qePVrhiBDvd2'),
(5, 'g2', 'g@gmail.com', '$2b$10$5CaXpC5EL4A4/kBRDiO/huSIJzGTfhbEiVxFQ2vxZYfoM/voh7Z.G'),
(6, 'i', 'i@gmail.com', '$2b$10$SojCIr2sFDg1aqQQc0NAB.NRLhMQbrK1x6aHRx7h.pdmbK6nRe7PC'),
(7, 'Juan Pablo', 'jp@gmail.com', '$2b$10$Hb6Hk4WdMDgFxGMTF1bJGe/VtYE3EmrwoKXbvtzvyLatlWHv2qsom');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
