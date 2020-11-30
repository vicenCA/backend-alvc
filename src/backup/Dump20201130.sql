-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: alvc
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(255) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'espectaculo'),(2,'salud'),(3,'cultura'),(4,'nacional'),(5,'internacional');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentario` (
  `id_comentario` int NOT NULL AUTO_INCREMENT,
  `comentario` varchar(255) NOT NULL,
  `fecha_comentario` varchar(255) NOT NULL,
  `alias` int NOT NULL,
  `noticiaIdNoticia` int DEFAULT NULL,
  PRIMARY KEY (`id_comentario`),
  KEY `FK_b96b37ea8ca0674d6c2b1b58222` (`noticiaIdNoticia`),
  CONSTRAINT `FK_b96b37ea8ca0674d6c2b1b58222` FOREIGN KEY (`noticiaIdNoticia`) REFERENCES `noticia` (`id_noticia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `timestamp` bigint NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,1606178494108,'initialMig1606178494108'),(2,1606266030108,'initialMig1606266030108'),(3,1606693263110,'createInitial1606693263110'),(4,1606695320177,'createInitial1606695320177'),(5,1606696087787,'createInitial1606696087787'),(6,1606696163051,'createInitial1606696163051'),(7,1606707377839,'createInitial1606707377839'),(8,1606707573208,'createInitial1606707573208'),(9,1606707613648,'initialMig1606707613648');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multimedia`
--

DROP TABLE IF EXISTS `multimedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `multimedia` (
  `id_multimedia` int NOT NULL AUTO_INCREMENT,
  `nombre_multimedia` varchar(255) NOT NULL,
  `tipoMultimediaIdTipoMultimedia` int DEFAULT NULL,
  `noticiaIdNoticia` int DEFAULT NULL,
  PRIMARY KEY (`id_multimedia`),
  UNIQUE KEY `REL_3bc16193d959cf6e85fffcab2f` (`tipoMultimediaIdTipoMultimedia`),
  KEY `FK_6cdc74d83dbf83ba2884c65c30d` (`noticiaIdNoticia`),
  CONSTRAINT `FK_3bc16193d959cf6e85fffcab2ff` FOREIGN KEY (`tipoMultimediaIdTipoMultimedia`) REFERENCES `tipo_multimedia` (`id_tipo_multimedia`),
  CONSTRAINT `FK_6cdc74d83dbf83ba2884c65c30d` FOREIGN KEY (`noticiaIdNoticia`) REFERENCES `noticia` (`id_noticia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multimedia`
--

LOCK TABLES `multimedia` WRITE;
/*!40000 ALTER TABLE `multimedia` DISABLE KEYS */;
/*!40000 ALTER TABLE `multimedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noticia`
--

DROP TABLE IF EXISTS `noticia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `noticia` (
  `id_noticia` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(256) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `calificacion` int NOT NULL,
  `visitas` int NOT NULL,
  `fecha_noticia` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cuerpo` varchar(512) NOT NULL,
  `categoriaIdCategoria` int DEFAULT NULL,
  PRIMARY KEY (`id_noticia`),
  UNIQUE KEY `REL_0a38dd778744dc4219910ba03d` (`categoriaIdCategoria`),
  KEY `IDX_0a38dd778744dc4219910ba03d` (`categoriaIdCategoria`),
  CONSTRAINT `FK_0a38dd778744dc4219910ba03d0` FOREIGN KEY (`categoriaIdCategoria`) REFERENCES `categoria` (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticia`
--

LOCK TABLES `noticia` WRITE;
/*!40000 ALTER TABLE `noticia` DISABLE KEYS */;
/*!40000 ALTER TABLE `noticia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noticia_usuarios_usuario`
--

DROP TABLE IF EXISTS `noticia_usuarios_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `noticia_usuarios_usuario` (
  `noticiaIdNoticia` int NOT NULL,
  `usuarioIdUsuario` int NOT NULL,
  PRIMARY KEY (`noticiaIdNoticia`,`usuarioIdUsuario`),
  KEY `IDX_f373db3903ce3bce8bc5deeb8f` (`noticiaIdNoticia`),
  KEY `IDX_5e19e7c34899d99446b6345b09` (`usuarioIdUsuario`),
  CONSTRAINT `FK_5e19e7c34899d99446b6345b09e` FOREIGN KEY (`usuarioIdUsuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE,
  CONSTRAINT `FK_f373db3903ce3bce8bc5deeb8f0` FOREIGN KEY (`noticiaIdNoticia`) REFERENCES `noticia` (`id_noticia`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticia_usuarios_usuario`
--

LOCK TABLES `noticia_usuarios_usuario` WRITE;
/*!40000 ALTER TABLE `noticia_usuarios_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `noticia_usuarios_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_multimedia`
--

DROP TABLE IF EXISTS `tipo_multimedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_multimedia` (
  `id_tipo_multimedia` int NOT NULL AUTO_INCREMENT,
  `nombre_tipo_multimedia` varchar(255) NOT NULL,
  PRIMARY KEY (`id_tipo_multimedia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_multimedia`
--

LOCK TABLES `tipo_multimedia` WRITE;
/*!40000 ALTER TABLE `tipo_multimedia` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_multimedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_usuario` (
  `id_tipo_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre_tipo_usuario` varchar(255) NOT NULL,
  PRIMARY KEY (`id_tipo_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_usuario`
--

LOCK TABLES `tipo_usuario` WRITE;
/*!40000 ALTER TABLE `tipo_usuario` DISABLE KEYS */;
INSERT INTO `tipo_usuario` VALUES (1,'administrador'),(2,'periodista'),(3,'registrado');
/*!40000 ALTER TABLE `tipo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `apellido_paterno` varchar(255) NOT NULL,
  `apellido_materno` varchar(255) DEFAULT NULL,
  `vigencia` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `telefono` int NOT NULL,
  `tipoUsuarioIdTipoUsuario` int DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `REL_d074ce20c38c7f1edbf7cbe71f` (`tipoUsuarioIdTipoUsuario`),
  CONSTRAINT `FK_d074ce20c38c7f1edbf7cbe71fb` FOREIGN KEY (`tipoUsuarioIdTipoUsuario`) REFERENCES `tipo_usuario` (`id_tipo_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Pedro','completo123','Gonzalez','Zuñiga','1','pedro@gmail.com',998463029,2),(2,'Vicente2','completo1234','Cisternas2','Acosta2','1','vince2@gmail.com',997450329,1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_noticias_noticia`
--

DROP TABLE IF EXISTS `usuario_noticias_noticia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_noticias_noticia` (
  `usuarioIdUsuario` int NOT NULL,
  `noticiaIdNoticia` int NOT NULL,
  PRIMARY KEY (`usuarioIdUsuario`,`noticiaIdNoticia`),
  KEY `IDX_13a9ccb1d084ba70a6fca550de` (`usuarioIdUsuario`),
  KEY `IDX_cd74fb3d04454ed3bd3b6a947c` (`noticiaIdNoticia`),
  CONSTRAINT `FK_13a9ccb1d084ba70a6fca550dee` FOREIGN KEY (`usuarioIdUsuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE,
  CONSTRAINT `FK_cd74fb3d04454ed3bd3b6a947c6` FOREIGN KEY (`noticiaIdNoticia`) REFERENCES `noticia` (`id_noticia`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_noticias_noticia`
--

LOCK TABLES `usuario_noticias_noticia` WRITE;
/*!40000 ALTER TABLE `usuario_noticias_noticia` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_noticias_noticia` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-30  0:54:13
