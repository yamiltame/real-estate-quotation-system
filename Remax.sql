/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.18-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: Remax
-- ------------------------------------------------------
-- Server version	10.11.18-MariaDB-cll-lve

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
-- Table structure for table `agentes`
--

DROP TABLE IF EXISTS `agentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agentes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(230) NOT NULL,
  `contacto` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`contacto`)),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agentes`
--

LOCK TABLES `agentes` WRITE;
/*!40000 ALTER TABLE `agentes` DISABLE KEYS */;
INSERT INTO `agentes` VALUES
(2,'Hector CalderÃ³n','{\"tel\":\"4434344636\",\"email\":\"hectorjavcalderon@protonmail.com\"}'),
(3,'Yamil Tame Soria','{\"tel\":\"4432271642\",\"email\":\"informatica@edgesborders.com\"}'),
(4,'Poli','{\"tel\":\"4432834806\",\"email\":\"poli@remaxvesta.com\"}'),
(5,'Luisa Huato','{\"tel\":\"4431281703\",\"email\":\"luisa@remaxvesta.com\"}'),
(6,'Ignacio Leal','{\"tel\":\"5543628644\",\"email\":\"\"}');
/*!40000 ALTER TABLE `agentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `contacto` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`contacto`)),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES
(10,'Juan Manuel Guerrero','{\"tel\": \"(+52)\", \"email\": \"correo@dominio.com\"}'),
(12,'Alejandro Murguia','{\"tel\": \"(+52)\", \"email\": \"correo@dominio.com\"}'),
(15,'propietario','{\"tel\":\"(+52)\",\"email\":\"correo@dominio.com\"}'),
(16,'Alfredo MuÃ±oz Reyes','{\"tel\":\"\",\"email\":\"\"}'),
(17,'Francisco JosÃ© Garcia Mier ','{\"tel\":\"\",\"email\":\"\"}'),
(18,'Yolanda Quezada Herrera','{\"tel\":\"664 126 7696\",\"email\":\"yolandaqh@hotmail.com\"}'),
(19,'Jose Luis Gaona Alvarado ','{\"tel\":\"\",\"email\":\"\"}'),
(20,'Erendira Gabriela Perez Gonzalez ','{\"tel\":\"\",\"email\":\"\"}');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `autor` int(11) NOT NULL,
  `comentario` varchar(258) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` VALUES
(7,5,'comentario de Antonio\r\n'),
(9,4,'comentario de hector'),
(10,1,'Comentarios sobre el software para modificar en la webapp. '),
(11,6,'comentario de poli'),
(12,4,'comentarios falta algo, etc'),
(13,8,'Comentario de Luisa Huato');
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cotizaciones`
--

DROP TABLE IF EXISTS `cotizaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cotizaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `datos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`datos`)),
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cotizaciones`
--

LOCK TABLES `cotizaciones` WRITE;
/*!40000 ALTER TABLE `cotizaciones` DISABLE KEYS */;
INSERT INTO `cotizaciones` VALUES
(111,'2026-02-17','Luisa Huato_Valma_lote38_Alfredo MuÃ±oz Reyes_Esquema de pago','{\"titulo\":\"CotizaciÃ³n\",\"fecha\":\"17-02-2026\",\"vendedor\":\"Luisa Huato\",\"contacto_v\":\"4431281703,luisa@remaxvesta.com\",\"archivo\":\"1\",\"cliente\":\"Alfredo MuÃ±oz Reyes\",\"agente\":\"Luisa Huato\",\"contacto_c\":\",\",\"contacto_a\":\"4431281703,luisa@remaxvesta.com\",\"desarrollo\":\"Valma\",\"tipo\":\"vistus\",\"num\":38,\"manzana\":1,\"superficie\":152.18,\"precio\":\"$1,369,620\",\"costo_m2_lista\":\"$9,000\",\"costo_m2\":8500,\"esquema\":\"Esquema de pago\",\"pagos\":1,\"interes\":0,\"enganche\":\"$245,771   (19%)\",\"mensualidades\":\"$801,989   (62%)\",\"finiquito\":\"$245,771   (19%)\",\"pago_m\":\"$801,989\",\"precio_final\":\"$1,293,530\",\"precio_m2\":\"$9,000\",\"calendario\":\"<tr><td>1</td><td>17/febrero/2026</td><td>Enganche(19%)</td><td>$245,771</td></tr><tr><td>2</td><td>17/febrero/2026</td><td>Mensualidad</td><td>$801,988</td></tr><tr><td>3</td><td>17/marzo/2026</td><td>EscrituraciÃ³n y entrega(19%)</td><td>$245,771</td></tr><tr><td></td><td></td><td><b>Total: </b><td><b>$1,293,530</b></td></tr>\"}'),
(112,'2026-02-19','yamil_Valma_lote5_Alejandro Murguia_12 meses','{\"titulo\":\"CotizaciÃ³n\",\"fecha\":\"19-02-2026\",\"vendedor\":\"yamil\",\"contacto_v\":\"4432271642,yamil@remaxvesta.com\",\"archivo\":\"Croquis.png\",\"cliente\":\"Alejandro Murguia\",\"agente\":\"Luisa Huato\",\"contacto_c\":\"(+52),correo@dominio.com\",\"contacto_a\":\"4431281703,luisa@remaxvesta.com\",\"desarrollo\":\"Valma\",\"tipo\":\"\",\"num\":5,\"manzana\":2,\"superficie\":144,\"precio\":\"$1,296,000\",\"costo_m2_lista\":\"$9,000\",\"costo_m2\":10000,\"esquema\":\"12 meses\",\"pagos\":12,\"interes\":11.11,\"enganche\":\"$360,000   (25%)\",\"mensualidades\":\"$792,000   (55%)\",\"finiquito\":\"$288,000   (20%)\",\"pago_m\":\"$66,000\",\"precio_final\":\"$1,440,000\",\"precio_m2\":\"$9,000\",\"calendario\":\"<tr><td>1</td><td>19/febrero/2026</td><td>Enganche(25%)</td><td>$360,000</td></tr><tr><td>2</td><td>19/marzo/2026</td><td>Mensualidad</td><td>$66,000</td></tr><tr><td>3</td><td>19/abril/2026</td><td>Mensualidad</td><td>$66,000</td></tr><tr><td>4</td><td>19/mayo/2026</td><td>Mensualidad</td><td>$66,000</td></tr><tr><td>5</td><td>19/junio/2026</td><td>Mensualidad</td><td>$66,000</td></tr><tr><td>6</td><td>19/julio/2026</td><td>Mensualidad</td><td>$66,000</td></tr><tr><td>7</td><td>19/agosto/2026</td><td>Mensualidad</td><td>$66,000</td></tr><tr><td>8</td><td>19/septiembre/2026</td><td>Mensualidad</td><td>$66,000</td></tr><tr><td>9</td><td>19/octubre/2026</td><td>Mensualidad</td><td>$66,000</td></tr><tr><td>10</td><td>19/noviembre/2026</td><td>Mensualidad</td><td>$66,000</td></tr><tr><td>11</td><td>19/diciembre/2026</td><td>Mensualidad</td><td>$66,000</td></tr><tr><td>12</td><td>19/enero/2027</td><td>Mensualidad</td><td>$66,000</td></tr><tr><td>13</td><td>19/enero/2027</td><td>Mensualidad</td><td>$66,000</td></tr><tr><td>14</td><td>19/febrero/2027</td><td>EscrituraciÃ³n y entrega(20%)</td><td>$288,000</td></tr><tr><td></td><td></td><td><b>Total: </b><td><b>$1,440,000</b></td></tr>\"}'),
(113,'2026-02-26','yamil_Valma_lote49_Francisco JosÃ© Garcia Mier _Francisco JosÃ© GarcÃ­a Mier ','{\"titulo\":\"CotizaciÃ³n\",\"fecha\":\"26-02-2026\",\"vendedor\":\"yamil\",\"contacto_v\":\"4432271642,yamil@remaxvesta.com\",\"archivo\":\"1\",\"cliente\":\"Francisco JosÃ© Garcia Mier \",\"agente\":\"Ignacio Leal\",\"contacto_c\":\",\",\"contacto_a\":\"5543628644,\",\"desarrollo\":\"Valma\",\"tipo\":\"vistus\",\"num\":49,\"manzana\":1,\"superficie\":144.79,\"precio\":\"$1,303,110\",\"costo_m2_lista\":\"$9,000\",\"costo_m2\":8500,\"esquema\":\"Francisco JosÃ© GarcÃ­a Mier \",\"pagos\":2,\"interes\":0,\"enganche\":\"$123,072   (10%)\",\"mensualidades\":\"$12,307   (1%)\",\"finiquito\":\"$1,107,644   (90%)\",\"pago_m\":\"$6,154\",\"precio_final\":\"$1,230,715\",\"precio_m2\":\"$9,000\",\"calendario\":\"<tr><td>1</td><td>26/febrero/2026</td><td>Enganche(10%)</td><td>$123,072</td></tr><tr><td>2</td><td>26/marzo/2026</td><td>Mensualidad</td><td>$6,154</td></tr><tr><td>3</td><td>26/marzo/2026</td><td>Mensualidad</td><td>$-6,155</td></tr><tr><td>4</td><td>26/abril/2026</td><td>EscrituraciÃ³n y entrega(90%)</td><td>$1,107,644</td></tr><tr><td></td><td></td><td><b>Total: </b><td><b>$1,230,715</b></td></tr>\"}'),
(114,'2026-02-26','yamil_Valma etapa1_lote49_Francisco JosÃ© Garcia Mier _Francisco JosÃ© GarcÃ­a Mier ','{\"titulo\":\"CotizaciÃ³n\",\"fecha\":\"26-02-2026\",\"vendedor\":\"yamil\",\"contacto_v\":\"4432271642,yamil@remaxvesta.com\",\"archivo\":\"Croquis.png\",\"cliente\":\"Francisco JosÃ© Garcia Mier \",\"agente\":\"Ignacio Leal\",\"contacto_c\":\",\",\"contacto_a\":\"5543628644,\",\"desarrollo\":\"Valma etapa1\",\"tipo\":\"vistus\",\"num\":49,\"manzana\":1,\"superficie\":144.79,\"precio\":\"$1,230,715\",\"costo_m2_lista\":\"$8,500\",\"costo_m2\":8500,\"esquema\":\"Francisco JosÃ© GarcÃ­a Mier \",\"pagos\":2,\"interes\":0,\"enganche\":\"$123,072   (10%)\",\"mensualidades\":\"$12,307   (1%)\",\"finiquito\":\"$1,107,644   (90%)\",\"pago_m\":\"$6,154\",\"precio_final\":\"$1,230,715\",\"precio_m2\":\"$8,500\",\"calendario\":\"<tr><td>1</td><td>26/febrero/2026</td><td>Enganche(10%)</td><td>$123,072</td></tr><tr><td>2</td><td>26/marzo/2026</td><td>Mensualidad</td><td>$6,154</td></tr><tr><td>3</td><td>26/marzo/2026</td><td>Mensualidad</td><td>$-6,155</td></tr><tr><td>4</td><td>26/abril/2026</td><td>EscrituraciÃ³n y entrega(90%)</td><td>$1,107,644</td></tr><tr><td></td><td></td><td><b>Total: </b><td><b>$1,230,715</b></td></tr>\"}'),
(115,'2026-02-27','yamil_Valma etapa1_lote49_Francisco JosÃ© Garcia Mier _Contado','{\"titulo\":\"CotizaciÃ³n\",\"fecha\":\"27-02-2026\",\"vendedor\":\"yamil\",\"contacto_v\":\"4432271642,yamil@remaxvesta.com\",\"archivo\":\"Croquis.png\",\"cliente\":\"Francisco JosÃ© Garcia Mier \",\"agente\":\"Ignacio Leal\",\"contacto_c\":\",\",\"contacto_a\":\"5543628644,\",\"desarrollo\":\"Valma etapa1\",\"tipo\":\"vistus\",\"num\":49,\"manzana\":1,\"superficie\":144.79,\"precio\":\"$1,230,715\",\"costo_m2_lista\":\"$8,500\",\"costo_m2\":8500,\"esquema\":\"Contado\",\"pagos\":1,\"interes\":0,\"enganche\":\"$1,230,715   (100%)\",\"mensualidades\":\"$0   (0%)\",\"finiquito\":\"$0   (0%)\",\"pago_m\":\"$0\",\"precio_final\":\"$1,230,715\",\"precio_m2\":\"$8,500\",\"calendario\":\"<tr><td>1</td><td>27/febrero/2026</td><td>Enganche(100%)</td><td>$1,230,715</td></tr><tr><td>2</td><td>27/febrero/2026</td><td>Mensualidad</td><td>$0</td></tr><tr><td>3</td><td>27/marzo/2026</td><td>EscrituraciÃ³n y entrega(0%)</td><td>$0</td></tr><tr><td></td><td></td><td><b>Total: </b><td><b>$1,230,715</b></td></tr>\"}'),
(117,'2026-02-27','yamil_Valma_lote4_Francisco JosÃ© Garcia Mier _Contado','{\"titulo\":\"CotizaciÃ³n\",\"fecha\":\"27-02-2026\",\"vendedor\":\"yamil\",\"contacto_v\":\"4432271642,yamil@remaxvesta.com\",\"archivo\":\"Croquis.png\",\"cliente\":\"Francisco JosÃ© Garcia Mier \",\"agente\":\"\",\"contacto_c\":\",\",\"contacto_a\":\"\",\"desarrollo\":\"Valma\",\"tipo\":\"vistus\",\"num\":4,\"manzana\":1,\"superficie\":145.07,\"precio\":\"$1,305,630\",\"costo_m2_lista\":\"$9,000\",\"costo_m2\":9000,\"esquema\":\"Contado\",\"pagos\":1,\"interes\":0,\"enganche\":\"$130,563   (10%)\",\"mensualidades\":\"$13,056   (1%)\",\"finiquito\":\"$1,175,067   (90%)\",\"pago_m\":\"$13,056\",\"precio_final\":\"$1,305,630\",\"precio_m2\":\"$9,000\",\"calendario\":\"<tr><td>1</td><td>27/febrero/2026</td><td>Enganche(10%)</td><td>$130,563</td></tr><tr><td>2</td><td>27/febrero/2026</td><td>Mensualidad</td><td>$0</td></tr><tr><td>3</td><td>27/marzo/2026</td><td>EscrituraciÃ³n y entrega(90%)</td><td>$1,175,067</td></tr><tr><td></td><td></td><td><b>Total: </b><td><b>$1,305,630</b></td></tr>\"}'),
(118,'2026-02-27','yamil_Valma_lote4_Alejandro Murguia_Contado','{\"titulo\":\"CotizaciÃ³n\",\"fecha\":\"27-02-2026\",\"vendedor\":\"yamil\",\"contacto_v\":\"4432271642,yamil@remaxvesta.com\",\"archivo\":\"Croquis.png\",\"cliente\":\"Alejandro Murguia\",\"agente\":\"Hector CalderÃ³n\",\"contacto_c\":\"(+52),correo@dominio.com\",\"contacto_a\":\"4434344636,hectorjavcalderon@protonmail.com\",\"desarrollo\":\"Valma\",\"tipo\":\"vistus\",\"num\":4,\"manzana\":1,\"superficie\":145.07,\"precio\":\"$1,305,630\",\"costo_m2_lista\":\"$9,000\",\"costo_m2\":9000,\"esquema\":\"Contado\",\"pagos\":1,\"interes\":0,\"enganche\":\"$1,305,630   (100%)\",\"mensualidades\":\"$0   (0%)\",\"finiquito\":\"$0   (0%)\",\"pago_m\":\"$0\",\"precio_final\":\"$1,305,630\",\"precio_m2\":\"$9,000\",\"calendario\":\"<tr><td>1</td><td>27/febrero/2026</td><td>Enganche(100%)</td><td>$1,305,630</td></tr><tr><td>2</td><td>27/febrero/2026</td><td>Mensualidad</td><td>$0</td></tr><tr><td>3</td><td>27/marzo/2026</td><td>EscrituraciÃ³n y entrega(0%)</td><td>$0</td></tr><tr><td></td><td></td><td><b>Total: </b><td><b>$1,305,630</b></td></tr>\"}'),
(119,'2026-03-12','yamil_Valma_lote48_Yolanda Quezada Herrera_Contado','{\"titulo\":\"CotizaciÃ³n\",\"fecha\":\"12-03-2026\",\"vendedor\":\"yamil\",\"contacto_v\":\"4432271642,yamil@remaxvesta.com\",\"archivo\":\"1\",\"cliente\":\"Yolanda Quezada Herrera\",\"agente\":\"Ignacio Leal\",\"contacto_c\":\"664 126 7696,yolandaqh@hotmail.com\",\"contacto_a\":\"5543628644,\",\"desarrollo\":\"Valma\",\"tipo\":\"vistus\",\"num\":48,\"manzana\":1,\"superficie\":145.29,\"precio\":\"$1,307,610\",\"costo_m2_lista\":\"$9,000\",\"costo_m2\":9000,\"esquema\":\"Contado\",\"pagos\":1,\"interes\":0,\"enganche\":\"$1,307,610   (100%)\",\"mensualidades\":\"$0   (0%)\",\"finiquito\":\"$0   (0%)\",\"pago_m\":\"$0\",\"precio_final\":\"$1,307,610\",\"precio_m2\":\"$9,000\",\"calendario\":\"<tr><td>1</td><td>12/marzo/2026</td><td>Enganche(100%)</td><td>$1,307,610</td></tr><tr><td>2</td><td>12/marzo/2026</td><td>Mensualidad</td><td>$0</td></tr><tr><td>3</td><td>12/abril/2026</td><td>EscrituraciÃ³n y entrega(0%)</td><td>$0</td></tr><tr><td></td><td></td><td><b>Total: </b><td><b>$1,307,610</b></td></tr>\"}'),
(120,'2026-03-12','yamil_Valma_lote48_Yolanda Quezada Herrera_Esquema de pago','{\"titulo\":\"CotizaciÃ³n\",\"fecha\":\"12-03-2026\",\"vendedor\":\"yamil\",\"contacto_v\":\"4432271642,yamil@remaxvesta.com\",\"archivo\":\"1\",\"cliente\":\"Yolanda Quezada Herrera\",\"agente\":\"Ignacio Leal\",\"contacto_c\":\"664 126 7696,yolandaqh@hotmail.com\",\"contacto_a\":\"5543628644,\",\"desarrollo\":\"Valma\",\"tipo\":\"vistus\",\"num\":48,\"manzana\":1,\"superficie\":145.29,\"precio\":\"$1,307,610\",\"costo_m2_lista\":\"$9,000\",\"costo_m2\":8500,\"esquema\":\"Esquema de pago\",\"pagos\":1,\"interes\":0,\"enganche\":\"$234,643   (19%)\",\"mensualidades\":\"$765,678   (62%)\",\"finiquito\":\"$234,643   (19%)\",\"pago_m\":\"$765,678\",\"precio_final\":\"$1,234,965\",\"precio_m2\":\"$9,000\",\"calendario\":\"<tr><td>1</td><td>12/marzo/2026</td><td>Enganche(19%)</td><td>$234,643</td></tr><tr><td>2</td><td>12/marzo/2026</td><td>Mensualidad</td><td>$765,679</td></tr><tr><td>3</td><td>12/abril/2026</td><td>EscrituraciÃ³n y entrega(19%)</td><td>$234,643</td></tr><tr><td></td><td></td><td><b>Total: </b><td><b>$1,234,965</b></td></tr>\"}'),
(122,'2026-03-12','Luisa Huato_Valma_lote48_Yolanda Quezada Herrera_Contado','{\"titulo\":\"CotizaciÃ³n\",\"fecha\":\"12-03-2026\",\"vendedor\":\"Luisa Huato\",\"contacto_v\":\"4431281703,luisa@remaxvesta.com\",\"archivo\":\"1\",\"cliente\":\"Yolanda Quezada Herrera\",\"agente\":\"Ignacio Leal\",\"contacto_c\":\"664 126 7696,yolandaqh@hotmail.com\",\"contacto_a\":\"5543628644,\",\"desarrollo\":\"Valma\",\"tipo\":\"vistus\",\"num\":48,\"manzana\":1,\"superficie\":145.29,\"precio\":\"$1,307,610\",\"costo_m2_lista\":\"$9,000\",\"costo_m2\":9000,\"esquema\":\"Contado\",\"pagos\":1,\"interes\":0,\"enganche\":\"$1,307,610   (100%)\",\"mensualidades\":\"$0   (0%)\",\"finiquito\":\"$0   (0%)\",\"pago_m\":\"$0\",\"precio_final\":\"$1,307,610\",\"precio_m2\":\"$9,000\",\"calendario\":\"<tr><td>1</td><td>12/marzo/2026</td><td>Enganche(100%)</td><td>$1,307,610</td></tr><tr><td>2</td><td>12/marzo/2026</td><td>Mensualidad</td><td>$0</td></tr><tr><td>3</td><td>12/abril/2026</td><td>EscrituraciÃ³n y entrega(0%)</td><td>$0</td></tr><tr><td></td><td></td><td><b>Total: </b><td><b>$1,307,610</b></td></tr>\"}'),
(123,'2026-03-12','Luisa Huato_Valma_lote2_propietario_Contado','{\"titulo\":\"CotizaciÃ³n\",\"fecha\":\"12-03-2026\",\"vendedor\":\"Luisa Huato\",\"contacto_v\":\"4431281703,luisa@remaxvesta.com\",\"archivo\":\"Croquis.png\",\"cliente\":\"propietario\",\"agente\":\"Hector CalderÃ³n\",\"contacto_c\":\"(+52),correo@dominio.com\",\"contacto_a\":\"4434344636,hectorjavcalderon@protonmail.com\",\"desarrollo\":\"Valma\",\"tipo\":\"\",\"num\":2,\"manzana\":3,\"superficie\":144,\"precio\":\"$1,296,000\",\"costo_m2_lista\":\"$9,000\",\"costo_m2\":9000,\"esquema\":\"Contado\",\"pagos\":1,\"interes\":0,\"enganche\":\"$1,296,000   (100%)\",\"mensualidades\":\"$0   (0%)\",\"finiquito\":\"$0   (0%)\",\"pago_m\":\"$0\",\"precio_final\":\"$1,296,000\",\"precio_m2\":\"$9,000\",\"calendario\":\"<tr><td>1</td><td>12/marzo/2026</td><td>Enganche(100%)</td><td>$1,296,000</td></tr><tr><td>2</td><td>12/marzo/2026</td><td>Mensualidad</td><td>$0</td></tr><tr><td>3</td><td>12/abril/2026</td><td>EscrituraciÃ³n y entrega(0%)</td><td>$0</td></tr><tr><td></td><td></td><td><b>Total: </b><td><b>$1,296,000</b></td></tr>\"}'),
(124,'2026-04-15','Luisa Huato_Valma_lote7_Alfredo MuÃ±oz Reyes_Esquema de pago','{\"titulo\":\"CotizaciÃ³n\",\"fecha\":\"15-04-2026\",\"vendedor\":\"Luisa Huato\",\"contacto_v\":\"4431281703,luisa@remaxvesta.com\",\"archivo\":\"Croquis.png\",\"cliente\":\"Alfredo MuÃ±oz Reyes\",\"agente\":\"Ignacio Leal\",\"contacto_c\":\",\",\"contacto_a\":\"5543628644,\",\"desarrollo\":\"Valma\",\"tipo\":\"\",\"num\":7,\"manzana\":3,\"superficie\":218.43,\"precio\":\"$1,965,870\",\"costo_m2_lista\":\"$9,000\",\"costo_m2\":8500,\"esquema\":\"Esquema de pago\",\"pagos\":1,\"interes\":0,\"enganche\":\"$352,764   (19%)\",\"mensualidades\":\"$1,151,126   (62%)\",\"finiquito\":\"$352,764   (19%)\",\"pago_m\":\"$1,151,126\",\"precio_final\":\"$1,856,655\",\"precio_m2\":\"$9,000\",\"calendario\":\"<tr><td>1</td><td>15/abril/2026</td><td>Enganche(19%)</td><td>$352,764</td></tr><tr><td>2</td><td>15/abril/2026</td><td>Mensualidad</td><td>$1,151,127</td></tr><tr><td>3</td><td>15/mayo/2026</td><td>EscrituraciÃ³n y entrega(19%)</td><td>$352,764</td></tr><tr><td></td><td></td><td><b>Total: </b><td><b>$1,856,655</b></td></tr>\"}'),
(125,'2026-04-15','Luisa Huato_valma2_lote17_Erendira Gabriela Perez Gonzalez _Contado','{\"titulo\":\"CotizaciÃ³n\",\"fecha\":\"15-04-2026\",\"vendedor\":\"Luisa Huato\",\"contacto_v\":\"4431281703,luisa@remaxvesta.com\",\"archivo\":\"Croquis.png\",\"cliente\":\"Erendira Gabriela Perez Gonzalez \",\"agente\":\"Hector CalderÃ³n\",\"contacto_c\":\",\",\"contacto_a\":\"4434344636,hectorjavcalderon@protonmail.com\",\"desarrollo\":\"valma2\",\"tipo\":\"altus\",\"num\":17,\"manzana\":1,\"superficie\":145.96,\"precio\":\"$1,240,660\",\"costo_m2_lista\":\"$8,500\",\"costo_m2\":8500,\"esquema\":\"Contado\",\"pagos\":1,\"interes\":0,\"enganche\":\"$1,240,660   (100%)\",\"mensualidades\":\"$0   (0%)\",\"finiquito\":\"$0   (0%)\",\"pago_m\":\"$0\",\"precio_final\":\"$1,240,660\",\"precio_m2\":\"$8,500\",\"calendario\":\"<tr><td>1</td><td>15/abril/2026</td><td>Enganche(100%)</td><td>$1,240,660</td></tr><tr><td>2</td><td>15/abril/2026</td><td>Mensualidad</td><td>$0</td></tr><tr><td>3</td><td>15/mayo/2026</td><td>EscrituraciÃ³n y entrega(0%)</td><td>$0</td></tr><tr><td></td><td></td><td><b>Total: </b><td><b>$1,240,660</b></td></tr>\"}'),
(126,'2026-04-15','Luisa Huato_valma2_lote50_Erendira Gabriela Perez Gonzalez _Contado','{\"titulo\":\"CotizaciÃ³n\",\"fecha\":\"15-04-2026\",\"vendedor\":\"Luisa Huato\",\"contacto_v\":\"4431281703,luisa@remaxvesta.com\",\"archivo\":\"1\",\"cliente\":\"Erendira Gabriela Perez Gonzalez \",\"agente\":\"Hector CalderÃ³n\",\"contacto_c\":\",\",\"contacto_a\":\"4434344636,hectorjavcalderon@protonmail.com\",\"desarrollo\":\"valma2\",\"tipo\":\"vistus\",\"num\":50,\"manzana\":1,\"superficie\":144.28,\"precio\":\"$1,226,380\",\"costo_m2_lista\":\"$8,500\",\"costo_m2\":8500,\"esquema\":\"Contado\",\"pagos\":1,\"interes\":0,\"enganche\":\"$1,226,380   (100%)\",\"mensualidades\":\"$0   (0%)\",\"finiquito\":\"$0   (0%)\",\"pago_m\":\"$0\",\"precio_final\":\"$1,226,380\",\"precio_m2\":\"$8,500\",\"calendario\":\"<tr><td>1</td><td>15/abril/2026</td><td>Enganche(100%)</td><td>$1,226,380</td></tr><tr><td>2</td><td>15/abril/2026</td><td>Mensualidad</td><td>$0</td></tr><tr><td>3</td><td>15/mayo/2026</td><td>EscrituraciÃ³n y entrega(0%)</td><td>$0</td></tr><tr><td></td><td></td><td><b>Total: </b><td><b>$1,226,380</b></td></tr>\"}'),
(127,'2026-04-15','Luisa Huato_valma2_lote39_Jose Luis Gaona Alvarado _Contado','{\"titulo\":\"CotizaciÃ³n\",\"fecha\":\"15-04-2026\",\"vendedor\":\"Luisa Huato\",\"contacto_v\":\"4431281703,luisa@remaxvesta.com\",\"archivo\":\"1\",\"cliente\":\"Jose Luis Gaona Alvarado \",\"agente\":\"Hector CalderÃ³n\",\"contacto_c\":\",\",\"contacto_a\":\"4434344636,hectorjavcalderon@protonmail.com\",\"desarrollo\":\"valma2\",\"tipo\":\"vistus\",\"num\":39,\"manzana\":1,\"superficie\":150.27,\"precio\":\"$1,277,295\",\"costo_m2_lista\":\"$8,500\",\"costo_m2\":8500,\"esquema\":\"Contado\",\"pagos\":1,\"interes\":0,\"enganche\":\"$1,277,295   (100%)\",\"mensualidades\":\"$0   (0%)\",\"finiquito\":\"$0   (0%)\",\"pago_m\":\"$0\",\"precio_final\":\"$1,277,295\",\"precio_m2\":\"$8,500\",\"calendario\":\"<tr><td>1</td><td>15/abril/2026</td><td>Enganche(100%)</td><td>$1,277,295</td></tr><tr><td>2</td><td>15/abril/2026</td><td>Mensualidad</td><td>$0</td></tr><tr><td>3</td><td>15/mayo/2026</td><td>EscrituraciÃ³n y entrega(0%)</td><td>$0</td></tr><tr><td></td><td></td><td><b>Total: </b><td><b>$1,277,295</b></td></tr>\"}'),
(128,'2026-04-15','Luisa Huato_valma2_lote9_Alfredo MuÃ±oz Reyes_Contado','{\"titulo\":\"CotizaciÃ³n\",\"fecha\":\"15-04-2026\",\"vendedor\":\"Luisa Huato\",\"contacto_v\":\"4431281703,luisa@remaxvesta.com\",\"archivo\":\"Croquis.png\",\"cliente\":\"Alfredo MuÃ±oz Reyes\",\"agente\":\"Hector CalderÃ³n\",\"contacto_c\":\",\",\"contacto_a\":\"4434344636,hectorjavcalderon@protonmail.com\",\"desarrollo\":\"valma2\",\"tipo\":\"\",\"num\":9,\"manzana\":3,\"superficie\":144,\"precio\":\"$1,224,000\",\"costo_m2_lista\":\"$8,500\",\"costo_m2\":8500,\"esquema\":\"Contado\",\"pagos\":1,\"interes\":0,\"enganche\":\"$1,224,000   (100%)\",\"mensualidades\":\"$0   (0%)\",\"finiquito\":\"$0   (0%)\",\"pago_m\":\"$0\",\"precio_final\":\"$1,224,000\",\"precio_m2\":\"$8,500\",\"calendario\":\"<tr><td>1</td><td>15/abril/2026</td><td>Enganche(100%)</td><td>$1,224,000</td></tr><tr><td>2</td><td>15/abril/2026</td><td>Mensualidad</td><td>$0</td></tr><tr><td>3</td><td>15/mayo/2026</td><td>EscrituraciÃ³n y entrega(0%)</td><td>$0</td></tr><tr><td></td><td></td><td><b>Total: </b><td><b>$1,224,000</b></td></tr>\"}');
/*!40000 ALTER TABLE `cotizaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `desarrollos`
--

DROP TABLE IF EXISTS `desarrollos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `desarrollos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) NOT NULL,
  `precio` double NOT NULL,
  `meses_12` double NOT NULL,
  `meses_24` double NOT NULL,
  `friendsnfamily` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `desarrollos`
--

LOCK TABLES `desarrollos` WRITE;
/*!40000 ALTER TABLE `desarrollos` DISABLE KEYS */;
INSERT INTO `desarrollos` VALUES
(35,'Valma etapa1',8500,10000,10500,8900),
(38,'Valma',9000,10000,11000,8900),
(39,'valma2',8500,10000,10500,8900);
/*!40000 ALTER TABLE `desarrollos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `actualizar_precio_lotes` AFTER UPDATE ON `desarrollos` FOR EACH ROW begin
if !(NEW.precio <=> OLD.precio) then
update lotes set lotes.precio=lotes.superficie*NEW.precio where lotes.desarrollo=NEW.id;
end if;
if !(NEW.meses_12 <=> OLD.meses_12) then
update lotes set lotes.meses_12=lotes.superficie*NEW.meses_12 where lotes.desarrollo=NEW.id;
end if;
if !(NEW.meses_24 <=> OLD.meses_24) then
update lotes set lotes.meses_24=lotes.superficie*NEW.meses_24 where lotes.desarrollo=NEW.id;
end if;
if !(NEW.friendsnfamily <=> OLD.friendsnfamily) then
update lotes set lotes.friendsnfamily=lotes.superficie*NEW.friendsnfamily where lotes.desarrollo=NEW.id;
end if;
end 
*/;;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `borrar_lotes` BEFORE DELETE ON `desarrollos` FOR EACH ROW begin
delete from lotes where desarrollo=Old.id;
end 
*/;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `esquemas`
--

