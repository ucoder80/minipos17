-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 30, 2024 at 05:31 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `minipos17`
--

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bill_id` varchar(255) NOT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `customer_tel` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `bill_id`, `customer_name`, `customer_tel`, `created_at`, `updated_at`) VALUES
(1, 'B2407999', NULL, NULL, '2024-07-16 22:17:36', '2024-07-16 22:17:36'),
(2, 'B24075021', NULL, NULL, '2024-07-16 22:19:29', '2024-07-16 22:19:29'),
(3, 'B24074965', NULL, NULL, '2024-07-16 22:20:01', '2024-07-16 22:20:01'),
(4, 'B24077975', NULL, NULL, '2024-07-16 23:57:42', '2024-07-16 23:57:42'),
(5, 'B24075280', NULL, NULL, '2024-07-16 23:59:28', '2024-07-16 23:59:28'),
(6, 'B24071932', NULL, NULL, '2024-07-17 00:00:43', '2024-07-17 00:00:43'),
(7, 'B24077138', NULL, NULL, '2024-07-17 00:01:46', '2024-07-17 00:01:46'),
(8, 'B24075012', NULL, NULL, '2024-07-17 00:02:23', '2024-07-17 00:02:23'),
(9, 'B24079445', NULL, NULL, '2024-07-17 00:05:02', '2024-07-17 00:05:02'),
(10, 'B24076327', NULL, NULL, '2024-07-17 00:13:09', '2024-07-17 00:13:09');

-- --------------------------------------------------------

--
-- Table structure for table `bill_lists`
--

CREATE TABLE `bill_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bill_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `qty` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bill_lists`
--

INSERT INTO `bill_lists` (`id`, `bill_id`, `name`, `qty`, `price`, `created_at`, `updated_at`) VALUES
(1, 'B24071000', 'ເກີບຜ້າ', '1', '100000', '2024-07-16 22:11:48', '2024-07-16 22:11:48'),
(2, 'B24071000', 'mouse', '1', '200000', '2024-07-16 22:11:48', '2024-07-16 22:11:48'),
(3, 'B24071000', 'Ear Phone', '1', '150000', '2024-07-16 22:11:48', '2024-07-16 22:11:48'),
(4, 'B24071000', 'ເກີບຜ້າ', '1', '100000', '2024-07-16 22:15:53', '2024-07-16 22:15:53'),
(5, 'B24071000', 'Ear Phone', '1', '150000', '2024-07-16 22:15:53', '2024-07-16 22:15:53'),
(6, 'B2407999', 'ເກີບຜ້າ', '1', '100000', '2024-07-16 22:17:37', '2024-07-16 22:17:37'),
(7, 'B2407999', 'tikok', '1', '121212', '2024-07-16 22:17:37', '2024-07-16 22:17:37'),
(8, 'B24075021', 'ເກີບຜ້າ', '1', '100000', '2024-07-16 22:19:29', '2024-07-16 22:19:29'),
(9, 'B24075021', 'Ear Phone', '1', '150000', '2024-07-16 22:19:29', '2024-07-16 22:19:29'),
(10, 'B24074965', 'ເກີບຜ້າ', '1', '100000', '2024-07-16 22:20:01', '2024-07-16 22:20:01'),
(11, 'B24074965', 'Ear Phone', '1', '150000', '2024-07-16 22:20:01', '2024-07-16 22:20:01'),
(12, 'B24074965', 'mouse', '1', '200000', '2024-07-16 22:20:01', '2024-07-16 22:20:01'),
(13, 'B24077975', 'ເກີບຜ້າ', '1', '100000', '2024-07-16 23:57:42', '2024-07-16 23:57:42'),
(14, 'B24077975', 'Ear Phone', '1', '150000', '2024-07-16 23:57:42', '2024-07-16 23:57:42'),
(15, 'B24075280', 'ເກີບຜ້າ', '1', '100000', '2024-07-16 23:59:28', '2024-07-16 23:59:28'),
(16, 'B24075280', 'Ear Phone', '1', '150000', '2024-07-16 23:59:28', '2024-07-16 23:59:28'),
(17, 'B24071932', 'ເກີບຜ້າ', '1', '100000', '2024-07-17 00:00:43', '2024-07-17 00:00:43'),
(18, 'B24071932', 'Ear Phone', '1', '150000', '2024-07-17 00:00:43', '2024-07-17 00:00:43'),
(19, 'B24077138', 'ເກີບຜ້າ', '1', '100000', '2024-07-17 00:01:46', '2024-07-17 00:01:46'),
(20, 'B24077138', 'Ear Phone', '1', '150000', '2024-07-17 00:01:46', '2024-07-17 00:01:46'),
(21, 'B24075012', 'ເກີບຜ້າ', '1', '100000', '2024-07-17 00:02:23', '2024-07-17 00:02:23'),
(22, 'B24075012', 'Ear Phone', '1', '150000', '2024-07-17 00:02:23', '2024-07-17 00:02:23'),
(23, 'B24079445', 'ເກີບຜ້າ', '1', '100000', '2024-07-17 00:05:02', '2024-07-17 00:05:02'),
(24, 'B24076327', 'ເກີບຜ້າ', '1', '100000', '2024-07-17 00:13:09', '2024-07-17 00:13:09');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_06_24_055512_create_stores_table', 1),
(6, '2024_06_24_055554_create_transections_table', 1),
(7, '2024_06_24_055604_create_bills_table', 1),
(9, '2024_06_24_055617_create_bill_lists_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `qty` varchar(255) NOT NULL,
  `price_buy` varchar(255) NOT NULL,
  `price_sell` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`id`, `name`, `image`, `qty`, `price_buy`, `price_sell`, `created_at`, `updated_at`) VALUES
(1, 'T-shirt', NULL, '10', '200000', '300000', '2024-06-30 22:21:31', '2024-07-02 17:51:02'),
(25, 'ເກີບ', NULL, '1', '100000', '150000', '2024-07-02 17:50:09', '2024-07-02 17:50:09'),
(26, 'yu', NULL, '1', '202020', '202020', '2024-07-03 02:45:56', '2024-07-03 02:45:56'),
(27, 'ffdf', '', '11111', '11111', '1311313131', '2024-07-03 02:56:48', '2024-07-03 02:56:48'),
(28, 'tikok', NULL, '12121', '12122', '121212', '2024-07-03 02:58:13', '2024-07-03 04:06:25'),
(29, 'u-uy', '1720006676.png', '13312313', '121212', '1111', '2024-07-03 03:01:26', '2024-07-03 04:37:56'),
(32, 'mouse', '', '5', '150000', '200000', '2024-07-09 19:51:39', '2024-07-09 19:51:39'),
(33, 'Ear Phone', '', '10', '100000', '150000', '2024-07-09 19:52:27', '2024-07-09 19:52:27'),
(34, 'USB 3.0', NULL, '0', '20000', '100000', '2024-07-09 19:54:34', '2024-07-11 02:57:14'),
(35, 'ເກີບຜ້າ', '1721185227.png', '1', '10000', '100000', '2024-07-16 19:59:51', '2024-07-16 20:00:27');

-- --------------------------------------------------------

--
-- Table structure for table `transections`
--

CREATE TABLE `transections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tran_id` varchar(255) NOT NULL,
  `tran_type` varchar(255) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `qty` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `detail` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transections`
