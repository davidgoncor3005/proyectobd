-- MySQL dump 10.13  Distrib 8.0.41, for Linux (x86_64)
--
-- Host: localhost    Database: GameExpress2
-- ------------------------------------------------------
-- Server version	8.0.41-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `antigüedad_sueldo_empleados_promedio`
--

DROP TABLE IF EXISTS `antigüedad_sueldo_empleados_promedio`;
/*!50001 DROP VIEW IF EXISTS `antigüedad_sueldo_empleados_promedio`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `antigüedad_sueldo_empleados_promedio` AS SELECT 
 1 AS `rol`,
 1 AS `ROUND(AVG(DATEDIFF(CURDATE(), e.fecha_contratacion) / 365), 2)`,
 1 AS `ROUND(AVG(e.sueldo), 2)`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `cliente_mas_valiosos`
--

DROP TABLE IF EXISTS `cliente_mas_valiosos`;
/*!50001 DROP VIEW IF EXISTS `cliente_mas_valiosos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cliente_mas_valiosos` AS SELECT 
 1 AS `id_cliente`,
 1 AS `CONCAT(c.nombre, ' ', c.apellido1, ' ', c.apellido2)`,
 1 AS `COUNT(DISTINCT p.id_pedido)`,
 1 AS `SUM(jp.cantidad)`,
 1 AS `SUM(jp.cantidad * j.precio)`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `juego`
--

DROP TABLE IF EXISTS `juego`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `juego_pedido`
--

DROP TABLE IF EXISTS `juego_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insertar_pedido` BEFORE INSERT ON `pedido` FOR EACH ROW BEGIN
  -- Verificamos si el pedido corresponde al año actual
  IF YEAR(NEW.fecha) != YEAR(CURDATE()) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'EL PEDIDO NO CORRESPONDE AL AÑO ACTUAL';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `pedidos_maximos` BEFORE INSERT ON `pedido` FOR EACH ROW BEGIN
  DECLARE numpedidos INT;

  -- Se cuenta cuantos pedidos ha hecho ese cliente en el mismo mes del nuevo pedido
  SELECT COUNT(*) INTO numpedidos
  FROM pedido p
  WHERE p.id_cliente = NEW.id_cliente 
  AND MONTH(p.fecha) = MONTH(NEW.fecha);

  -- Si ya tiene 3 o más, no se permite insertar
  IF numpedidos >= 3 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'EL CLIENTE HA REALIZADO MÁS DE 3 PEDIDOS ESTE MES';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tienda`
--

DROP TABLE IF EXISTS `tienda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tienda_juego_empresa`
--

DROP TABLE IF EXISTS `tienda_juego_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `antigüedad_sueldo_empleados_promedio`
--

/*!50001 DROP VIEW IF EXISTS `antigüedad_sueldo_empleados_promedio`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `antigüedad_sueldo_empleados_promedio` AS select `e`.`rol` AS `rol`,round(avg(((to_days(curdate()) - to_days(`e`.`fecha_contratacion`)) / 365)),2) AS `ROUND(AVG(DATEDIFF(CURDATE(), e.fecha_contratacion) / 365), 2)`,round(avg(`e`.`sueldo`),2) AS `ROUND(AVG(e.sueldo), 2)` from `empleado` `e` group by `e`.`rol` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cliente_mas_valiosos`
--

/*!50001 DROP VIEW IF EXISTS `cliente_mas_valiosos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cliente_mas_valiosos` AS select `c`.`id_cliente` AS `id_cliente`,concat(`c`.`nombre`,' ',`c`.`apellido1`,' ',`c`.`apellido2`) AS `CONCAT(c.nombre, ' ', c.apellido1, ' ', c.apellido2)`,count(distinct `p`.`id_pedido`) AS `COUNT(DISTINCT p.id_pedido)`,sum(`jp`.`cantidad`) AS `SUM(jp.cantidad)`,sum((`jp`.`cantidad` * `j`.`precio`)) AS `SUM(jp.cantidad * j.precio)` from (((`cliente` `c` join `pedido` `p` on((`c`.`id_cliente` = `p`.`id_cliente`))) join `juego_pedido` `jp` on((`p`.`id_pedido` = `jp`.`id_pedido`))) join `juego` `j` on((`jp`.`id_juego` = `j`.`id_juego`))) group by `c`.`id_cliente`,`c`.`nombre`,`c`.`apellido1`,`c`.`apellido2` order by sum((`jp`.`cantidad` * `j`.`precio`)) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-29 14:21:51
