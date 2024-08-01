-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 01, 2024 at 11:07 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bd_proyectofinal`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_categoria`
--

CREATE TABLE `tb_categoria` (
  `cod_categ` int NOT NULL,
  `nom_categ` varchar(60) NOT NULL,
  `zona_mueble` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_categoria`
--

INSERT INTO `tb_categoria` (`cod_categ`, `nom_categ`, `zona_mueble`) VALUES
(1, 'lavaplatos', 'cocina'),
(2, 'ducha', 'baño'),
(3, 'lavamano', 'baño'),
(4, 'camas', 'dormitorio'),
(5, 'regaderas', 'baño');

-- --------------------------------------------------------

--
-- Table structure for table `tb_clientes`
--

CREATE TABLE `tb_clientes` (
  `dni_client` int NOT NULL,
  `nom_client` varchar(100) NOT NULL,
  `apell_client` varchar(100) DEFAULT NULL,
  `direcc_client` varchar(100) DEFAULT NULL,
  `telef_client` bigint DEFAULT NULL,
  `fecha_client` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_clientes`
--

INSERT INTO `tb_clientes` (`dni_client`, `nom_client`, `apell_client`, `direcc_client`, `telef_client`, `fecha_client`) VALUES
(1102714658, 'Pepito', 'Perez', 'Calle 58', 321323333, '2024-08-01 17:55:20'),
(1233331231, 'Daniel', 'Otero', 'AVD 56', 3213214543, '2024-08-01 18:00:21');

-- --------------------------------------------------------

--
-- Table structure for table `tb_factura`
--

CREATE TABLE `tb_factura` (
  `cod_factu` int NOT NULL,
  `dni_client_fk` int NOT NULL,
  `fecha_creacion_factu` datetime DEFAULT CURRENT_TIMESTAMP,
  `cod_pedido_fk` int NOT NULL,
  `total_factu` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_mueble`
--

CREATE TABLE `tb_mueble` (
  `cod_mueble` int NOT NULL,
  `nom_mueble` varchar(60) NOT NULL,
  `cod_categ_fk` int NOT NULL,
  `mater_mueble` varchar(60) NOT NULL,
  `color_mueble` varchar(30) NOT NULL,
  `presi_mueble` decimal(10,2) NOT NULL,
  `stok_mueble` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_mueble`
--

INSERT INTO `tb_mueble` (`cod_mueble`, `nom_mueble`, `cod_categ_fk`, `mater_mueble`, `color_mueble`, `presi_mueble`, `stok_mueble`) VALUES
(1, 'Cama KingZise', 4, 'Negro', 'Roble y Seda', '3000000.00', 10);

-- --------------------------------------------------------

--
-- Table structure for table `tb_mueble_pedido`
--

CREATE TABLE `tb_mueble_pedido` (
  `cod_mueble_fk` int NOT NULL,
  `cod_pedido_fk` int NOT NULL,
  `cant_mueble` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_operacion`
--

CREATE TABLE `tb_operacion` (
  `cod_opera` int NOT NULL,
  `nom_opera` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_operacion`
--

INSERT INTO `tb_operacion` (`cod_opera`, `nom_opera`) VALUES
(1, 'Eliminar'),
(2, 'Agregar'),
(3, 'Modificar'),
(4, 'Listar');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pedido`
--

CREATE TABLE `tb_pedido` (
  `cod_pedido` int NOT NULL,
  `cod_rol_fk` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_rol`
--

CREATE TABLE `tb_rol` (
  `cod_rol` int NOT NULL,
  `nom_rol` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_rol`
--

INSERT INTO `tb_rol` (`cod_rol`, `nom_rol`) VALUES
(1, 'admin'),
(2, 'Empleados');

-- --------------------------------------------------------

--
-- Table structure for table `tb_rol_operacion`
--

CREATE TABLE `tb_rol_operacion` (
  `cod_opera_fk` int NOT NULL,
  `cod_rol_fk` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_rol_operacion`
--

INSERT INTO `tb_rol_operacion` (`cod_opera_fk`, `cod_rol_fk`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(2, 2),
(3, 2),
(4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tb_tienda`
--

CREATE TABLE `tb_tienda` (
  `id_tienda` int NOT NULL,
  `nom_tienda` varchar(60) NOT NULL,
  `direcc_tienda` varchar(60) NOT NULL,
  `ciudad_tienda` varchar(60) NOT NULL,
  `depart_tienda` varchar(60) NOT NULL,
  `pais_tienda` varchar(60) NOT NULL,
  `telfon_tienda` int DEFAULT NULL,
  `cod_rol_fk` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_usuario`
--

CREATE TABLE `tb_usuario` (
  `cod_user` int NOT NULL,
  `nom_user` varchar(60) NOT NULL,
  `email_user` varchar(60) NOT NULL,
  `contra_user` varchar(60) NOT NULL,
  `fecha_creaci_user` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `cod_rol_fk` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_usuario`
--

INSERT INTO `tb_usuario` (`cod_user`, `nom_user`, `email_user`, `contra_user`, `fecha_creaci_user`, `cod_rol_fk`) VALUES
(1, 'admin', 'admin123@gmail.com', 'admin', '2024-07-29 22:46:01', 1),
(2, 'Pedro Piedra', 'perdo@gmail.com', '123', '2024-07-29 22:46:14', 2),
(3, 'daniel', 'daniel@gmail.com', '1234555', '2024-07-29 22:46:27', 2),
(4, 'Samuel Rueda', 'sam@gmail.com', '123', '2024-07-29 22:47:54', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_categoria`
--
ALTER TABLE `tb_categoria`
  ADD PRIMARY KEY (`cod_categ`);

--
-- Indexes for table `tb_clientes`
--
ALTER TABLE `tb_clientes`
  ADD PRIMARY KEY (`dni_client`);

--
-- Indexes for table `tb_factura`
--
ALTER TABLE `tb_factura`
  ADD PRIMARY KEY (`cod_factu`),
  ADD KEY `cod_pedido_fk` (`cod_pedido_fk`),
  ADD KEY `dni_client_fk` (`dni_client_fk`);

--
-- Indexes for table `tb_mueble`
--
ALTER TABLE `tb_mueble`
  ADD PRIMARY KEY (`cod_mueble`),
  ADD KEY `cod_categ_fk` (`cod_categ_fk`);

--
-- Indexes for table `tb_mueble_pedido`
--
ALTER TABLE `tb_mueble_pedido`
  ADD KEY `cod_mueble_fk` (`cod_mueble_fk`),
  ADD KEY `cod_pedido_fk` (`cod_pedido_fk`);

--
-- Indexes for table `tb_operacion`
--
ALTER TABLE `tb_operacion`
  ADD PRIMARY KEY (`cod_opera`);

--
-- Indexes for table `tb_pedido`
--
ALTER TABLE `tb_pedido`
  ADD PRIMARY KEY (`cod_pedido`),
  ADD KEY `cod_rol_fk` (`cod_rol_fk`);

--
-- Indexes for table `tb_rol`
--
ALTER TABLE `tb_rol`
  ADD PRIMARY KEY (`cod_rol`);

--
-- Indexes for table `tb_rol_operacion`
--
ALTER TABLE `tb_rol_operacion`
  ADD KEY `cod_opera_fk` (`cod_opera_fk`),
  ADD KEY `cod_rol_fk` (`cod_rol_fk`);

--
-- Indexes for table `tb_tienda`
--
ALTER TABLE `tb_tienda`
  ADD PRIMARY KEY (`id_tienda`),
  ADD KEY `cod_rol_fk` (`cod_rol_fk`);

--
-- Indexes for table `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD PRIMARY KEY (`cod_user`),
  ADD KEY `cod_rol_fk` (`cod_rol_fk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_categoria`
--
ALTER TABLE `tb_categoria`
  MODIFY `cod_categ` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `tb_clientes`
--
ALTER TABLE `tb_clientes`
  MODIFY `dni_client` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1233331232;

--
-- AUTO_INCREMENT for table `tb_factura`
--
ALTER TABLE `tb_factura`
  MODIFY `cod_factu` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_mueble`
--
ALTER TABLE `tb_mueble`
  MODIFY `cod_mueble` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_operacion`
--
ALTER TABLE `tb_operacion`
  MODIFY `cod_opera` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_pedido`
--
ALTER TABLE `tb_pedido`
  MODIFY `cod_pedido` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_rol`
--
ALTER TABLE `tb_rol`
  MODIFY `cod_rol` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_tienda`
--
ALTER TABLE `tb_tienda`
  MODIFY `id_tienda` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_usuario`
--
ALTER TABLE `tb_usuario`
  MODIFY `cod_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_factura`
--
ALTER TABLE `tb_factura`
  ADD CONSTRAINT `tb_factura_ibfk_1` FOREIGN KEY (`cod_pedido_fk`) REFERENCES `tb_pedido` (`cod_pedido`),
  ADD CONSTRAINT `tb_factura_ibfk_2` FOREIGN KEY (`dni_client_fk`) REFERENCES `tb_clientes` (`dni_client`);

--
-- Constraints for table `tb_mueble`
--
ALTER TABLE `tb_mueble`
  ADD CONSTRAINT `tb_mueble_ibfk_1` FOREIGN KEY (`cod_categ_fk`) REFERENCES `tb_categoria` (`cod_categ`);

--
-- Constraints for table `tb_mueble_pedido`
--
ALTER TABLE `tb_mueble_pedido`
  ADD CONSTRAINT `tb_mueble_pedido_ibfk_1` FOREIGN KEY (`cod_mueble_fk`) REFERENCES `tb_mueble` (`cod_mueble`),
  ADD CONSTRAINT `tb_mueble_pedido_ibfk_2` FOREIGN KEY (`cod_pedido_fk`) REFERENCES `tb_pedido` (`cod_pedido`);

--
-- Constraints for table `tb_pedido`
--
ALTER TABLE `tb_pedido`
  ADD CONSTRAINT `tb_pedido_ibfk_1` FOREIGN KEY (`cod_rol_fk`) REFERENCES `tb_rol` (`cod_rol`);

--
-- Constraints for table `tb_rol_operacion`
--
ALTER TABLE `tb_rol_operacion`
  ADD CONSTRAINT `tb_rol_operacion_ibfk_1` FOREIGN KEY (`cod_opera_fk`) REFERENCES `tb_operacion` (`cod_opera`),
  ADD CONSTRAINT `tb_rol_operacion_ibfk_2` FOREIGN KEY (`cod_rol_fk`) REFERENCES `tb_rol` (`cod_rol`);

--
-- Constraints for table `tb_tienda`
--
ALTER TABLE `tb_tienda`
  ADD CONSTRAINT `tb_tienda_ibfk_1` FOREIGN KEY (`cod_rol_fk`) REFERENCES `tb_rol` (`cod_rol`);

--
-- Constraints for table `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD CONSTRAINT `tb_usuario_ibfk_1` FOREIGN KEY (`cod_rol_fk`) REFERENCES `tb_rol` (`cod_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
