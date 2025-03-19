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
  `DNI` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `fecha_registro` date NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `socio` varchar(50) NOT NULL,
  `id_direccion` int NOT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `fk_CLIENTE_DIRECCION` (`id_direccion`),
  CONSTRAINT `fk_CLIENTE_DIRECCION` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=541 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion` (
  `id_direccion` int NOT NULL AUTO_INCREMENT,
  `calle` varchar(100) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `municipio` varchar(50) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `comunidad` varchar(50) NOT NULL,
  `codigo_postal` varchar(10) NOT NULL,
  PRIMARY KEY (`id_direccion`)
) ENGINE=InnoDB AUTO_INCREMENT=541 DEFAULT CHARSET=utf8mb3;
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
  `DNI` varchar(20) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `sueldo` decimal(10,2) NOT NULL,
  `horario` varchar(50) NOT NULL,
  `rol` varchar(50) NOT NULL,
  `fecha_contratacion` date NOT NULL,
  `id_tienda` int NOT NULL,
  `id_jefe` int DEFAULT NULL,
  `id_direccion` int NOT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `fk_EMPLEADO_TIENDA` (`id_tienda`),
  KEY `fk_EMPLEADO_DIRECCION` (`id_direccion`),
  KEY `fk_EMPLEADO_JEFE` (`id_jefe`),
  CONSTRAINT `fk_EMPLEADO_DIRECCION` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_EMPLEADO_JEFE` FOREIGN KEY (`id_jefe`) REFERENCES `empleado` (`id_empleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_EMPLEADO_TIENDA` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`id_tienda`) ON DELETE CASCADE ON UPDATE CASCADE
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
  `telefono` varchar(15) NOT NULL,
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
  `genero` varchar(50) NOT NULL,
  `plataforma` varchar(50) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `anio_lanzamiento` date NOT NULL,
  `edad_recomendada` int NOT NULL,
  PRIMARY KEY (`id_juego`)
) ENGINE=InnoDB AUTO_INCREMENT=541 DEFAULT CHARSET=utf8mb3;
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
  CONSTRAINT `fk_JUEGO_PEDIDO_PEDIDO` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `juego_por_plataforma_y_tienda`
--

DROP TABLE IF EXISTS `juego_por_plataforma_y_tienda`;
/*!50001 DROP VIEW IF EXISTS `juego_por_plataforma_y_tienda`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `juego_por_plataforma_y_tienda` AS SELECT 
 1 AS `plataforma`,
 1 AS `id_tienda`,
 1 AS `count(*)`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `forma_entrega` varchar(50) NOT NULL,
  `forma_pago` varchar(50) NOT NULL,
  `descuento` decimal(5,2) DEFAULT NULL,
  `id_cliente` int NOT NULL,
  `id_empleado` int NOT NULL,
  `id_direccion` int NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `fk_PEDIDO_CLIENTE` (`id_cliente`),
  KEY `fk_PEDIDO_EMPLEADO` (`id_empleado`),
  KEY `fk_PEDIDO_DIRECCION` (`id_direccion`),
  CONSTRAINT `fk_PEDIDO_CLIENTE` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_PEDIDO_DIRECCION` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_PEDIDO_EMPLEADO` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=541 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tienda`
--

DROP TABLE IF EXISTS `tienda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tienda` (
  `id_tienda` int NOT NULL AUTO_INCREMENT,
  `horario` varchar(50) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fecha_apertura` date NOT NULL,
  `id_direccion` int NOT NULL,
  PRIMARY KEY (`id_tienda`),
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
  CONSTRAINT `fk_TIENDA_JUEGO_EMPRESA_TIENDA` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`id_tienda`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `juego_por_plataforma_y_tienda`
--

/*!50001 DROP VIEW IF EXISTS `juego_por_plataforma_y_tienda`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`proyectobd`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `juego_por_plataforma_y_tienda` AS select `j`.`plataforma` AS `plataforma`,`t`.`id_tienda` AS `id_tienda`,count(0) AS `count(*)` from ((`juego` `j` join `tienda_juego_empresa` `tje` on((`j`.`id_juego` = `tje`.`id_juego`))) join `tienda` `t` on((`tje`.`id_tienda` = `t`.`id_tienda`))) group by `j`.`plataforma`,`t`.`id_tienda` */;
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

-- Dump completed on 2025-03-19 22:07:48
