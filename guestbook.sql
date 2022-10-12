-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 12, 2022 at 01:04 AM
-- Server version: 8.0.27-0ubuntu0.20.04.1
-- PHP Version: 8.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `guestbook`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20221006194449', NULL, NULL),
('DoctrineMigrations\\Version20221006195922', '2022-10-06 20:59:39', 57),
('DoctrineMigrations\\Version20221006211631', '2022-10-06 22:16:56', 75),
('DoctrineMigrations\\Version20221009143241', '2022-10-09 15:33:35', 153),
('DoctrineMigrations\\Version20221009144032', '2022-10-09 15:40:45', 129),
('DoctrineMigrations\\Version20221009144449', '2022-10-09 15:45:19', 82),
('DoctrineMigrations\\Version20221009144841', '2022-10-09 15:48:50', 64),
('DoctrineMigrations\\Version20221009180459', '2022-10-09 19:05:21', 161),
('DoctrineMigrations\\Version20221009182016', '2022-10-09 19:20:38', 169),
('DoctrineMigrations\\Version20221010170537', '2022-10-10 18:05:46', 109),
('DoctrineMigrations\\Version20221010171737', '2022-10-10 18:18:08', 82),
('DoctrineMigrations\\Version20221011011821', '2022-10-11 02:18:37', 190),
('DoctrineMigrations\\Version20221011013248', '2022-10-11 02:32:57', 141),
('DoctrineMigrations\\Version20221011013659', '2022-10-11 02:37:08', 91),
('DoctrineMigrations\\Version20221011013740', '2022-10-11 02:37:44', 98);

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `comments` longtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `user_id`, `comments`, `image`, `created_date`, `status`) VALUES
(12, 13, 'test2', NULL, '10/12/2022 12:59:21am', '1'),
(13, 13, 'test', '0c6f4321ba23ea81b0b9521c63b65e85.jpg', '10/12/2022 01:00:50am', '1'),
(14, 13, 'test 3', '639028dc1fe5bf03baad7c0934534b3b.jpg', '10/12/2022 01:01:15am', '1'),
(15, 13, NULL, 'd092334c7748df69c8c69bb1537b123e.jpg', '10/12/2022 01:01:37am', '1');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `email_id` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email_id`, `roles`, `password`, `first_name`, `last_name`, `role`) VALUES
(10, 'admin@gmail.com', '[]', '$2y$13$Ph2M/2GARQ5Zf8nz.o1fZ.snyyv7BppIr063.THMXor.DpDa8pPYy', 'Admin', NULL, '1'),
(13, 'gibinpunnoose@gmail.com', '[]', '$2y$13$I0nyuQNzYY7uOUfhVBnYw.zp7af2w2VT6zLNYR32EdIKYQTCS.8MS', 'Gibin', 'Punnoose', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649A832C1C9` (`email_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