DROP TABLE IF EXISTS `esquemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `esquemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `costo_m2` double NOT NULL,
  `pagos` int(11) NOT NULL,
  `enganche` double NOT NULL,
  `mensualidades` double NOT NULL,
  `finiquito` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esquemas`
--

LOCK TABLES `esquemas` WRITE;
/*!40000 ALTER TABLE `esquemas` DISABLE KEYS */;
INSERT INTO `esquemas` VALUES
(8,'Friends and Family',0,1,100,0,0),
(11,'12 meses',0,12,25,55,20),
(12,'24 meses',0,24,25,55,20),
(18,'PromociÃ³n 1',8000,15,30,60,10),
(19,'Esquema de pago',8500,1,19,62,19),
(20,'Contado',0,1,100,0,0),
(21,'Francisco',8500,1,10,0,90);
/*!40000 ALTER TABLE `esquemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lotes`
--

DROP TABLE IF EXISTS `lotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desarrollo` int(11) NOT NULL,
  `manzana` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `superficie` double NOT NULL,
  `precio` double NOT NULL,
  `meses_12` double NOT NULL,
  `meses_24` double NOT NULL,
  `friendsnfamily` double NOT NULL,
  `apartado` int(11) NOT NULL DEFAULT 0,
  `vendido` tinyint(1) NOT NULL,
  `archivo` varchar(255) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1439 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lotes`
