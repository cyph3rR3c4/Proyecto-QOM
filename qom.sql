-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-03-2021 a las 01:29:14
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `qom`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `idAdministrador` int(10) UNSIGNED NOT NULL,
  `Inventario_productos_id_productos` int(10) UNSIGNED NOT NULL,
  `Inventario_idInventario` int(10) UNSIGNED NOT NULL,
  `Inventario_productos_detalles_pedido_id_deta_pedido` int(10) UNSIGNED NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Documento` int(10) NOT NULL,
  `Nombre_de_usuario` varchar(20) NOT NULL,
  `Contraseña` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`idAdministrador`, `Inventario_productos_id_productos`, `Inventario_idInventario`, `Inventario_productos_detalles_pedido_id_deta_pedido`, `Nombre`, `Documento`, `Nombre_de_usuario`, `Contraseña`) VALUES
(1, 4000, 300, 200, 'Juan Valdes', 2147483647, 'JuanV', '1234'),
(2, 4001, 301, 201, 'Dayana Villalobos', 2147483647, 'DayanaV', '4321');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(10) UNSIGNED NOT NULL,
  `Inventario_productos_id_productos` int(10) UNSIGNED NOT NULL,
  `Inventario_idInventario` int(10) UNSIGNED NOT NULL,
  `Inventario_productos_detalles_pedido_id_deta_pedido` int(10) UNSIGNED NOT NULL,
  `Bebidas` varchar(20) NOT NULL,
  `Preparados` varchar(20) NOT NULL,
  `Enpaquetados` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idCategoria`, `Inventario_productos_id_productos`, `Inventario_idInventario`, `Inventario_productos_detalles_pedido_id_deta_pedido`, `Bebidas`, `Preparados`, `Enpaquetados`) VALUES
(1, 4000, 300, 200, 'Coca Cola', 'Empanada', 'Doritos'),
(2, 4001, 301, 201, 'Pepsi', 'sandwich', 'Cheetos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_clientes` int(10) UNSIGNED NOT NULL,
  `pedidos_id_pedidos` int(10) UNSIGNED NOT NULL,
  `pedidos_detalles_pedido_id_deta_pedido` int(10) UNSIGNED NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Telefono` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_clientes`, `pedidos_id_pedidos`, `pedidos_detalles_pedido_id_deta_pedido`, `Nombre`, `Telefono`) VALUES
(1, 5000, 200, 'Luis García', 2147483647),
(2, 5001, 201, 'Álvaro Rodríguez', 2147483647);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_pedido`
--

CREATE TABLE `detalles_pedido` (
  `id_deta_pedido` int(10) UNSIGNED NOT NULL,
  `id_pedidos` int(11) DEFAULT NULL,
  `id_ingresos` int(11) DEFAULT NULL,
  `cantidad_de_productos` int(11) DEFAULT NULL,
  `Estado_de_pago` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalles_pedido`
--

