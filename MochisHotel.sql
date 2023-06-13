-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: mochis
-- ------------------------------------------------------
-- Server version	5.5.5-10.11.3-MariaDB

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
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudad` (
  `Ciudad_ID` varchar(255) NOT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Estado_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Ciudad_ID`),
  KEY `Estado_ID` (`Estado_ID`),
  CONSTRAINT `ciudad_ibfk_1` FOREIGN KEY (`Estado_ID`) REFERENCES `estado` (`Estado_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES ('MTY','Moterrey','NL'),('SPGG','San Pedro Garza Garcia','NL');
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `Cliente_ID` int(11) NOT NULL DEFAULT 1,
  `Nombre` varchar(255) DEFAULT NULL,
  `Apellido` varchar(255) DEFAULT NULL,
  `Telefono` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Ciudad_ID` varchar(255) DEFAULT NULL,
  `Pais_ID` varchar(50) DEFAULT NULL,
  `Estado_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Cliente_ID`),
  KEY `Ciudad_ID` (`Ciudad_ID`),
  KEY `Pais_ID` (`Pais_ID`),
  KEY `Estado_ID` (`Estado_ID`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`Ciudad_ID`) REFERENCES `ciudad` (`Ciudad_ID`),
  CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`Pais_ID`) REFERENCES `pais` (`Pais_ID`),
  CONSTRAINT `cliente_ibfk_3` FOREIGN KEY (`Estado_ID`) REFERENCES `estado` (`Estado_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (123,'Mariana','Moreno Concha','81750346','mmorenoconcha@gmail.com','MTY','MX','NL'),(205,'Jose Martin','Estructuras','joseph@struct.com','3456725368',NULL,NULL,NULL),(222,'Francisco','Berrones Gomez','81324509','fberronesgomez@gmail.com','MTY','MX','NL'),(249,'Miguel Angel','Otero','8682562029','miguel.otero@udem.edu',NULL,NULL,NULL),(408,'Brad','Brad','brad@gmail.com','1234567894',NULL,NULL,NULL),(444,'Alejandro','Berrones Elizondo','81897632','aberroneselizondo@gmail.com','MTY','MX','NL'),(749,'Jose Martin','Estructuras','joseph@struct.com','3456725368',NULL,NULL,NULL),(899,'Eso','Brad','4321567812','brad2@gmail.com',NULL,NULL,NULL),(914,'Karla','Moreno Concha','7865945312','kmorenoc24@gmail.com',NULL,NULL,NULL),(932,'Cristopher','Hildebrand','2221949392','estariabiengato@gmail.com',NULL,NULL,NULL);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consumo`
--

DROP TABLE IF EXISTS `consumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consumo` (
  `Consumo_ID` int(11) NOT NULL,
  `Reservacion_ID` int(11) DEFAULT NULL,
  `Servicio_ID` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Consumo_ID`),
  KEY `Reservacion_ID` (`Reservacion_ID`),
  KEY `Servicio_ID` (`Servicio_ID`),
  CONSTRAINT `consumo_ibfk_1` FOREIGN KEY (`Reservacion_ID`) REFERENCES `reservacion` (`Reservacion_ID`),
  CONSTRAINT `consumo_ibfk_2` FOREIGN KEY (`Servicio_ID`) REFERENCES `servicio` (`Servicio_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumo`
--

LOCK TABLES `consumo` WRITE;
/*!40000 ALTER TABLE `consumo` DISABLE KEYS */;
INSERT INTO `consumo` VALUES (123,17256,2,'2023-10-07',800.00),(345,12777,1,'2023-06-12',200.00);
/*!40000 ALTER TABLE `consumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `Estado_ID` varchar(10) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Pais_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Estado_ID`),
  KEY `Pais_ID` (`Pais_ID`),
  CONSTRAINT `estado_ibfk_1` FOREIGN KEY (`Pais_ID`) REFERENCES `pais` (`Pais_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES ('NL','Nuevo Leon','MX');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_reservacion`
--

DROP TABLE IF EXISTS `estado_reservacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_reservacion` (
  `Reservacion_ID` int(11) NOT NULL,
  `Disponibilidad` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Reservacion_ID`),
  CONSTRAINT `estado_reservacion_ibfk_1` FOREIGN KEY (`Reservacion_ID`) REFERENCES `reservacion` (`Reservacion_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_reservacion`
--

LOCK TABLES `estado_reservacion` WRITE;
/*!40000 ALTER TABLE `estado_reservacion` DISABLE KEYS */;
INSERT INTO `estado_reservacion` VALUES (12777,0),(16792,1),(17256,1);
/*!40000 ALTER TABLE `estado_reservacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habitacion`
--

DROP TABLE IF EXISTS `habitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habitacion` (
  `Habitacion_ID` int(11) NOT NULL,
  `Hotel_ID` int(11) DEFAULT NULL,
  `Tipo_Habitacion_ID` int(11) DEFAULT NULL,
  `Numero_Piso` int(11) DEFAULT NULL,
  `Precio` decimal(10,2) DEFAULT NULL,
  `Descripcion` varchar(500) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Habitacion_ID`),
  KEY `Hotel_ID` (`Hotel_ID`),
  KEY `Tipo_Habitacion_ID` (`Tipo_Habitacion_ID`),
  KEY `Numero_Piso` (`Numero_Piso`),
  CONSTRAINT `habitacion_ibfk_1` FOREIGN KEY (`Hotel_ID`) REFERENCES `hotel` (`Hotel_ID`),
  CONSTRAINT `habitacion_ibfk_2` FOREIGN KEY (`Tipo_Habitacion_ID`) REFERENCES `tipo_habitacion` (`Tipo_Habitacion_ID`),
  CONSTRAINT `habitacion_ibfk_3` FOREIGN KEY (`Numero_Piso`) REFERENCES `piso` (`Num_Piso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitacion`
--

LOCK TABLES `habitacion` WRITE;
/*!40000 ALTER TABLE `habitacion` DISABLE KEYS */;
INSERT INTO `habitacion` VALUES (110,1,1,1,2499.00,'Nuestras habitaciones clásicas son la opción perfecta para aquellos que buscan comodidad y valor. Cada habitación cuenta con una cómoda cama, ropa de cama de alta calidad, un baño privado, una televisión de pantalla plana y un escritorio para su comodidad. La decoración clásica de la habitación crea un ambiente cálido y acogedor, perfecto para relajarse después de un largo día.','roomlist-01.jpg'),(210,1,2,2,3499.00,'Con vistas impresionantes de la ciudad, cada habitación cuenta con una amplia cama king-size, una sala de estar separada con sofá y mesa de café, un baño privado con bañera y ducha separadas, así como una amplia variedad de comodidades modernas, incluyendo una televisión de pantalla plana, acceso a Wi-Fi de alta velocidad y una estación de trabajo.','roomlist-02.jpg'),(310,1,3,3,4999.00,'Con una superficie generosa y una decoración elegante y sofisticada, cada suite cuenta con una amplia cama king-size, una sala de estar separada con sofá, mesa de café y sillas, un baño privado con bañera de hidromasaje y ducha separadas, así como una amplia variedad de comodidades modernas, incluyendo una televisión de pantalla plana, acceso a Wi-Fi de alta velocidad y una estación de trabajo.','roomlist-03.jpg');
/*!40000 ALTER TABLE `habitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel` (
  `Hotel_ID` int(11) NOT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Ciudad_ID` varchar(255) DEFAULT NULL,
  `Estado_ID` varchar(10) DEFAULT NULL,
  `Pais_ID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Hotel_ID`),
  KEY `Ciudad_ID` (`Ciudad_ID`),
  KEY `Estado_ID` (`Estado_ID`),
  KEY `Pais_ID` (`Pais_ID`),
  CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (`Ciudad_ID`) REFERENCES `ciudad` (`Ciudad_ID`),
  CONSTRAINT `hotel_ibfk_2` FOREIGN KEY (`Estado_ID`) REFERENCES `estado` (`Estado_ID`),
  CONSTRAINT `hotel_ibfk_3` FOREIGN KEY (`Pais_ID`) REFERENCES `pais` (`Pais_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (1,'Mochis','Av. Ignacio Morones Prieto 4500 poniente. Col. Jesús M. Garza San Pedro Garza García Nuevo León, México C. P. 66238','SPGG','NL','MX');
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `Pais_ID` varchar(50) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`Pais_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES ('MX','Mexico');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piso`
--

DROP TABLE IF EXISTS `piso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `piso` (
  `Num_Piso` int(11) NOT NULL,
  PRIMARY KEY (`Num_Piso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piso`
--

LOCK TABLES `piso` WRITE;
/*!40000 ALTER TABLE `piso` DISABLE KEYS */;
INSERT INTO `piso` VALUES (1),(2),(3);
/*!40000 ALTER TABLE `piso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservacion`
--

DROP TABLE IF EXISTS `reservacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservacion` (
  `Reservacion_ID` int(11) NOT NULL,
  `Habitacion_ID` int(11) DEFAULT NULL,
  `Cliente_ID` int(11) DEFAULT NULL,
  `Fecha_Entrada` date DEFAULT NULL,
  `Fecha_Salida` date DEFAULT NULL,
  `Cantidad_Personas` int(11) DEFAULT NULL,
  `Cantidad_Habitaciones` int(11) DEFAULT NULL,
  PRIMARY KEY (`Reservacion_ID`),
  KEY `Habitacion_ID` (`Habitacion_ID`),
  KEY `Cliente_ID` (`Cliente_ID`),
  CONSTRAINT `reservacion_ibfk_1` FOREIGN KEY (`Habitacion_ID`) REFERENCES `habitacion` (`Habitacion_ID`),
  CONSTRAINT `reservacion_ibfk_2` FOREIGN KEY (`Cliente_ID`) REFERENCES `cliente` (`Cliente_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservacion`
--

LOCK TABLES `reservacion` WRITE;
/*!40000 ALTER TABLE `reservacion` DISABLE KEYS */;
INSERT INTO `reservacion` VALUES (103,110,914,'2023-09-14','2023-09-27',NULL,NULL),(195,110,749,'2023-05-24','2023-05-30',NULL,NULL),(440,210,408,'2023-05-20','2023-05-25',NULL,NULL),(600,310,899,'2023-05-19','2023-05-29',NULL,NULL),(878,110,932,'2023-06-05','2023-08-02',NULL,NULL),(989,110,249,'2024-06-30','2023-07-02',NULL,NULL),(12777,210,444,'2023-06-11','2023-10-11',4,2),(16792,310,123,'2024-05-01','2024-08-01',5,1),(17256,110,222,'2023-10-06','2024-03-06',2,1);
/*!40000 ALTER TABLE `reservacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio` (
  `Servicio_ID` int(11) NOT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Precio_Unitario` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Servicio_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES (1,'Reparacion de ropa','Reparación de ropas (costura, planchado)',200.00),(2,'Servicio de masajes','Masajes completos al cuarto',800.00),(6,'Servicio de sauna','Servicio de sauna de 1 hr',220.00);
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_habitacion`
--

DROP TABLE IF EXISTS `tipo_habitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_habitacion` (
  `Tipo_Habitacion_ID` int(11) NOT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Tipo_Habitacion_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_habitacion`
--

LOCK TABLES `tipo_habitacion` WRITE;
/*!40000 ALTER TABLE `tipo_habitacion` DISABLE KEYS */;
INSERT INTO `tipo_habitacion` VALUES (1,'Clasica'),(2,'Gran Deluxe'),(3,'Ultra Suite');
/*!40000 ALTER TABLE `tipo_habitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mochis'
--
/*!50003 DROP PROCEDURE IF EXISTS `MostrarReservacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`usuario`@`localhost` PROCEDURE `MostrarReservacion`(
  IN reservacionID INT
)
BEGIN
  SELECT 
    Reservacion.Reservacion_ID, 
    Reservacion.Habitacion_ID,
    Cliente.Cliente_ID, 
    Cliente.Nombre,
    Cliente.Apellido,
    Reservacion.Fecha_Entrada, 
    Reservacion.Fecha_Salida
  FROM 
    Reservacion
  INNER JOIN 
    Cliente ON Reservacion.Cliente_ID = Cliente.Cliente_ID
  WHERE 
    Reservacion.Reservacion_ID = reservacionID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerHabitacionesDisponibles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerHabitacionesDisponibles`(
  IN fechaEntrada DATE,
  IN fechaSalida DATE
)
BEGIN
  SELECT TH.Nombre AS Tipo_Habitacion, H.Habitacion_ID, H.Precio, H.Imagen
  FROM Tipo_Habitacion TH
  INNER JOIN Habitacion H ON TH.Tipo_Habitacion_ID = H.Tipo_Habitacion_ID
  WHERE H.Habitacion_ID NOT IN (
    SELECT R.Habitacion_ID
    FROM Reservacion R
    WHERE R.Fecha_Entrada <= fechaSalida
      AND R.Fecha_Salida >= fechaEntrada
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Reservacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Reservacion`(
  IN fechaEntrada DATE,
  IN fechaSalida DATE,
  IN habitacionID int,
  IN rid int,
  IN cid int
)
BEGIN
  INSERT INTO Reservacion (Cliente_ID, Habitacion_ID, Fecha_Entrada, Fecha_Salida, Reservacion_ID)
  VALUES (cid, habitacionID, fechaEntrada, fechaSalida, rid);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ReservacionCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ReservacionCliente`(
  IN nombreCliente VARCHAR(255),
  IN apellidoCliente VARCHAR(255),
  IN telefonoCliente VARCHAR(255),
  IN emailCliente VARCHAR(255),
  IN cid int
)
BEGIN

  
  INSERT INTO Cliente (Cliente_ID, Nombre, Apellido, Telefono, Email)
  VALUES (cid, nombreCliente, apellidoCliente, telefonoCliente, emailCliente);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-19 21:22:09
