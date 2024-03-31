-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: carpio_47375
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (1,1,3,'2023-09-15','09:36:00',1,1,_binary '\0',_binary ''),(2,7,10,'2023-09-23','15:49:15',11,5,_binary '\0',_binary ''),(3,4,1,'2023-09-25','11:45:05',11,5,_binary '\0',_binary ''),(4,6,9,'2023-09-26','13:15:50',7,6,_binary '\0',_binary ''),(5,3,4,'2023-09-27','17:25:40',10,2,_binary '\0',_binary ''),(6,8,11,'2023-09-27','08:31:08',5,13,_binary '\0',_binary ''),(7,13,8,'2023-09-27','13:28:36',13,4,_binary '\0',_binary ''),(9,10,12,'2023-09-28','09:36:00',3,12,_binary '\0',_binary ''),(10,15,2,'2023-09-28','11:15:50',8,3,_binary '\0',_binary ''),(11,9,13,'2023-09-29','07:02:01',14,15,_binary '\0',_binary ''),(12,11,7,'2023-09-30','15:15:50',4,11,_binary '\0',_binary ''),(13,2,14,'2023-09-30','14:55:50',15,8,_binary '\0',_binary ''),(15,12,15,'2023-09-30','23:25:50',9,7,_binary '\0',_binary '');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'13.938.227-7','Benix','Aravena','1978-04-21','F','56995937221','San Bernardo, RM'),(2,'26.889.858-1','Ericka','Herrera','1985-08-15','F','56984150764','Santiago Centro, RM'),(3,'18.097.726-0','Romina','Neira','1990-02-02','F','56991540141','La florida, RM'),(4,'18.108.934-2','Karina','Teran','1990-05-21','F','56995424936','Vitacura, RM'),(5,'25.705.371-7','Neudys','Moreno','1996-07-25','F','56949557462','Vitacura, RM'),(6,'17.491.159-2','Scarlet','Jaque','1990-12-08','F','56954405151','La Florida, RM'),(7,'27.157.784-2','Laura','Pereira','1989-11-28','F','56967784887','San Miguel, RM'),(8,'10.156.150-K','Nancys','Poblete','1970-10-07','F','56976559562','La Reina, RM'),(9,'18.467.451-3','Fabiola','Alcota','1995-08-28','F','56981947364','La Florida, RM'),(10,'18.175.006-5','Joselin','Rubio','1992-08-31','F','56954625348','Vitacura, RM'),(11,'26.656.931-9','Sandra','Bracho','2061-05-06','F','56985325100','Independencia, RM'),(12,'26.928.047-6','Dayana','Duarte','1992-11-18','F','56936384662','Santiago Centro, RM'),(13,'18.005.488-K','Carolina','Altuvez','1985-04-04','F','56944536582','La Cisterna, RM'),(14,'23.556.874-k','Maria','Carpio','1978-05-13','F','56957880452','La Dehesa, RM'),(15,'27.556.874-0','Mariam','Rodriguez','1978-05-25','F','56957880436','Providencia, RM');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'2023-10-01 08:00:00',1,22000.00),(2,'2023-10-01 10:00:00',2,22000.00),(3,'2023-10-01 12:30:00',3,26000.00),(4,'2023-10-01 14:00:00',4,18000.00),(5,'2023-10-01 17:00:00',5,22000.00),(6,'2023-10-02 10:00:00',1,30000.00),(7,'2023-10-02 14:00:00',5,21000.00),(8,'2023-10-04 12:00:00',2,26000.00),(9,'2023-10-04 15:00:00',3,30000.00),(10,'2023-10-04 18:00:00',1,22000.00),(11,'2023-10-05 08:00:00',3,22000.00),(12,'2023-10-05 13:00:00',4,25000.00),(13,'2023-10-05 17:00:00',2,35000.00),(14,'2023-10-06 14:00:00',1,30000.00),(15,'2023-10-06 17:00:00',3,26000.00);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `payment_type`
--

LOCK TABLES `payment_type` WRITE;
/*!40000 ALTER TABLE `payment_type` DISABLE KEYS */;
INSERT INTO `payment_type` VALUES (1,'Efectivo'),(2,'Tarjeta Debito'),(3,'Tarjeta Credito'),(4,'Transferencia Bancaria'),(5,'Cheque al Dia');
/*!40000 ALTER TABLE `payment_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'Manicurista'),(2,'Podologa'),(3,'Estilista'),(4,'Lashista'),(5,'Cajera');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,'Manicure Rusa Uñas Cortas',22000.00,'02:00:00'),(2,'Manicure Rusa Uñas Medias',24000.00,'02:30:00'),(3,'Manicure Rusa Uñas Largas',26000.00,'02:30:00'),(4,'Manicure Convencional',18000.00,'01:30:00'),(5,'Pedicure Estetico',21000.00,'01:30:00'),(6,'Podologia',25000.00,'01:50:00'),(7,'Podologia Esmaltado',30000.00,'02:00:00'),(8,'Extension de Pestañas Clasicas',25000.00,'02:00:00'),(9,'Extension de Pestañas Volumen Ruso',32000.00,'02:30:00'),(10,'Brushing',20000.00,'01:00:00'),(11,'Brushing+Lavado',26000.00,'01:15:00'),(12,'Masaje Capilar',25000.00,'01:30:00'),(13,'Masaje Capilar Botox',30000.00,'01:30:00'),(14,'Tintura Capilar',35000.00,'02:00:00'),(15,'Retiro de Manicure',5000.00,'00:30:00');
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `worker`
--

LOCK TABLES `worker` WRITE;
/*!40000 ALTER TABLE `worker` DISABLE KEYS */;
INSERT INTO `worker` VALUES (1,'18.256.778-6','Angelica','Marin','1995-06-21','F','56985635823','Vitacura, RM',1),(2,'27.632.792-k','Barbara','Perez','1993-06-04','F','56996320023','Providencia, RM',3),(3,'23.658.776-6','Isbelyn','Carpio','1994-01-20','F','56921453695','San Miguel, RM',5),(4,'28.564.773-6','Emily','Pichardo','1999-09-04','F','56988523698','Lampa, RM',4),(5,'23.568.412-0','Alexmary','Rodriguez','1995-01-31','F','56985632152','Lo Prado, RM',4),(6,'21.586.223-7','Sofia','Rivera','1993-05-21','F','56932100002','Providencia, RM',5),(7,'26.258.471-k','Maria','Perez','1992-08-15','F','56925100023','Vitacura, RM',3),(8,'29.568.223-0','Altagracia','Suarez','1996-07-06','F','56978965236','Vitacura, RM',2),(9,'24.587.663-8','Mery','Pichardo','1992-05-28','F','56999996325','Vitacura, RM',1),(10,'21.365.748-0','Stefania','Duque','1985-03-21','F','56978452145','San Miguel, RM',4),(11,'27.003.562-6','Alejandra','Diaz','1986-09-21','F','56900032516','San Miguel, RM',1),(12,'26.542.223-0','Katherine','Caceres','1988-12-17','F','56902143285','Providencia, RM',2),(13,'18.657.000-4','Josefa','Franco','1990-12-31','F','56956410000','La Reina, RM',3),(14,'18.547.111-6','Mariana','Ravelo','1997-11-16','F','56930215552','La Reina, RM',2),(15,'17.563.660-5','Karina','Hernandez','1994-01-08','F','56998745632','Macul, RM',5);
/*!40000 ALTER TABLE `worker` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-07 17:54:11
