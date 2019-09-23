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
-- Table structure for table `tcursos`
--

DROP TABLE IF EXISTS `tcursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcursos` (
  `Id Curso` int(11) NOT NULL,
  `Título` text,
  `Categoría` int(11) DEFAULT NULL,
  `Certificado` int(11) DEFAULT NULL,
  `Precio` text,
  `Idioma curso` int(11) DEFAULT NULL,
  `tlicencias_idLicencia` int(11) NOT NULL,
  PRIMARY KEY (`Id Curso`,`tlicencias_idLicencia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcursos`
--

LOCK TABLES `tcursos` WRITE;
/*!40000 ALTER TABLE `tcursos` DISABLE KEYS */;
INSERT INTO `tcursos` VALUES (1,'Architecture Studio: Building in Landscapes',1,0,'$149',1,0),(2,'Roman Architecture',1,0,'$150',1,0),(3,'The Architectural Imagination ',1,0,'$45',1,0),(4,'Theory of City Form',1,0,'$15',1,0),(5,'Aesthetics & the Philosophy of Art',2,1,'$20',1,0),(6,'Digital Photography',21,1,'$200',1,0),(7,'Introduction to Visual Design',2,1,'$100',1,0),(8,'Introduction to Visual Thinking',2,1,'$199',1,0),(9,'Italian Renaissance',2,0,'$149',1,0),(10,'Italic Calligraphy & Handwriting',2,0,'$150',1,0),(11,'Photography',21,1,'$45',1,0),(12,'Ancient and Medieval Philosophy',19,0,'$15',1,0),(13,'Ancient Greece: City and Society',19,1,'$20',1,0),(14,'Ancient Philosophy',19,1,'$200',1,0),(15,'Classical Mythology',19,1,'$100',1,0),(16,'Concepts of the Hero in Greek Civilization',19,1,'$199',1,0),(17,'Virgil’s Aeneid: Anatomy of a Classic',19,0,'$149',1,0),(19,'Virgil’s Aeneid: Anatomy of a Classic II',19,0,'$149',1,0),(20,'Advanced Political Economy',6,0,'$45',1,0),(21,'American Capitalism: A History',6,1,'$15',1,0),(22,'Behavioral Finance',6,0,'$20',1,0),(23,'Capitalism: Success',6,1,'$15',1,0),(24,'Crisis',6,1,'$15',1,0),(25,'Economic Geography of the Industrial World',6,1,'$199',1,0),(26,'Economic History of the Soviet Union',6,0,'$149',1,0),(27,'Economic Statistics and Econometrics',6,0,'$150',1,0),(28,'Finance Theory 1',6,0,'$45',1,0),(29,'Financial Markets ',6,1,'$15',1,0),(30,'Global Poverty and Impact Evaluation',6,1,'$20',1,0),(31,'Great Economists: Classical Economics and its Forerunners',6,1,'$200',1,0),(32,'History of Economic Theory',6,0,'$100',1,0),(33,'Intermediate Microeconomic Theory',6,0,'$199',1,0),(34,'International Finance',6,1,'$149',1,0),(35,'International Political Economy',6,1,'$150',1,0),(36,'International Trade ',6,0,'$45',1,0),(37,'International Trade',6,0,'$15',1,0),(38,'Introduction to Economics',6,0,'$20',1,0),(39,'Introduction to Environmental Economics and Policy',6,0,'$200',1,0),(40,'Law and Economics I',6,0,'$100',1,0),(41,'Lectures on Human Capital',6,0,'$199',1,0),(42,'Marx\'s Kapital: Volumes 1 and 2',6,0,'$149',1,0),(43,'Marxian Economic',6,0,'$150',1,0),(44,'Mexico’s Economy: Current Prospects and History',6,0,'$45',1,0),(45,'Microeconomic Theory with Application to Natural Resources',6,1,'$15',1,0),(46,'Money and Banking',6,1,'$20',1,0),(47,'Money',6,1,'$20',1,0),(48,'Money Skills',6,0,'$100',1,0),(49,'Poker Theory and Analytics',6,0,'$199',1,0),(50,'Political Economy After the Crisis',6,0,'$149',1,0),(51,'Principles of Economics: Microeconomics',6,1,'$150',1,0),(52,'Principles of Economics: Macroeconomics',6,1,'$45',1,0),(53,'Principles of Microeconomics',6,1,'$15',1,0),(54,'Psychology and Economics ',6,0,'$20',1,0),(55,'Public Economics and Finance',6,0,'$200',1,0),(56,'Radical Capitalism',6,0,'$100',1,0),(57,'Sports Economics',6,1,'$199',1,0),(58,'The Eurozone Crisis',6,1,'$149',1,0),(59,'Biochemistry 1',3,1,'$150',1,0),(60,'Chemistry (Chemical Stoichiometry)',3,1,'$45',1,0),(61,'Core Concepts in Chemistry',3,1,'$15',1,0),(62,'Chemical Structure and Reactivity',3,0,'$20',1,0),(63,'Advanced Algorithms',4,1,'$200',1,0),(64,'Advanced Operating Systems Structures and Implementation',4,0,'$100',1,0),(65,'Crash Course in Design Thinking',5,0,'$199',1,0),(66,'Everything I Know',5,0,'$149',1,0),(67,'Geology',7,1,'$150',1,0),(68,'Engineering',8,1,'$45',1,0),(69,'Engineering - Signals and Systems',8,1,'$15',1,0),(70,'Engineering Dynamics',8,1,'$20',1,0),(71,'Electronic Techniques for Engineering',8,1,'$200',1,0),(72,'Engineering Statics',8,1,'$100',1,0),(73,'Environmental Air Pollution',9,1,'$199',1,0),(74,'Australian Environmental History',9,1,'$149',1,0),(75,'Adaptation to Climate Change',9,1,'$150',1,0),(76,'Education for Sustainable Living: Environment',9,1,'$45',1,0),(77,'Energy Regulations and the Environment',9,1,'$15',1,0),(78,'Environmental Economics & Policy',9,1,'$20',1,0),(79,'Introduction to Visual Design',5,1,'$200',1,0),(80,'Environmental Politics and Law',9,1,'$100',1,0),(81,'Ethical Challenges in Public Health Interventions: Catastrophic and Routine',10,0,'$199',1,0),(82,'Food and the Environment',11,0,'$149',1,0),(83,'Basic Concepts of Music Theory',18,0,'$150',1,0),(84,'Food Production',11,0,'$15',1,0),(85,'Nutrition Education for Cancer Prevention',11,0,'$15',1,0),(86,'Arabic Elementary Course',14,0,'$20',1,0),(87,'Français pour débutant',14,1,'$200',1,0),(88,'Chinese for beginners',14,1,'$100',1,0),(89,'German for beginners',14,1,'$199',1,0),(90,'Japanese for beginners',14,1,'$149',1,0),(91,'Russian for beginners',14,1,'$150',1,0),(92,'Portuguese for beginners',14,1,'$45',1,0),(93,'Common Law',15,1,'$15',1,0),(94,'Ruso para principiantes',14,0,'$20',2,0),(95,'Child Nutrition and Cooking',11,0,'$200',1,0),(96,'Ancient Greek History',12,0,'$100',1,0),(97,'Análisis sintáctico',13,1,'$199',2,0),(98,'La generación del 27',13,1,'$149',2,0),(99,'A First Course in Linear Algebra',16,1,'$150',1,0),(100,'Neurology',17,0,'$45',1,0);
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
-- Table structure for table `tlicencias`
--

DROP TABLE IF EXISTS `tlicencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlicencias` (
  `idLicencia` int(11) NOT NULL,
  `idCurso` int(11) DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `nroLicencias` int(11) DEFAULT NULL,
  PRIMARY KEY (`idLicencia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlicencias`
--

LOCK TABLES `tlicencias` WRITE;
/*!40000 ALTER TABLE `tlicencias` DISABLE KEYS */;
INSERT INTO `tlicencias` VALUES (0,1,4,20),(1,5,324,10),(2,7,2,15),(3,6,45,5),(4,3,23,15),(5,3,7,10),(6,6,45,5),(7,4,44,20),(8,6,5,15),(9,11,3,20),(10,7,67,10),(11,20,6,20),(12,2,77,10),(13,10,34,5),(14,3,12,5),(15,5,21,10),(16,19,44,15),(17,4,25,20),(18,17,14,10),(19,20,3,5),(20,20,56,15);
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
-- Table structure for table `troles`
--

DROP TABLE IF EXISTS `troles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `troles` (
  `idRol` int(11) NOT NULL,
  `subirVideo` text,
  `editarVideo` text,
  `validarVideo` text,
  `rol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `troles`
--

LOCK TABLES `troles` WRITE;
/*!40000 ALTER TABLE `troles` DISABLE KEYS */;
INSERT INTO `troles` VALUES (1,'boolean = false','boolean = false','boolean = false','validador/admin'),(2,'boolean = true','boolean = true','boolean = false','alumno'),(3,'boolean = false','boolean = false','boolean = false','profesor'),(4,'boolean = false','boolean = false','boolean = true','empresa');
/*!40000 ALTER TABLE `troles` ENABLE KEYS */;
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
  `idlicencia` int(11) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `userHasRol_idx` (`rol`),
  KEY `userHasFactura_idx` (`factura`),
  KEY `userHasLicencia_idx` (`idlicencia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tusuarios`
--

LOCK TABLES `tusuarios` WRITE;
/*!40000 ALTER TABLE `tusuarios` DISABLE KEYS */;
INSERT INTO `tusuarios` VALUES (1,1,'el huevito','Huevito','García García','01/01/1991','07/02/2019','huevito@gmail.com','612-123-123','000-000-000','huevito123','','','',7,NULL,8),(2,1,'fulgen','Fulgencio','Buen Hombre','31/10/1965','12/09/2019','fulgencio@gmail.com','612-123-124','000-000-000','fulgencio123','','','',1,NULL,7),(3,1,'takoyaki','Pascuala','Central Asturiana','25/12/1986','08/08/2019','pascuala@gmail.com','612-123-125','000-000-000','pascuala123','','','',5,NULL,6),(4,1,'mr potato','Eneko','Bilbo Pérez','08/03/1978','06/05/2019','eneko@gmail.com','612-123-126','000-000-000','eneko123','','','',3,NULL,5),(5,2,'profe fili','Filiberto','Código Facilito','28/12/1990','01/01/2019','profesor-filiberto@atenea.com','612-123-127','000-000-000','filiberto123','','Doctorado en JavaScript, php y C++. Cofundador de la escuela Código Facilito. Le encanta enseñar a programar.','',12,NULL,4),(6,2,'miss script','Chumilla','Baena Baena','04/06/1995','02/01/2019','profesora-chumilla@atenea.com','612-123-128','000-000-000','chumilla123','','Titulada en Internet de las Cosas por la Universidad de Suiza. Creó su primer programa con 5 años, un sistema para ordenar los botes de plastilina según olor y caducidad. Actualmente es profesora en el EOI.','',15,NULL,3),(7,2,'benita','Marianela','Pérez Galdós','07/08/1978','03/01/2019','profesora-marianela@atenea.com','612-123-129','000-000-000','marianela123','','Doctorada en literatura. Máster en Arameo. Fan incondicional de de don Benito Pérez Galdós, promueve sus obras por todo el mundo.','',9,NULL,2),(8,3,'','indra','','','01/09/2019','rrhh@indra.com','612-123-130','000-000-000','indra123','A-28599033','','',20,NULL,1),(9,3,'','telefónica','','','04/06/2019','rrhh@telefonica.com','612-123-131','000-000-000','telefonica123','A-28/015865','','',25,NULL,9);
/*!40000 ALTER TABLE `tusuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-20 13:01:50
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: docere_190920
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
  PRIMARY KEY (`IdCurso`,`tlicencias_idLicencia`)
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
-- Table structure for table `tcourses_has_tlicense`
--

DROP TABLE IF EXISTS `tcourses_has_tlicense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcourses_has_tlicense` (
  `tcursos_Id Curso` int(11) NOT NULL,
  `tcursos_tlicencias_idLicencia` int(11) NOT NULL,
  `tlicencias_idLicencia` int(11) NOT NULL,
  PRIMARY KEY (`tcursos_Id Curso`,`tcursos_tlicencias_idLicencia`,`tlicencias_idLicencia`),
  KEY `fk_tcursos_has_tlicencias_tlicencias1_idx` (`tlicencias_idLicencia`),
  KEY `fk_tcursos_has_tlicencias_tcursos1_idx` (`tcursos_Id Curso`,`tcursos_tlicencias_idLicencia`),
  CONSTRAINT `fk_tcursos_has_tlicencias_tcursos1` FOREIGN KEY (`tcursos_Id Curso`, `tcursos_tlicencias_idLicencia`) REFERENCES `tcourses` (`IdCurso`, `tlicencias_idLicencia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tcursos_has_tlicencias_tlicencias1` FOREIGN KEY (`tlicencias_idLicencia`) REFERENCES `tlicense` (`idLicencia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcourses_has_tlicense`
--

LOCK TABLES `tcourses_has_tlicense` WRITE;
/*!40000 ALTER TABLE `tcourses_has_tlicense` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcourses_has_tlicense` ENABLE KEYS */;
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
-- Table structure for table `tlicense`
--

DROP TABLE IF EXISTS `tlicense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlicense` (
  `idLicencia` int(11) NOT NULL,
  `idCurso` int(11) DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `nroLicencias` int(11) DEFAULT NULL,
  PRIMARY KEY (`idLicencia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlicense`
--

LOCK TABLES `tlicense` WRITE;
/*!40000 ALTER TABLE `tlicense` DISABLE KEYS */;
/*!40000 ALTER TABLE `tlicense` ENABLE KEYS */;
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
-- Table structure for table `tusers`
--

DROP TABLE IF EXISTS `tusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tusers` (
  `idUsuario` int(11) NOT NULL,
  `alias` text,
  `nombre` text,
  `apellidos` text,
  `fechaNacimiento` text,
  `fechaInscripción` text,
  `email` text,
  `telefono` text,
  `datosFacturacion` text,
  `password` text,
  `cif` text,
  `datosAcademicos` text,
  `cv` text,
  `nivel` int(11) DEFAULT NULL,
  `factura` int(11) DEFAULT NULL,
  `tfacturas_idFactura` int(11) NOT NULL,
  `tfacturas_tlineafactura_idFactura` int(11) NOT NULL,
  `troles_idRol` int(11) NOT NULL,
  `tlicencias_idLicencia` int(11) NOT NULL,
  PRIMARY KEY (`idUsuario`,`tfacturas_idFactura`,`tfacturas_tlineafactura_idFactura`,`troles_idRol`,`tlicencias_idLicencia`),
  KEY `userHasFactura_idx` (`factura`),
  KEY `fk_tusuarios_tfacturas1_idx` (`tfacturas_idFactura`,`tfacturas_tlineafactura_idFactura`),
  KEY `fk_tusuarios_troles1_idx` (`troles_idRol`),
  KEY `fk_tusuarios_tlicencias1_idx` (`tlicencias_idLicencia`),
  CONSTRAINT `fk_tusuarios_tfacturas1` FOREIGN KEY (`tfacturas_idFactura`, `tfacturas_tlineafactura_idFactura`) REFERENCES `tbill` (`idFactura`, `tlineafactura_idFactura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tusuarios_tlicencias1` FOREIGN KEY (`tlicencias_idLicencia`) REFERENCES `tlicense` (`idLicencia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tusuarios_troles1` FOREIGN KEY (`troles_idRol`) REFERENCES `trole` (`idRol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tusers`
--

LOCK TABLES `tusers` WRITE;
/*!40000 ALTER TABLE `tusers` DISABLE KEYS */;
/*!40000 ALTER TABLE `tusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tusers_has_tcourses`
--

DROP TABLE IF EXISTS `tusers_has_tcourses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tusers_has_tcourses` (
  `tusuarios_idUsuario` int(11) NOT NULL,
  `tcursos_Id Curso` int(11) NOT NULL,
  PRIMARY KEY (`tusuarios_idUsuario`,`tcursos_Id Curso`),
  KEY `fk_tusuarios_has_tcursos_tcursos1_idx` (`tcursos_Id Curso`),
  KEY `fk_tusuarios_has_tcursos_tusuarios1_idx` (`tusuarios_idUsuario`),
  CONSTRAINT `fk_tusuarios_has_tcursos_tcursos1` FOREIGN KEY (`tcursos_Id Curso`) REFERENCES `tcourses` (`IdCurso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tusuarios_has_tcursos_tusuarios1` FOREIGN KEY (`tusuarios_idUsuario`) REFERENCES `tusers` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tusers_has_tcourses`
--

LOCK TABLES `tusers_has_tcourses` WRITE;
/*!40000 ALTER TABLE `tusers_has_tcourses` DISABLE KEYS */;
/*!40000 ALTER TABLE `tusers_has_tcourses` ENABLE KEYS */;
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-20 13:01:50
