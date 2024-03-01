-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 29, 2024 at 02:58 PM
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
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add profile', 7, 'add_profile'),
(26, 'Can change profile', 7, 'change_profile'),
(27, 'Can delete profile', 7, 'delete_profile'),
(28, 'Can view profile', 7, 'view_profile'),
(29, 'Can add followers count', 8, 'add_followerscount'),
(30, 'Can change followers count', 8, 'change_followerscount'),
(31, 'Can delete followers count', 8, 'delete_followerscount'),
(32, 'Can view followers count', 8, 'view_followerscount'),
(33, 'Can add like post', 9, 'add_likepost'),
(34, 'Can change like post', 9, 'change_likepost'),
(35, 'Can delete like post', 9, 'delete_likepost'),
(36, 'Can view like post', 9, 'view_likepost'),
(37, 'Can add post', 10, 'add_post'),
(38, 'Can change post', 10, 'change_post'),
(39, 'Can delete post', 10, 'delete_post'),
(40, 'Can view post', 10, 'view_post'),
(41, 'Can add pending post', 11, 'add_pendingpost'),
(42, 'Can change pending post', 11, 'change_pendingpost'),
(43, 'Can delete pending post', 11, 'delete_pendingpost'),
(44, 'Can view pending post', 11, 'view_pendingpost'),
(45, 'Can add comment', 12, 'add_comment'),
(46, 'Can change comment', 12, 'change_comment'),
(47, 'Can delete comment', 12, 'delete_comment'),
(48, 'Can view comment', 12, 'view_comment'),
(49, 'Can add viewed post', 13, 'add_viewedpost'),
(50, 'Can change viewed post', 13, 'change_viewedpost'),
(51, 'Can delete viewed post', 13, 'delete_viewedpost'),
(52, 'Can view viewed post', 13, 'view_viewedpost'),
(53, 'Can add post attachment', 14, 'add_postattachment'),
(54, 'Can change post attachment', 14, 'change_postattachment'),
(55, 'Can delete post attachment', 14, 'delete_postattachment'),
(56, 'Can view post attachment', 14, 'view_postattachment'),
(57, 'Can add post image', 15, 'add_postimage'),
(58, 'Can change post image', 15, 'change_postimage'),
(59, 'Can delete post image', 15, 'delete_postimage'),
(60, 'Can view post image', 15, 'view_postimage'),
(61, 'Can add followings count', 16, 'add_followingscount'),
(62, 'Can change followings count', 16, 'change_followingscount'),
(63, 'Can delete followings count', 16, 'delete_followingscount'),
(64, 'Can view followings count', 16, 'view_followingscount'),
(65, 'Can add view log', 17, 'add_viewlog'),
(66, 'Can change view log', 17, 'change_viewlog'),
(67, 'Can delete view log', 17, 'delete_viewlog'),
(68, 'Can view view log', 17, 'view_viewlog'),
(69, 'Can add rating', 18, 'add_rating'),
(70, 'Can change rating', 18, 'change_rating'),
(71, 'Can delete rating', 18, 'delete_rating'),
(72, 'Can view rating', 18, 'view_rating'),
(73, 'Can add chat model', 19, 'add_chatmodel'),
(74, 'Can change chat model', 19, 'change_chatmodel'),
(75, 'Can delete chat model', 19, 'delete_chatmodel'),
(76, 'Can view chat model', 19, 'view_chatmodel');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$720000$RNcFey7S26GduDLJUWhOOh$g/Z2v8n4wX/Jc7ciO8kKI5urzcIDVk/NuNYOx2nV8mk=', '2024-02-29 04:08:08.258679', 0, 'manish', 'manish', 'timsina', 'manish@gmail.com', 0, 1, '2024-02-24 06:41:10.772850'),
(2, 'pbkdf2_sha256$720000$sjv4s2l3VkUyP9WoAgkmIb$3MxC51JukZ9KOIoFExIjad+YkQvRRSp3A8I/+JXAhMY=', '2024-02-29 02:37:18.277348', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2024-02-24 06:42:31.622248'),
(3, 'pbkdf2_sha256$720000$dZKvWW8DiwKJdWjr5JA2sO$QrpkgZ50oZKDhAr+qj/GxcvCH+aOn3jkIDh0rxHXRnA=', '2024-02-29 02:35:32.500978', 0, 'ankit', 'ankit', 'rawal', 'ankit@gmail.com', 0, 1, '2024-02-24 06:49:57.723432'),
(4, 'pbkdf2_sha256$720000$vqmlA8N6YItZvzMmICfnho$Os1xuIMl0By48alQ/Vq3R1rLK5+OEl9N0fczZe6Er1w=', '2024-02-29 04:00:19.976814', 0, 'gyanhari', 'gyanhari', 'dahal', 'gyanhari@gmail.com', 0, 1, '2024-02-25 05:17:59.462890');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_chatmodel`
--

CREATE TABLE `chat_chatmodel` (
  `id` bigint(20) NOT NULL,
  `sender` varchar(100) NOT NULL,
  `message` longtext DEFAULT NULL,
  `thread_name` varchar(50) DEFAULT NULL,
  `timestamp` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chat_chatmodel`
--

INSERT INTO `chat_chatmodel` (`id`, `sender`, `message`, `thread_name`, `timestamp`) VALUES
(1, 'manish', 'hello', 'chat_4-1', '2024-02-28 03:09:44.291188'),
(2, 'manish', 'manish', 'chat_4-1', '2024-02-28 03:09:47.448421'),
(3, 'manish', 'timsina', 'chat_4-1', '2024-02-28 03:09:48.705259'),
(4, 'gyanhari', 'hello manish', 'chat_4-1', '2024-02-28 03:10:09.600302'),
(5, 'gyanhari', 'k xa bro', 'chat_4-1', '2024-02-28 03:28:43.511013'),
(26, 'manish', 'sdfasd', 'chat_3-1', '2024-02-28 11:07:51.177269'),
(27, 'manish', 'fasd', 'chat_3-1', '2024-02-28 11:07:51.487781'),
(28, 'manish', 'fasd', 'chat_3-1', '2024-02-28 11:07:51.809946'),
(29, 'manish', 'manish', 'chat_1-1', '2024-02-28 11:38:16.789486'),
(30, 'manish', 'hello', 'chat_4-1', '2024-02-29 01:12:42.399376'),
(31, 'manish', 'khana vayo', 'chat_4-1', '2024-02-29 03:48:58.895381'),
(32, 'gyanhari', 'hello', 'chat_4-1', '2024-02-29 04:00:33.452738');

-- --------------------------------------------------------

--
-- Table structure for table `core_comment`
--

CREATE TABLE `core_comment` (
  `id` bigint(20) NOT NULL,
  `text` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `post_id` char(32) NOT NULL,
  `user_id` int(11) NOT NULL,
  `profile_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_comment`
--

INSERT INTO `core_comment` (`id`, `text`, `created_at`, `post_id`, `user_id`, `profile_id`) VALUES
(11, 'hello bro', '2024-02-28 11:15:03.459240', 'bd2942eb5edd47188e73a2371343c2e8', 1, 1),
(13, 'fasdf', '2024-02-28 14:17:23.030625', '639dd71515ca4fbba41070633b7b24c2', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `core_followerscount`
--

CREATE TABLE `core_followerscount` (
  `id` bigint(20) NOT NULL,
  `follower` varchar(100) NOT NULL,
  `user` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_followerscount`
--

INSERT INTO `core_followerscount` (`id`, `follower`, `user`) VALUES
(3, 'gyanhari', 'ankit'),
(9, 'gyanhari', 'manish'),
(15, 'ankit', 'gyanhari'),
(18, 'ankit', 'manish'),
(28, 'manish', 'gyanhari');

-- --------------------------------------------------------

--
-- Table structure for table `core_followingscount`
--

CREATE TABLE `core_followingscount` (
  `id` bigint(20) NOT NULL,
  `following_user` varchar(100) NOT NULL,
  `user` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_likepost`
--

CREATE TABLE `core_likepost` (
  `id` bigint(20) NOT NULL,
  `post_id` varchar(500) NOT NULL,
  `username` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_likepost`
--

INSERT INTO `core_likepost` (`id`, `post_id`, `username`) VALUES
(4, '26ac6694-2ee7-45dc-b23c-986dd5e70c0a', 'manish'),
(5, 'dfce5e03-13e9-41c2-8e88-36d1a6f76393', 'manish'),
(6, 'c8050f38-67fe-4184-9b4c-a7702a01c24c', 'ankit'),
(7, 'fba3ca3e-afa6-4bcf-a8e6-2c66ae6c2827', 'ankit'),
(12, '639dd715-15ca-4fbb-a410-70633b7b24c2', 'manish'),
(19, 'daf31fa1-7da1-476e-bbc3-7ae18c4e6ccf', 'gyanhari'),
(21, 'bd2942eb-5edd-4718-8e73-a2371343c2e8', 'manish');

-- --------------------------------------------------------

--
-- Table structure for table `core_pendingpost`
--

CREATE TABLE `core_pendingpost` (
  `id` bigint(20) NOT NULL,
  `caption` varchar(255) NOT NULL,
  `image` varchar(100) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `approved` tinyint(1) NOT NULL,
  `view_count` int(11) NOT NULL,
  `budget` longtext NOT NULL,
  `rating` double NOT NULL,
  `attachment` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_post`
--

INSERT INTO `core_post` (`id`, `user`, `caption`, `created_at`, `no_of_likes`, `approved`, `view_count`, `budget`, `rating`, `attachment`, `first_name`, `image`, `last_name`) VALUES
('04c5aac01e4e4626b44edb0aa42f0d17', 'manish', 'd', '2024-02-29 06:42:30.850869', 0, 0, 0, '', 0, '', 'manish', '', 'timsina'),
('4d374484758d42d9b0286abb4088b127', 'ankit', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', '2024-02-27 21:18:05.734794', 0, 1, 4, '4000', 0, '', 'ankit', '', 'rawal'),
('639dd71515ca4fbba41070633b7b24c2', 'manish', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)', '2024-02-26 09:03:24.673369', 1, 1, 10, '', 0, '', 'manish', '', 'timsina'),
('bd2942eb5edd47188e73a2371343c2e8', 'ankit', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', '2024-02-27 21:21:03.046411', 1, 1, 3, '', 0, '', 'ankit', '', 'rawal'),
('daf31fa17da1476ebbc37ae18c4e6ccf', 'manish', '', '2024-02-28 08:05:47.208745', 1, 1, 4, '4000 to 9000', 0, '', 'manish', '', 'timsina');

-- --------------------------------------------------------

--
-- Table structure for table `core_postattachment`
--

CREATE TABLE `core_postattachment` (
  `id` bigint(20) NOT NULL,
  `attachment` varchar(100) NOT NULL,
  `post_id` char(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_postattachment`
--

INSERT INTO `core_postattachment` (`id`, `attachment`, `post_id`) VALUES
(18, 'post_attachments/dummy_Xqmdzwc.pdf', '4d374484758d42d9b0286abb4088b127'),
(19, 'post_attachments/dummy_DG9M6Pb_B98vk2G.pdf', '4d374484758d42d9b0286abb4088b127');

-- --------------------------------------------------------

--
-- Table structure for table `core_postimage`
--

CREATE TABLE `core_postimage` (
  `id` bigint(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `post_id` char(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_postimage`
--

INSERT INTO `core_postimage` (`id`, `image`, `post_id`) VALUES
(27, 'post_images/Screenshot_2024-02-27_211623.png', '4d374484758d42d9b0286abb4088b127'),
(28, 'post_images/Screenshot_2024-02-27_211635.png', '4d374484758d42d9b0286abb4088b127'),
(29, 'post_images/Screenshot_2024-02-27_211645.png', '4d374484758d42d9b0286abb4088b127'),
(33, 'post_images/Screenshot_2024-02-27_211623_JL1XKxC.png', 'bd2942eb5edd47188e73a2371343c2e8'),
(35, 'post_images/Screenshot_2024-02-27_211645_VnT43lo.png', 'daf31fa17da1476ebbc37ae18c4e6ccf');

-- --------------------------------------------------------

--
-- Table structure for table `core_post_viewers`
--

CREATE TABLE `core_post_viewers` (
  `id` bigint(20) NOT NULL,
  `post_id` char(32) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_profile`
--

CREATE TABLE `core_profile` (
  `id` bigint(20) NOT NULL,
  `bio` longtext NOT NULL,
  `profileimg` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_profile`
--

INSERT INTO `core_profile` (`id`, `bio`, `profileimg`, `location`, `user_id`) VALUES
(1, '', 'profile_images/linkedin-sales-solutions-pAtA8xe_iVM-unsplash_UrqfDMD.jpg', '', 1),
(2, 'hy', 'profile_images/jurica-koletic-7YVZYZeITc8-unsplash_MtqvyEJ.jpg', '', 3),
(3, '', 'profile_images/ali-morshedlou-WMD64tMfc4k-unsplash_JFUrzFW.jpg', '', 4),
(4, '', 'blank-profile-picture.png', '', 2);

-- --------------------------------------------------------

--
-- Table structure for table `core_rating`
--

CREATE TABLE `core_rating` (
  `id` bigint(20) NOT NULL,
  `rating` int(11) NOT NULL,
  `post_id` char(32) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_rating`
--

INSERT INTO `core_rating` (`id`, `rating`, `post_id`, `user_id`) VALUES
(46, 2, '639dd71515ca4fbba41070633b7b24c2', 3),
(47, 1, '639dd71515ca4fbba41070633b7b24c2', 3),
(48, 1, '639dd71515ca4fbba41070633b7b24c2', 3),
(49, 1, '639dd71515ca4fbba41070633b7b24c2', 3),
(51, 3, 'daf31fa17da1476ebbc37ae18c4e6ccf', 1),
(52, 5, 'bd2942eb5edd47188e73a2371343c2e8', 1),
(53, 2, '639dd71515ca4fbba41070633b7b24c2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `core_viewedpost`
--

CREATE TABLE `core_viewedpost` (
  `id` bigint(20) NOT NULL,
  `viewed_at` datetime(6) NOT NULL,
  `post_id` char(32) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_viewedpost`
--

INSERT INTO `core_viewedpost` (`id`, `viewed_at`, `post_id`, `user_id`) VALUES
(18, '2024-02-28 12:23:40.962711', '639dd71515ca4fbba41070633b7b24c2', 1),
(21, '2024-02-28 11:05:01.117053', '639dd71515ca4fbba41070633b7b24c2', 3),
(29, '2024-02-29 02:23:02.838856', 'bd2942eb5edd47188e73a2371343c2e8', 3),
(30, '2024-02-29 02:21:51.087756', '4d374484758d42d9b0286abb4088b127', 3),
(33, '2024-02-29 04:04:24.081665', 'daf31fa17da1476ebbc37ae18c4e6ccf', 4),
(34, '2024-02-28 04:46:25.340862', 'bd2942eb5edd47188e73a2371343c2e8', 1),
(35, '2024-02-28 11:04:29.407156', 'daf31fa17da1476ebbc37ae18c4e6ccf', 3),
(36, '2024-02-28 11:20:12.580986', 'daf31fa17da1476ebbc37ae18c4e6ccf', 1),
(37, '2024-02-28 11:23:49.516643', '4d374484758d42d9b0286abb4088b127', 1),
(40, '2024-02-29 02:37:01.232071', '4d374484758d42d9b0286abb4088b127', 4);

-- --------------------------------------------------------

--
-- Table structure for table `core_viewlog`
--

CREATE TABLE `core_viewlog` (
  `id` bigint(20) NOT NULL,
  `view_time` datetime(6) NOT NULL,
  `post_id` char(32) NOT NULL,
  `viewer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(19, 'chat', 'chatmodel'),
(5, 'contenttypes', 'contenttype'),
(12, 'core', 'comment'),
(8, 'core', 'followerscount'),
(16, 'core', 'followingscount'),
(9, 'core', 'likepost'),
(11, 'core', 'pendingpost'),
(10, 'core', 'post'),
(14, 'core', 'postattachment'),
(15, 'core', 'postimage'),
(7, 'core', 'profile'),
(18, 'core', 'rating'),
(13, 'core', 'viewedpost'),
(17, 'core', 'viewlog'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-02-24 06:32:45.819003'),
(2, 'auth', '0001_initial', '2024-02-24 06:32:46.167388'),
(3, 'admin', '0001_initial', '2024-02-24 06:32:46.251101'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-02-24 06:32:46.259262'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-02-24 06:32:46.265384'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-02-24 06:32:46.316286'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-02-24 06:32:46.355656'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-02-24 06:32:46.368659'),
(9, 'auth', '0004_alter_user_username_opts', '2024-02-24 06:32:46.374816'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-02-24 06:32:46.417153'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-02-24 06:32:46.419383'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-02-24 06:32:46.428046'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-02-24 06:32:46.437475'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-02-24 06:32:46.446760'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-02-24 06:32:46.461358'),
(16, 'auth', '0011_update_proxy_permissions', '2024-02-24 06:32:46.475119'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-02-24 06:32:46.490362'),
(18, 'core', '0001_initial', '2024-02-24 06:32:46.555814'),
(19, 'core', '0002_followerscount_likepost_post', '2024-02-24 06:32:46.575097'),
(20, 'core', '0003_post_first_name_post_last_name', '2024-02-24 06:32:46.599634'),
(21, 'core', '0004_approvedpost_pendingpost', '2024-02-24 06:32:46.709731'),
(22, 'core', '0005_post_approved_postapproval', '2024-02-24 06:32:46.760454'),
(23, 'core', '0006_remove_postapproval_post_post_budget_and_more', '2024-02-24 06:32:47.064931'),
(24, 'core', '0007_approvedpost_postapproval', '2024-02-24 06:32:47.156705'),
(25, 'core', '0008_remove_postapproval_post_delete_approvedpost_and_more', '2024-02-24 06:32:47.378302'),
(26, 'core', '0009_approvedpost_postapproval', '2024-02-24 06:32:47.472093'),
(27, 'core', '0010_remove_postapproval_post_comment_delete_approvedpost_and_more', '2024-02-24 06:32:47.771181'),
(28, 'core', '0011_comment_profileimg', '2024-02-24 06:32:47.787501'),
(29, 'core', '0012_remove_comment_profileimg_comment_profile', '2024-02-24 06:32:47.847313'),
(30, 'core', '0013_remove_post_image_image', '2024-02-24 06:32:47.898768'),
(31, 'core', '0014_post_image_delete_image', '2024-02-24 06:32:47.922222'),
(32, 'core', '0015_remove_post_budget_alter_comment_profile_and_more', '2024-02-24 06:32:48.171499'),
(33, 'core', '0016_post_user_profile', '2024-02-24 06:32:48.230712'),
(34, 'core', '0017_remove_post_user_profile', '2024-02-24 06:32:48.454467'),
(35, 'core', '0018_profile_coverimg', '2024-02-24 06:32:48.469709'),
(36, 'core', '0019_profile_email', '2024-02-24 06:32:48.486086'),
(37, 'core', '0020_remove_profile_email', '2024-02-24 06:32:48.500799'),
(38, 'core', '0021_post_view_count', '2024-02-24 06:32:48.515020'),
(39, 'core', '0022_viewedpost', '2024-02-24 06:32:48.615160'),
(40, 'core', '0023_post_budget', '2024-02-24 06:32:48.625427'),
(41, 'core', '0024_post_rating', '2024-02-24 06:32:48.640250'),
(42, 'core', '0025_remove_profile_coverimg_remove_profile_id_user', '2024-02-24 06:32:48.677366'),
(43, 'core', '0026_remove_post_image_image', '2024-02-24 06:32:48.739041'),
(44, 'core', '0027_post_image_delete_image', '2024-02-24 06:32:48.752542'),
(45, 'core', '0028_alter_post_image', '2024-02-24 06:32:48.774536'),
(46, 'core', '0029_post_attachment', '2024-02-24 06:32:48.789126'),
(47, 'core', '0030_profile_otp_code_alter_profile_user', '2024-02-24 06:32:49.246793'),
(48, 'core', '0031_remove_post_attachment_remove_post_image_and_more', '2024-02-24 06:32:49.436286'),
(49, 'core', '0032_remove_postimage_post_post_attachment_post_image_and_more', '2024-02-24 06:32:50.147343'),
(50, 'core', '0033_alter_profile_user', '2024-02-24 06:32:50.614314'),
(51, 'core', '0034_alter_profile_user', '2024-02-24 06:32:51.026973'),
(52, 'core', '0035_remove_post_attachment_alter_post_image_and_more', '2024-02-24 06:32:51.549117'),
(53, 'core', '0036_post_attachment_alter_post_image_alter_profile_user', '2024-02-24 06:32:52.034879'),
(54, 'core', '0037_postattachment_postimage', '2024-02-24 06:32:52.131849'),
(55, 'core', '0038_followingscount', '2024-02-24 06:32:52.139031'),
(56, 'core', '0039_rename_follower_followingscount_following', '2024-02-24 06:32:52.147484'),
(57, 'core', '0040_rename_following_followingscount_following_user', '2024-02-24 06:32:52.156852'),
(58, 'core', '0041_post_viewers', '2024-02-24 06:32:52.252931'),
(59, 'core', '0042_viewlog', '2024-02-24 06:32:52.340308'),
(60, 'core', '0043_remove_post_attachment_remove_post_first_name_and_more', '2024-02-24 06:32:52.481143'),
(61, 'core', '0044_post_attachment_post_first_name_post_image_and_more', '2024-02-24 06:32:53.059963'),
(62, 'sessions', '0001_initial', '2024-02-24 06:32:53.077361'),
(63, 'core', '0045_rating', '2024-02-24 07:04:40.164955'),
(64, 'chat', '0001_initial', '2024-02-28 02:36:06.026452');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0sfhgtoq8qrw99k2dssltsl5g16q3gxs', '.eJxVjDkOwjAUBe_iGllesIkp6TmD9f0XHECOFCcV4u4QKQW0b2beS2VYl5rXznMeSZ2VVYffrQA-uG2A7tBuk8apLfNY9KbonXZ9nYifl939O6jQ67cuyZFhMWiSc57LEYOPRsAQEhkQBzBY54XB4hBREnNyHIAlCJ9iUu8PCbQ5SA:1rfUww:121DX7nk08nsyh4vpJCIxf0QCpVRTAHEE56IFSeWXeQ', '2024-03-14 01:11:02.873533'),
('13tn3ts7jfd63wejxs1ruduxhmceal2t', '.eJxVjDkOwjAUBe_iGllesIkp6TmD9f0XHECOFCcV4u4QKQW0b2beS2VYl5rXznMeSZ2VVYffrQA-uG2A7tBuk8apLfNY9KbonXZ9nYifl939O6jQ67cuyZFhMWiSc57LEYOPRsAQEhkQBzBY54XB4hBREnNyHIAlCJ9iUu8PCbQ5SA:1rfWLX:EG4rI-Wa9BqLpwCCcIKhvYowceanKHD9A0pkWRqLqqk', '2024-03-14 02:40:31.141686'),
('1hj206w4xni8hi022w300ntimmny543i', '.eJxVjMsOwiAQRf-FtSFAysule7-BzDCDVA0kpV0Z_12bdKHbe865L5FgW2vaBi9pJnEWRpx-N4T84LYDukO7dZl7W5cZ5a7Igw557cTPy-H-HVQY9VsHJIcM3pocPEIsmF0JjFlB8VoRm0hTtN4Ub60lMyGaOGmH2kd2CsX7AxIGOHE:1rdlk4:uPOAgKeuFWC2LfuaMeHZJTVw7AnnkDkuhteXzIPxESA', '2024-03-09 06:42:36.725944'),
('22jf5443g8z9crf0muk6qs3cw6h81rky', '.eJxVjEEOwiAQRe_C2pBSYECX7nsGMsMMUjVtUtqV8e7apAvd_vfef6mE21rT1mRJI6uLsur0uxHmh0w74DtOt1nneVqXkfSu6IM2Pcwsz-vh_h1UbPVbRzQuGKIAQjG7rneC7CF2xbMpxSIHR5IjWBIEKMBeIp2zDdD3ZIt6fwD49jic:1retUu:7CaNTNi-eo1ujFmjOqXPteYS_syP4W0I7AyNAWaTWLI', '2024-03-12 09:11:36.060549'),
('2tnlpo5g91ha3yndxiyuu47jnqw53sz6', '.eJxVjEEOwiAQRe_C2pBSYECX7nsGMsMMUjVtUtqV8e7apAvd_vfef6mE21rT1mRJI6uLsur0uxHmh0w74DtOt1nneVqXkfSu6IM2Pcwsz-vh_h1UbPVbRzQuGKIAQjG7rneC7CF2xbMpxSIHR5IjWBIEKMBeIp2zDdD3ZIt6fwD49jic:1rf9Z9:M-2BLRvwU64GztWmk5uX-UurQvW9VapjPucNgx6qBNc', '2024-03-13 02:21:03.609595'),
('6d5bq6db8j65pngr1wl9o3hz1uzfhyfa', '.eJxVjDkOwjAUBe_iGllesIkp6TmD9f0XHECOFCcV4u4QKQW0b2beS2VYl5rXznMeSZ2VVYffrQA-uG2A7tBuk8apLfNY9KbonXZ9nYifl939O6jQ67cuyZFhMWiSc57LEYOPRsAQEhkQBzBY54XB4hBREnNyHIAlCJ9iUu8PCbQ5SA:1rfXXv:6GKYlA9WpQbTjMPmqZzEHo3ZwuNptvq8TwUy_StKGfY', '2024-03-14 03:57:23.522729'),
('6purxsf5qcti2mcvb2kpgsgtzbvg8r7n', '.eJxVjEEOwiAQRe_C2hAKnQFcuu8ZyDCDUjVtUtqV8e7apAvd_vfef6lE21rT1sqSRlFn1avT75aJH2Xagdxpus2a52ldxqx3RR-06WGW8rwc7t9BpVa_tTUA9koMHqMpINEH8cgdRMAcMDpE1xljew6GBBity1GcNZ6AOVj1_gCxUDaN:1rfB4f:I3aIW36YwK3fmJ2y9OiwD65K6qxj6vnFU_54xVOy_CE', '2024-03-13 03:57:41.037940'),
('7822d3shnke1xap8ylpcnp7xuekn4dav', '.eJxVjEEOwiAQRe_C2pBSYECX7nsGMsMMUjVtUtqV8e7apAvd_vfef6mE21rT1mRJI6uLsur0uxHmh0w74DtOt1nneVqXkfSu6IM2Pcwsz-vh_h1UbPVbRzQuGKIAQjG7rneC7CF2xbMpxSIHR5IjWBIEKMBeIp2zDdD3ZIt6fwD49jic:1reRbP:9HPPwlTI07yWQ4k5BsdFTyzfkM1EXUHnLYO6NgrWBqo', '2024-03-11 03:24:27.034925'),
('7bofg5arnd89axs76hxbgcykwov6szrm', '.eJxVjDkOwjAUBe_iGllesIkp6TmD9f0XHECOFCcV4u4QKQW0b2beS2VYl5rXznMeSZ2VVYffrQA-uG2A7tBuk8apLfNY9KbonXZ9nYifl939O6jQ67cuyZFhMWiSc57LEYOPRsAQEhkQBzBY54XB4hBREnNyHIAlCJ9iUu8PCbQ5SA:1re6ss:junIZE9PD_K6U0QsrDMnUZePsnnFpB3WMXjJFJTH6R4', '2024-03-10 05:17:06.945121'),
('8aldr7hodc8pzca754vcgtfn5v3kci8l', '.eJxVjDkOwjAUBe_iGllesIkp6TmD9f0XHECOFCcV4u4QKQW0b2beS2VYl5rXznMeSZ2VVYffrQA-uG2A7tBuk8apLfNY9KbonXZ9nYifl939O6jQ67cuyZFhMWiSc57LEYOPRsAQEhkQBzBY54XB4hBREnNyHIAlCJ9iUu8PCbQ5SA:1rfHvM:FBEYrBdxARYQavpnIoK4Yswh9Ks99GsVkJx9ySAXmPU', '2024-03-13 11:16:32.722473'),
('94pckuvmdo9r6tsbq75srnu77j0p0sf8', '.eJxVjDkOwjAUBe_iGllesIkp6TmD9f0XHECOFCcV4u4QKQW0b2beS2VYl5rXznMeSZ2VVYffrQA-uG2A7tBuk8apLfNY9KbonXZ9nYifl939O6jQ67cuyZFhMWiSc57LEYOPRsAQEhkQBzBY54XB4hBREnNyHIAlCJ9iUu8PCbQ5SA:1rfWiI:Hm83HI444cHW6Rc_wTnHBLxCWVKk71Shcckdyh3oYl0', '2024-03-14 03:04:02.219379'),
('9tz2ykf6uomn4rp2br72r9zwm40gh5qf', '.eJxVjDkOwjAUBe_iGllesIkp6TmD9f0XHECOFCcV4u4QKQW0b2beS2VYl5rXznMeSZ2VVYffrQA-uG2A7tBuk8apLfNY9KbonXZ9nYifl939O6jQ67cuyZFhMWiSc57LEYOPRsAQEhkQBzBY54XB4hBREnNyHIAlCJ9iUu8PCbQ5SA:1rfKon:wxq8JXolTwlACdSP45qp8eaSFtWBVAN3hqSFhqWLuAw', '2024-03-13 14:21:57.873367'),
('bvvz9wot8hxhyeh5tp3bw654yqlzsho3', '.eJxVjDkOwjAUBe_iGllesIkp6TmD9f0XHECOFCcV4u4QKQW0b2beS2VYl5rXznMeSZ2VVYffrQA-uG2A7tBuk8apLfNY9KbonXZ9nYifl939O6jQ67cuyZFhMWiSc57LEYOPRsAQEhkQBzBY54XB4hBREnNyHIAlCJ9iUu8PCbQ5SA:1rfHyf:PZJRqfQURCaWLKt3D9gXHV32ylDiieiW3PgpfJROWj0', '2024-03-13 11:19:57.161023'),
('ccynxg7ovoqkx8gl6y4kkjrgtzsakbjb', '.eJxVjEEOwiAQRe_C2pBSYECX7nsGMsMMUjVtUtqV8e7apAvd_vfef6mE21rT1mRJI6uLsur0uxHmh0w74DtOt1nneVqXkfSu6IM2Pcwsz-vh_h1UbPVbRzQuGKIAQjG7rneC7CF2xbMpxSIHR5IjWBIEKMBeIp2zDdD3ZIt6fwD49jic:1rf9tb:fPyzMZhjG4cagy_5meVzqTqIx85VVIwpspOhiEnOJGw', '2024-03-13 02:42:11.191254'),
('chbh8r271aearygszohvbfs6szulzo6m', '.eJxVjDkOwjAUBe_iGllesIkp6TmD9f0XHECOFCcV4u4QKQW0b2beS2VYl5rXznMeSZ2VVYffrQA-uG2A7tBuk8apLfNY9KbonXZ9nYifl939O6jQ67cuyZFhMWiSc57LEYOPRsAQEhkQBzBY54XB4hBREnNyHIAlCJ9iUu8PCbQ5SA:1rfUg4:BZUKu9n5w1C97ElRbybvbcNNEFB2w_jFRoF0XEIt2BE', '2024-03-14 00:53:36.564927'),
('d3x2opgs3r13j1josq4d2p6p48vkhnhu', '.eJxVjDkOwjAUBe_iGllesIkp6TmD9f0XHECOFCcV4u4QKQW0b2beS2VYl5rXznMeSZ2VVYffrQA-uG2A7tBuk8apLfNY9KbonXZ9nYifl939O6jQ67cuyZFhMWiSc57LEYOPRsAQEhkQBzBY54XB4hBREnNyHIAlCJ9iUu8PCbQ5SA:1re7LQ:YvlUnp_5VHRPloQWCY8zMIVVOlywHsF3dNIiMhmT8jA', '2024-03-10 05:46:36.500845'),
('de281asqr06gz2rpkhnhogektvriaepf', '.eJxVjMsOwiAQRf-FtSFAysule7-BzDCDVA0kpV0Z_12bdKHbe865L5FgW2vaBi9pJnEWRpx-N4T84LYDukO7dZl7W5cZ5a7Igw557cTPy-H-HVQY9VsHJIcM3pocPEIsmF0JjFlB8VoRm0hTtN4Ub60lMyGaOGmH2kd2CsX7AxIGOHE:1rfWIQ:wgvGDlLu7k51PrdQOtRU9vZ0UqAKeiQhEwoxkX7VXn8', '2024-03-14 02:37:18.277348'),
('e1x5d6gnw6bioca6lrg8e8pfcs8ghvh5', '.eJxVjDkOwjAUBe_iGllesIkp6TmD9f0XHECOFCcV4u4QKQW0b2beS2VYl5rXznMeSZ2VVYffrQA-uG2A7tBuk8apLfNY9KbonXZ9nYifl939O6jQ67cuyZFhMWiSc57LEYOPRsAQEhkQBzBY54XB4hBREnNyHIAlCJ9iUu8PCbQ5SA:1rfWU9:l0pXBTa3StPg4Hbd3Q-7rmFSzU5Is5Y4qpCBc-K1Tqo', '2024-03-14 02:49:25.777466'),
('e9uwn5ihew7c01i8qhdoewuti1s68plx', '.eJxVjEEOwiAQRe_C2pBSYECX7nsGMsMMUjVtUtqV8e7apAvd_vfef6mE21rT1mRJI6uLsur0uxHmh0w74DtOt1nneVqXkfSu6IM2Pcwsz-vh_h1UbPVbRzQuGKIAQjG7rneC7CF2xbMpxSIHR5IjWBIEKMBeIp2zDdD3ZIt6fwD49jic:1rfAev:8U32XA677co-1X3aNOzNBWmgRtCAPaXIKfUs4WYVilY', '2024-03-13 03:31:05.923145'),
('f15uxjfq796qyl9rys3nlhwot7xxyr34', '.eJxVjDkOwjAUBe_iGllesIkp6TmD9f0XHECOFCcV4u4QKQW0b2beS2VYl5rXznMeSZ2VVYffrQA-uG2A7tBuk8apLfNY9KbonXZ9nYifl939O6jQ67cuyZFhMWiSc57LEYOPRsAQEhkQBzBY54XB4hBREnNyHIAlCJ9iUu8PCbQ5SA:1rfHmj:DP4ZNyw8eiP7WY3DA_FpaClmF1fpnjoKcT3wV0h6w2o', '2024-03-13 11:07:37.574458'),
('f5i2743bpfr4q2n74pcwefb7u9vc1kry', '.eJxVjDkOwjAUBe_iGllesIkp6TmD9f0XHECOFCcV4u4QKQW0b2beS2VYl5rXznMeSZ2VVYffrQA-uG2A7tBuk8apLfNY9KbonXZ9nYifl939O6jQ67cuyZFhMWiSc57LEYOPRsAQEhkQBzBY54XB4hBREnNyHIAlCJ9iUu8PCbQ5SA:1rfUFE:abNhN7CcX-PeKCVVYE5s-AvfWhDE0-0uDeJVRwh9VuI', '2024-03-14 00:25:52.469117'),
('g0ewy53q7dsepoymnlg7vknvnkpb1zns', '.eJxVjDkOwjAUBe_iGllesIkp6TmD9f0XHECOFCcV4u4QKQW0b2beS2VYl5rXznMeSZ2VVYffrQA-uG2A7tBuk8apLfNY9KbonXZ9nYifl939O6jQ67cuyZFhMWiSc57LEYOPRsAQEhkQBzBY54XB4hBREnNyHIAlCJ9iUu8PCbQ5SA:1rfHxZ:j4EKz3Mt137RjwbvFtl_DiV--VsRR0Ue6HHp4DRTbP8', '2024-03-13 11:18:49.038335'),
('ggzyfi1iuos20fncvt2zs0u8a6wvd9i6', '.eJxVjDkOwjAUBe_iGllesIkp6TmD9f0XHECOFCcV4u4QKQW0b2beS2VYl5rXznMeSZ2VVYffrQA-uG2A7tBuk8apLfNY9KbonXZ9nYifl939O6jQ67cuyZFhMWiSc57LEYOPRsAQEhkQBzBY54XB4hBREnNyHIAlCJ9iUu8PCbQ5SA:1rfVgt:rST573L1NG5uBSUEN2S2zd8U2TQSVKCqrxF-Unb5t58', '2024-03-14 01:58:31.977369'),
('gi75rz3xok4y6dx38y01q83gc5o02imw', '.eJxVjDkOwjAUBe_iGllesIkp6TmD9f0XHECOFCcV4u4QKQW0b2beS2VYl5rXznMeSZ2VVYffrQA-uG2A7tBuk8apLfNY9KbonXZ9nYifl939O6jQ67cuyZFhMWiSc57LEYOPRsAQEhkQBzBY54XB4hBREnNyHIAlCJ9iUu8PCbQ5SA:1re6r8:WBLoUar-SPa1-yVRNWlbmTHc8dooaiX2NCNAfhrkEI0', '2024-03-10 05:15:18.046886'),
('icjqygnvglb0ojikhz58905n3tnko1jz', '.eJxVjDkOwjAUBe_iGllesIkp6TmD9f0XHECOFCcV4u4QKQW0b2beS2VYl5rXznMeSZ2VVYffrQA-uG2A7tBuk8apLfNY9KbonXZ9nYifl939O6jQ67cuyZFhMWiSc57LEYOPRsAQEhkQBzBY54XB4hBREnNyHIAlCJ9iUu8PCbQ5SA:1rfItl:Q9sUjZc0Yn4vBLdiaqIquLImfgD4U_PF5Sj3vw-6nIQ', '2024-03-13 12:18:57.734975'),
('ieoa3iu42t1qxidvvr6g2tgq8btvij6a', '.eJxVjEEOwiAQRe_C2pBSYECX7nsGMsMMUjVtUtqV8e7apAvd_vfef6mE21rT1mRJI6uLsur0uxHmh0w74DtOt1nneVqXkfSu6IM2Pcwsz-vh_h1UbPVbRzQuGKIAQjG7rneC7CF2xbMpxSIHR5IjWBIEKMBeIp2zDdD3ZIt6fwD49jic:1re6qv:fn_aaYWG1GafFVvKQANOiCvVBdj3ijWazERAhJ7h9zU', '2024-03-10 05:15:05.158326'),
('ir1pgvphy6ie1ba8vxwx7qn2plbg7t3h', '.eJxVjEEOwiAQRe_C2pBSYECX7nsGMsMMUjVtUtqV8e7apAvd_vfef6mE21rT1mRJI6uLsur0uxHmh0w74DtOt1nneVqXkfSu6IM2Pcwsz-vh_h1UbPVbRzQuGKIAQjG7rneC7CF2xbMpxSIHR5IjWBIEKMBeIp2zDdD3ZIt6fwD49jic:1reZdA:tYXLsFt2xp5fMvZ3os8qFwqVUgmWivKRnMKAPVxhbbI', '2024-03-11 11:58:48.184823'),
('j1hro9gzvyy0wvpnwd29ay01qdmx1foy', '.eJxVjDkOwjAUBe_iGllesIkp6TmD9f0XHECOFCcV4u4QKQW0b2beS2VYl5rXznMeSZ2VVYffrQA-uG2A7tBuk8apLfNY9KbonXZ9nYifl939O6jQ67cuyZFhMWiSc57LEYOPRsAQEhkQBzBY54XB4hBREnNyHIAlCJ9iUu8PCbQ5SA:1re6sh:_vAaPRNb74fdvb2q9FGc1b6ced8A_GOnd17RAi7lAJU', '2024-03-10 05:16:55.631780'),
('jioz0ngwbn3aemiyfb69dc1l020mh1im', '.eJxVjEEOwiAQRe_C2hAKnQFcuu8ZyDCDUjVtUtqV8e7apAvd_vfef6lE21rT1sqSRlFn1avT75aJH2Xagdxpus2a52ldxqx3RR-06WGW8rwc7t9BpVa_tTUA9koMHqMpINEH8cgdRMAcMDpE1xljew6GBBity1GcNZ6AOVj1_gCxUDaN:1rfXal:L6cSb9cJ2bC0WDo3dwUQ0xt1bGESglcHD6c2lvZdTK4', '2024-03-14 04:00:19.976814'),
('kbswwxfjtkvlk0le043823ojdhuh1xo3', '.eJxVjEEOwiAQRe_C2pBSYECX7nsGMsMMUjVtUtqV8e7apAvd_vfef6mE21rT1mRJI6uLsur0uxHmh0w74DtOt1nneVqXkfSu6IM2Pcwsz-vh_h1UbPVbRzQuGKIAQjG7rneC7CF2xbMpxSIHR5IjWBIEKMBeIp2zDdD3ZIt6fwD49jic:1rezVp:Y2FwAhDyhR30O5KOwbfECFV-aZ5Zfbv8siNLR42xDtU', '2024-03-12 15:36:57.562374'),
('ksqhu0ww5q918ufu5gt5a4jmpzzxp249', '.eJxVjDkOwjAUBe_iGllesIkp6TmD9f0XHECOFCcV4u4QKQW0b2beS2VYl5rXznMeSZ2VVYffrQA-uG2A7tBuk8apLfNY9KbonXZ9nYifl939O6jQ67cuyZFhMWiSc57LEYOPRsAQEhkQBzBY54XB4hBREnNyHIAlCJ9iUu8PCbQ5SA:1rfXiK:whi6_amlx3rPTNZZvcH0np5VRbd741Z1MmNa5Ftejg8', '2024-03-14 04:08:08.258679'),
('lipateq5wwz3fb0qarofnkkjkrly203z', '.eJxVjDkOwjAUBe_iGllesIkp6TmD9f0XHECOFCcV4u4QKQW0b2beS2VYl5rXznMeSZ2VVYffrQA-uG2A7tBuk8apLfNY9KbonXZ9nYifl939O6jQ67cuyZFhMWiSc57LEYOPRsAQEhkQBzBY54XB4hBREnNyHIAlCJ9iUu8PCbQ5SA:1rfHtc:f9VUej1Ws5ZRHG3y-o_mQMmTWIknOpDHJ2SU6EDgNOc', '2024-03-13 11:14:44.104948'),
('lx14ssk2x3binexwzlu0as8yeqcdhj0w', '.eJxVjDkOwjAUBe_iGllesIkp6TmD9f0XHECOFCcV4u4QKQW0b2beS2VYl5rXznMeSZ2VVYffrQA-uG2A7tBuk8apLfNY9KbonXZ9nYifl939O6jQ67cuyZFhMWiSc57LEYOPRsAQEhkQBzBY54XB4hBREnNyHIAlCJ9iUu8PCbQ5SA:1rfWau:gzyf3jYvQVPVq248kqjT1HYTxLOhN9g_-hsbHjvXJX4', '2024-03-14 02:56:24.866782'),
('m16mou3u70xbpy04k9atoog89c1v9tx0', '.eJxVjDkOwjAUBe_iGllesIkp6TmD9f0XHECOFCcV4u4QKQW0b2beS2VYl5rXznMeSZ2VVYffrQA-uG2A7tBuk8apLfNY9KbonXZ9nYifl939O6jQ67cuyZFhMWiSc57LEYOPRsAQEhkQBzBY54XB4hBREnNyHIAlCJ9iUu8PCbQ5SA:1reZV8:k3cui1m2pHXpg1OhNJhqlqMZJmv3lbb_PcYU9Gz62yY', '2024-03-11 11:50:30.123033'),
('me28o3qafzr2d7nvymx7x1cai5ettpyt', '.eJxVjMsOwiAQRf-FtSFAysule7-BzDCDVA0kpV0Z_12bdKHbe865L5FgW2vaBi9pJnEWRpx-N4T84LYDukO7dZl7W5cZ5a7Igw557cTPy-H-HVQY9VsHJIcM3pocPEIsmF0JjFlB8VoRm0hTtN4Ub60lMyGaOGmH2kd2CsX7AxIGOHE:1reGYs:HVUazs_gwmHHjBUlJJGnhw07hvFR1I9Uu1jZOckqf7E', '2024-03-10 15:37:06.044682'),
('mi6c4lnsvqtru8oz9xho3d93p5pb521b', '.eJxVjMsOwiAQRf-FtSFAysule7-BzDCDVA0kpV0Z_12bdKHbe865L5FgW2vaBi9pJnEWRpx-N4T84LYDukO7dZl7W5cZ5a7Igw557cTPy-H-HVQY9VsHJIcM3pocPEIsmF0JjFlB8VoRm0hTtN4Ub60lMyGaOGmH2kd2CsX7AxIGOHE:1rePb1:A3YHiotsfgflFRVEoXEVh89qps11CHsbz4H6WbG-4b0', '2024-03-11 01:15:55.443699'),
('mlp8betk6tmykfgl1t0naspvko4tdd3r', '.eJxVjMsOwiAQRf-FtSFAysule7-BzDCDVA0kpV0Z_12bdKHbe865L5FgW2vaBi9pJnEWRpx-N4T84LYDukO7dZl7W5cZ5a7Igw557cTPy-H-HVQY9VsHJIcM3pocPEIsmF0JjFlB8VoRm0hTtN4Ub60lMyGaOGmH2kd2CsX7AxIGOHE:1rePml:9XDsmDVV-nRA5mbOkqRcTIUWrifCK8bqyH5fMHiAJxQ', '2024-03-11 01:28:03.244217'),
('moio8mde60uvl9qunosph8zoeoun86xo', '.eJxVjMsOwiAQRf-FtSFAysule7-BzDCDVA0kpV0Z_12bdKHbe865L5FgW2vaBi9pJnEWRpx-N4T84LYDukO7dZl7W5cZ5a7Igw557cTPy-H-HVQY9VsHJIcM3pocPEIsmF0JjFlB8VoRm0hTtN4Ub60lMyGaOGmH2kd2CsX7AxIGOHE:1rfHkt:ZDsV91WC-q_yI8dp4BHVLuSGAhD87KuR7nnfgHtAk28', '2024-03-13 11:05:43.275625'),
('ns0fesmncy6n7g49pld45onj55ou7bi7', '.eJxVjDkOwjAUBe_iGllesIkp6TmD9f0XHECOFCcV4u4QKQW0b2beS2VYl5rXznMeSZ2VVYffrQA-uG2A7tBuk8apLfNY9KbonXZ9nYifl939O6jQ67cuyZFhMWiSc57LEYOPRsAQEhkQBzBY54XB4hBREnNyHIAlCJ9iUu8PCbQ5SA:1rfUax:CjEzxJcscuIwyl1yus5mlIUaQG5OCXGzxZOpLOYDLYs', '2024-03-14 00:48:19.058226'),
('qr1zofcdjeufegp2djeatdpmqx3mtu0z', '.eJxVjDkOwjAUBe_iGllesIkp6TmD9f0XHECOFCcV4u4QKQW0b2beS2VYl5rXznMeSZ2VVYffrQA-uG2A7tBuk8apLfNY9KbonXZ9nYifl939O6jQ67cuyZFhMWiSc57LEYOPRsAQEhkQBzBY54XB4hBREnNyHIAlCJ9iUu8PCbQ5SA:1rfM57:JsVtWJ0nSLB0lBiDN7itnJZsegwkcBrzeb8pUjdc0e0', '2024-03-13 15:42:53.459840'),
('ranxje84ivuh7bdzzx0ae7utj14c2sly', '.eJxVjDkOwjAUBe_iGllesIkp6TmD9f0XHECOFCcV4u4QKQW0b2beS2VYl5rXznMeSZ2VVYffrQA-uG2A7tBuk8apLfNY9KbonXZ9nYifl939O6jQ67cuyZFhMWiSc57LEYOPRsAQEhkQBzBY54XB4hBREnNyHIAlCJ9iUu8PCbQ5SA:1rfBpm:GVouFnf4tzQHPEqzUmndQeBWx1GVLyHAAa1aB2IbE_A', '2024-03-13 04:46:22.618213'),
('spdiuwsagca0ughjfpwrynmrv7wtu9rs', '.eJxVjDkOwjAUBe_iGllesIkp6TmD9f0XHECOFCcV4u4QKQW0b2beS2VYl5rXznMeSZ2VVYffrQA-uG2A7tBuk8apLfNY9KbonXZ9nYifl939O6jQ67cuyZFhMWiSc57LEYOPRsAQEhkQBzBY54XB4hBREnNyHIAlCJ9iUu8PCbQ5SA:1rdlro:yGcM3NHKAi2sck1NyG6oDoDNCwS3OoleA9TKF25zmgs', '2024-03-09 06:50:36.075576'),
('tll6nnz3rajuidcqoqvtdnhppuy2h2ba', '.eJxVjEEOwiAQRe_C2pBSYECX7nsGMsMMUjVtUtqV8e7apAvd_vfef6mE21rT1mRJI6uLsur0uxHmh0w74DtOt1nneVqXkfSu6IM2Pcwsz-vh_h1UbPVbRzQuGKIAQjG7rneC7CF2xbMpxSIHR5IjWBIEKMBeIp2zDdD3ZIt6fwD49jic:1rfHiO:fRYvZE52deGDVkLpCKMfha6XWrfKlAOSAUtJBCCbrWY', '2024-03-13 11:03:08.007533'),
('tos96pm0tdiabtedpx50fsdto2jvr5su', '.eJxVjDkOwjAUBe_iGllesIkp6TmD9f0XHECOFCcV4u4QKQW0b2beS2VYl5rXznMeSZ2VVYffrQA-uG2A7tBuk8apLfNY9KbonXZ9nYifl939O6jQ67cuyZFhMWiSc57LEYOPRsAQEhkQBzBY54XB4hBREnNyHIAlCJ9iUu8PCbQ5SA:1rfL4O:uZ93uvW7mjBmQe4k2Z6KYbGAhTSgiUTJrCumvwRCChY', '2024-03-13 14:38:04.719179'),
('trk34g2c4gdnxad4vhfk536bohc246eq', '.eJxVjEEOwiAQRe_C2pBSYECX7nsGMsMMUjVtUtqV8e7apAvd_vfef6mE21rT1mRJI6uLsur0uxHmh0w74DtOt1nneVqXkfSu6IM2Pcwsz-vh_h1UbPVbRzQuGKIAQjG7rneC7CF2xbMpxSIHR5IjWBIEKMBeIp2zDdD3ZIt6fwD49jic:1re5Kk:6qy_l4s6WiDL5udlsKCp6IbCyiNM0Sr9pES_r6DBKg0', '2024-03-10 03:37:46.790880'),
('vncwqxll1b5gqmzsb89t608gqlj8c1d6', '.eJxVjEEOwiAQRe_C2pBSYECX7nsGMsMMUjVtUtqV8e7apAvd_vfef6mE21rT1mRJI6uLsur0uxHmh0w74DtOt1nneVqXkfSu6IM2Pcwsz-vh_h1UbPVbRzQuGKIAQjG7rneC7CF2xbMpxSIHR5IjWBIEKMBeIp2zDdD3ZIt6fwD49jic:1rem69:Z8HuBP1KZfVZNPHQTdU4subT1i3GqA28snNg5WiGXJ8', '2024-03-12 01:17:33.616698'),
('whtevl6pxl41rvj4ixxrwft7w1t3ehct', '.eJxVjEEOwiAQRe_C2pBSYECX7nsGMsMMUjVtUtqV8e7apAvd_vfef6mE21rT1mRJI6uLsur0uxHmh0w74DtOt1nneVqXkfSu6IM2Pcwsz-vh_h1UbPVbRzQuGKIAQjG7rneC7CF2xbMpxSIHR5IjWBIEKMBeIp2zDdD3ZIt6fwD49jic:1re6rL:JIgEbGDGRLahDE2ukpiIFipSaH_W_o4x6t2ZWzHTego', '2024-03-10 05:15:31.574680'),
('wlmc7ku4g1t7duanvdrwutfjcvwnke8u', '.eJxVjDkOwjAUBe_iGllesIkp6TmD9f0XHECOFCcV4u4QKQW0b2beS2VYl5rXznMeSZ2VVYffrQA-uG2A7tBuk8apLfNY9KbonXZ9nYifl939O6jQ67cuyZFhMWiSc57LEYOPRsAQEhkQBzBY54XB4hBREnNyHIAlCJ9iUu8PCbQ5SA:1rePz0:SfltG6gMxVwX7roToxso5K2H3Z2ThGAD0A2hsFwr5Lo', '2024-03-11 01:40:42.302203'),
('xvix2tlsqfiylgj5tay4mqju2gdy5lyv', '.eJxVjDkOwjAUBe_iGllesIkp6TmD9f0XHECOFCcV4u4QKQW0b2beS2VYl5rXznMeSZ2VVYffrQA-uG2A7tBuk8apLfNY9KbonXZ9nYifl939O6jQ67cuyZFhMWiSc57LEYOPRsAQEhkQBzBY54XB4hBREnNyHIAlCJ9iUu8PCbQ5SA:1rduuy:gDw_dDCDkdFjuaiD9238FzHT2XSAR84WWiqkAlwt3tA', '2024-03-09 16:30:28.474981'),
('xy2xi1fnwhxtypai41b3pufnb9l7207m', '.eJxVjDkOwjAUBe_iGllesIkp6TmD9f0XHECOFCcV4u4QKQW0b2beS2VYl5rXznMeSZ2VVYffrQA-uG2A7tBuk8apLfNY9KbonXZ9nYifl939O6jQ67cuyZFhMWiSc57LEYOPRsAQEhkQBzBY54XB4hBREnNyHIAlCJ9iUu8PCbQ5SA:1rfHMY:wst6P099qCmAXsLUZi67IFggqjLFGr0WcU-gass5bSg', '2024-03-13 10:40:34.224071'),
('yecerv7q96l9j9wlyoa5eyrzyy3ht4km', '.eJxVjDkOwjAUBe_iGllesIkp6TmD9f0XHECOFCcV4u4QKQW0b2beS2VYl5rXznMeSZ2VVYffrQA-uG2A7tBuk8apLfNY9KbonXZ9nYifl939O6jQ67cuyZFhMWiSc57LEYOPRsAQEhkQBzBY54XB4hBREnNyHIAlCJ9iUu8PCbQ5SA:1rfDyd:69jg83qBxVuroWDozEGt6-avJOTa_L3-sgm6uaFkEVE', '2024-03-13 07:03:39.381504');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `chat_chatmodel`
--
ALTER TABLE `chat_chatmodel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `core_comment`
--
ALTER TABLE `core_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_comment_post_id_a75a789c_fk_core_post_id` (`post_id`),
  ADD KEY `core_comment_user_id_a9a9430c_fk_auth_user_id` (`user_id`),
  ADD KEY `core_comment_profile_id_5b11e06b_fk_core_profile_id` (`profile_id`);

--
-- Indexes for table `core_followerscount`
--
ALTER TABLE `core_followerscount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `core_followingscount`
--
ALTER TABLE `core_followingscount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `core_likepost`
--
ALTER TABLE `core_likepost`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `core_pendingpost`
--
ALTER TABLE `core_pendingpost`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_pendingpost_user_id_0cdc078b_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `core_post`
--
ALTER TABLE `core_post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `core_postattachment`
--
ALTER TABLE `core_postattachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_postattachment_post_id_3b290a90_fk_core_post_id` (`post_id`);

--
-- Indexes for table `core_postimage`
--
ALTER TABLE `core_postimage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_postimage_post_id_5d452adf_fk_core_post_id` (`post_id`);

--
-- Indexes for table `core_post_viewers`
--
ALTER TABLE `core_post_viewers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `core_post_viewers_post_id_user_id_d5bdb04e_uniq` (`post_id`,`user_id`),
  ADD KEY `core_post_viewers_user_id_56811ef3_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `core_profile`
--
ALTER TABLE `core_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `core_profile_user_id_bf8ada58_uniq` (`user_id`);

--
-- Indexes for table `core_rating`
--
ALTER TABLE `core_rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_rating_post_id_b7a77044_fk_core_post_id` (`post_id`),
  ADD KEY `core_rating_user_id_0c12e4af_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `core_viewedpost`
--
ALTER TABLE `core_viewedpost`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `core_viewedpost_post_id_user_id_b6850d8a_uniq` (`post_id`,`user_id`),
  ADD KEY `core_viewedpost_user_id_4715dc38_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `core_viewlog`
--
ALTER TABLE `core_viewlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_viewlog_post_id_0ce91032_fk_core_post_id` (`post_id`),
  ADD KEY `core_viewlog_viewer_id_08b50bb2_fk_auth_user_id` (`viewer_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_chatmodel`
--
ALTER TABLE `chat_chatmodel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `core_comment`
--
ALTER TABLE `core_comment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `core_followerscount`
--
ALTER TABLE `core_followerscount`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `core_followingscount`
--
ALTER TABLE `core_followingscount`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `core_likepost`
--
ALTER TABLE `core_likepost`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `core_pendingpost`
--
ALTER TABLE `core_pendingpost`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `core_postattachment`
--
ALTER TABLE `core_postattachment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `core_postimage`
--
ALTER TABLE `core_postimage`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `core_post_viewers`
--
ALTER TABLE `core_post_viewers`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `core_profile`
--
ALTER TABLE `core_profile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `core_rating`
--
ALTER TABLE `core_rating`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `core_viewedpost`
--
ALTER TABLE `core_viewedpost`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `core_viewlog`
--
ALTER TABLE `core_viewlog`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `core_comment`
--
ALTER TABLE `core_comment`
  ADD CONSTRAINT `core_comment_post_id_a75a789c_fk_core_post_id` FOREIGN KEY (`post_id`) REFERENCES `core_post` (`id`),
  ADD CONSTRAINT `core_comment_profile_id_5b11e06b_fk_core_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `core_profile` (`id`),
  ADD CONSTRAINT `core_comment_user_id_a9a9430c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `core_pendingpost`
--
ALTER TABLE `core_pendingpost`
  ADD CONSTRAINT `core_pendingpost_user_id_0cdc078b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `core_postattachment`
--
ALTER TABLE `core_postattachment`
  ADD CONSTRAINT `core_postattachment_post_id_3b290a90_fk_core_post_id` FOREIGN KEY (`post_id`) REFERENCES `core_post` (`id`);

--
-- Constraints for table `core_postimage`
--
ALTER TABLE `core_postimage`
  ADD CONSTRAINT `core_postimage_post_id_5d452adf_fk_core_post_id` FOREIGN KEY (`post_id`) REFERENCES `core_post` (`id`);

--
-- Constraints for table `core_post_viewers`
--
ALTER TABLE `core_post_viewers`
  ADD CONSTRAINT `core_post_viewers_post_id_b382b944_fk_core_post_id` FOREIGN KEY (`post_id`) REFERENCES `core_post` (`id`),
  ADD CONSTRAINT `core_post_viewers_user_id_56811ef3_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `core_profile`
--
ALTER TABLE `core_profile`
  ADD CONSTRAINT `core_profile_user_id_bf8ada58_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `core_rating`
--
ALTER TABLE `core_rating`
  ADD CONSTRAINT `core_rating_post_id_b7a77044_fk_core_post_id` FOREIGN KEY (`post_id`) REFERENCES `core_post` (`id`),
  ADD CONSTRAINT `core_rating_user_id_0c12e4af_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `core_viewedpost`
--
ALTER TABLE `core_viewedpost`
  ADD CONSTRAINT `core_viewedpost_post_id_97cc0c22_fk_core_post_id` FOREIGN KEY (`post_id`) REFERENCES `core_post` (`id`),
  ADD CONSTRAINT `core_viewedpost_user_id_4715dc38_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `core_viewlog`
--
ALTER TABLE `core_viewlog`
  ADD CONSTRAINT `core_viewlog_post_id_0ce91032_fk_core_post_id` FOREIGN KEY (`post_id`) REFERENCES `core_post` (`id`),
  ADD CONSTRAINT `core_viewlog_viewer_id_08b50bb2_fk_auth_user_id` FOREIGN KEY (`viewer_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
