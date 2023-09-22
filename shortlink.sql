-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 22, 2023 at 08:00 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shortlink`
--

-- --------------------------------------------------------

--
-- Table structure for table `url_storage`
--

CREATE TABLE `url_storage` (
  `id` int(11) NOT NULL,
  `long_url` tinytext NOT NULL,
  `short_code` varchar(50) NOT NULL,
  `hits` int(11) NOT NULL,
  `added_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `url_storage`
--

INSERT INTO `url_storage` (`id`, `long_url`, `short_code`, `hits`, `added_date`) VALUES
(1, 'https://github.com/Umair121245/able-friends/', 'f64', 0, '2023-09-22 16:04:32'),
(2, 'https://github.com/Umair121245/able-friends/', 'R6XTqC', 0, '2023-09-22 16:12:17'),
(3, 'https://github.com/Umair121245/able-friends/', 'cl0Rcb', 0, '2023-09-22 16:13:05'),
(4, 'https://github.com/Umair121245/able-friends/', 't5VUn0', 0, '2023-09-22 16:13:29'),
(5, 'https://github.com/Umair121245/able-friends/', 'NzsQlh', 0, '2023-09-22 16:13:48'),
(6, 'https://github.com/Umair121245/able-friends/', 'jdz3yh', 0, '2023-09-22 16:14:23'),
(7, 'https://github.com/Umair121245/able-friends/', 'cqLykT', 0, '2023-09-22 16:14:34'),
(8, 'google.com', 'f6nHUw', 0, '2023-09-22 16:51:35'),
(9, 'https://github.com/Umair121245/able-friends/', 'IENAix', 0, '2023-09-22 16:51:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `url_storage`
--
ALTER TABLE `url_storage`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `url_storage`
--
ALTER TABLE `url_storage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
