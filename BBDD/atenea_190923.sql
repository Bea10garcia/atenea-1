-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: atenea
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
-- Table structure for table `tarchivos`
--

DROP TABLE IF EXISTS `tarchivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarchivos` (
  `idArchivo` int(11) NOT NULL,
  `idCurso` int(11) DEFAULT NULL,
  `Nombre` text,
  `tipo` text,
  `Source` text,
  PRIMARY KEY (`idArchivo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarchivos`
--

LOCK TABLES `tarchivos` WRITE;
/*!40000 ALTER TABLE `tarchivos` DISABLE KEYS */;
INSERT INTO `tarchivos` VALUES (0,4,'Diploma curso','Img',''),(1,324,'Tabla periódica','Pdf',''),(2,2,'Espacios de color','Img',''),(3,45,'Poemas Ruben Darío','Pdf',''),(4,23,'Carta Magna','Img',''),(5,7,'Diccionario Inglés','Word',''),(6,45,'Diploma curso','Img',''),(7,44,'La Constitución','Img',''),(8,5,'AI','Img',''),(9,3,'Diploma curso','Pdf',''),(10,67,'Declinaciones Alemán','Word',''),(11,6,'Diploma curso','Pdf',''),(12,77,'Derecho penal','Word',''),(13,34,'Conjugaciones Arameo','Pdf',''),(14,12,'Diploma curso','Pdf',''),(15,21,'DL','Img',''),(16,44,'Ejemplos trigonometría','Pdf',''),(17,25,'Diploma curso','Img',''),(18,14,'Diploma curso','Pdf',''),(19,3,'Fuerzas Normales','Word',''),(20,56,'Diploma curso','Img','');
/*!40000 ALTER TABLE `tarchivos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbill`
--

DROP TABLE IF EXISTS `tbill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbill` (
  `idFactura` int(11) NOT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `fecha` text,
  `numeroFactura` text,
  `baseImponible` text,
  `iva` text,
  `total` int(11) DEFAULT NULL,
  `estado` text,
  `tlineafactura_idFactura` int(11) NOT NULL,
  PRIMARY KEY (`idFactura`,`tlineafactura_idFactura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbill`
--

LOCK TABLES `tbill` WRITE;
/*!40000 ALTER TABLE `tbill` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbill_has_tbillline`
--

DROP TABLE IF EXISTS `tbill_has_tbillline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbill_has_tbillline` (
  `tfacturas_idFactura` int(11) NOT NULL,
  `tfacturas_tlineafactura_idFactura` int(11) NOT NULL,
  `tlineafactura_idFactura` int(11) NOT NULL,
  PRIMARY KEY (`tfacturas_idFactura`,`tfacturas_tlineafactura_idFactura`,`tlineafactura_idFactura`),
  KEY `fk_tfacturas_has_tlineafactura_tlineafactura1_idx` (`tlineafactura_idFactura`),
  KEY `fk_tfacturas_has_tlineafactura_tfacturas1_idx` (`tfacturas_idFactura`,`tfacturas_tlineafactura_idFactura`),
  CONSTRAINT `fk_tfacturas_has_tlineafactura_tfacturas1` FOREIGN KEY (`tfacturas_idFactura`, `tfacturas_tlineafactura_idFactura`) REFERENCES `tbill` (`idFactura`, `tlineafactura_idFactura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tfacturas_has_tlineafactura_tlineafactura1` FOREIGN KEY (`tlineafactura_idFactura`) REFERENCES `tbillline` (`idFactura`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbill_has_tbillline`
--

LOCK TABLES `tbill_has_tbillline` WRITE;
/*!40000 ALTER TABLE `tbill_has_tbillline` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbill_has_tbillline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbillline`
--

DROP TABLE IF EXISTS `tbillline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbillline` (
  `idFactura` int(11) NOT NULL,
  `idLineaFactura` text,
  `idProducto` text,
  `cantidad` int(11) DEFAULT NULL,
  `idIva` int(11) DEFAULT NULL,
  `baseImponible` text,
  `total` int(11) DEFAULT NULL,
  `iva` text,
  PRIMARY KEY (`idFactura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbillline`
--

LOCK TABLES `tbillline` WRITE;
/*!40000 ALTER TABLE `tbillline` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbillline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcourses`
--

DROP TABLE IF EXISTS `tcourses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcourses` (
  `IdCurso` int(11) NOT NULL,
  `Título` text,
  `Categoría` int(11) DEFAULT NULL,
  `Certificado` int(11) DEFAULT NULL,
  `Precio` text,
  `IdiomaCurso` int(11) DEFAULT NULL,
  `tlicencias_idLicencia` int(11) NOT NULL,
  `idProfesor` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdCurso`,`tlicencias_idLicencia`),
  KEY `curso_profe_idx` (`idProfesor`),
  CONSTRAINT `curso_profe` FOREIGN KEY (`idProfesor`) REFERENCES `tusuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcourses`
--

LOCK TABLES `tcourses` WRITE;
/*!40000 ALTER TABLE `tcourses` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcourses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcourses_has_tfiles`
--

DROP TABLE IF EXISTS `tcourses_has_tfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcourses_has_tfiles` (
  `tcursos_Id Curso` int(11) NOT NULL,
  `tarchivos_idArchivo` int(11) NOT NULL,
  PRIMARY KEY (`tcursos_Id Curso`,`tarchivos_idArchivo`),
  KEY `fk_tcursos_has_tarchivos_tarchivos1_idx` (`tarchivos_idArchivo`),
  KEY `fk_tcursos_has_tarchivos_tcursos1_idx` (`tcursos_Id Curso`),
  CONSTRAINT `fk_tcursos_has_tarchivos_tarchivos1` FOREIGN KEY (`tarchivos_idArchivo`) REFERENCES `tfiles` (`idArchivo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tcursos_has_tarchivos_tcursos1` FOREIGN KEY (`tcursos_Id Curso`) REFERENCES `tcourses` (`IdCurso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcourses_has_tfiles`
--

LOCK TABLES `tcourses_has_tfiles` WRITE;
/*!40000 ALTER TABLE `tcourses_has_tfiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcourses_has_tfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcursos`
--

DROP TABLE IF EXISTS `tcursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcursos` (
  `IdCurso` int(11) NOT NULL,
  `titulo` text,
  `categoria` int(11) DEFAULT NULL,
  `certificado` int(11) DEFAULT NULL,
  `precio` text,
  `idioma_curso` int(11) DEFAULT NULL,
  `fecha_inclusion` date DEFAULT NULL,
  `idProfe` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdCurso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcursos`
--

LOCK TABLES `tcursos` WRITE;
/*!40000 ALTER TABLE `tcursos` DISABLE KEYS */;
INSERT INTO `tcursos` VALUES (1,'Architecture Studio: Building in Landscapes',1,0,'$149',1,'2019-01-13',6),(2,'Roman Architecture',1,0,'$150',1,'2019-03-04',5),(3,'The Architectural Imagination ',1,0,'$45',1,'2019-01-13',7),(4,'Theory of City Form',1,0,'$15',1,'2019-07-29',6),(5,'Aesthetics & the Philosophy of Art',2,1,'$20',1,'2019-05-24',7),(6,'Digital Photography',21,1,'$200',1,'2019-05-07',5),(7,'Introduction to Visual Design',2,1,'$100',1,'2019-08-26',7),(8,'Introduction to Visual Thinking',2,1,'$199',1,'2019-09-01',5),(9,'Italian Renaissance',2,0,'$149',1,'2019-08-28',6),(10,'Italic Calligraphy & Handwriting',2,0,'$150',1,'2019-07-21',6),(11,'Photography',21,1,'$45',1,'2019-01-22',7),(12,'Ancient and Medieval Philosophy',19,0,'$15',1,'2019-05-22',7),(13,'Ancient Greece: City and Society',19,1,'$20',1,'2019-03-19',5),(14,'Ancient Philosophy',19,1,'$200',1,'2018-12-30',6),(15,'Classical Mythology',19,1,'$100',1,'2019-04-04',6),(16,'Concepts of the Hero in Greek Civilization',19,1,'$199',1,'2019-07-26',5),(17,'Virgil’s Aeneid: Anatomy of a Classic',19,0,'$149',1,'2019-07-07',5),(19,'Virgil’s Aeneid: Anatomy of a Classic II',19,0,'$149',1,'2019-02-24',6),(20,'Advanced Political Economy',6,0,'$45',1,'2019-02-13',6),(21,'American Capitalism: A History',6,1,'$15',1,'2019-04-02',7),(22,'Behavioral Finance',6,0,'$20',1,'2019-03-01',5),(23,'Capitalism: Success',6,1,'$15',1,'2019-03-01',5),(24,'Crisis',6,1,'$15',1,'2019-06-01',6),(25,'Economic Geography of the Industrial World',6,1,'$199',1,'2019-01-16',6),(26,'Economic History of the Soviet Union',6,0,'$149',1,'2019-09-16',5),(27,'Economic Statistics and Econometrics',6,0,'$150',1,'2019-03-24',6),(28,'Finance Theory 1',6,0,'$45',1,'2018-12-02',7),(29,'Financial Markets ',6,1,'$15',1,'2019-08-27',5),(30,'Global Poverty and Impact Evaluation',6,1,'$20',1,'2019-04-28',5),(31,'Great Economists: Classical Economics and its Forerunners',6,1,'$200',1,'2019-07-27',5),(32,'History of Economic Theory',6,0,'$100',1,'2019-05-02',5),(33,'Intermediate Microeconomic Theory',6,0,'$199',1,'2019-01-17',6),(34,'International Finance',6,1,'$149',1,'2019-02-25',7),(35,'International Political Economy',6,1,'$150',1,'2019-09-19',5),(36,'International Trade ',6,0,'$45',1,'2018-12-06',5),(37,'International Trade',6,0,'$15',1,'2019-01-27',6),(38,'Introduction to Economics',6,0,'$20',1,'2019-08-29',6),(39,'Introduction to Environmental Economics and Policy',6,0,'$200',1,'2019-09-17',7),(40,'Law and Economics I',6,0,'$100',1,'2019-01-10',5),(41,'Lectures on Human Capital',6,0,'$199',1,'2019-07-25',6),(42,'Marx\'s Kapital: Volumes 1 and 2',6,0,'$149',1,'2019-05-14',5),(43,'Marxian Economic',6,0,'$150',1,'2019-03-27',5),(44,'Mexico’s Economy: Current Prospects and History',6,0,'$45',1,'2019-03-05',5),(45,'Microeconomic Theory with Application to Natural Resources',6,1,'$15',1,'2019-04-04',6),(46,'Money and Banking',6,1,'$20',1,'2019-01-13',5),(47,'Money',6,1,'$20',1,'2019-04-30',6),(48,'Money Skills',6,0,'$100',1,'2018-12-25',7),(49,'Poker Theory and Analytics',6,0,'$199',1,'2019-09-01',6),(50,'Political Economy After the Crisis',6,0,'$149',1,'2019-03-13',5),(51,'Principles of Economics: Microeconomics',6,1,'$150',1,'2019-09-19',7),(52,'Principles of Economics: Macroeconomics',6,1,'$45',1,'2019-08-15',6),(53,'Principles of Microeconomics',6,1,'$15',1,'2019-03-28',6),(54,'Psychology and Economics ',6,0,'$20',1,'2019-03-26',6),(55,'Public Economics and Finance',6,0,'$200',1,'2019-07-19',7),(56,'Radical Capitalism',6,0,'$100',1,'2019-07-01',5),(57,'Sports Economics',6,1,'$199',1,'2019-02-10',6),(58,'The Eurozone Crisis',6,1,'$149',1,'2018-12-26',6),(59,'Biochemistry 1',3,1,'$150',1,'2019-07-07',7),(60,'Chemistry (Chemical Stoichiometry)',3,1,'$45',1,'2019-03-27',5),(61,'Core Concepts in Chemistry',3,1,'$15',1,'2019-07-22',5),(62,'Chemical Structure and Reactivity',3,0,'$20',1,'2019-07-11',7),(63,'Advanced Algorithms',4,1,'$200',1,'2019-03-27',5),(64,'Advanced Operating Systems Structures and Implementation',4,0,'$100',1,'2019-07-08',6),(65,'Crash Course in Design Thinking',5,0,'$199',1,'2019-05-02',5),(66,'Everything I Know',5,0,'$149',1,'2019-03-16',5),(67,'Geology',7,1,'$150',1,'2019-02-15',6),(68,'Engineering',8,1,'$45',1,'2019-02-05',6),(69,'Engineering - Signals and Systems',8,1,'$15',1,'2019-03-21',7),(70,'Engineering Dynamics',8,1,'$20',1,'2019-01-24',7),(71,'Electronic Techniques for Engineering',8,1,'$200',1,'2019-08-03',5),(72,'Engineering Statics',8,1,'$100',1,'2019-05-17',6),(73,'Environmental Air Pollution',9,1,'$199',1,'2019-03-18',5),(74,'Australian Environmental History',9,1,'$149',1,'2019-01-07',5),(75,'Adaptation to Climate Change',9,1,'$150',1,'2019-05-20',6),(76,'Education for Sustainable Living: Environment',9,1,'$45',1,'2019-04-22',5),(77,'Energy Regulations and the Environment',9,1,'$15',1,'2019-06-22',6),(78,'Environmental Economics & Policy',9,1,'$20',1,'2019-09-22',5),(79,'Introduction to Visual Design',5,1,'$200',1,'2019-08-30',5),(80,'Environmental Politics and Law',9,1,'$100',1,'2019-05-29',6),(81,'Ethical Challenges in Public Health Interventions: Catastrophic and Routine',10,0,'$199',1,'2019-02-21',5),(82,'Food and the Environment',11,0,'$149',1,'2019-05-26',5),(83,'Basic Concepts of Music Theory',18,0,'$150',1,'2019-01-11',5),(84,'Food Production',11,0,'$15',1,'2019-09-07',7),(85,'Nutrition Education for Cancer Prevention',11,0,'$15',1,'2019-02-22',5),(86,'Arabic Elementary Course',14,0,'$20',1,'2019-05-29',5),(87,'Français pour débutant',14,1,'$200',1,'2019-01-21',5),(88,'Chinese for beginners',14,1,'$100',1,'2018-12-24',5),(89,'German for beginners',14,1,'$199',1,'2019-08-22',5),(90,'Japanese for beginners',14,1,'$149',1,'2019-01-26',5),(91,'Russian for beginners',14,1,'$150',1,'2019-03-05',6),(92,'Portuguese for beginners',14,1,'$45',1,'2018-12-06',7),(93,'Common Law',15,1,'$15',1,'2019-01-19',6),(94,'Ruso para principiantes',14,0,'$20',2,'2019-07-22',5),(95,'Child Nutrition and Cooking',11,0,'$200',1,'2019-04-05',5),(96,'Ancient Greek History',12,0,'$100',1,'2019-07-19',5),(97,'Análisis sintáctico',13,1,'$199',2,'2019-05-29',5),(98,'La generación del 27',13,1,'$149',2,'2019-06-29',5),(99,'A First Course in Linear Algebra',16,1,'$150',1,'2019-07-08',5),(100,'Neurology',17,0,'$45',1,'2019-05-18',5);
/*!40000 ALTER TABLE `tcursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tfacturas`
--

DROP TABLE IF EXISTS `tfacturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tfacturas` (
  `idFactura` int(11) NOT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `fecha` text,
  `numeroFactura` text,
  `baseImponible` text,
  `iva` text,
  `total` int(11) DEFAULT NULL,
  `estado` text,
  PRIMARY KEY (`idFactura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tfacturas`
--

LOCK TABLES `tfacturas` WRITE;
/*!40000 ALTER TABLE `tfacturas` DISABLE KEYS */;
INSERT INTO `tfacturas` VALUES (1,8,'10/06/2019','AT-2019-001','29,93713202','21%',30,'PAGADA'),(2,8,'20/08/2019','AT-2019-002','29,93713202','21%',30,'PENDIENTE'),(3,9,'04/07/2019','AT-2019-003','29,93713202','21%',30,'PAGADA'),(4,9,'05/07/2019','AT-2019-004','29,93713202','21%',30,'PAGADA'),(5,1,'04/02/2019','AT-2019-005','29,93713202','21%',30,'PAGADA'),(6,2,'14/03/2019','AT-2019-006','29,93713202','21%',30,'PENDIENTE'),(7,1,'06/02/2019','AT-2019-007','29,93713202','21%',30,'PAGADA'),(8,3,'08/08/2019','AT-2019-008','29,93713202','21%',30,'PAGADA'),(9,4,'11/01/2019','AT-2019-009','29,93713202','21%',30,'PAGADA'),(10,4,'06/09/2019','AT-2019-010','29,93713202','21%',30,'PAGADA');
/*!40000 ALTER TABLE `tfacturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tfiles`
--

DROP TABLE IF EXISTS `tfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tfiles` (
  `idArchivo` int(11) NOT NULL,
  `idCurso` int(11) DEFAULT NULL,
  `Nombre` text,
  `tipo` text,
  `Source` text,
  PRIMARY KEY (`idArchivo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tfiles`
--

LOCK TABLES `tfiles` WRITE;
/*!40000 ALTER TABLE `tfiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `tfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tidiomas`
--

DROP TABLE IF EXISTS `tidiomas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tidiomas` (
  `id Idiomas` int(11) NOT NULL,
  `Idiomas` text,
  PRIMARY KEY (`id Idiomas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tidiomas`
--

LOCK TABLES `tidiomas` WRITE;
/*!40000 ALTER TABLE `tidiomas` DISABLE KEYS */;
INSERT INTO `tidiomas` VALUES (1,'Inglés'),(2,'Español'),(3,'Francés'),(4,'Alemán'),(5,'Chino'),(6,'Ruso');
/*!40000 ALTER TABLE `tidiomas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiva`
--

DROP TABLE IF EXISTS `tiva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiva` (
  `idIva` int(11) NOT NULL,
  `tipo` text,
  PRIMARY KEY (`idIva`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiva`
--

LOCK TABLES `tiva` WRITE;
/*!40000 ALTER TABLE `tiva` DISABLE KEYS */;
INSERT INTO `tiva` VALUES (1,'21%'),(2,'0%');
/*!40000 ALTER TABLE `tiva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlanguage`
--

DROP TABLE IF EXISTS `tlanguage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlanguage` (
  `id Idiomas` int(11) NOT NULL,
  `Idiomas` text,
  `tcursos_Id Curso` int(11) NOT NULL,
  `tcursos_tlicencias_idLicencia` int(11) NOT NULL,
  PRIMARY KEY (`id Idiomas`,`tcursos_Id Curso`,`tcursos_tlicencias_idLicencia`),
  KEY `fk_tidiomas_tcursos1_idx` (`tcursos_Id Curso`,`tcursos_tlicencias_idLicencia`),
  CONSTRAINT `fk_tidiomas_tcursos1` FOREIGN KEY (`tcursos_Id Curso`, `tcursos_tlicencias_idLicencia`) REFERENCES `tcourses` (`IdCurso`, `tlicencias_idLicencia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlanguage`
--

LOCK TABLES `tlanguage` WRITE;
/*!40000 ALTER TABLE `tlanguage` DISABLE KEYS */;
/*!40000 ALTER TABLE `tlanguage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlicencias`
--

DROP TABLE IF EXISTS `tlicencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlicencias` (
  `idLicencia` int(11) NOT NULL,
  `idCurso` int(11) DEFAULT NULL,
  `idEmpresa` int(11) DEFAULT NULL,
  `nroLicencias` int(11) DEFAULT NULL,
  `licencia` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idLicencia`),
  KEY `licencia_curso_idx` (`idCurso`),
  CONSTRAINT `licencia_curso` FOREIGN KEY (`idCurso`) REFERENCES `tcursos` (`IdCurso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlicencias`
--

LOCK TABLES `tlicencias` WRITE;
/*!40000 ALTER TABLE `tlicencias` DISABLE KEYS */;
INSERT INTO `tlicencias` VALUES (0,9,8,20,'CP1JCX'),(1,15,8,10,'HR2443'),(2,6,8,15,'EO5YJL'),(3,30,8,5,'K3NGFL'),(4,37,8,15,'KHREKY'),(5,19,8,10,'65UNNY'),(6,2,8,5,'5BZ2MO'),(7,1,8,20,'86BE7F'),(8,35,8,15,'OVNR6Z'),(9,5,8,20,'RVCLEF'),(10,12,8,10,'SPRPH5'),(11,20,9,20,'NYSR88'),(12,90,9,10,'XOONRK'),(13,77,9,5,'OJ1172'),(14,3,9,5,'LL36QF'),(15,5,9,10,'YCCU4S'),(16,19,9,15,'YYIMIJ'),(17,4,9,20,'ZRIM88'),(18,17,9,10,'1Y17NC'),(19,20,9,5,'AFM7LW'),(20,38,9,15,'ABZF5B');
/*!40000 ALTER TABLE `tlicencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlineafactura`
--

DROP TABLE IF EXISTS `tlineafactura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlineafactura` (
  `idFactura` int(11) NOT NULL,
  `idLineaFactura` text,
  `idProducto` text,
  `cantidad` int(11) DEFAULT NULL,
  `idIva` int(11) DEFAULT NULL,
  `baseImponible` text,
  `total` int(11) DEFAULT NULL,
  `iva` text,
  PRIMARY KEY (`idFactura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlineafactura`
--

LOCK TABLES `tlineafactura` WRITE;
/*!40000 ALTER TABLE `tlineafactura` DISABLE KEYS */;
INSERT INTO `tlineafactura` VALUES (1,'','prod-1',1,1,'29,93713202',30,'21%'),(2,'','prod-2',1,1,'29,93713202',30,'21%'),(3,'','prod-3',1,1,'29,93713202',30,'21%'),(4,'','prod-4',1,1,'29,93713202',30,'21%'),(5,'','prod-5',1,1,'29,93713202',30,'21%'),(6,'','prod-6',1,1,'29,93713202',30,'21%'),(7,'','prod-7',1,1,'29,93713202',30,'21%'),(8,'','prod-8',1,1,'29,93713202',30,'21%'),(9,'','prod-9',1,1,'29,93713202',30,'21%'),(10,'','prod-10',1,1,'29,93713202',30,'21%');
/*!40000 ALTER TABLE `tlineafactura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trole`
--

DROP TABLE IF EXISTS `trole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trole` (
  `idRol` int(11) NOT NULL,
  `subirVideo` text,
  `editarVideo` text,
  `validarVideo` text,
  `rol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trole`
--

LOCK TABLES `trole` WRITE;
/*!40000 ALTER TABLE `trole` DISABLE KEYS */;
/*!40000 ALTER TABLE `trole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `troles`
--

DROP TABLE IF EXISTS `troles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `troles` (
  `idRol` int(11) NOT NULL,
  `subirVideo` tinyint(4) DEFAULT NULL,
  `editarVideo` tinyint(4) DEFAULT NULL,
  `validarVideo` tinyint(4) DEFAULT NULL,
  `rol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `troles`
--

LOCK TABLES `troles` WRITE;
/*!40000 ALTER TABLE `troles` DISABLE KEYS */;
INSERT INTO `troles` VALUES (1,0,0,1,'validador/admin'),(2,0,0,0,'alumno'),(3,1,1,0,'profesor'),(4,0,0,0,'empresa');
/*!40000 ALTER TABLE `troles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tusers_has_tcourses`
--

DROP TABLE IF EXISTS `tusers_has_tcourses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tusers_has_tcourses` (
  `idUserCourse` varchar(45) NOT NULL,
  `tusuarios_idUsuario` int(11) NOT NULL,
  `tcursos_IdCurso` int(11) NOT NULL,
  `idLicencia` int(11) DEFAULT NULL,
  `alta` date DEFAULT NULL,
  `avance` decimal(5,2) NOT NULL,
  `idUltimoVideo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idUserCourse`),
  KEY `fk_tusuarios_has_tcursos_tusuarios1_idx` (`tusuarios_idUsuario`),
  KEY `fk_tusuarios_has_tcursos_tcursos1_idx` (`tcursos_IdCurso`),
  KEY `usuario_has_licencia_idx` (`idLicencia`),
  CONSTRAINT `fk_tusuarios_has_tcursos_tcursos1` FOREIGN KEY (`tcursos_IdCurso`) REFERENCES `tcursos` (`IdCurso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tusuarios_has_tcursos_tusuarios1` FOREIGN KEY (`tusuarios_idUsuario`) REFERENCES `tusuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usuario_has_licencia` FOREIGN KEY (`idLicencia`) REFERENCES `tlicencias` (`idLicencia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tusers_has_tcourses`
--

LOCK TABLES `tusers_has_tcourses` WRITE;
/*!40000 ALTER TABLE `tusers_has_tcourses` DISABLE KEYS */;
INSERT INTO `tusers_has_tcourses` VALUES ('0',1,59,NULL,'2019-07-01',33.93,0),('1',1,30,NULL,'2019-07-31',27.04,0),('10',3,6,NULL,'2019-09-01',73.88,5),('11',4,30,NULL,'2019-09-13',18.33,0),('12',4,37,NULL,'2019-06-29',70.03,0),('13',4,19,NULL,'2019-06-15',95.14,8),('14',4,2,6,'2019-08-14',65.64,2),('15',4,1,7,'2019-06-16',42.75,2),('16',5,35,NULL,'2019-07-08',16.84,0),('17',5,77,13,'2019-06-28',55.96,0),('18',6,12,NULL,'2019-09-21',29.28,6),('19',7,20,NULL,'2019-08-06',78.52,0),('2',1,19,NULL,'2019-09-06',33.44,0),('3',2,40,NULL,'2019-09-01',86.05,0),('4',3,5,15,'2019-07-27',29.92,1),('5',3,40,NULL,'2019-08-31',91.47,0),('6',3,59,NULL,'2019-08-13',67.59,0),('7',3,60,NULL,'2019-08-20',63.52,0),('8',3,9,NULL,'2019-08-07',14.85,3),('9',3,15,12,'2019-08-21',83.69,7);
/*!40000 ALTER TABLE `tusers_has_tcourses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tusuarios`
--

DROP TABLE IF EXISTS `tusuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tusuarios` (
  `idUsuario` int(11) NOT NULL,
  `rol` int(11) DEFAULT NULL,
  `alias` text,
  `nombre` text,
  `apellidos` text,
  `fechaNacimiento` text,
  `fechaInscripcion` text,
  `email` text,
  `telefono` text,
  `datosFacturacion` text,
  `password` text,
  `cif` text,
  `datosAcademicos` text,
  `cv` text,
  `nivel` int(11) DEFAULT NULL,
  `factura` int(11) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `userHasFactura_idx` (`factura`),
  KEY `usuario_rol_idx` (`rol`),
  CONSTRAINT `usuario_rol` FOREIGN KEY (`rol`) REFERENCES `troles` (`idRol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usuarios_facturas` FOREIGN KEY (`factura`) REFERENCES `tfacturas` (`idFactura`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tusuarios`
--

LOCK TABLES `tusuarios` WRITE;
/*!40000 ALTER TABLE `tusuarios` DISABLE KEYS */;
INSERT INTO `tusuarios` VALUES (1,2,'el huevito','Huevito','García García','01/01/1991','07/02/2019','huevito@gmail.com','612-123-123','000-000-000','huevito123','','','',7,NULL),(2,2,'fulgen','Fulgencio','Buen Hombre','31/10/1965','12/09/2019','fulgencio@gmail.com','612-123-124','000-000-000','fulgencio123','','','',1,NULL),(3,2,'takoyaki','Pascuala','Central Asturiana','25/12/1986','08/08/2019','pascuala@gmail.com','612-123-125','000-000-000','pascuala123','','','',5,NULL),(4,2,'mr potato','Eneko','Bilbo Pérez','08/03/1978','06/05/2019','eneko@gmail.com','612-123-126','000-000-000','eneko123','','','',3,NULL),(5,3,'profe fili','Filiberto','Código Facilito','28/12/1990','01/01/2019','profesor-filiberto@atenea.com','612-123-127','000-000-000','filiberto123','','Doctorado en JavaScript, php y C++. Cofundador de la escuela Código Facilito. Le encanta enseñar a programar.','',12,NULL),(6,3,'miss script','Chumilla','Baena Baena','04/06/1995','02/01/2019','profesora-chumilla@atenea.com','612-123-128','000-000-000','chumilla123','','Titulada en Internet de las Cosas por la Universidad de Suiza. Creó su primer programa con 5 años, un sistema para ordenar los botes de plastilina según olor y caducidad. Actualmente es profesora en el EOI.','',15,NULL),(7,3,'benita','Marianela','Pérez Galdós','07/08/1978','03/01/2019','profesora-marianela@atenea.com','612-123-129','000-000-000','marianela123','','Doctorada en literatura. Máster en Arameo. Fan incondicional de de don Benito Pérez Galdós, promueve sus obras por todo el mundo.','',9,NULL),(8,4,'','indra','','','01/09/2019','rrhh@indra.com','612-123-200','000-000-000','indra123','A-28599033','','',20,NULL),(9,4,'','telefónica','','','04/06/2019','rrhh@telefonica.com','612-123-131','000-000-000','telefonica123','A-28/015865','','',25,NULL),(10,1,'admin','Ramón','San Juan',NULL,NULL,'admin@ateneaweb.com','612-123-132','000-000-000','admin1234',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tusuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tvat`
--

DROP TABLE IF EXISTS `tvat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tvat` (
  `idIva` int(11) NOT NULL,
  `tipo` text,
  `tfacturas_idFactura` int(11) NOT NULL,
  `tfacturas_tlineafactura_idFactura` int(11) NOT NULL,
  PRIMARY KEY (`idIva`,`tfacturas_idFactura`,`tfacturas_tlineafactura_idFactura`),
  KEY `fk_tiva_tfacturas1_idx` (`tfacturas_idFactura`,`tfacturas_tlineafactura_idFactura`),
  CONSTRAINT `fk_tiva_tfacturas1` FOREIGN KEY (`tfacturas_idFactura`, `tfacturas_tlineafactura_idFactura`) REFERENCES `tbill` (`idFactura`, `tlineafactura_idFactura`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tvat`
--

LOCK TABLES `tvat` WRITE;
/*!40000 ALTER TABLE `tvat` DISABLE KEYS */;
/*!40000 ALTER TABLE `tvat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tvideos`
--

DROP TABLE IF EXISTS `tvideos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tvideos` (
  `idvideo` int(11) NOT NULL,
  `idcurso` int(11) DEFAULT NULL,
  `url` varchar(45) DEFAULT NULL,
  `leccion` int(11) DEFAULT NULL,
  PRIMARY KEY (`idvideo`),
  KEY `video_curso_idx` (`idcurso`),
  CONSTRAINT `video_curso` FOREIGN KEY (`idcurso`) REFERENCES `tcursos` (`IdCurso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tvideos`
--

LOCK TABLES `tvideos` WRITE;
/*!40000 ALTER TABLE `tvideos` DISABLE KEYS */;
INSERT INTO `tvideos` VALUES (0,1,'https://www.youtube.com/watch?v=vjgx9QW9d7E',1),(1,1,'https://www.youtube.com/watch?v=31G1BFYTUpc',2),(2,1,'https://www.youtube.com/watch?v=fLCZXA1s5ds',3),(3,1,'https://www.youtube.com/watch?v=HterWfmxe4E',4),(4,2,NULL,1),(5,2,NULL,2),(6,2,NULL,3),(7,2,NULL,4),(8,2,NULL,NULL);
/*!40000 ALTER TABLE `tvideos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-23 14:47:42