INSERT INTO `detalles_pedido` (`id_deta_pedido`, `id_pedidos`, `id_ingresos`, `cantidad_de_productos`, `Estado_de_pago`) VALUES
(200, 5000, 60000, 3, 'Sin cancelar'),
(201, 5001, 60000, 2, 'Cancelado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrada_de_producto`
--

CREATE TABLE `entrada_de_producto` (
  `Factura_de_compra` int(10) UNSIGNED NOT NULL,
  `Inventario_productos_id_productos` int(10) UNSIGNED NOT NULL,
  `Inventario_idInventario` int(10) UNSIGNED NOT NULL,
  `Inventario_productos_detalles_pedido_id_deta_pedido` int(10) UNSIGNED NOT NULL,
  `Fecha_de_compra` date NOT NULL,
  `Código_del_producto_entrada` int(11) NOT NULL,
  `Nombre_del_producto` varchar(20) NOT NULL,
  `Cantidad_comprada` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `entrada_de_producto`
--

INSERT INTO `entrada_de_producto` (`Factura_de_compra`, `Inventario_productos_id_productos`, `Inventario_idInventario`, `Inventario_productos_detalles_pedido_id_deta_pedido`, `Fecha_de_compra`, `Código_del_producto_entrada`, `Nombre_del_producto`, `Cantidad_comprada`) VALUES
(1, 4000, 300, 200, '2020-12-12', 1000, 'Coca Cola', 3),
(2, 4001, 301, 201, '2021-03-03', 1001, 'sandwich', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `idInventario` int(10) UNSIGNED NOT NULL,
  `productos_id_productos` int(10) UNSIGNED NOT NULL,
  `productos_detalles_pedido_id_deta_pedido` int(10) UNSIGNED NOT NULL,
  `Código_del_producto` int(11) DEFAULT NULL,
  `Nombre_del_producto` varchar(20) DEFAULT NULL,
  `Stock_inicial` int(11) DEFAULT NULL,
  `Entradas` int(11) DEFAULT NULL,
  `Salidas` int(11) DEFAULT NULL,
  `Total` int(11) DEFAULT NULL,
  `Categoria` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`idInventario`, `productos_id_productos`, `productos_detalles_pedido_id_deta_pedido`, `Código_del_producto`, `Nombre_del_producto`, `Stock_inicial`, `Entradas`, `Salidas`, `Total`, `Categoria`) VALUES
(300, 4000, 200, 1000, 'Coca Cola', 1, 3, 2, 2, 'Bebidas'),
(301, 4001, 201, 1001, 'sandwich', 2, 2, 1, 3, 'preparados');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedidos` int(10) UNSIGNED NOT NULL,
  `detalles_pedido_id_deta_pedido` int(10) UNSIGNED NOT NULL,
  `id_productos` int(11) NOT NULL,
  `id_clientes` int(11) NOT NULL,
  `Estado_del_pedido` varchar(20) NOT NULL,
  `Detalles_del_pedido` varchar(20) NOT NULL,
  `Fecha_del_pedido` date NOT NULL,
  `Codigo_del_pedido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedidos`, `detalles_pedido_id_deta_pedido`, `id_productos`, `id_clientes`, `Estado_del_pedido`, `Detalles_del_pedido`, `Fecha_del_pedido`, `Codigo_del_pedido`) VALUES
(4000, 200, 800, 1, 'En fila', 'Cocacola', '2020-05-11', 700),
(4001, 201, 801, 2, 'En fila', 'Sandwich', '2020-05-11', 701);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_productos` int(10) UNSIGNED NOT NULL,
  `detalles_pedido_id_deta_pedido` int(10) UNSIGNED NOT NULL,
  `nombre_producto` varchar(20) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `Presentacion` varchar(20) DEFAULT NULL,
  `Fecha_de_vencimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_productos`, `detalles_pedido_id_deta_pedido`, `nombre_producto`, `precio`, `Presentacion`, `Fecha_de_vencimiento`) VALUES
(800, 200, 'Cocacola', 1000, 'Botella', '2021-05-11'),
(801, 201, 'Sandwich', 1500, 'bolsa', '2021-05-11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salida_de_producto`
--

CREATE TABLE `salida_de_producto` (
  `IdFactura_de_venta` int(10) UNSIGNED NOT NULL,
  `Inventario_productos_id_productos` int(10) UNSIGNED NOT NULL,
  `Inventario_idInventario` int(10) UNSIGNED NOT NULL,
  `Inventario_productos_detalles_pedido_id_deta_pedido` int(10) UNSIGNED NOT NULL,
  `Fecha_de_venta` date NOT NULL,
  `Código_del_producto_salida` int(11) NOT NULL,
  `Nombre_del_producto` varchar(20) NOT NULL,
  `Cantidad_vendida` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `salida_de_producto`
--

INSERT INTO `salida_de_producto` (`IdFactura_de_venta`, `Inventario_productos_id_productos`, `Inventario_idInventario`, `Inventario_productos_detalles_pedido_id_deta_pedido`, `Fecha_de_venta`, `Código_del_producto_salida`, `Nombre_del_producto`, `Cantidad_vendida`) VALUES
(11, 4000, 300, 200, '2020-12-12', 1000, 'Coca Cola', 2),
(12, 4001, 301, 201, '2021-03-03', 1001, 'sandwich', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`idAdministrador`,`Inventario_productos_id_productos`,`Inventario_idInventario`,`Inventario_productos_detalles_pedido_id_deta_pedido`),
  ADD KEY `Administrador_FKIndex1` (`Inventario_idInventario`,`Inventario_productos_id_productos`,`Inventario_productos_detalles_pedido_id_deta_pedido`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`,`Inventario_productos_id_productos`,`Inventario_idInventario`,`Inventario_productos_detalles_pedido_id_deta_pedido`),
  ADD KEY `Categoria_FKIndex1` (`Inventario_idInventario`,`Inventario_productos_id_productos`,`Inventario_productos_detalles_pedido_id_deta_pedido`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_clientes`,`pedidos_id_pedidos`,`pedidos_detalles_pedido_id_deta_pedido`),
  ADD KEY `clientes_FKIndex1` (`pedidos_id_pedidos`,`pedidos_detalles_pedido_id_deta_pedido`);

--
-- Indices de la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  ADD PRIMARY KEY (`id_deta_pedido`);

--
-- Indices de la tabla `entrada_de_producto`
--
ALTER TABLE `entrada_de_producto`
  ADD PRIMARY KEY (`Factura_de_compra`,`Inventario_productos_id_productos`,`Inventario_idInventario`,`Inventario_productos_detalles_pedido_id_deta_pedido`),
  ADD KEY `Entrada_de_producto_FKIndex1` (`Inventario_idInventario`,`Inventario_productos_id_productos`,`Inventario_productos_detalles_pedido_id_deta_pedido`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`idInventario`,`productos_id_productos`,`productos_detalles_pedido_id_deta_pedido`),
  ADD KEY `Inventario_FKIndex1` (`productos_id_productos`,`productos_detalles_pedido_id_deta_pedido`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedidos`,`detalles_pedido_id_deta_pedido`),
  ADD KEY `pedidos_FKIndex1` (`detalles_pedido_id_deta_pedido`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_productos`,`detalles_pedido_id_deta_pedido`),
  ADD KEY `productos_FKIndex1` (`detalles_pedido_id_deta_pedido`);

--
-- Indices de la tabla `salida_de_producto`
--
ALTER TABLE `salida_de_producto`
  ADD PRIMARY KEY (`IdFactura_de_venta`,`Inventario_productos_id_productos`,`Inventario_idInventario`,`Inventario_productos_detalles_pedido_id_deta_pedido`),
  ADD KEY `Salida_de_producto_FKIndex1` (`Inventario_idInventario`,`Inventario_productos_id_productos`,`Inventario_productos_detalles_pedido_id_deta_pedido`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `idAdministrador` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idCategoria` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_clientes` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  MODIFY `id_deta_pedido` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- AUTO_INCREMENT de la tabla `entrada_de_producto`
--
ALTER TABLE `entrada_de_producto`
  MODIFY `Factura_de_compra` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `idInventario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=302;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_productos` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=802;

--
-- AUTO_INCREMENT de la tabla `salida_de_producto`
--
ALTER TABLE `salida_de_producto`
  MODIFY `IdFactura_de_venta` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
