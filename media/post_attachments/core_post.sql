-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 20, 2024 at 12:35 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `social_book`
--

-- --------------------------------------------------------

--
-- Table structure for table `core_post`
--

CREATE TABLE `core_post` (
  `id` char(32) NOT NULL,
  `user` varchar(100) NOT NULL,
  `caption` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `no_of_likes` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_post`
--

INSERT INTO `core_post` (`id`, `user`, `caption`, `created_at`, `no_of_likes`, `first_name`, `last_name`, `approved`, `image`) VALUES
('1e8589894887467d873f2df470769441', 'ankit', 'lorem', '2024-02-19 19:12:17.637664', 1, 'ankit', 'rawal', 1, 'post_images/dummy_1Utj85P.pdf'),
('434b00716d3f4f318ce96502af2e733f', 'manish', 'This is my research ', '2024-02-20 06:15:45.649859', 1, 'manish ', 'timsina', 1, 'post_images/Screenshot_2024-02-19_080804_bJQrRPt.png'),
('44e77d6dd56a46909ebda069da1b3e30', 'manish', '', '2024-02-19 19:18:31.766105', 1, 'manish ', 'timsina', 1, 'post_images/Screenshot_2024-02-19_155044.png'),
('7fc26f8f8cf54a1fa865bef4f3c51bb8', 'ankit', 'fdfdf', '2024-02-18 11:26:01.163690', 0, 'ankit', 'rawal', 1, '1'),
('94328ad451b7449eb4d0eff7e4821e4f', 'ankit', '', '2024-02-19 19:07:24.419846', 0, 'ankit', 'rawal', 1, 'post_images/file_example_PPT_250kB_n1R0VQv_RPDPL34.ppt'),
('94bec340862e46d9bb5aa655804549f5', 'ankit', 'This is my id', '2024-02-20 06:19:45.004021', 1, 'ankit', 'rawal', 1, 'post_images/Screenshot_2024-02-20_061931.png'),
('9658a6dabcca41cb99a32c3fcc39bc65', 'ankit', '', '2024-02-20 11:14:20.539382', 0, 'ankit', 'rawal', 0, 'post_images/Screenshot_2024-02-20_111416.png'),
('a2cfd995cf2c4a26b48bfe21656b249e', 'ankit', 'fadfa', '2024-02-18 11:25:32.180843', 0, 'ankit', 'rawal', 0, '1'),
('b1a65898bc3943a7b99b5c895950fbf8', 'ankit', '', '2024-02-19 19:05:18.298242', 0, 'ankit', 'rawal', 0, 'post_images/dummy_jMCZL7Y.pdf'),
('edf1e7a2228840518624fed10d94284f', 'ankit', 'Hello everyone', '2024-02-20 06:19:21.670867', 2, 'ankit', 'rawal', 1, 'post_images/Screenshot_2024-02-20_061912.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `core_post`
--
ALTER TABLE `core_post`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
