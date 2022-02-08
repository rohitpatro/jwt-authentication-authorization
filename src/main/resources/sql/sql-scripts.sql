-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.6.5-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for my_app
DROP DATABASE IF EXISTS `my_app`;
CREATE DATABASE IF NOT EXISTS `my_app` /*!40100 DEFAULT CHARACTER SET armscii8 COLLATE armscii8_bin */;
USE `my_app`;

-- Dumping structure for table my_app.employees
DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(50) COLLATE armscii8_bin NOT NULL,
  `DEPARTMENT` varchar(50) COLLATE armscii8_bin NOT NULL,
  `SALARY` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Dumping data for table my_app.employees: ~24 rows (approximately)
DELETE FROM `employees`;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` (`ID`, `NAME`, `DEPARTMENT`, `SALARY`) VALUES
	(101, 'Mohan', 'Admin', 4000),
	(102, 'Adarsh', 'HR', 3000),
	(103, 'Rohit', 'IT', 4000),
	(104, 'Dorvin', 'Finance', 6500),
	(105, 'Rohit', 'HR', 3000),
	(106, 'Rajesh', 'Finance', 5000),
	(107, 'Preet', 'HR', 7000),
	(108, 'Maryam', 'Admin', 4000),
	(109, 'Sanjay', 'IT', 6500),
	(110, 'Vasudha', 'IT', 7000),
	(111, 'Melinda', 'IT', 8000),
	(112, 'Komal', 'IT', 10000),
	(113, 'Gautham', 'Admin', 2000),
	(114, 'Manisha', 'HR', 3000),
	(115, 'Chandni', 'IT', 4500),
	(116, 'Satya', 'Finance', 6500),
	(117, 'Adarsh', 'HR', 3500),
	(118, 'Tejaswi', 'Finance', 5500),
	(119, 'Cory', 'HR', 8000),
	(120, 'Monica', 'Admin', 5000),
	(121, 'Rosalin', 'IT', 6000),
	(122, 'Ibrahim', 'IT', 8000),
	(123, 'Vikram', 'IT', 8000),
	(124, 'Dheeraj', 'IT', 11000);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;

-- Dumping structure for table my_app.hibernate_sequence
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Dumping data for table my_app.hibernate_sequence: ~0 rows (approximately)
DELETE FROM `hibernate_sequence`;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` (`next_val`) VALUES
	(9);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;

-- Dumping structure for table my_app.role
DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE armscii8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Dumping data for table my_app.role: ~4 rows (approximately)
DELETE FROM `role`;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`id`, `name`) VALUES
	(1, 'ROLE_USER'),
	(2, 'ROLE_MANAGER'),
	(3, 'ROLE_ADMIN'),
	(4, 'ROLE_SUPER_ADMIN');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

-- Dumping structure for table my_app.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE armscii8_bin DEFAULT NULL,
  `password` varchar(255) COLLATE armscii8_bin DEFAULT NULL,
  `username` varchar(255) COLLATE armscii8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Dumping data for table my_app.user: ~4 rows (approximately)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `name`, `password`, `username`) VALUES
	(5, 'Rohit', '$2a$10$u/tQH/AGIfszUSdJ27fQlOJtZ7PaA7B02x.LTUaxT4vK9BZB6EKe.', 'rohit'),
	(6, 'Champ', '$2a$10$0G3amBzpIepPAvLSilcbA.micD5kQ.gyPTKrJR40sE5Sh4TynClZC', 'champ'),
	(7, 'Anjali', '$2a$10$CubyFFU/W6xxQoM2Hu9w5eDnZ50Mg5aY1P0dbTCTdQjvu8aobqV/O', 'anjali'),
	(8, 'Kuku', '$2a$10$QnVkiShgmMsL4IYh8xhMmubdJLzZRJcnNVIdYFP9mImoOg7MQyqAi', 'kuku');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- Dumping structure for table my_app.user_roles
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` bigint(20) NOT NULL,
  `roles_id` bigint(20) NOT NULL,
  KEY `FKj9553ass9uctjrmh0gkqsmv0d` (`roles_id`),
  KEY `FK55itppkw3i07do3h7qoclqd4k` (`user_id`),
  CONSTRAINT `FK55itppkw3i07do3h7qoclqd4k` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKj9553ass9uctjrmh0gkqsmv0d` FOREIGN KEY (`roles_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Dumping data for table my_app.user_roles: ~6 rows (approximately)
DELETE FROM `user_roles`;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` (`user_id`, `roles_id`) VALUES
	(5, 1),
	(5, 2),
	(7, 2),
	(7, 4),
	(6, 1),
	(8, 2);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
