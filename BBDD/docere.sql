-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: docere
-- ------------------------------------------------------
-- Server version	5.7.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tArchivos`
--

DROP TABLE IF EXISTS `tArchivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tArchivos` (
  `idtArchivos` int(11) NOT NULL,
  `idCurso` int(11) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `source` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtArchivos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tArchivos`
--

LOCK TABLES `tArchivos` WRITE;
/*!40000 ALTER TABLE `tArchivos` DISABLE KEYS */;
INSERT INTO `tArchivos` VALUES (0,4,'Diploma curso','Img',''),(1,324,'Tabla periódica','Pdf',''),(2,2,'Espacios de color','Img',''),(3,45,'Poemas Ruben Darío','Pdf',''),(4,23,'Carta Magna','Img',''),(5,7,'Diccionario Inglés','Word',''),(6,45,'Diploma curso','Img',''),(7,44,'La Constitución','Img',''),(8,5,'AI','Img',''),(9,3,'Diploma curso','Pdf',''),(10,67,'Declinaciones Alemán','Word',''),(11,6,'Diploma curso','Pdf',''),(12,77,'Derecho penal','Word',''),(13,34,'Conjugaciones Arameo','Pdf',''),(14,12,'Diploma curso','Pdf',''),(15,21,'DL','Img',''),(16,44,'Ejemplos trigonometría','Pdf',''),(17,25,'Diploma curso','Img',''),(18,14,'Diploma curso','Pdf',''),(19,3,'Fuerzas Normales','Word',''),(20,56,'Diploma curso','Img','');
/*!40000 ALTER TABLE `tArchivos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tCategorias`
--

DROP TABLE IF EXISTS `tCategorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tCategorias` (
  `idtCategoria` int(11) NOT NULL,
  `categoria` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tCategorias`
--

LOCK TABLES `tCategorias` WRITE;
/*!40000 ALTER TABLE `tCategorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `tCategorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tCursos`
--

DROP TABLE IF EXISTS `tCursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tCursos` (
  `idtCursos` int(11) NOT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `categoria` int(11) DEFAULT NULL,
  `certificado` varchar(45) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `idioma` varchar(45) DEFAULT NULL,
  `tArchivos_idtArchivos` int(11) NOT NULL,
  `tCategorias_idtCategoria` int(11) NOT NULL,
  PRIMARY KEY (`idtCursos`,`tArchivos_idtArchivos`,`tCategorias_idtCategoria`),
  KEY `fk_tCursos_tArchivos1_idx` (`tArchivos_idtArchivos`),
  KEY `fk_tCursos_tCategorias1_idx` (`tCategorias_idtCategoria`),
  CONSTRAINT `fk_tCursos_tArchivos1` FOREIGN KEY (`tArchivos_idtArchivos`) REFERENCES `tArchivos` (`idtArchivos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tCursos_tCategorias1` FOREIGN KEY (`tCategorias_idtCategoria`) REFERENCES `tCategorias` (`idtCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tCursos`
--

LOCK TABLES `tCursos` WRITE;
/*!40000 ALTER TABLE `tCursos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tCursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tCursos_has_tLicencias`
--

DROP TABLE IF EXISTS `tCursos_has_tLicencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tCursos_has_tLicencias` (
  `tCursos_idtCursos` int(11) NOT NULL,
  `tCursos_tArchivos_idtArchivos` int(11) NOT NULL,
  `tLicencias_idtLicencias` int(11) NOT NULL,
  PRIMARY KEY (`tCursos_idtCursos`,`tCursos_tArchivos_idtArchivos`,`tLicencias_idtLicencias`),
  KEY `fk_tCursos_has_tLicencias_tLicencias1_idx` (`tLicencias_idtLicencias`),
  KEY `fk_tCursos_has_tLicencias_tCursos1_idx` (`tCursos_idtCursos`,`tCursos_tArchivos_idtArchivos`),
  CONSTRAINT `fk_tCursos_has_tLicencias_tCursos1` FOREIGN KEY (`tCursos_idtCursos`, `tCursos_tArchivos_idtArchivos`) REFERENCES `tCursos` (`idtCursos`, `tArchivos_idtArchivos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tCursos_has_tLicencias_tLicencias1` FOREIGN KEY (`tLicencias_idtLicencias`) REFERENCES `tLicencias` (`idtLicencias`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tCursos_has_tLicencias`
--

LOCK TABLES `tCursos_has_tLicencias` WRITE;
/*!40000 ALTER TABLE `tCursos_has_tLicencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `tCursos_has_tLicencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tFacturas`
--

DROP TABLE IF EXISTS `tFacturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tFacturas` (
  `idtFacturas` int(11) NOT NULL,
  `idUsuarios` int(11) DEFAULT NULL,
  `idCurso` int(11) DEFAULT NULL,
  `nroFactura` varchar(45) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `baseImponible` float DEFAULT NULL,
  `iva` int(11) DEFAULT NULL,
  `total` float DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `tIVA_idtIVA` int(11) NOT NULL,
  PRIMARY KEY (`idtFacturas`,`tIVA_idtIVA`),
  KEY `fk_tFacturas_tIVA1_idx` (`tIVA_idtIVA`),
  CONSTRAINT `fk_tFacturas_tIVA1` FOREIGN KEY (`tIVA_idtIVA`) REFERENCES `tIVA` (`idtIVA`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tFacturas`
--

LOCK TABLES `tFacturas` WRITE;
/*!40000 ALTER TABLE `tFacturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tFacturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tFacturas_has_tLineaFactura`
--

DROP TABLE IF EXISTS `tFacturas_has_tLineaFactura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tFacturas_has_tLineaFactura` (
  `tFacturas_idtFacturas` int(11) NOT NULL,
  `tLineaFactura_idtLineaFactura` int(11) NOT NULL,
  PRIMARY KEY (`tFacturas_idtFacturas`,`tLineaFactura_idtLineaFactura`),
  KEY `fk_tFacturas_has_tLineaFactura_tLineaFactura1_idx` (`tLineaFactura_idtLineaFactura`),
  KEY `fk_tFacturas_has_tLineaFactura_tFacturas1_idx` (`tFacturas_idtFacturas`),
  CONSTRAINT `fk_tFacturas_has_tLineaFactura_tFacturas1` FOREIGN KEY (`tFacturas_idtFacturas`) REFERENCES `tFacturas` (`idtFacturas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tFacturas_has_tLineaFactura_tLineaFactura1` FOREIGN KEY (`tLineaFactura_idtLineaFactura`) REFERENCES `tLineaFactura` (`idtLineaFactura`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tFacturas_has_tLineaFactura`
--

LOCK TABLES `tFacturas_has_tLineaFactura` WRITE;
/*!40000 ALTER TABLE `tFacturas_has_tLineaFactura` DISABLE KEYS */;
/*!40000 ALTER TABLE `tFacturas_has_tLineaFactura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tIVA`
--

DROP TABLE IF EXISTS `tIVA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tIVA` (
  `idtIVA` int(11) NOT NULL,
  `valor` int(11) DEFAULT NULL,
  PRIMARY KEY (`idtIVA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tIVA`
--

LOCK TABLES `tIVA` WRITE;
/*!40000 ALTER TABLE `tIVA` DISABLE KEYS */;
/*!40000 ALTER TABLE `tIVA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tIdiomas`
--

DROP TABLE IF EXISTS `tIdiomas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tIdiomas` (
  `idtIdiomas` int(11) NOT NULL,
  `idioma` varchar(45) DEFAULT NULL,
  `tCursos_idtCursos` int(11) NOT NULL,
  `tCursos_tArchivos_idtArchivos` int(11) NOT NULL,
  PRIMARY KEY (`idtIdiomas`,`tCursos_idtCursos`,`tCursos_tArchivos_idtArchivos`),
  KEY `fk_tIdiomas_tCursos1_idx` (`tCursos_idtCursos`,`tCursos_tArchivos_idtArchivos`),
  CONSTRAINT `fk_tIdiomas_tCursos1` FOREIGN KEY (`tCursos_idtCursos`, `tCursos_tArchivos_idtArchivos`) REFERENCES `tCursos` (`idtCursos`, `tArchivos_idtArchivos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tIdiomas`
--

LOCK TABLES `tIdiomas` WRITE;
/*!40000 ALTER TABLE `tIdiomas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tIdiomas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tLicencias`
--

DROP TABLE IF EXISTS `tLicencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tLicencias` (
  `idtLicencias` int(11) NOT NULL,
  `idCurso` int(11) DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `nroLicencias` int(11) DEFAULT NULL,
  PRIMARY KEY (`idtLicencias`),
  KEY `idUsuario_idx` (`idUsuario`),
  CONSTRAINT `idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `tUsuarios` (`idtUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tLicencias`
--

LOCK TABLES `tLicencias` WRITE;
/*!40000 ALTER TABLE `tLicencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `tLicencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tLineaFactura`
--

DROP TABLE IF EXISTS `tLineaFactura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tLineaFactura` (
  `idtLineaFactura` int(11) NOT NULL,
  `idfactura` int(11) DEFAULT NULL,
  `idCurso` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `baseImponible` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  PRIMARY KEY (`idtLineaFactura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tLineaFactura`
--

LOCK TABLES `tLineaFactura` WRITE;
/*!40000 ALTER TABLE `tLineaFactura` DISABLE KEYS */;
/*!40000 ALTER TABLE `tLineaFactura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tRoles`
--

DROP TABLE IF EXISTS `tRoles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tRoles` (
  `idtRoles` int(11) NOT NULL,
  `subirVideo` tinyint(1) DEFAULT NULL,
  `editarVideo` tinyint(1) DEFAULT NULL,
  `validarVideo` tinyint(1) DEFAULT NULL,
  `crearCurso` tinyint(1) DEFAULT NULL,
  `editarCurso` tinyint(1) DEFAULT NULL,
  `validarCurso` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idtRoles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tRoles`
--

LOCK TABLES `tRoles` WRITE;
/*!40000 ALTER TABLE `tRoles` DISABLE KEYS */;
/*!40000 ALTER TABLE `tRoles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tUsuarios`
--

DROP TABLE IF EXISTS `tUsuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tUsuarios` (
  `idtUsuarios` int(11) NOT NULL,
  `rol` smallint(1) DEFAULT NULL,
  `alias` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `fechaInscripcion` date DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `tf` varchar(45) DEFAULT NULL,
  `datosFactura` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `CIF` varchar(45) DEFAULT NULL,
  `datosAcadm` longtext,
  `Cv` longtext,
  `Nivel` int(11) DEFAULT NULL,
  `img` blob,
  `tRoles_idtRoles` int(11) NOT NULL,
  `tFacturas_idtFacturas` int(11) NOT NULL,
  `tRoles_idtRoles1` int(11) NOT NULL,
  PRIMARY KEY (`idtUsuarios`,`tRoles_idtRoles`,`tFacturas_idtFacturas`,`tRoles_idtRoles1`),
  KEY `fk_tUsuarios_tFacturas1_idx` (`tFacturas_idtFacturas`),
  KEY `fk_tUsuarios_tRoles1_idx` (`tRoles_idtRoles1`),
  CONSTRAINT `fk_tUsuarios_tFacturas1` FOREIGN KEY (`tFacturas_idtFacturas`) REFERENCES `tFacturas` (`idtFacturas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tUsuarios_tRoles1` FOREIGN KEY (`tRoles_idtRoles1`) REFERENCES `tRoles` (`idtRoles`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tUsuarios`
--

LOCK TABLES `tUsuarios` WRITE;
/*!40000 ALTER TABLE `tUsuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tUsuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tUsuarios_has_tCursos`
--

DROP TABLE IF EXISTS `tUsuarios_has_tCursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tUsuarios_has_tCursos` (
  `tUsuarios_idtUsuarios` int(11) NOT NULL,
  `tCursos_idtCursos` int(11) NOT NULL,
  PRIMARY KEY (`tUsuarios_idtUsuarios`,`tCursos_idtCursos`),
  KEY `fk_tUsuarios_has_tCursos_tCursos1_idx` (`tCursos_idtCursos`),
  KEY `fk_tUsuarios_has_tCursos_tUsuarios_idx` (`tUsuarios_idtUsuarios`),
  CONSTRAINT `fk_tUsuarios_has_tCursos_tCursos1` FOREIGN KEY (`tCursos_idtCursos`) REFERENCES `tCursos` (`idtCursos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tUsuarios_has_tCursos_tUsuarios` FOREIGN KEY (`tUsuarios_idtUsuarios`) REFERENCES `tUsuarios` (`idtUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tUsuarios_has_tCursos`
--

LOCK TABLES `tUsuarios_has_tCursos` WRITE;
/*!40000 ALTER TABLE `tUsuarios_has_tCursos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tUsuarios_has_tCursos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-17 18:13:10
