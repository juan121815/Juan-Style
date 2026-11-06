-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-10-2026 a las 15:57:54
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
-- Base de datos: `juan_style_db`
--
CREATE DATABASE IF NOT EXISTS `juan_style_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `juan_style_db`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barbero`
--

CREATE TABLE `barbero` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL DEFAULT 'Juan González',
  `especialidad` varchar(150) NOT NULL DEFAULT 'Cortes clásicos, degradados y barbería urbana',
  `descripcion` text DEFAULT NULL,
  `horario_laboral` varchar(255) NOT NULL DEFAULT 'Lunes a Sábado: 8:00 AM - 8:00 PM',
  `foto` varchar(255) DEFAULT 'juan_gonzalez.jpg',
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `barbero`
--

INSERT INTO `barbero` (`id`, `nombre`, `especialidad`, `descripcion`, `horario_laboral`, `foto`, `estado`) VALUES
(1, 'Juan González', 'Especialista en Fade, Corte Clásico y Diseño de Barba', 'Barbero profesional y fundador de Juan’Style. Apasionado por la precisión y el estilo moderno en Neiva.', 'Lunes a Sábado: 8:00 AM - 8:00 PM', 'juan_gonzalez.jpg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `barbero_id` int(11) NOT NULL DEFAULT 1,
  `servicio_id` int(11) NOT NULL,
  `fecha_hora_inicio` datetime NOT NULL,
  `fecha_hora_fin` datetime NOT NULL,
  `precio_acordado` decimal(10,2) NOT NULL,
  `estado` enum('pendiente','confirmada','completada','cancelada') NOT NULL DEFAULT 'pendiente',
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`id`, `cliente_id`, `barbero_id`, `servicio_id`, `fecha_hora_inicio`, `fecha_hora_fin`, `precio_acordado`, `estado`, `fecha_creacion`) VALUES
(2, 4, 1, 2, '2026-10-29 09:25:00', '0000-00-00 00:00:00', 25000.00, 'pendiente', '2026-10-28 14:25:36'),
(3, 5, 1, 1, '2026-10-29 09:00:00', '0000-00-00 00:00:00', 20000.00, 'pendiente', '2026-10-28 14:57:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `duracion_minutos` int(11) NOT NULL DEFAULT 30,
  `imagen` varchar(255) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id`, `nombre`, `descripcion`, `precio`, `duracion_minutos`, `imagen`, `estado`) VALUES
(1, 'Corte Tradicional / Clásico', 'Corte con tijera o máquina, incluye lavado express y peinado con cera.', 20000.00, 30, NULL, 1),
(2, 'Corte Degradado (Fade)', 'Degradado pulido a la piel con navaja o trimmer, peinado y asesoría de estilo.', 25000.00, 45, NULL, 1),
(3, 'Arreglo y Perfilado de Barba', 'Delineado, rebajado y perfilado de barba con toalla caliente e hidratación.', 15000.00, 20, NULL, 1),
(4, 'Combo VIP Juan’Style', 'Corte de cabello completo + perfilado de barba + mascarilla negra e hidratación.', 38000.00, 60, NULL, 1),
(5, 'Corte Infantil', 'Corte especial para niños con máxima paciencia y acabado profesional.', 18000.00, 30, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `rol` enum('admin','cliente') NOT NULL DEFAULT 'cliente',
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `password`, `telefono`, `rol`, `fecha_registro`) VALUES
(4, 'Juan Gonzalez', 'davidsito1254@gmail.com', '$2y$10$5mjF1ZmKDwOUSFsKVt6iw.l5nhctbco95ngDh7vp.wYrp22bNR5Gy', '3177128368', 'admin', '2026-10-28 14:25:14'),
(5, 'Romelia', 'imjuxxns@gmail.com', '$2y$10$1j1Oh7qZABY2S0T4NmgMNeByGMn9jEYs5hN0R/8LwpS0zoSEehDne', '3152234262', 'cliente', '2026-10-28 14:34:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `numero_venta` varchar(50) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `metodo_pago` varchar(50) DEFAULT 'Efectivo',
  `estado` varchar(30) DEFAULT 'Completada',
  `fecha_venta` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `barbero`
--
ALTER TABLE `barbero`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `barbero_id` (`barbero_id`),
  ADD KEY `servicio_id` (`servicio_id`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numero_venta` (`numero_venta`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `barbero`
--
ALTER TABLE `barbero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`barbero_id`) REFERENCES `barbero` (`id`),
  ADD CONSTRAINT `reservas_ibfk_3` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