--

INSERT INTO `transections` (`id`, `tran_id`, `tran_type`, `product_id`, `qty`, `price`, `detail`, `created_at`, `updated_at`) VALUES
(1, '1720742874', 'income', '29', '1', '1111', 'u-uy', '2024-07-11 17:07:54', '2024-07-11 17:07:54'),
(2, '24076351', 'income', '33', '2', '150000', 'Ear Phone', '2024-07-15 07:14:46', '2024-07-15 07:14:46'),
(3, '24079072', 'income', '26', '1', '202020', 'yu', '2024-07-15 07:14:46', '2024-07-15 07:14:46'),
(4, '24077280', 'income', '32', '4', '200000', 'mouse', '2024-07-15 07:14:46', '2024-07-15 07:14:46'),
(5, '24074025', 'income', '25', '1', '150000', 'ເກີບ', '2024-07-15 07:14:46', '2024-07-15 07:14:46'),
(6, '24072777', 'income', '1', '5', '300000', 'T-shirt', '2024-07-15 07:14:46', '2024-07-15 07:14:46'),
(7, '24075218', 'income', '33', '2', '150000', 'Ear Phone', '2024-07-15 07:14:47', '2024-07-15 07:14:47'),
(8, '24073817', 'income', '26', '1', '202020', 'yu', '2024-07-15 07:14:47', '2024-07-15 07:14:47'),
(9, '24071331', 'income', '32', '4', '200000', 'mouse', '2024-07-15 07:14:47', '2024-07-15 07:14:47'),
(10, '24071084', 'income', '25', '1', '150000', 'ເກີບ', '2024-07-15 07:14:47', '2024-07-15 07:14:47'),
(11, '24073630', 'income', '1', '5', '300000', 'T-shirt', '2024-07-15 07:14:47', '2024-07-15 07:14:47'),
(12, '24077045', 'income', '33', '2', '150000', 'Ear Phone', '2024-07-15 07:14:47', '2024-07-15 07:14:47'),
(13, '24074897', 'income', '26', '1', '202020', 'yu', '2024-07-15 07:14:47', '2024-07-15 07:14:47'),
(14, '24078437', 'income', '32', '4', '200000', 'mouse', '2024-07-15 07:14:47', '2024-07-15 07:14:47'),
(15, '24074222', 'income', '25', '1', '150000', 'ເກີບ', '2024-07-15 07:14:47', '2024-07-15 07:14:47'),
(16, '24079151', 'income', '1', '5', '300000', 'T-shirt', '2024-07-15 07:14:47', '2024-07-15 07:14:47'),
(17, '24079020', 'income', '25', '1', '150000', 'ເກີບ', '2024-07-15 07:15:23', '2024-07-15 07:15:23'),
(18, '24077991', 'income', '26', '1', '202020', 'yu', '2024-07-15 07:15:23', '2024-07-15 07:15:23'),
(19, '24077744', 'income', '32', '1', '200000', 'mouse', '2024-07-15 07:15:23', '2024-07-15 07:15:23'),
(20, '24075881', 'income', '35', '1', '100000', 'ເກີບຜ້າ', '2024-07-16 22:01:12', '2024-07-16 22:01:12'),
(21, '24075333', 'income', '35', '1', '100000', 'ເກີບຜ້າ', '2024-07-16 22:01:14', '2024-07-16 22:01:14'),
(22, '24074663', 'income', '35', '1', '100000', 'ເກີບຜ້າ', '2024-07-16 22:01:14', '2024-07-16 22:01:14'),
(23, '24074177', 'income', '35', '1', '100000', 'ເກີບຜ້າ', '2024-07-16 22:01:15', '2024-07-16 22:01:15'),
(24, '24079943', 'income', '35', '1', '100000', 'ເກີບຜ້າ', '2024-07-16 22:01:15', '2024-07-16 22:01:15'),
(25, '24077718', 'income', '35', '1', '100000', 'ເກີບຜ້າ', '2024-07-16 22:01:15', '2024-07-16 22:01:15'),
(26, '24078872', 'income', '35', '1', '100000', 'ເກີບຜ້າ', '2024-07-16 22:01:15', '2024-07-16 22:01:15'),
(27, '24074494', 'income', '35', '1', '100000', 'ເກີບຜ້າ', '2024-07-16 22:01:44', '2024-07-16 22:01:44'),
(28, '24075896', 'income', '35', '1', '100000', 'ເກີບຜ້າ', '2024-07-16 22:03:25', '2024-07-16 22:03:25'),
(29, '24076690', 'income', '35', '1', '100000', 'ເກີບຜ້າ', '2024-07-16 22:03:26', '2024-07-16 22:03:26'),
(30, '24071304', 'income', '35', '1', '100000', 'ເກີບຜ້າ', '2024-07-16 22:03:26', '2024-07-16 22:03:26'),
(31, '24075743', 'income', '35', '1', '100000', 'ເກີບຜ້າ', '2024-07-16 22:03:26', '2024-07-16 22:03:26'),
(32, '24075567', 'income', '35', '1', '100000', 'ເກີບຜ້າ', '2024-07-16 22:03:26', '2024-07-16 22:03:26'),
(33, '24078159', 'income', '35', '1', '100000', 'ເກີບຜ້າ', '2024-07-16 22:03:27', '2024-07-16 22:03:27'),
(34, '24079319', 'income', '35', '1', '100000', 'ເກີບຜ້າ', '2024-07-16 22:03:27', '2024-07-16 22:03:27'),
(35, '24071331', 'income', '35', '1', '100000', 'ເກີບຜ້າ', '2024-07-16 22:03:27', '2024-07-16 22:03:27'),
(36, '24076694', 'income', '35', '1', '100000', 'ເກີບຜ້າ', '2024-07-16 22:03:27', '2024-07-16 22:03:27'),
(37, '24074658', 'income', '35', '1', '100000', 'ເກີບຜ້າ', '2024-07-16 22:03:27', '2024-07-16 22:03:27'),
(38, '24071608', 'income', '35', '1', '100000', 'ເກີບຜ້າ', '2024-07-16 22:03:29', '2024-07-16 22:03:29'),
(39, '24078791', 'income', '35', '1', '100000', 'ເກີບຜ້າ', '2024-07-16 22:03:29', '2024-07-16 22:03:29'),
(40, '24079563', 'income', '35', '1', '100000', 'ເກີບຜ້າ', '2024-07-16 22:03:30', '2024-07-16 22:03:30'),
(41, '24074677', 'income', '35', '1', '100000', 'ເກີບຜ້າ', '2024-07-16 22:03:44', '2024-07-16 22:03:44'),
(42, '24074413', 'income', '35', '1', '100000', 'ເກີບຜ້າ', '2024-07-16 22:08:23', '2024-07-16 22:08:23'),
(43, '24077021', 'income', '35', '1', '100000', 'ເກີບຜ້າ', '2024-07-16 22:09:47', '2024-07-16 22:09:47'),
(44, '24073196', 'income', '35', '1', '100000', 'ເກີບຜ້າ', '2024-07-16 22:09:48', '2024-07-16 22:09:48'),
(45, '24071796', 'income', '35', '1', '100000', 'ເກີບຜ້າ', '2024-07-16 22:11:48', '2024-07-16 22:11:48'),
(46, '24071689', 'income', '32', '1', '200000', 'mouse', '2024-07-16 22:11:48', '2024-07-16 22:11:48'),
(47, '24072281', 'income', '33', '1', '150000', 'Ear Phone', '2024-07-16 22:11:48', '2024-07-16 22:11:48'),
(48, '24071626', 'income', '35', '1', '100000', 'ເກີບຜ້າ', '2024-07-16 22:15:53', '2024-07-16 22:15:53'),
(49, '24071891', 'income', '33', '1', '150000', 'Ear Phone', '2024-07-16 22:15:53', '2024-07-16 22:15:53'),
(50, '24074512', 'income', '35', '1', '100000', 'ເກີບຜ້າ', '2024-07-16 22:17:37', '2024-07-16 22:17:37'),
(51, '24074636', 'income', '28', '1', '121212', 'tikok', '2024-07-16 22:17:37', '2024-07-16 22:17:37'),
(52, '24075384', 'income', '35', '1', '100000', 'ເກີບຜ້າ', '2024-07-16 22:19:29', '2024-07-16 22:19:29'),
(53, '24071662', 'income', '33', '1', '150000', 'Ear Phone', '2024-07-16 22:19:29', '2024-07-16 22:19:29'),
(54, '24076930', 'income', '35', '1', '100000', 'ເກີບຜ້າ', '2024-07-16 22:20:01', '2024-07-16 22:20:01'),
(55, '24072350', 'income', '33', '1', '150000', 'Ear Phone', '2024-07-16 22:20:01', '2024-07-16 22:20:01'),
(56, '24077566', 'income', '32', '1', '200000', 'mouse', '2024-07-16 22:20:01', '2024-07-16 22:20:01'),
(57, '24073119', 'income', '35', '1', '100000', 'ເກີບຜ້າ', '2024-07-16 23:57:42', '2024-07-16 23:57:42'),
(58, '24075800', 'income', '33', '1', '150000', 'Ear Phone', '2024-07-16 23:57:42', '2024-07-16 23:57:42'),
(59, '24079008', 'income', '35', '1', '100000', 'ເກີບຜ້າ', '2024-07-16 23:59:28', '2024-07-16 23:59:28'),
(60, '24078987', 'income', '33', '1', '150000', 'Ear Phone', '2024-07-16 23:59:28', '2024-07-16 23:59:28'),
(61, '24076410', 'income', '35', '1', '100000', 'ເກີບຜ້າ', '2024-07-17 00:00:43', '2024-07-17 00:00:43'),
(62, '24076175', 'income', '33', '1', '150000', 'Ear Phone', '2024-07-17 00:00:43', '2024-07-17 00:00:43'),
(63, '24073514', 'income', '35', '1', '100000', 'ເກີບຜ້າ', '2024-07-17 00:01:46', '2024-07-17 00:01:46'),
(64, '24074474', 'income', '33', '1', '150000', 'Ear Phone', '2024-07-17 00:01:46', '2024-07-17 00:01:46'),
(65, '24078630', 'income', '35', '1', '100000', 'ເກີບຜ້າ', '2024-07-17 00:02:23', '2024-07-17 00:02:23'),
(66, '24074799', 'income', '33', '1', '150000', 'Ear Phone', '2024-07-17 00:02:23', '2024-07-17 00:02:23'),
(67, '24075737', 'income', '35', '1', '100000', 'ເກີບຜ້າ', '2024-07-17 00:05:02', '2024-07-17 00:05:02'),
(68, '24074412', 'income', '35', '1', '100000', 'ເກີບຜ້າ', '2024-07-17 00:13:09', '2024-07-17 00:13:09');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$10$A6BUXxJPHUEriG0f.e2bMOMaVoVrxjd2KVWvxjZWevgtkAHKLmsx.', NULL, '2024-06-27 06:10:46', '2024-06-27 06:10:46'),
(9, 'user1', 'user1@gmail.com', NULL, '$2y$10$z/hAE00Fk1XRqM6SuRJnUeNT0EJWuRtseVOUFouNy1JXCJQSYaLRW', NULL, '2024-06-27 06:24:05', '2024-06-27 06:24:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bill_lists`
--
ALTER TABLE `bill_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transections`
--
ALTER TABLE `transections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `bill_lists`
--
ALTER TABLE `bill_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `transections`
--
ALTER TABLE `transections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
