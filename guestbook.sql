-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 05, 2023 at 12:19 PM
-- Server version: 8.0.28-0ubuntu4
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
  `version` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
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
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `comments` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `user_id`, `comments`, `image`, `created_date`, `status`) VALUES
(12, 13, 'test2', NULL, '10/12/2022 12:59:21am', '1'),
(13, 13, 'test', '0c6f4321ba23ea81b0b9521c63b65e85.jpg', '10/12/2022 01:00:50am', '1'),
(14, 13, 'test 3', '639028dc1fe5bf03baad7c0934534b3b.jpg', '10/12/2022 01:01:15am', '1'),
(15, 13, NULL, 'd092334c7748df69c8c69bb1537b123e.jpg', '10/12/2022 01:01:37am', '1'),
(16, 13, NULL, '830cff04f3c1735fc89f31c414e90092.svg', '06/03/2023 10:55:49pm', '1'),
(17, 13, 'new', NULL, '06/03/2023 10:56:01pm', '1'),
(18, 13, 'new', '182a2e14bafb208d9f82142f30576d16.png', '06/03/2023 10:56:06pm', '1'),
(19, 14, 'Post from Shan', '4f34b710adf33bbe03eaf8a53ecfc71a.png', '06/05/2023 11:14:31am', '1'),
(20, 14, 'post from shan 2', NULL, '06/05/2023 11:26:53am', '1'),
(21, 15, 'test post', NULL, '06/05/2023 11:49:09am', '1'),
(22, 15, NULL, 'f25db255465de77ba58cc3fb3da62b1e.svg', '06/05/2023 11:49:38am', '1'),
(23, 15, 'test post 2', '6b083d9f82f4d698decd5d6114d71cb0.jpg', '06/05/2023 11:50:13am', '1');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `email_id` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email_id`, `roles`, `password`, `first_name`, `last_name`, `role`) VALUES
(10, 'admin@gmail.com', '[]', '$2y$13$Ph2M/2GARQ5Zf8nz.o1fZ.snyyv7BppIr063.THMXor.DpDa8pPYy', 'Admin', NULL, 1),
(13, 'gibinpunnoose@gmail.com', '[]', '$2y$13$I0nyuQNzYY7uOUfhVBnYw.zp7af2w2VT6zLNYR32EdIKYQTCS.8MS', 'Gibin', 'Punnoose', NULL),
(14, 'shanp@gmail.com', '[]', '$2y$13$lg2YrlBFRLQqU0k4ZA8kNuj.srESZHMK3Hsjt5MzktkRS8CevQ9ku', 'Shan', 'P', NULL),
(15, 'punnooseg@gmail.com', '[]', '$2y$13$OLIq1ZZFoo17IT/c4b2Z4OXoG91q/gG5GHz62oWKAqiCtwD3Tk4FO', 'Punnoose', 'G', NULL);

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
