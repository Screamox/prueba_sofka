-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-10-2021 a las 10:53:24
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sofka_test`
--
CREATE DATABASE IF NOT EXISTS `sofka_test` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sofka_test`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nivel` int(11) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nivel`, `nombre`) VALUES
(1, 1, 'matematicas'),
(2, 2, 'Geografia'),
(3, 3, 'Cultura general'),
(4, 4, 'Ciencia'),
(5, 5, 'Economia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugador`
--

CREATE TABLE `jugador` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `puntaje` int(11) DEFAULT NULL,
  `ronda` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `jugador`
--

INSERT INTO `jugador` (`id`, `nombre`, `puntaje`, `ronda`) VALUES
(1, 'julian', 10000, 5),
(2, 'Andres', 2000, 3),
(3, 'karol', 1000, 2),
(4, 'dana', 10000, 5),
(5, 'pipe', 1000, 2),
(6, 'pipe', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta`
--

CREATE TABLE `pregunta` (
  `id_pregunta` int(11) NOT NULL,
  `enunciado` varchar(100) NOT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pregunta`
--

INSERT INTO `pregunta` (`id_pregunta`, `enunciado`, `id_categoria`) VALUES
(1, '¿2 +2 es igual a?', 1),
(2, '¿Cuanto es  7^2?', 1),
(3, '¿es formula que nombre tiene  \"((x+2)^2)= (x^2)+2x+1  \" a que caso de factorizacion  pertenece?', 1),
(4, '¿6-9 es iagual?', 1),
(5, '¿si tenemso esta ecuacion \"x-2=7\" x es igual a?', 1),
(6, '¿Cuantos departamento tiene Colombia?', 2),
(7, '¿Cual es pais mas grande del mundo?', 2),
(8, '¿Que pais no tiene  salida al mar ?', 2),
(9, '¿Cual es el rio mas grande de Colombia ?', 2),
(10, '¿Cual, es pais con mayor poblacion ?', 2),
(11, '¿En año llego el hombre a la luna?', 3),
(12, '¿Cuantos huesos tiene el ser humano?', 3),
(13, '¿Quien pinto la mona lisa?', 3),
(14, '¿Quien es creador de Mickey Mouse?', 3),
(15, '¿Cual es calendario que popularmente se conocia por pronoticar el fin del munodo en el 2012?', 3),
(16, 'Es la unidad estructural, funcional y reproductora de todo ser vivo', 4),
(17, 'Almacena el material genético (ADN). ', 4),
(18, '¿Cual es la medida de calor corporal?', 4),
(19, 'Es el líquido que más sustancias disuelve', 4),
(20, '\r\n¿Al aplicar la fuerza a un objeto, éste puede producir un cambio en su forma? ', 4),
(21, '\r\n\r\nLa economía es una ciencia...', 5),
(22, 'Cantidad de un bien que está dispuesto a adquirir los demandantes a un precio determinado:', 5),
(23, 'Este tipo de mercado se caracteriza porque solo existe un oferente y muchos demandantes', 5),
(24, '¿Cuál es la fórmula del PIB?', 5),
(25, 'Pertenecen al sector secundario:', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `premios`
--

CREATE TABLE `premios` (
  `id_premios` int(11) NOT NULL,
  `nivel` int(11) NOT NULL,
  `valor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `premios`
--

INSERT INTO `premios` (`id_premios`, `nivel`, `valor`) VALUES
(1, 1, 500),
(2, 2, 1000),
(3, 3, 2000),
(4, 4, 5000),
(5, 5, 10000),
(6, 6, 20000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta`
--

CREATE TABLE `respuesta` (
  `id_respuesta` int(11) NOT NULL,
  `respuesta` varchar(100) NOT NULL,
  `id_pregunta` int(11) DEFAULT NULL,
  `correcto` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `respuesta`
--

INSERT INTO `respuesta` (`id_respuesta`, `respuesta`, `id_pregunta`, `correcto`) VALUES
(1, '4', 1, 1),
(2, '3', 1, 0),
(3, '6', 1, 0),
(4, '5', 1, 0),
(5, '49', 2, 1),
(6, '56', 2, 0),
(7, '42', 2, 0),
(8, '64', 2, 0),
(9, 'Trinomio cuadrado perfecto', 3, 1),
(10, 'Factor comun', 3, 0),
(11, 'Diferencia de cuadrados', 3, 0),
(12, 'Cubo perfecto de binomios', 3, 0),
(13, '-3', 4, 1),
(14, '3', 4, 0),
(15, '6', 4, 0),
(16, '-6', 4, 0),
(17, '5', 5, 1),
(18, '2', 5, 0),
(19, '8', 5, 0),
(20, '9', 5, 0),
(21, '32', 6, 1),
(22, '29', 6, 0),
(23, '30', 6, 0),
(24, '31', 6, 0),
(25, 'Rusia', 7, 1),
(26, 'Estados unidos', 7, 0),
(27, 'China', 7, 0),
(28, 'Brasil', 7, 0),
(29, 'Bolivia', 8, 1),
(30, 'Uruguay', 8, 0),
(31, 'Ecuador', 8, 0),
(32, 'Alemania', 8, 0),
(33, 'Amazonas', 9, 1),
(34, 'Rio negro', 9, 0),
(35, 'Orinoco', 9, 0),
(36, 'Putumayo', 9, 0),
(37, 'China', 10, 1),
(38, 'India', 10, 0),
(39, 'Estados unidos ', 10, 0),
(40, 'Rusia', 10, 0),
(41, '1969', 11, 1),
(42, '1972', 11, 0),
(43, '1966', 11, 0),
(44, '1970', 11, 0),
(45, '206', 12, 1),
(46, '262', 12, 0),
(47, '224', 12, 0),
(48, '215', 12, 0),
(49, 'Da Vinci', 13, 1),
(50, 'Botero', 13, 0),
(51, 'Dali', 13, 0),
(52, 'Picaso', 13, 0),
(53, 'Walt Disney', 14, 1),
(54, 'Tex Avery', 14, 0),
(55, 'Matt Groening', 14, 0),
(56, 'Stephen Hillenburg', 14, 0),
(57, 'Maya', 15, 1),
(58, 'Chino', 15, 0),
(59, 'Mulsulman', 15, 0),
(60, 'Turco', 15, 0),
(61, 'Célula ', 16, 1),
(62, 'Mitocondria', 16, 0),
(63, 'Membrana ', 16, 0),
(64, 'Aparato de Golgi', 16, 0),
(65, 'Nucleo ', 17, 1),
(66, 'Nucleolo', 17, 0),
(67, 'Membrana', 17, 0),
(68, 'Ribosoma', 17, 0),
(69, 'Temperatura', 18, 1),
(70, 'Termometro', 18, 0),
(71, 'Fiebre', 18, 0),
(72, 'Hipotermia', 18, 0),
(73, 'El agua', 19, 1),
(74, 'Alcohol', 19, 0),
(75, 'El aceite', 19, 0),
(76, 'El petróleo', 19, 0),
(77, 'Deformación', 20, 1),
(78, 'Encogimiento', 20, 0),
(79, 'Elasticidad', 20, 0),
(80, 'Dureza', 20, 0),
(81, 'Social', 21, 1),
(82, 'Exacta', 21, 0),
(83, 'De la salud', 21, 0),
(84, 'Natural', 21, 0),
(85, 'Demanda', 22, 1),
(86, 'PIB', 22, 0),
(87, 'IPC ( índice de precios al consumo )', 22, 0),
(88, 'Oferta', 22, 0),
(89, 'Monopolio', 23, 1),
(90, 'Oligopolio', 23, 0),
(91, 'Competencia pura o perfecta', 23, 0),
(92, 'Oligopolio bilateral', 23, 0),
(93, 'Consumo+inversion+gasto+(exportaciones-importaciones)', 24, 1),
(94, 'Exportaciones+inversion+gasto+(importaciones-consumo)', 24, 0),
(95, 'Importaciones+exportaciones+inversion+(gasto-consumo)', 24, 0),
(96, 'Gastos+Deudas+Consumo', 24, 0),
(97, 'Todo lo que implica transformación ', 25, 1),
(98, 'Lo que no requiere ningún tipo de trasnsformación', 25, 0),
(99, 'Los frutos que se recogen en el bosque', 25, 0),
(100, 'La pesca y la caza', 25, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD PRIMARY KEY (`id_pregunta`),
  ADD KEY `pregunta_FK` (`id_categoria`);

--
-- Indices de la tabla `premios`
--
ALTER TABLE `premios`
  ADD PRIMARY KEY (`id_premios`);

--
-- Indices de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD PRIMARY KEY (`id_respuesta`),
  ADD KEY `respuesta_FK` (`id_pregunta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  MODIFY `id_pregunta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  MODIFY `id_respuesta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD CONSTRAINT `pregunta_FK` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`);

--
-- Filtros para la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD CONSTRAINT `respuesta_FK` FOREIGN KEY (`id_pregunta`) REFERENCES `pregunta` (`id_pregunta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