--

LOCK TABLES `lotes` WRITE;
/*!40000 ALTER TABLE `lotes` DISABLE KEYS */;
INSERT INTO `lotes` VALUES
(988,35,1,35,157.66,1340110,1576600,1655430,1403174,0,0,'Croquis.png','vistus'),
(989,35,1,36,155.99,1325915,1559900,1637895,1388311,0,0,'Croquis.png','vistus'),
(990,35,1,37,154.08,1309680,1540800,1617840,1371312,0,0,'Croquis.png','vistus'),
(991,35,1,38,152.18,1293530,1521800,1597890,1354402,0,0,'Croquis.png','vistus'),
(992,35,1,39,150.27,1277295,1502700,1577835,1337403,0,0,'Croquis.png','vistus'),
(993,35,1,40,148.37,1261145,1483700,1557885,1320493,0,0,'Croquis.png','vistus'),
(994,35,1,41,146.46,1244910,1464600,1537830,1303494,0,0,'Croquis.png','vistus'),
(995,35,1,42,144.65,1229525,1446500,1518825,1287385,0,0,'Croquis.png','vistus'),
(996,35,1,43,144.32,1226720,1443200,1515360,1284448,10,0,'Croquis.png','vistus'),
(997,35,1,44,144.5,1228250,1445000,1517250,1286050,0,0,'Croquis.png','vistus'),
(998,35,1,45,144.69,1229865,1446900,1519245,1287741,0,0,'Croquis.png','vistus'),
(999,35,1,46,210.31,1787635,2103100,2208255,1871759,0,0,'Croquis.png','vistus'),
(1000,35,1,47,146.74,1247290,1467400,1540770,1305986,0,0,'Croquis.png','vistus'),
(1001,35,1,48,145.29,1234965,1452900,1525545,1293081,0,0,'Croquis.png','vistus'),
(1002,35,1,49,144.79,1230715,1447900,1520295,1288631,0,0,'Croquis.png','vistus'),
(1003,35,1,50,144.28,1226380,1442800,1514940,1284092,0,0,'Croquis.png','vistus'),
(1004,35,1,51,143.85,1222725,1438500,1510425,1280265,0,0,'Croquis.png','vistus'),
(1005,35,1,52,143.71,1221535,1437100,1508955,1279019,0,0,'Croquis.png','vistus'),
(1006,35,1,53,217.98,1852830,2179800,2288790,1940022,0,0,'Croquis.png','vistus'),
(1223,38,1,1,346.95,3122550,3469500,3816450,3087855,0,0,'Croquis.png','altus'),
(1224,38,1,2,144.81,1303290,1448100,1592910,0,0,0,'Croquis.png','vistus'),
(1225,38,1,3,145.01,1305090,1450100,1595110,0,0,0,'Croquis.png','vistus'),
(1226,38,1,4,145.07,1305630,1450700,1595770,0,0,0,'Croquis.png','vistus'),
(1227,38,1,5,145.12,1306080,1451200,1596320,0,0,0,'Croquis.png','vistus'),
(1228,38,1,6,145.18,1306620,1451800,1596980,0,0,0,'Croquis.png','vistus'),
(1229,38,1,7,145.23,1307070,1452300,1597530,0,0,0,'Croquis.png','vistus'),
(1230,38,1,8,145.29,1307610,1452900,1598190,0,0,0,'Croquis.png','vistus'),
(1231,38,1,9,145.34,1308060,1453400,1598740,0,0,0,'Croquis.png','vistus'),
(1232,38,1,10,145.42,1308780,1454200,1599620,0,0,0,'Croquis.png','vistus'),
(1233,38,1,11,145.51,1309590,1455100,1600610,0,0,0,'Croquis.png','vistus'),
(1234,38,1,12,145.59,1310310,1455900,1601490,0,0,0,'Croquis.png','vistus'),
(1235,38,1,13,145.68,1311120,1456800,1602480,0,0,0,'Croquis.png','altus'),
(1236,38,1,14,145.77,1311930,1457700,1603470,0,0,0,'Croquis.png','altus'),
(1237,38,1,15,145.86,1312740,1458600,1604460,0,0,0,'Croquis.png','altus'),
(1238,38,1,16,145.95,1313550,1459500,1605450,0,0,0,'Croquis.png','altus'),
(1239,38,1,17,145.96,1313640,1459600,1605560,0,0,0,'Croquis.png','altus'),
(1240,38,1,18,146.79,1321110,1467900,1614690,0,0,0,'Croquis.png','altus'),
(1241,38,1,19,181.23,1631070,1812300,1993530,0,0,0,'Croquis.png','altus'),
(1242,38,1,20,149.69,1347210,1496900,1646590,0,0,0,'Croquis.png','altus'),
(1243,38,1,21,149.58,1346220,1495800,1645380,0,0,0,'Croquis.png','altus'),
(1244,38,1,22,149.88,1348920,1498800,1648680,0,0,0,'Croquis.png','vistus'),
(1245,38,1,23,148.37,1335330,1483700,1632070,0,0,0,'Croquis.png','vistus'),
(1246,38,1,24,147.21,1324890,1472100,1619310,0,0,0,'Croquis.png','vistus'),
(1247,38,1,25,147.54,1327860,1475400,1622940,0,0,0,'Croquis.png','vistus'),
(1248,38,1,26,147.89,1331010,1478900,1626790,0,0,0,'Croquis.png','vistus'),
(1249,38,1,27,148.25,1334250,1482500,1630750,0,0,0,'Croquis.png','vistus'),
(1250,38,1,28,148.59,1337310,1485900,1634490,0,0,0,'Croquis.png','vistus'),
(1251,38,1,29,327.11,2943990,3271100,3598210,2911279,0,0,'Croquis.png','altus'),
(1252,38,1,30,142.8,1285200,1428000,1570800,0,0,0,'Croquis.png','vistus'),
(1253,38,1,31,144.6,1301400,1446000,1590600,0,0,0,'Croquis.png','vistus'),
(1254,38,1,32,144.41,1299690,1444100,1588510,0,0,0,'Croquis.png','vistus'),
(1255,38,1,33,144.23,1298070,1442300,1586530,0,0,0,'Croquis.png','vistus'),
(1256,38,1,34,528.22,4753980,5282200,5810420,4701158,0,0,'Croquis.png','altus'),
(1257,38,1,35,157.66,1418940,1576600,1734260,0,0,0,'1','vistus'),
(1258,38,1,36,155.99,1403910,1559900,1715890,0,0,0,'1','vistus'),
(1259,38,1,37,154.08,1386720,1540800,1694880,0,0,0,'1','vistus'),
(1260,38,1,38,152.18,1369620,1521800,1673980,0,0,0,'1','vistus'),
(1261,38,1,39,150.27,1352430,1502700,1652970,0,0,0,'1','vistus'),
(1262,38,1,40,148.37,1335330,1483700,1632070,0,0,0,'1','vistus'),
(1263,38,1,41,146.46,1318140,1464600,1611060,0,0,0,'1','vistus'),
(1264,38,1,42,144.65,1301850,1446500,1591150,0,0,0,'1','vistus'),
(1265,38,1,43,144.32,1298880,1443200,1587520,0,0,0,'1','vistus'),
(1266,38,1,44,144.5,1300500,1445000,1589500,0,0,0,'1','vistus'),
(1267,38,1,45,144.69,1302210,1446900,1591590,0,0,0,'1','vistus'),
(1268,38,1,46,210.31,1892790,2103100,2313410,0,0,0,'1','vistus'),
(1269,38,1,47,146.74,1320660,1467400,1614140,0,0,0,'1','vistus'),
(1270,38,1,48,145.29,1307610,1452900,1598190,0,0,0,'1','vistus'),
(1271,38,1,49,144.79,1303110,1447900,1592690,0,0,0,'1','vistus'),
(1272,38,1,50,144.28,1298520,1442800,1587080,0,0,0,'1','vistus'),
(1273,38,1,51,143.85,1294650,1438500,1582350,0,0,0,'1','vistus'),
(1274,38,1,52,143.71,1293390,1437100,1580810,0,0,0,'1','vistus'),
(1275,38,1,53,217.98,1961820,2179800,2397780,0,0,0,'1','vistus'),
(1276,38,2,1,201.26,1811340,2012600,2213860,0,0,0,'Croquis.png',''),
(1277,38,2,2,144,1296000,1440000,1584000,0,0,0,'Croquis.png',''),
(1278,38,2,3,144,1296000,1440000,1584000,0,0,0,'Croquis.png',''),
(1279,38,2,4,144,1296000,1440000,1584000,0,0,0,'Croquis.png',''),
(1280,38,2,5,144,1296000,1440000,1584000,0,0,0,'Croquis.png',''),
(1281,38,2,6,204.94,1844460,2049400,2254340,1823966,0,0,'Croquis.png',''),
(1282,38,2,7,156.24,1406160,1562400,1718640,0,0,0,'Croquis.png',''),
(1283,38,2,8,162.7,1464300,1627000,1789700,0,0,0,'Croquis.png',''),
(1284,38,2,9,169.17,1522530,1691700,1860870,0,0,0,'Croquis.png',''),
(1285,38,2,10,168.15,1513350,1681500,1849650,0,0,0,'Croquis.png',''),
(1286,38,3,1,144,1296000,1440000,1584000,0,0,0,'Croquis.png',''),
(1287,38,3,2,144,1296000,1440000,1584000,0,0,0,'Croquis.png',''),
(1288,38,3,3,144,1296000,1440000,1584000,0,0,0,'Croquis.png',''),
(1289,38,3,4,144,1296000,1440000,1584000,0,0,0,'Croquis.png',''),
(1290,38,3,5,144,1296000,1440000,1584000,0,0,0,'Croquis.png',''),
(1291,38,3,6,144,1296000,1440000,1584000,0,0,0,'Croquis.png',''),
(1292,38,3,7,218.43,1965870,2184300,2402730,0,0,0,'Croquis.png',''),
(1293,38,3,8,156.81,1411290,1568100,1724910,0,0,0,'Croquis.png',''),
(1294,38,3,9,144,1296000,1440000,1584000,0,0,0,'Croquis.png',''),
(1295,38,3,10,144,1296000,1440000,1584000,0,0,0,'Croquis.png',''),
(1296,38,3,11,144,1296000,1440000,1584000,0,0,0,'Croquis.png',''),
(1297,38,3,12,144,1296000,1440000,1584000,0,0,0,'Croquis.png',''),
(1298,38,3,13,144,1296000,1440000,1584000,0,0,0,'Croquis.png',''),
(1299,38,3,14,144,1296000,1440000,1584000,0,0,0,'Croquis.png',''),
(1300,38,3,15,790.95,7118550,7909500,8700450,7039455,0,0,'Croquis.png',''),
(1301,38,4,1,201.26,1811340,2012600,2213860,0,0,0,'Croquis.png',''),
(1302,38,4,2,144,1296000,1440000,1584000,0,0,0,'Croquis.png',''),
(1303,38,4,3,144,1296000,1440000,1584000,0,0,0,'Croquis.png',''),
(1304,38,4,4,144,1296000,1440000,1584000,0,0,0,'Croquis.png',''),
(1305,38,4,5,144,1296000,1440000,1584000,0,0,0,'Croquis.png',''),
(1306,38,4,6,144,1296000,1440000,1584000,0,0,0,'Croquis.png',''),
(1307,38,4,7,144,1296000,1440000,1584000,0,0,0,'Croquis.png',''),
(1308,38,4,8,144,1296000,1440000,1584000,0,0,0,'Croquis.png',''),
(1309,38,4,9,144,1296000,1440000,1584000,0,0,0,'Croquis.png',''),
(1310,38,4,10,144,1296000,1440000,1584000,0,0,0,'Croquis.png',''),
(1311,38,4,11,144,1296000,1440000,1584000,0,0,0,'Croquis.png',''),
(1312,38,4,12,144,1296000,1440000,1584000,0,0,0,'Croquis.png',''),
(1313,38,4,13,144,1296000,1440000,1584000,0,0,0,'Croquis.png',''),
(1314,38,4,14,190.43,1713870,1904300,2094730,0,0,0,'Croquis.png',''),
(1315,38,4,15,299.44,2694960,2994400,3293840,2665016,0,0,'Croquis.png',''),
(1316,38,4,16,144,1296000,1440000,1584000,0,0,0,'Croquis.png',''),
(1317,38,4,17,144,1296000,1440000,1584000,0,0,0,'Croquis.png',''),
(1318,38,4,18,144,1296000,1440000,1584000,0,0,0,'Croquis.png',''),
(1319,38,4,19,144,1296000,1440000,1584000,0,0,0,'Croquis.png',''),
(1320,38,4,20,144,1296000,1440000,1584000,0,0,0,'Croquis.png',''),
(1321,38,4,21,144,1296000,1440000,1584000,0,0,0,'Croquis.png',''),
(1322,38,4,22,144,1296000,1440000,1584000,0,0,0,'Croquis.png',''),
(1323,38,4,23,144,1296000,1440000,1584000,0,0,0,'Croquis.png',''),
(1324,38,4,24,144,1296000,1440000,1584000,0,0,0,'Croquis.png',''),
(1325,38,4,25,144,1296000,1440000,1584000,0,0,0,'Croquis.png',''),
(1326,38,4,26,144,1296000,1440000,1584000,0,0,0,'Croquis.png',''),
(1327,38,4,27,144,1296000,1440000,1584000,0,0,0,'Croquis.png',''),
(1328,38,4,28,204.91,1844190,2049100,2254010,0,0,0,'Croquis.png',''),
(1329,38,5,1,5000.62,45005580,50006200,55006820,44505518,0,0,'Croquis.png',''),
(1330,38,5,2,5116.9,46052100,51169000,56285900,45540410,0,0,'Croquis.png',''),
(1331,39,1,1,346.95,2949075,3469500,3642975,3087855,0,0,'Croquis.png','altus'),
(1332,39,1,2,144.81,1230885,1448100,1520505,1288809,0,0,'Croquis.png','vistus'),
(1333,39,1,3,145.01,1232585,1450100,1522605,1290589,0,0,'Croquis.png','vistus'),
(1334,39,1,4,145.07,1233095,1450700,1523235,1291123,0,0,'Croquis.png','vistus'),
(1335,39,1,5,145.12,1233520,1451200,1523760,1291568,0,0,'Croquis.png','vistus'),
(1336,39,1,6,145.18,1234030,1451800,1524390,1292102,0,0,'Croquis.png','vistus'),
(1337,39,1,7,145.23,1234455,1452300,1524915,1292547,0,0,'Croquis.png','vistus'),
(1338,39,1,8,145.29,1234965,1452900,1525545,1293081,0,0,'Croquis.png','vistus'),
(1339,39,1,9,145.34,1235390,1453400,1526070,1293526,0,0,'Croquis.png','vistus'),
(1340,39,1,10,145.42,1236070,1454200,1526909.9999999998,1294238,0,0,'Croquis.png','vistus'),
(1341,39,1,11,145.51,1236835,1455100,1527855,1295039,0,0,'Croquis.png','vistus'),
(1342,39,1,12,145.59,1237515,1455900,1528695,1295751,0,0,'Croquis.png','vistus'),
(1343,39,1,13,145.68,1238280,1456800,1529640,1296552,0,0,'Croquis.png','altus'),
(1344,39,1,14,145.77,1239045,1457700,1530585,1297353,0,0,'Croquis.png','altus'),
(1345,39,1,15,145.86,1239810,1458600,1531530.0000000002,1298154.0000000002,0,0,'Croquis.png','altus'),
(1346,39,1,16,145.95,1240575,1459500,1532474.9999999998,1298955,0,0,'Croquis.png','altus'),
(1347,39,1,17,145.96,1240660,1459600,1532580,1299044,0,0,'Croquis.png','altus'),
(1348,39,1,18,146.79,1247715,1467900,1541295,1306431,0,0,'Croquis.png','altus'),
(1349,39,1,19,181.23,1540455,1812300,1902915,1612947,0,0,'Croquis.png','altus'),
(1350,39,1,20,149.69,1272365,1496900,1571745,1332241,0,0,'Croquis.png','altus'),
(1351,39,1,21,149.58,1271430,1495800,1570590.0000000002,1331262,0,0,'Croquis.png','altus'),
(1352,39,1,22,149.88,1273980,1498800,1573740,1333932,0,0,'Croquis.png','vistus'),
(1353,39,1,23,148.37,1261145,1483700,1557885,1320493,0,0,'Croquis.png','vistus'),
(1354,39,1,24,147.21,1251285,1472100,1545705,1310169,0,0,'Croquis.png','vistus'),
(1355,39,1,25,147.54,1254090,1475400,1549170,1313106,0,0,'Croquis.png','vistus'),
(1356,39,1,26,147.89,1257065,1478900,1552844.9999999998,1316220.9999999998,0,0,'Croquis.png','vistus'),
(1357,39,1,27,148.25,1260125,1482500,1556625,1319425,0,0,'Croquis.png','vistus'),
(1358,39,1,28,148.59,1263015,1485900,1560195,1322451,0,0,'Croquis.png','vistus'),
(1359,39,1,29,327.11,2780435,3271100,3434655,2911279,0,0,'Croquis.png','altus'),
(1360,39,1,30,142.8,1213800,1428000,1499400.0000000002,1270920,0,0,'Croquis.png','vistus'),
(1361,39,1,31,144.6,1229100,1446000,1518300,1286940,0,0,'Croquis.png','vistus'),
(1362,39,1,32,144.41,1227485,1444100,1516305,1285249,0,0,'Croquis.png','vistus'),
(1363,39,1,33,144.23,1225955,1442300,1514415,1283647,0,0,'Croquis.png','vistus'),
(1364,39,1,34,528.22,4489870,5282200,5546310,4701158,0,0,'Croquis.png','altus'),
(1365,39,1,35,157.66,1340110,1576600,1655430,1403174,0,0,'1','vistus'),
(1366,39,1,36,155.99,1325915,1559900,1637895,1388311,0,0,'1','vistus'),
(1367,39,1,37,154.08,1309680,1540800,1617840.0000000002,1371312,0,0,'1','vistus'),
(1368,39,1,38,152.18,1293530,1521800,1597890,1354402,0,0,'1','vistus'),
(1369,39,1,39,150.27,1277295,1502700,1577835,1337403,0,0,'1','vistus'),
(1370,39,1,40,148.37,1261145,1483700,1557885,1320493,0,0,'1','vistus'),
(1371,39,1,41,146.46,1244910,1464600,1537830,1303494,0,0,'1','vistus'),
(1372,39,1,42,144.65,1229525,1446500,1518825,1287385,0,0,'1','vistus'),
(1373,39,1,43,144.32,1226720,1443200,1515360,1284448,0,0,'1','vistus'),
(1374,39,1,44,144.5,1228250,1445000,1517250,1286050,0,0,'1','vistus'),
(1375,39,1,45,144.69,1229865,1446900,1519245,1287741,0,0,'1','vistus'),
(1376,39,1,46,210.31,1787635,2103100,2208255,1871759,0,0,'1','vistus'),
(1377,39,1,47,146.74,1247290,1467400,1540770,1305986,0,0,'1','vistus'),
(1378,39,1,48,145.29,1234965,1452900,1525545,1293081,18,0,'1','vistus'),
(1379,39,1,49,144.79,1230715,1447900,1520295,1288631,17,0,'1','vistus'),
(1380,39,1,50,144.28,1226380,1442800,1514940,1284092,0,0,'1','vistus'),
(1381,39,1,51,143.85,1222725,1438500,1510425,1280265,0,0,'1','vistus'),
(1382,39,1,52,143.71,1221535,1437100,1508955,1279019,0,0,'1','vistus'),
(1383,39,1,53,217.98,1852830,2179800,2288790,1940022,0,0,'1','vistus'),
(1384,39,2,1,201.26,1710710,2012600,2113230,1791214,0,0,'Croquis.png',''),
(1385,39,2,2,144,1224000,1440000,1512000,1281600,0,0,'Croquis.png',''),
(1386,39,2,3,144,1224000,1440000,1512000,1281600,0,0,'Croquis.png',''),
(1387,39,2,4,144,1224000,1440000,1512000,1281600,0,0,'Croquis.png',''),
(1388,39,2,5,144,1224000,1440000,1512000,1281600,0,0,'Croquis.png',''),
(1389,39,2,6,204.94,1741990,2049400,2151870,1823966,0,0,'Croquis.png',''),
(1390,39,2,7,156.24,1328040,1562400,1640520,1390536,0,0,'Croquis.png',''),
(1391,39,2,8,162.7,1382950,1627000,1708349.9999999998,1448030,0,0,'Croquis.png',''),
(1392,39,2,9,169.17,1437945,1691700,1776284.9999999998,1505613,0,0,'Croquis.png',''),
(1393,39,2,10,168.15,1429275,1681500,1765575,1496535,0,0,'Croquis.png',''),
(1394,39,3,1,144,1224000,1440000,1512000,1281600,0,0,'Croquis.png',''),
(1395,39,3,2,144,1224000,1440000,1512000,1281600,0,0,'Croquis.png',''),
(1396,39,3,3,144,1224000,1440000,1512000,1281600,0,0,'Croquis.png',''),
(1397,39,3,4,144,1224000,1440000,1512000,1281600,0,0,'Croquis.png',''),
(1398,39,3,5,144,1224000,1440000,1512000,1281600,0,0,'Croquis.png',''),
(1399,39,3,6,144,1224000,1440000,1512000,1281600,0,0,'Croquis.png',''),
(1400,39,3,7,218.43,1856655,2184300,2293515,1944027,0,0,'Croquis.png',''),
(1401,39,3,8,156.81,1332885,1568100,1646505,1395609,0,0,'Croquis.png',''),
(1402,39,3,9,144,1224000,1440000,1512000,1281600,0,0,'Croquis.png',''),
(1403,39,3,10,144,1224000,1440000,1512000,1281600,0,0,'Croquis.png',''),
(1404,39,3,11,144,1224000,1440000,1512000,1281600,0,0,'Croquis.png',''),
(1405,39,3,12,144,1224000,1440000,1512000,1281600,0,0,'Croquis.png',''),
(1406,39,3,13,144,1224000,1440000,1512000,1281600,0,0,'Croquis.png',''),
(1407,39,3,14,144,1224000,1440000,1512000,1281600,0,0,'Croquis.png',''),
(1408,39,3,15,790.95,6723075,7909500,8304975.000000001,7039455,0,0,'Croquis.png',''),
(1409,39,4,1,201.26,1710710,2012600,2113230,1791214,0,0,'Croquis.png',''),
(1410,39,4,2,144,1224000,1440000,1512000,1281600,0,0,'Croquis.png',''),
(1411,39,4,3,144,1224000,1440000,1512000,1281600,0,0,'Croquis.png',''),
(1412,39,4,4,144,1224000,1440000,1512000,1281600,0,0,'Croquis.png',''),
(1413,39,4,5,144,1224000,1440000,1512000,1281600,0,0,'Croquis.png',''),
(1414,39,4,6,144,1224000,1440000,1512000,1281600,0,0,'Croquis.png',''),
(1415,39,4,7,144,1224000,1440000,1512000,1281600,0,0,'Croquis.png',''),
(1416,39,4,8,144,1224000,1440000,1512000,1281600,0,0,'Croquis.png',''),
(1417,39,4,9,144,1224000,1440000,1512000,1281600,0,0,'Croquis.png',''),
(1418,39,4,10,144,1224000,1440000,1512000,1281600,0,0,'Croquis.png',''),
(1419,39,4,11,144,1224000,1440000,1512000,1281600,0,0,'Croquis.png',''),
(1420,39,4,12,144,1224000,1440000,1512000,1281600,0,0,'Croquis.png',''),
(1421,39,4,13,144,1224000,1440000,1512000,1281600,0,0,'Croquis.png',''),
(1422,39,4,14,190.43,1618655,1904300,1999515,1694827,0,0,'Croquis.png',''),
(1423,39,4,15,299.44,2545240,2994400,3144120,2665016,0,0,'Croquis.png',''),
(1424,39,4,16,144,1224000,1440000,1512000,1281600,0,0,'Croquis.png',''),
(1425,39,4,17,144,1224000,1440000,1512000,1281600,0,0,'Croquis.png',''),
(1426,39,4,18,144,1224000,1440000,1512000,1281600,0,0,'Croquis.png',''),
(1427,39,4,19,144,1224000,1440000,1512000,1281600,0,0,'Croquis.png',''),
(1428,39,4,20,144,1224000,1440000,1512000,1281600,0,0,'Croquis.png',''),
(1429,39,4,21,144,1224000,1440000,1512000,1281600,0,0,'Croquis.png',''),
(1430,39,4,22,144,1224000,1440000,1512000,1281600,0,0,'Croquis.png',''),
(1431,39,4,23,144,1224000,1440000,1512000,1281600,0,0,'Croquis.png',''),
(1432,39,4,24,144,1224000,1440000,1512000,1281600,0,0,'Croquis.png',''),
(1433,39,4,25,144,1224000,1440000,1512000,1281600,0,0,'Croquis.png',''),
(1434,39,4,26,144,1224000,1440000,1512000,1281600,0,0,'Croquis.png',''),
(1435,39,4,27,144,1224000,1440000,1512000,1281600,0,0,'Croquis.png',''),
(1436,39,4,28,204.91,1741735,2049100,2151555,1823699,0,0,'Croquis.png',''),
(1437,39,5,1,5000.62,42505270,50006200,52506510,44505518,0,0,'Croquis.png',''),
(1438,39,5,2,5116.9,43493650,51169000,53727449.99999999,45540410,0,0,'Croquis.png','');
/*!40000 ALTER TABLE `lotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedores`
--

DROP TABLE IF EXISTS `vendedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(300) NOT NULL,
  `contacto` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`contacto`)),
  `password` varchar(258) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedores`
--

LOCK TABLES `vendedores` WRITE;
/*!40000 ALTER TABLE `vendedores` DISABLE KEYS */;
INSERT INTO `vendedores` VALUES
(1,'yamil','{\"tel\":\"4432271642\",\"email\":\"yamil@remaxvesta.com\"}','$2y$10$8QKn3kppfrAcgKKhVFDjCOkORVhR2k8ygttgtqmGTQJwHOomcL3Qy'),
(4,'hector','{\"tel\":\"4433221100\",\"email\":\"hector@remaxvesta.com\"}','$2y$10$NetV8lNEdPrvMsPq7WuSAeZTWYJ9W/78GrcJthZAnrONY.8QcR5ce'),
(6,'poli','{\"tel\":\"4433221100\",\"email\":\"poli@remaxvesta.com\"}','$2y$10$faK57D4YiwLZ1YmAcjzJ5.wO5tFvTV0ftKlkN9EIn/iI9SFbVBVSO'),
(8,'Luisa Huato','{\"tel\":\"4431281703\",\"email\":\"luisa@remaxvesta.com\"}','$2y$10$YijICrz60z124imIuhA2ZOlZ7DyiYDjqbBQ8nZY/3n.yoAQQnAezy');
/*!40000 ALTER TABLE `vendedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(100) NOT NULL,
  `vendedor` int(11) NOT NULL,
  `cliente` int(11) NOT NULL,
  `lote` int(11) NOT NULL,
  `esquema` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `monto` double NOT NULL,
  `contrato` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`contrato`)),
  PRIMARY KEY (`id`),
  UNIQUE KEY `clave` (`clave`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-01 18:18:10
