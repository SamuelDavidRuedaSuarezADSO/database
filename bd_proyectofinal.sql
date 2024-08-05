-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 05, 2024 at 07:54 PM
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
  `fecha_creacion_factu` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `cod_pedido_fk` int NOT NULL,
  `total_factu` decimal(10,2) DEFAULT NULL,
  `cambio_factu` double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_factura`
--

INSERT INTO `tb_factura` (`cod_factu`, `fecha_creacion_factu`, `cod_pedido_fk`, `total_factu`, `cambio_factu`) VALUES
(1, '2024-08-05 04:26:22', 1, '6450000.00', 550000.00),
(2, '2024-08-05 04:43:09', 3, '6000000.00', 1000000.00),
(3, '2024-08-05 05:27:51', 4, '6000000.00', 0.00),
(4, '2024-08-05 05:29:35', 5, '9300000.00', 0.00);

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
(1, 'Cama KingSize', 4, 'Roble y Seda', 'Blanco', '3000000.00', 15),
(2, 'Regadera Corona', 5, 'Cilicona', 'Gris - Metalico', '150000.00', 25);

-- --------------------------------------------------------

--
-- Table structure for table `tb_mueble_pedido`
--

CREATE TABLE `tb_mueble_pedido` (
  `cod_mueble_fk` int NOT NULL,
  `cod_pedido_fk` int NOT NULL,
  `cant_mueble` int NOT NULL,
  `press_mueble` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_mueble_pedido`
--

INSERT INTO `tb_mueble_pedido` (`cod_mueble_fk`, `cod_pedido_fk`, `cant_mueble`, `press_mueble`) VALUES
(1, 1, 2, '6000000.00'),
(2, 1, 3, '450000.00'),
(1, 2, 1, '3000000.00'),
(1, 3, 2, '6000000.00'),
(1, 4, 2, '6000000.00'),
(1, 5, 3, '9000000.00'),
(2, 5, 2, '300000.00');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pedido`
--

CREATE TABLE `tb_pedido` (
  `cod_pedido` int NOT NULL,
  `cod_user_fk` int NOT NULL,
  `dni_client_fk` int NOT NULL,
  `total_pedido` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_pedido`
--

INSERT INTO `tb_pedido` (`cod_pedido`, `cod_user_fk`, `dni_client_fk`, `total_pedido`) VALUES
(1, 4, 1233331231, '6450000.00'),
(2, 2, 1233331231, '3000000.00'),
(3, 2, 1102714658, '6000000.00'),
(4, 2, 1233331231, '6000000.00'),
(5, 3, 1102714658, '9300000.00');

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
(1, 'admin', 'admin123@gmail.com', '1', '2024-07-29 22:46:01', 1),
(2, 'Pedro Piedra', 'perdo@gmail.com', '123', '2024-07-29 22:46:14', 2),
(3, 'daniel', 'daniel@gmail.com', '1234555', '2024-07-29 22:46:27', 2),
(4, 'Samuel Rueda', 'sam@gmail.com', '123', '2024-07-29 22:47:54', 2),
(6, 'sam', 'sam@gmail.com', '123sam', '2024-08-05 19:45:48', 1);

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
  ADD KEY `cod_pedido_fk` (`cod_pedido_fk`);

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
-- Indexes for table `tb_pedido`
--
ALTER TABLE `tb_pedido`
  ADD PRIMARY KEY (`cod_pedido`),
  ADD KEY `dni_client_fk` (`dni_client_fk`),
  ADD KEY `cod_user_fk` (`cod_user_fk`);

--
-- Indexes for table `tb_rol`
--
ALTER TABLE `tb_rol`
  ADD PRIMARY KEY (`cod_rol`);

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
  MODIFY `cod_factu` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_mueble`
--
ALTER TABLE `tb_mueble`
  MODIFY `cod_mueble` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_pedido`
--
ALTER TABLE `tb_pedido`
  MODIFY `cod_pedido` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_rol`
--
ALTER TABLE `tb_rol`
  MODIFY `cod_rol` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_usuario`
--
ALTER TABLE `tb_usuario`
  MODIFY `cod_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_factura`
--
ALTER TABLE `tb_factura`
  ADD CONSTRAINT `tb_factura_ibfk_1` FOREIGN KEY (`cod_pedido_fk`) REFERENCES `tb_pedido` (`cod_pedido`);

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
  ADD CONSTRAINT `tb_pedido_ibfk_2` FOREIGN KEY (`dni_client_fk`) REFERENCES `tb_clientes` (`dni_client`),
  ADD CONSTRAINT `tb_pedido_ibfk_3` FOREIGN KEY (`cod_user_fk`) REFERENCES `tb_usuario` (`cod_user`);

--
-- Constraints for table `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD CONSTRAINT `tb_usuario_ibfk_1` FOREIGN KEY (`cod_rol_fk`) REFERENCES `tb_rol` (`cod_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
