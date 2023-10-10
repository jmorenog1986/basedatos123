-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: prueba3
-- ------------------------------------------------------
-- Server version	10.4.27-MariaDB-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `documento` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `telefono` int(10) DEFAULT NULL,
  PRIMARY KEY (`documento`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datoscontacto`
--

DROP TABLE IF EXISTS `datoscontacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datoscontacto` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `direccion` varchar(45) NOT NULL,
  `descripcion` int(10) DEFAULT NULL,
  `Clientesdocumento` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datoscontacto`
--

LOCK TABLES `datoscontacto` WRITE;
/*!40000 ALTER TABLE `datoscontacto` DISABLE KEYS */;
/*!40000 ALTER TABLE `datoscontacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datoscontacto_clientes`
--

DROP TABLE IF EXISTS `datoscontacto_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datoscontacto_clientes` (
  `DatosContactoid` int(10) NOT NULL,
  `Clientesdocumento` int(10) NOT NULL,
  PRIMARY KEY (`DatosContactoid`,`Clientesdocumento`),
  KEY `FKDatosConta192036` (`Clientesdocumento`),
  CONSTRAINT `FKDatosConta145772` FOREIGN KEY (`DatosContactoid`) REFERENCES `datoscontacto` (`id`),
  CONSTRAINT `FKDatosConta192036` FOREIGN KEY (`Clientesdocumento`) REFERENCES `clientes` (`documento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datoscontacto_clientes`
--

LOCK TABLES `datoscontacto_clientes` WRITE;
/*!40000 ALTER TABLE `datoscontacto_clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `datoscontacto_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facturas` (
  `numero` int(10) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Sedesid` int(10) NOT NULL,
  `Clientesdocumento` int(10) NOT NULL,
  PRIMARY KEY (`numero`),
  KEY `FKFacturas627250` (`Sedesid`),
  KEY `FKFacturas450090` (`Clientesdocumento`),
  CONSTRAINT `FKFacturas450090` FOREIGN KEY (`Clientesdocumento`) REFERENCES `clientes` (`documento`),
  CONSTRAINT `FKFacturas627250` FOREIGN KEY (`Sedesid`) REFERENCES `sedes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ivas`
--

DROP TABLE IF EXISTS `ivas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ivas` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `iva` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ivas`
--

LOCK TABLES `ivas` WRITE;
/*!40000 ALTER TABLE `ivas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ivas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preciosproducto`
--

DROP TABLE IF EXISTS `preciosproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preciosproducto` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `precio` decimal(19,2) NOT NULL DEFAULT 0.00,
  `Productosid2` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKPreciosPro369277` (`Productosid2`),
  CONSTRAINT `FKPreciosPro369277` FOREIGN KEY (`Productosid2`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preciosproducto`
--

LOCK TABLES `preciosproducto` WRITE;
/*!40000 ALTER TABLE `preciosproducto` DISABLE KEYS */;
/*!40000 ALTER TABLE `preciosproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `categoria` varchar(45) NOT NULL,
  `catidad` int(10) NOT NULL DEFAULT 0,
  `Ivasid` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKProductos628235` (`Ivasid`),
  CONSTRAINT `FKProductos628235` FOREIGN KEY (`Ivasid`) REFERENCES `ivas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prueba`
--

DROP TABLE IF EXISTS `prueba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prueba` (
  `idPrueba` int(11) NOT NULL,
  `Ejemplo` varchar(45) DEFAULT '0',
  PRIMARY KEY (`idPrueba`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prueba`
--

LOCK TABLES `prueba` WRITE;
/*!40000 ALTER TABLE `prueba` DISABLE KEYS */;
/*!40000 ALTER TABLE `prueba` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prueba_has_clientes`
--

DROP TABLE IF EXISTS `prueba_has_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prueba_has_clientes` (
  `Prueba_idPrueba` int(11) NOT NULL,
  `clientes_documento` int(10) NOT NULL,
  PRIMARY KEY (`Prueba_idPrueba`,`clientes_documento`),
  KEY `fk_Prueba_has_clientes_clientes1_idx` (`clientes_documento`),
  KEY `fk_Prueba_has_clientes_Prueba1_idx` (`Prueba_idPrueba`),
  CONSTRAINT `fk_Prueba_has_clientes_Prueba1` FOREIGN KEY (`Prueba_idPrueba`) REFERENCES `prueba` (`idPrueba`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Prueba_has_clientes_clientes1` FOREIGN KEY (`clientes_documento`) REFERENCES `clientes` (`documento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prueba_has_clientes`
--

LOCK TABLES `prueba_has_clientes` WRITE;
/*!40000 ALTER TABLE `prueba_has_clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `prueba_has_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sedes`
--

DROP TABLE IF EXISTS `sedes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sedes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ciudad` varchar(45) NOT NULL,
  `telefono` int(10) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `cp` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sedes`
--

LOCK TABLES `sedes` WRITE;
/*!40000 ALTER TABLE `sedes` DISABLE KEYS */;
/*!40000 ALTER TABLE `sedes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventasporfacturas`
--

DROP TABLE IF EXISTS `ventasporfacturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventasporfacturas` (
  `cantidad` int(10) NOT NULL,
  `Facturasid` int(10) NOT NULL,
  `Productosid2` int(10) NOT NULL,
  PRIMARY KEY (`Facturasid`,`Productosid2`),
  KEY `FKVentasPorF551771` (`Productosid2`),
  CONSTRAINT `FKVentasPorF551771` FOREIGN KEY (`Productosid2`) REFERENCES `productos` (`id`),
  CONSTRAINT `FKVentasPorF685875` FOREIGN KEY (`Facturasid`) REFERENCES `facturas` (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventasporfacturas`
--

LOCK TABLES `ventasporfacturas` WRITE;
/*!40000 ALTER TABLE `ventasporfacturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventasporfacturas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-09 21:42:49
