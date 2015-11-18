-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-11-2015 a las 09:49:10
-- Versión del servidor: 5.6.24
-- Versión de PHP: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `bdbazarrosy`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbadministrador`
--

CREATE TABLE IF NOT EXISTS `tbadministrador` (
  `id` int(11) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `contrasena` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbadministrador`
--

INSERT INTO `tbadministrador` (`id`, `usuario`, `contrasena`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbfactura`
--

CREATE TABLE IF NOT EXISTS `tbfactura` (
  `codigoFactura` int(11) NOT NULL,
  `codigoProducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbfacturaventa`
--

CREATE TABLE IF NOT EXISTS `tbfacturaventa` (
  `codigoFactura` int(11) NOT NULL,
  `fecha` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbfacturaventa`
--

INSERT INTO `tbfacturaventa` (`codigoFactura`, `fecha`) VALUES
(1, '20/04/2015'),
(2, '30/04/2015'),
(3, '10/05/2015'),
(4, '20/05/2015'),
(5, '30/05/2015'),
(6, '10/06/2015'),
(7, '20/06/2015'),
(8, '30/06/2015'),
(9, '10/07/2015'),
(10, '20/07/2015'),
(11, '30/07/2015'),
(12, '10/08/2015'),
(13, '20/08/2015'),
(14, '30/08/2015'),
(15, '05/04/2015'),
(16, '23/04/2015'),
(17, '19/05/2015'),
(18, '22/05/2015'),
(19, '12/05/2015'),
(20, '15/06/2015'),
(21, '07/06/2015'),
(22, '09/06/2015'),
(23, '17/07/2015'),
(24, '28/07/2015'),
(25, '26/07/2015'),
(26, '19/08/2015'),
(27, '20/08/2015'),
(28, '05/08/2015');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbproducto`
--

CREATE TABLE IF NOT EXISTS `tbproducto` (
  `codigoProducto` int(11) NOT NULL,
  `nombreProducto` varchar(100) NOT NULL,
  `descripcionProducto` varchar(100) NOT NULL,
  `precioProducto` int(11) NOT NULL,
  `cantidadProducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbproducto`
--

INSERT INTO `tbproducto` (`codigoProducto`, `nombreProducto`, `descripcionProducto`, `precioProducto`, `cantidadProducto`) VALUES
(1, 'cuaderno', 'cuaderno 100 hojas', 250, 10),
(2, 'lapiz', 'lapiz de dibujo', 150, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbreporte`
--

CREATE TABLE IF NOT EXISTS `tbreporte` (
  `codigoProducto` int(11) NOT NULL,
  `fechaVenta` varchar(50) NOT NULL,
  `cantidadVenta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbadministrador`
--
ALTER TABLE `tbadministrador`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbfactura`
--
ALTER TABLE `tbfactura`
  ADD PRIMARY KEY (`codigoFactura`,`codigoProducto`), ADD KEY `codigoProducto` (`codigoProducto`);

--
-- Indices de la tabla `tbfacturaventa`
--
ALTER TABLE `tbfacturaventa`
  ADD PRIMARY KEY (`codigoFactura`);

--
-- Indices de la tabla `tbproducto`
--
ALTER TABLE `tbproducto`
  ADD PRIMARY KEY (`codigoProducto`);

--
-- Indices de la tabla `tbreporte`
--
ALTER TABLE `tbreporte`
  ADD PRIMARY KEY (`codigoProducto`,`fechaVenta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbfacturaventa`
--
ALTER TABLE `tbfacturaventa`
  MODIFY `codigoFactura` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbfactura`
--
ALTER TABLE `tbfactura`
ADD CONSTRAINT `tbfactura_ibfk_1` FOREIGN KEY (`codigoProducto`) REFERENCES `tbproducto` (`codigoProducto`),
ADD CONSTRAINT `tbfactura_ibfk_2` FOREIGN KEY (`codigoFactura`) REFERENCES `tbfacturaventa` (`codigoFactura`);

--
-- Filtros para la tabla `tbreporte`
--
ALTER TABLE `tbreporte`
ADD CONSTRAINT `tbreporte_ibfk_1` FOREIGN KEY (`codigoProducto`) REFERENCES `tbproducto` (`codigoProducto`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
