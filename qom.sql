-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-03-2021 a las 20:41:48
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
  `Rol_idRol` int(10) UNSIGNED NOT NULL,
  `Nombre` varchar(20) DEFAULT NULL,
  `Apellidos` varchar(20) DEFAULT NULL,
  `Correo` varchar(20) DEFAULT NULL,
  `Telefono` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(10) UNSIGNED NOT NULL,
  `Nombre_de_la_categoria` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_clientes` int(10) UNSIGNED NOT NULL,
  `Rol_idRol` int(10) UNSIGNED NOT NULL,
  `Nombre` varchar(20) DEFAULT NULL,
  `Telefono` int(11) DEFAULT NULL,
  `Apellidos` varchar(20) DEFAULT NULL,
  `Correos` varchar(20) DEFAULT NULL,
  `Direccion` varchar(20) DEFAULT NULL,
  `Estado_de_cliente` varchar(20) DEFAULT NULL,
  `Categoria_de_cliente` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_pedido`
--

CREATE TABLE `detalles_pedido` (
  `id_deta_pedido` int(10) UNSIGNED NOT NULL,
  `pedidos_clientes_id_clientes` int(10) UNSIGNED NOT NULL,
  `pedidos_id_pedidos` int(10) UNSIGNED NOT NULL,
  `productos_Categoria_idCategoria` int(10) UNSIGNED NOT NULL,
  `productos_id_productos` int(10) UNSIGNED NOT NULL,
  `cantidad_de_productos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `idInventario` int(10) UNSIGNED NOT NULL,
  `Entradas` int(11) DEFAULT NULL,
  `Salidas` int(11) DEFAULT NULL,
  `Total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedidos` int(10) UNSIGNED NOT NULL,
  `clientes_id_clientes` int(10) UNSIGNED NOT NULL,
  `Estado_del_pedido` varchar(20) DEFAULT NULL,
  `Fecha_del_pedido` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_productos` int(10) UNSIGNED NOT NULL,
  `Categoria_idCategoria` int(10) UNSIGNED NOT NULL,
  `nombre_producto` varchar(20) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `Presentacion` varchar(20) DEFAULT NULL,
  `Fecha_de_vencimiento` date DEFAULT NULL,
  `Marca` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_has_inventario`
--

CREATE TABLE `productos_has_inventario` (
  `productos_Categoria_idCategoria` int(10) UNSIGNED NOT NULL,
  `productos_id_productos` int(10) UNSIGNED NOT NULL,
  `Inventario_idInventario` int(10) UNSIGNED NOT NULL,
  `ingreso_de_productos` varchar(20) DEFAULT NULL,
  `Salida_de_productos` varchar(20) DEFAULT NULL,
  `Saldo` int(11) DEFAULT NULL,
  `Fecha_de_movimiento` date DEFAULT NULL,
  `Tipo_de_movimiento` varchar(20) DEFAULT NULL,
  `Producto` varchar(20) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idRol` int(10) UNSIGNED NOT NULL,
  `Usuario` int(10) UNSIGNED DEFAULT NULL,
  `Contraseña` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_de_inventario`
--

CREATE TABLE `tipo_de_inventario` (
  `idTipo_de_inventario` int(10) UNSIGNED NOT NULL,
  `productos_has_Inventario_Inventario_idInventario` int(10) UNSIGNED NOT NULL,
  `productos_has_Inventario_productos_id_productos` int(10) UNSIGNED NOT NULL,
  `productos_has_Inventario_productos_Categoria_idCategoria` int(10) UNSIGNED NOT NULL,
  `Fecha_de_movimiento` date DEFAULT NULL,
  `Tipo_de_movimento` varchar(20) DEFAULT NULL,
  `Cantidad_de_producto` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`idAdministrador`,`Rol_idRol`),
  ADD KEY `Administrador_FKIndex1` (`Rol_idRol`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_clientes`),
  ADD KEY `clientes_FKIndex1` (`Rol_idRol`);

--
-- Indices de la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  ADD PRIMARY KEY (`id_deta_pedido`),
  ADD KEY `detalles_pedido_FKIndex1` (`productos_id_productos`,`productos_Categoria_idCategoria`),
  ADD KEY `detalles_pedido_FKIndex2` (`pedidos_id_pedidos`,`pedidos_clientes_id_clientes`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`idInventario`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedidos`,`clientes_id_clientes`),
  ADD KEY `pedidos_FKIndex1` (`clientes_id_clientes`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_productos`,`Categoria_idCategoria`),
  ADD KEY `productos_FKIndex1` (`Categoria_idCategoria`);

--
-- Indices de la tabla `productos_has_inventario`
--
ALTER TABLE `productos_has_inventario`
  ADD PRIMARY KEY (`productos_Categoria_idCategoria`,`productos_id_productos`,`Inventario_idInventario`),
  ADD KEY `productos_has_Inventario_FKIndex1` (`productos_id_productos`,`productos_Categoria_idCategoria`),
  ADD KEY `productos_has_Inventario_FKIndex2` (`Inventario_idInventario`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `tipo_de_inventario`
--
ALTER TABLE `tipo_de_inventario`
  ADD PRIMARY KEY (`idTipo_de_inventario`),
  ADD KEY `Tipo_de_inventario_FKIndex1` (`productos_has_Inventario_productos_Categoria_idCategoria`,`productos_has_Inventario_productos_id_productos`,`productos_has_Inventario_Inventario_idInventario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `idAdministrador` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idCategoria` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_clientes` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  MODIFY `id_deta_pedido` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `idInventario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_productos` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idRol` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_de_inventario`
--
ALTER TABLE `tipo_de_inventario`
  MODIFY `idTipo_de_inventario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
