-- MySQL dump 10.13  Distrib 8.0.41, for Linux (x86_64)
--
-- Host: localhost    Database: GameExpress2
-- ------------------------------------------------------
-- Server version	8.0.41-0ubuntu0.24.04.1
--
-- Table structure for table `direccion`
--
CREATE TABLE `direccion` (
  `id_direccion` int NOT NULL AUTO_INCREMENT,
  `calle` varchar(100) NOT NULL,
  `numero` int NOT NULL,
  `municipio` varchar(50) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `comunidad` varchar(50) NOT NULL,
  `codigo_postal` varchar(10) NOT NULL,
  PRIMARY KEY (`id_direccion`),
  CONSTRAINT `direccion_chk_1` CHECK ((`numero` > 0)),
  CONSTRAINT `direccion_chk_10` CHECK ((`numero` > 0)),
  CONSTRAINT `direccion_chk_11` CHECK ((`numero` > 0)),
  CONSTRAINT `direccion_chk_12` CHECK ((`numero` > 0)),
  CONSTRAINT `direccion_chk_13` CHECK ((`numero` > 0)),
  CONSTRAINT `direccion_chk_14` CHECK ((`numero` > 0)),
  CONSTRAINT `direccion_chk_15` CHECK ((`numero` > 0)),
  CONSTRAINT `direccion_chk_16` CHECK ((`numero` > 0)),
  CONSTRAINT `direccion_chk_17` CHECK ((`numero` > 0)),
  CONSTRAINT `direccion_chk_18` CHECK ((`numero` > 0)),
  CONSTRAINT `direccion_chk_2` CHECK ((`numero` > 0)),
  CONSTRAINT `direccion_chk_3` CHECK ((`numero` > 0)),
  CONSTRAINT `direccion_chk_4` CHECK ((`numero` > 0)),
  CONSTRAINT `direccion_chk_5` CHECK ((`numero` > 0)),
  CONSTRAINT `direccion_chk_6` CHECK ((`numero` > 0)),
  CONSTRAINT `direccion_chk_7` CHECK ((`numero` > 0)),
  CONSTRAINT `direccion_chk_8` CHECK ((`numero` > 0)),
  CONSTRAINT `direccion_chk_9` CHECK ((`numero` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=1041 DEFAULT CHARSET=utf8mb3;
--
-- Table structure for table `cliente`
--
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido1` varchar(50) NOT NULL,
  `apellido2` varchar(50) NOT NULL,
  `DNI` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fecha_registro` date NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `socio` enum('Si','No') NOT NULL DEFAULT 'Si',
  `id_direccion` int NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `email_2` (`email`),
  UNIQUE KEY `email_3` (`email`),
  UNIQUE KEY `email_4` (`email`),
  UNIQUE KEY `email_5` (`email`),
  UNIQUE KEY `email_6` (`email`),
  UNIQUE KEY `email_7` (`email`),
  UNIQUE KEY `email_8` (`email`),
  UNIQUE KEY `email_9` (`email`),
  UNIQUE KEY `email_10` (`email`),
  UNIQUE KEY `email_11` (`email`),
  UNIQUE KEY `email_12` (`email`),
  UNIQUE KEY `DNI` (`DNI`),
  UNIQUE KEY `email_13` (`email`),
  UNIQUE KEY `DNI_2` (`DNI`),
  UNIQUE KEY `email_14` (`email`),
  UNIQUE KEY `DNI_3` (`DNI`),
  UNIQUE KEY `email_15` (`email`),
  UNIQUE KEY `DNI_4` (`DNI`),
  UNIQUE KEY `email_16` (`email`),
  UNIQUE KEY `DNI_5` (`DNI`),
  UNIQUE KEY `email_17` (`email`),
  UNIQUE KEY `DNI_6` (`DNI`),
  UNIQUE KEY `email_18` (`email`),
  UNIQUE KEY `DNI_7` (`DNI`),
  UNIQUE KEY `email_19` (`email`),
  UNIQUE KEY `DNI_8` (`DNI`),
  UNIQUE KEY `email_20` (`email`),
  UNIQUE KEY `DNI_9` (`DNI`),
  UNIQUE KEY `email_21` (`email`),
  UNIQUE KEY `DNI_10` (`DNI`),
  UNIQUE KEY `email_22` (`email`),
  UNIQUE KEY `DNI_11` (`DNI`),
  UNIQUE KEY `DNI_12` (`DNI`),
  KEY `fk_CLIENTE_DIRECCION` (`id_direccion`),
  CONSTRAINT `fk_CLIENTE_DIRECCION` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=541 DEFAULT CHARSET=utf8mb3;
--
-- Table structure for table `tienda`
--
CREATE TABLE `tienda` (
  `id_tienda` int NOT NULL AUTO_INCREMENT,
  `horario` varchar(50) NOT NULL,
  `telefono` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fecha_apertura` date NOT NULL,
  `id_direccion` int NOT NULL,
  PRIMARY KEY (`id_tienda`),
  UNIQUE KEY `telefono` (`telefono`),
  UNIQUE KEY `telefono_2` (`telefono`),
  UNIQUE KEY `telefono_3` (`telefono`),
  UNIQUE KEY `telefono_4` (`telefono`),
  UNIQUE KEY `telefono_5` (`telefono`),
  UNIQUE KEY `telefono_6` (`telefono`),
  UNIQUE KEY `telefono_7` (`telefono`),
  KEY `fk_TIENDA_DIRECCION` (`id_direccion`),
  CONSTRAINT `fk_TIENDA_DIRECCION` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=541 DEFAULT CHARSET=utf8mb3;
--
-- Table structure for table `empleado`
--
CREATE TABLE `empleado` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido1` varchar(50) NOT NULL,
  `apellido2` varchar(50) NOT NULL,
  `DNI` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `sueldo` decimal(10,2) NOT NULL,
  `horario` varchar(50) NOT NULL,
  `rol` enum('Cajero','Repartidor','Técnico en Videojuegos','Gerente','Vendedor','Encargado de Stock') DEFAULT NULL,
  `fecha_contratacion` date NOT NULL,
  `id_tienda` int NOT NULL,
  `id_jefe` int DEFAULT NULL,
  `id_direccion` int NOT NULL,
  PRIMARY KEY (`id_empleado`),
  UNIQUE KEY `DNI` (`DNI`),
  UNIQUE KEY `DNI_2` (`DNI`),
  UNIQUE KEY `DNI_3` (`DNI`),
  UNIQUE KEY `DNI_4` (`DNI`),
  UNIQUE KEY `DNI_5` (`DNI`),
  UNIQUE KEY `DNI_6` (`DNI`),
  UNIQUE KEY `DNI_7` (`DNI`),
  UNIQUE KEY `DNI_8` (`DNI`),
  UNIQUE KEY `DNI_9` (`DNI`),
  UNIQUE KEY `DNI_10` (`DNI`),
  UNIQUE KEY `DNI_11` (`DNI`),
  UNIQUE KEY `DNI_12` (`DNI`),
  UNIQUE KEY `DNI_13` (`DNI`),
  UNIQUE KEY `DNI_14` (`DNI`),
  UNIQUE KEY `DNI_15` (`DNI`),
  UNIQUE KEY `DNI_16` (`DNI`),
  UNIQUE KEY `telefono` (`telefono`),
  UNIQUE KEY `telefono_2` (`telefono`),
  UNIQUE KEY `telefono_3` (`telefono`),
  KEY `fk_EMPLEADO_TIENDA` (`id_tienda`),
  KEY `fk_EMPLEADO_DIRECCION` (`id_direccion`),
  KEY `fk_EMPLEADO_JEFE` (`id_jefe`),
  CONSTRAINT `fk_EMPLEADO_DIRECCION` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_EMPLEADO_JEFE` FOREIGN KEY (`id_jefe`) REFERENCES `empleado` (`id_empleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_EMPLEADO_TIENDA` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`id_tienda`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `empleado_chk_1` CHECK ((`sueldo` >= 0)),
  CONSTRAINT `empleado_chk_10` CHECK ((`sueldo` >= 0)),
  CONSTRAINT `empleado_chk_2` CHECK ((`sueldo` >= 0)),
  CONSTRAINT `empleado_chk_3` CHECK ((`sueldo` >= 0)),
  CONSTRAINT `empleado_chk_4` CHECK ((`sueldo` >= 0)),
  CONSTRAINT `empleado_chk_5` CHECK ((`sueldo` >= 0)),
  CONSTRAINT `empleado_chk_6` CHECK ((`sueldo` >= 0)),
  CONSTRAINT `empleado_chk_7` CHECK ((`sueldo` >= 0)),
  CONSTRAINT `empleado_chk_8` CHECK ((`sueldo` >= 0)),
  CONSTRAINT `empleado_chk_9` CHECK ((`sueldo` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=541 DEFAULT CHARSET=utf8mb3;
--
-- Table structure for table `empresa`
--
CREATE TABLE `empresa` (
  `id_empresa` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `contacto` varchar(50) NOT NULL,
  `id_direccion` int NOT NULL,
  PRIMARY KEY (`id_empresa`),
  KEY `fk_EMPRESA_DIRECCION` (`id_direccion`),
  CONSTRAINT `fk_EMPRESA_DIRECCION` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=541 DEFAULT CHARSET=utf8mb3;
--
-- Table structure for table `juego`
--
CREATE TABLE `juego` (
  `id_juego` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `genero` enum('Aventura','RPG','Deportes','Accion','Shooter','Estrategia','Simulación') DEFAULT NULL,
  `plataforma` enum('PlayStation','PC','Xbox','Nintendo','Nintendo Switch') DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `anio_lanzamiento` date NOT NULL,
  `edad_recomendada` int NOT NULL,
  PRIMARY KEY (`id_juego`),
  CONSTRAINT `juego_chk_1` CHECK ((`precio` >= 0)),
  CONSTRAINT `juego_chk_10` CHECK ((`precio` >= 0)),
  CONSTRAINT `juego_chk_11` CHECK ((`edad_recomendada` > 0)),
  CONSTRAINT `juego_chk_12` CHECK ((`precio` >= 0)),
  CONSTRAINT `juego_chk_13` CHECK ((`edad_recomendada` > 0)),
  CONSTRAINT `juego_chk_14` CHECK ((`precio` >= 0)),
  CONSTRAINT `juego_chk_15` CHECK ((`edad_recomendada` > 0)),
  CONSTRAINT `juego_chk_16` CHECK ((`precio` >= 0)),
  CONSTRAINT `juego_chk_17` CHECK ((`edad_recomendada` > 0)),
  CONSTRAINT `juego_chk_18` CHECK ((`precio` >= 0)),
  CONSTRAINT `juego_chk_19` CHECK ((`edad_recomendada` > 0)),
  CONSTRAINT `juego_chk_2` CHECK ((`precio` >= 0)),
  CONSTRAINT `juego_chk_20` CHECK ((`precio` >= 0)),
  CONSTRAINT `juego_chk_21` CHECK ((`edad_recomendada` > 0)),
  CONSTRAINT `juego_chk_3` CHECK ((`precio` >= 0)),
  CONSTRAINT `juego_chk_4` CHECK ((`precio` >= 0)),
  CONSTRAINT `juego_chk_5` CHECK ((`precio` >= 0)),
  CONSTRAINT `juego_chk_6` CHECK ((`precio` >= 0)),
  CONSTRAINT `juego_chk_7` CHECK ((`edad_recomendada` > 0)),
  CONSTRAINT `juego_chk_8` CHECK ((`precio` >= 0)),
  CONSTRAINT `juego_chk_9` CHECK ((`edad_recomendada` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=1041 DEFAULT CHARSET=utf8mb3;
--
-- Table structure for table `pedido`
--
CREATE TABLE `pedido` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `forma_entrega` enum('fisico','online') DEFAULT NULL,
  `forma_pago` enum('efectivo','paypal','tarjeta_credito') DEFAULT NULL,
  `descuento` int NOT NULL,
  `id_cliente` int NOT NULL,
  `id_empleado` int NOT NULL,
  `id_direccion` int NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `fk_PEDIDO_CLIENTE` (`id_cliente`),
  KEY `fk_PEDIDO_EMPLEADO` (`id_empleado`),
  KEY `fk_PEDIDO_DIRECCION` (`id_direccion`),
  CONSTRAINT `fk_PEDIDO_CLIENTE` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_PEDIDO_DIRECCION` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_PEDIDO_EMPLEADO` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pedido_chk_1` CHECK ((`descuento` >= 0)),
  CONSTRAINT `pedido_chk_2` CHECK ((`descuento` >= 0)),
  CONSTRAINT `pedido_chk_3` CHECK ((`descuento` >= 0)),
  CONSTRAINT `pedido_chk_4` CHECK ((`descuento` >= 0)),
  CONSTRAINT `pedido_chk_5` CHECK ((`descuento` >= 0)),
  CONSTRAINT `pedido_chk_6` CHECK ((`descuento` >= 0)),
  CONSTRAINT `pedido_chk_7` CHECK ((`descuento` >= 0)),
  CONSTRAINT `pedido_chk_8` CHECK ((`descuento` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2002 DEFAULT CHARSET=utf8mb3;
--
-- Table structure for table `juego_pedido`
--
CREATE TABLE `juego_pedido` (
  `id_juego` int NOT NULL,
  `id_pedido` int NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`id_juego`,`id_pedido`),
  KEY `fk_JUEGO_PEDIDO_PEDIDO` (`id_pedido`),
  CONSTRAINT `fk_JUEGO_PEDIDO_JUEGO` FOREIGN KEY (`id_juego`) REFERENCES `juego` (`id_juego`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_JUEGO_PEDIDO_PEDIDO` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `juego_pedido_chk_1` CHECK ((`cantidad` > 0)),
  CONSTRAINT `juego_pedido_chk_10` CHECK ((`cantidad` >= 0)),
  CONSTRAINT `juego_pedido_chk_11` CHECK ((`cantidad` >= 0)),
  CONSTRAINT `juego_pedido_chk_12` CHECK ((`cantidad` >= 0)),
  CONSTRAINT `juego_pedido_chk_13` CHECK ((`cantidad` >= 0)),
  CONSTRAINT `juego_pedido_chk_2` CHECK ((`cantidad` > 0)),
  CONSTRAINT `juego_pedido_chk_3` CHECK ((`cantidad` > 0)),
  CONSTRAINT `juego_pedido_chk_4` CHECK ((`cantidad` > 0)),
  CONSTRAINT `juego_pedido_chk_5` CHECK ((`cantidad` > 0)),
  CONSTRAINT `juego_pedido_chk_6` CHECK ((`cantidad` >= 0)),
  CONSTRAINT `juego_pedido_chk_7` CHECK ((`cantidad` >= 0)),
  CONSTRAINT `juego_pedido_chk_8` CHECK ((`cantidad` >= 0)),
  CONSTRAINT `juego_pedido_chk_9` CHECK ((`cantidad` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
--
-- Table structure for table `tienda_juego_empresa`
--
CREATE TABLE `tienda_juego_empresa` (
  `id_tienda` int NOT NULL,
  `id_juego` int NOT NULL,
  `id_empresa` int NOT NULL,
  `fecha_abastecimiento` date NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_tienda`,`id_juego`,`id_empresa`),
  KEY `fk_TIENDA_JUEGO_EMPRESA_JUEGO` (`id_juego`),
  KEY `fk_TIENDA_JUEGO_EMPRESA_EMPRESA` (`id_empresa`),
  CONSTRAINT `fk_TIENDA_JUEGO_EMPRESA_EMPRESA` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_TIENDA_JUEGO_EMPRESA_JUEGO` FOREIGN KEY (`id_juego`) REFERENCES `juego` (`id_juego`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_TIENDA_JUEGO_EMPRESA_TIENDA` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`id_tienda`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tienda_juego_empresa_chk_1` CHECK ((`cantidad` >= 0)),
  CONSTRAINT `tienda_juego_empresa_chk_2` CHECK ((`cantidad` >= 0)),
  CONSTRAINT `tienda_juego_empresa_chk_3` CHECK ((`cantidad` >= 0)),
  CONSTRAINT `tienda_juego_empresa_chk_4` CHECK ((`cantidad` >= 0)),
  CONSTRAINT `tienda_juego_empresa_chk_5` CHECK ((`cantidad` >= 0)),
  CONSTRAINT `tienda_juego_empresa_chk_6` CHECK ((`cantidad` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dump completed on 2025-03-29 17:24:29
