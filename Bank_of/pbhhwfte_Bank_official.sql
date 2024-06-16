-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 16-06-2024 a las 03:36:00
-- Versión del servidor: 5.7.23-23
-- Versión de PHP: 8.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pbhhwfte_Bank_official`
--

DELIMITER $$
--
-- Procedimientos
--
$$

$$

$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banco_cliente`
--

CREATE TABLE `banco_cliente` (
  `id_cliente` int(11) NOT NULL,
  `numero_cliente` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `titular_cliente` varchar(110) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `banco_cliente`
--

INSERT INTO `banco_cliente` (`id_cliente`, `numero_cliente`, `titular_cliente`) VALUES
(1, '1111222233334444', 'Roberto Torres'),
(2, '2222333344445555', 'Carmen Fernández'),
(3, '3333444455556666', 'Jorge García'),
(4, '4444555566667777', 'Lucía Rodríguez'),
(5, '5555666677778888', 'Patricia López'),
(6, '6666777788889999', 'Manuel Pérez'),
(7, '7777888899990000', 'Isabel Martínez'),
(8, '8888999900001111', 'Rosa Sánchez'),
(9, '9999000011112222', 'Francisco Ramírez'),
(10, '0000111122223333', 'Eva Gómez'),
(11, '1876425401846738', 'Mafer Ordonez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banco_cliente_cuenta_banca`
--

CREATE TABLE `banco_cliente_cuenta_banca` (
  `id_cuenta` int(11) NOT NULL,
  `numero_cuenta` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_apertura` date DEFAULT NULL,
  `titular_cuenta` varchar(110) COLLATE utf8_unicode_ci NOT NULL,
  `saldo_disponible` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `banco_cliente_cuenta_banca`
--

INSERT INTO `banco_cliente_cuenta_banca` (`id_cuenta`, `numero_cuenta`, `fecha_apertura`, `titular_cuenta`, `saldo_disponible`) VALUES
(1, '1234567890123456', '2023-01-15', 'Juan Pérez', 49795.00),
(2, '9876543210987654', '2023-02-28', 'María García', 2400.00),
(3, '1111222233334444', '2023-03-10', 'Luis Rodriguez', 3500.00),
(4, '5555666677778888', '2023-04-05', 'Ana Martínez', 4480.00),
(5, '9999000011112222', '2023-05-20', 'Carlos Lopez', 5500.00),
(6, '7777888899990000', '2023-06-08', 'Elena Hernandez', 6480.00),
(7, '4444555566667777', '2023-07-17', 'Javier Díaz', 7500.00),
(8, '2222333344445555', '2023-08-22', 'Sofia Sanchez', 8400.00),
(9, '6666777788889999', '2023-09-30', 'Diego Ramírez', 7700.00),
(10, '3333444455556666', '2023-10-12', 'Laura Goméz', 10500.00),
(11, '1738900367878787', '2023-01-13', 'Ivan Perez', 100.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banco_cuenta_terceros`
--

CREATE TABLE `banco_cuenta_terceros` (
  `id_cuenta_terceros` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_cuenta` int(11) NOT NULL,
  `numero_tercero` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `titular_tercero` varchar(110) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `banco_cuenta_terceros`
--

INSERT INTO `banco_cuenta_terceros` (`id_cuenta_terceros`, `id_cliente`, `id_cuenta`, `numero_tercero`, `titular_tercero`) VALUES
(1, 2, 1, '2222333344445555', 'Carmen Fernández'),
(5, 4, 4, '4444555566667777', 'Lucía Rodríguez'),
(7, 6, 1, '6666777788889999', 'Manuel Pérez'),
(8, 7, 1, '7777888899990000', 'Isabel Martínez'),
(9, 4, 1, '4444555566667777', 'Lucía Rodríguez'),
(10, 4, 2, '4444555566667777', 'Lucía Rodríguez'),
(11, 8, 1, '8888999900001111', 'Rosa Sánchez'),
(14, 11, 1, '1876425401846738', 'Mafer Ordonez'),
(15, 11, 2, '1876425401846738', 'Mafer Ordonez'),
(16, 6, 2, '6666777788889999', 'Manuel Pérez'),
(17, 6, 5, '6666777788889999', 'Manuel Pérez'),
(18, 6, 6, '6666777788889999', 'Manuel Pérez'),
(21, 7, 6, '7777888899990000', 'Isabel Martínez'),
(22, 1, 6, '1111222233334444', 'Roberto Torres'),
(23, 1, 5, '1111222233334444', 'Roberto Torres'),
(26, 1, 10, '1111222233334444', 'Roberto Torres'),
(28, 6, 3, '6666777788889999', 'Manuel Pérez'),
(29, 7, 3, '7777888899990000', 'Isabel Martínez'),
(31, 11, 3, '1876425401846738', 'Mafer Ordonez'),
(32, 8, 3, '8888999900001111', 'Rosa Sánchez'),
(33, 11, 4, '1876425401846738', 'Mafer Ordonez'),
(34, 8, 4, '8888999900001111', 'Rosa Sánchez'),
(35, 2, 4, '2222333344445555', 'Carmen Fernández'),
(36, 1, 4, '1111222233334444', 'Roberto Torres'),
(37, 3, 4, '3333444455556666', 'Jorge García'),
(38, 2, 7, '2222333344445555', 'Carmen Fernández'),
(39, 1, 7, '1111222233334444', 'Roberto Torres'),
(40, 11, 7, '1876425401846738', 'Mafer Ordonez'),
(41, 9, 7, '9999000011112222', 'Francisco Ramírez'),
(42, 6, 7, '6666777788889999', 'Manuel Pérez'),
(43, 4, 7, '4444555566667777', 'Lucía Rodríguez'),
(44, 8, 9, '8888999900001111', 'Rosa Sánchez'),
(45, 7, 9, '7777888899990000', 'Isabel Martínez'),
(46, 9, 9, '9999000011112222', 'Francisco Ramírez'),
(47, 9, 1, '9999000011112222', 'Francisco Ramírez'),
(48, 1, 1, '1111222233334444', 'Roberto Torres'),
(49, 3, 1, '3333444455556666', 'Jorge García'),
(50, 3, 2, '3333444455556666', 'Jorge García'),
(51, 1, 2, '1111222233334444', 'Roberto Torres'),
(52, 8, 2, '8888999900001111', 'Rosa Sánchez'),
(53, 1, 3, '1111222233334444', 'Roberto Torres'),
(54, 2, 3, '2222333344445555', 'Carmen Fernández'),
(55, 3, 3, '3333444455556666', 'Jorge García'),
(56, 5, 3, '5555666677778888', 'Patricia López'),
(57, 2, 8, '2222333344445555', 'Carmen Fernández'),
(58, 1, 8, '1111222233334444', 'Roberto Torres');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banco_numero_transferencia`
--

CREATE TABLE `banco_numero_transferencia` (
  `id_numero_transferencia` int(11) NOT NULL,
  `id_cuenta` int(11) NOT NULL,
  `numero_transferencia` varchar(36) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `banco_numero_transferencia`
--

INSERT INTO `banco_numero_transferencia` (`id_numero_transferencia`, `id_cuenta`, `numero_transferencia`) VALUES
(1, 1, '990664006'),
(2, 1, '170830009'),
(3, 1, '756945436'),
(4, 1, '843686981'),
(5, 1, '897035257'),
(6, 1, '637825093'),
(7, 1, '205238410'),
(8, 1, '954923767'),
(9, 1, '992096461'),
(10, 1, '863258328'),
(11, 1, '128899435'),
(12, 1, '1003841994'),
(13, 1, '469518012'),
(14, 2, '460964862'),
(15, 2, '570223574'),
(16, 2, '560964952'),
(17, 1, '576377803'),
(18, 1, '397486735'),
(19, 6, '1080970644'),
(20, 6, '178280684'),
(21, 4, '392415405'),
(22, 4, '1006924795'),
(23, 1, '359104997'),
(24, 1, '720703770'),
(25, 1, '1095923357'),
(26, 1, '688182840'),
(27, 1, '729195490'),
(28, 1, '375528772'),
(29, 1, '986936752'),
(30, 1, '1049935086'),
(31, 1, '1069814155'),
(32, 1, '770808947'),
(33, 1, '302669631'),
(34, 1, '1013284082'),
(35, 1, '278009399'),
(36, 1, '395332184'),
(37, 1, '224431657'),
(38, 1, '988564521'),
(39, 1, '307040905'),
(40, 1, '291424339'),
(41, 9, '444584706'),
(42, 9, '477342707'),
(43, 1, '1082589594'),
(44, 1, '105993587'),
(45, 1, '947343975'),
(46, 1, '879610902'),
(47, 1, '264020109'),
(48, 1, '313047534'),
(49, 1, '313654657'),
(50, 1, '756201442'),
(51, 1, '355641055'),
(52, 2, '415157763'),
(53, 1, '578946897'),
(54, 1, '1088026399'),
(55, 1, '643321597'),
(56, 2, '409173842'),
(57, 2, '311217782'),
(58, 1, '814943062'),
(59, 8, '986180532');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banco_transferencia`
--

CREATE TABLE `banco_transferencia` (
  `id_transferencia` int(11) NOT NULL,
  `id_cuenta` int(11) NOT NULL,
  `id_cuenta_terceros` int(11) NOT NULL,
  `desposito_saldo` decimal(12,2) NOT NULL,
  `descripcion` varchar(110) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_transferencia` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `banco_transferencia`
--

INSERT INTO `banco_transferencia` (`id_transferencia`, `id_cuenta`, `id_cuenta_terceros`, `desposito_saldo`, `descripcion`, `fecha_transferencia`) VALUES
(1, 1, 1, 10.00, 'ROPA SHEIN', '2024-05-09'),
(2, 1, 1, 10.00, 'ROPA SHEIN', '2024-05-09'),
(3, 1, 1, 25.00, 'Traslado', '2024-05-10'),
(4, 1, 1, 25.00, 'Traslado', '2024-05-10'),
(5, 1, 1, 25.00, 'Traslado', '2024-05-10'),
(6, 1, 1, 10.00, 'ROPA SHEIN', '2024-05-16'),
(7, 1, 1, 10.00, 'ROPA SHEIN', '2024-05-16'),
(8, 1, 1, 25.00, 'Traslado', '2024-05-16'),
(9, 1, 1, 25.00, 'Traslado', '2024-05-16'),
(10, 1, 1, 10.00, 'ROPA SHEIN', '2024-05-16'),
(11, 1, 1, 10.00, 'ROPA SHEIN', '2024-05-16'),
(12, 1, 1, 10.00, 'ROPA SHEIN', '2024-05-16'),
(13, 1, 1, 10.00, 'ROPA SHEIN', '2024-05-16'),
(14, 2, 7, 10.00, 'ROPA SHEIN', '2024-05-17'),
(15, 2, 7, 10.00, 'ROPA SHEIN', '2024-05-17'),
(16, 2, 7, 10.00, 'ROPA SHEIN', '2024-05-17'),
(17, 1, 7, 10.00, 'ROPA SHEIN', '2024-05-17'),
(18, 1, 7, 10.00, 'ROPA SHEIN', '2024-05-17'),
(19, 6, 22, 10.00, 'ROPA SHEIN', '2024-05-17'),
(20, 6, 22, 10.00, 'ROPA SHEIN', '2024-05-17'),
(21, 4, 14, 10.00, 'ROPA SHEIN', '2024-05-19'),
(22, 4, 14, 10.00, 'ROPA SHEIN', '2024-05-19'),
(23, 1, 1, 10.00, 'ROPA SHEIN', '2024-05-22'),
(24, 1, 1, 10.00, 'ROPA SHEIN', '2024-05-22'),
(25, 1, 1, 10.00, 'ROPA SHEIN', '2024-05-22'),
(26, 1, 1, 10.00, 'ROPA SHEIN', '2024-05-22'),
(27, 1, 1, 10.00, 'ROPA SHEIN', '2024-05-22'),
(28, 1, 1, 10.00, 'ROPA SHEIN', '2024-05-22'),
(29, 1, 1, 10.00, 'ROPA SHEIN', '2024-05-22'),
(30, 1, 14, 10.00, 'ROPA SHEIN', '2024-05-22'),
(31, 1, 14, 10.00, 'ROPA SHEIN', '2024-05-22'),
(32, 1, 1, 10.00, 'ROPA SHEIN', '2024-05-22'),
(33, 1, 14, 10.00, 'ROPA SHEIN', '2024-05-22'),
(36, 1, 14, 10.00, 'ROPA SHEIN', '2024-05-23'),
(37, 1, 14, 10.00, 'ROPA SHEIN', '2024-05-23'),
(38, 1, 1, 25.00, 'Traslado', '2024-05-23'),
(39, 1, 14, 150.00, 'traslado', '2024-05-23'),
(40, 1, 14, 150.00, 'traslado', '2024-05-23'),
(41, 9, 14, 900.00, 'Traslado', '2024-05-24'),
(42, 9, 14, 900.00, 'Traslado', '2024-05-24'),
(43, 1, 41, 223.23, 'Regalo de cumpleaños atrasado', '2024-05-24'),
(44, 1, 41, 90.00, 'Regalo de cumpleaños atrasado', '2024-05-24'),
(45, 1, 41, 2.00, 'Regalo de cumpleaños atrasado', '2024-05-24'),
(46, 1, 41, 2.00, 'Regalo de cumpleaños atrasado', '2024-05-24'),
(47, 1, 7, 10.00, 'ROPA SHEIN', '2024-05-25'),
(48, 1, 1, 10.00, 'rrr', '2024-05-25'),
(49, 1, 7, 10.00, 'ROPA SHEIN', '2024-05-25'),
(50, 1, 14, 150.00, 'traslado', '2024-05-28'),
(51, 1, 14, 72.77, 't', '2024-05-28'),
(52, 2, 5, 10.00, 'ROPA SHEIN', '2024-05-28'),
(53, 1, 5, 10.00, 'ROPA SHEIN', '2024-05-28'),
(54, 1, 5, 10.00, 'rrr', '2024-05-28'),
(55, 1, 41, 10.00, 'ROPA SHEIN', '2024-05-29'),
(56, 2, 22, 10.00, 'traslado', '2024-06-01'),
(57, 2, 22, 50.00, 'traslado', '2024-06-01'),
(58, 1, 1, 25.00, 'Traslado', '2024-06-01'),
(59, 8, 1, 100.00, 'traslado', '2024-06-08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_banca`
--

CREATE TABLE `usuario_banca` (
  `id_usuario` int(11) NOT NULL,
  `id_cuenta` int(11) NOT NULL,
  `nombre_usuario` varchar(110) COLLATE utf8_unicode_ci NOT NULL,
  `usuario_contrasenia` varchar(110) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuario_banca`
--

INSERT INTO `usuario_banca` (`id_usuario`, `id_cuenta`, `nombre_usuario`, `usuario_contrasenia`) VALUES
(1, 1, 'juan_perez', 'contrasenia1'),
(2, 2, 'maria_garcia', 'contrasenia2'),
(3, 3, 'luis_rodriguez', 'contrasenia3'),
(4, 4, 'ana_martinez', 'contrasenia4'),
(5, 5, 'carlos_lopez', 'contrasenia5'),
(6, 6, 'elena_hernandez', 'contrasenia6'),
(7, 7, 'javier_diaz', 'contrasenia7'),
(8, 8, 'sofia_sanchez', 'contrasenia8'),
(9, 9, 'diego_ramirez', 'contrasenia9'),
(10, 10, 'laura_gomez', 'contrasenia10'),
(14, 11, 'ivan_perez', 'contrasenia11'),
(15, 11, 'ivan_perez', 'contrasenia11');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `banco_cliente`
--
ALTER TABLE `banco_cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `banco_cliente_cuenta_banca`
--
ALTER TABLE `banco_cliente_cuenta_banca`
  ADD PRIMARY KEY (`id_cuenta`);

--
-- Indices de la tabla `banco_cuenta_terceros`
--
ALTER TABLE `banco_cuenta_terceros`
  ADD PRIMARY KEY (`id_cuenta_terceros`),
  ADD KEY `fk_banco_cliente_terceros` (`id_cliente`),
  ADD KEY `fk_banco_cuenta_terceros` (`id_cuenta`);

--
-- Indices de la tabla `banco_numero_transferencia`
--
ALTER TABLE `banco_numero_transferencia`
  ADD PRIMARY KEY (`id_numero_transferencia`),
  ADD KEY `fk_banco_autorizacion_debito` (`id_cuenta`);

--
-- Indices de la tabla `banco_transferencia`
--
ALTER TABLE `banco_transferencia`
  ADD PRIMARY KEY (`id_transferencia`),
  ADD KEY `fk_banco_cliente_tarjeta_debito` (`id_cuenta`),
  ADD KEY `fk_banco_id_cuenta_terceros` (`id_cuenta_terceros`);

--
-- Indices de la tabla `usuario_banca`
--
ALTER TABLE `usuario_banca`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `fk_banco_usuario_cuenta` (`id_cuenta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `banco_cliente`
--
ALTER TABLE `banco_cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `banco_cliente_cuenta_banca`
--
ALTER TABLE `banco_cliente_cuenta_banca`
  MODIFY `id_cuenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `banco_cuenta_terceros`
--
ALTER TABLE `banco_cuenta_terceros`
  MODIFY `id_cuenta_terceros` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de la tabla `banco_numero_transferencia`
--
ALTER TABLE `banco_numero_transferencia`
  MODIFY `id_numero_transferencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de la tabla `banco_transferencia`
--
ALTER TABLE `banco_transferencia`
  MODIFY `id_transferencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de la tabla `usuario_banca`
--
ALTER TABLE `usuario_banca`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `banco_cuenta_terceros`
--
ALTER TABLE `banco_cuenta_terceros`
  ADD CONSTRAINT `fk_banco_cliente_terceros` FOREIGN KEY (`id_cliente`) REFERENCES `banco_cliente` (`id_cliente`),
  ADD CONSTRAINT `fk_banco_cuenta_terceros` FOREIGN KEY (`id_cuenta`) REFERENCES `banco_cliente_cuenta_banca` (`id_cuenta`);

--
-- Filtros para la tabla `banco_numero_transferencia`
--
ALTER TABLE `banco_numero_transferencia`
  ADD CONSTRAINT `fk_banco_autorizacion_debito` FOREIGN KEY (`id_cuenta`) REFERENCES `banco_cliente_cuenta_banca` (`id_cuenta`);

--
-- Filtros para la tabla `banco_transferencia`
--
ALTER TABLE `banco_transferencia`
  ADD CONSTRAINT `fk_banco_cliente_tarjeta_debito` FOREIGN KEY (`id_cuenta`) REFERENCES `banco_cliente_cuenta_banca` (`id_cuenta`),
  ADD CONSTRAINT `fk_banco_id_cuenta_terceros` FOREIGN KEY (`id_cuenta_terceros`) REFERENCES `banco_cuenta_terceros` (`id_cuenta_terceros`);

--
-- Filtros para la tabla `usuario_banca`
--
ALTER TABLE `usuario_banca`
  ADD CONSTRAINT `fk_banco_usuario_cuenta` FOREIGN KEY (`id_cuenta`) REFERENCES `banco_cliente_cuenta_banca` (`id_cuenta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
