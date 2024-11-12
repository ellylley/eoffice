-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Nov 2024 pada 13.50
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eoffice`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `activity` text DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `activity_log`
--

INSERT INTO `activity_log` (`id`, `id_user`, `activity`, `timestamp`) VALUES
(1, 1, 'Mengakses halaman dashboard', '2024-11-06 00:59:14'),
(2, 1, 'Mengakses halaman dashboard', '2024-11-06 13:44:41'),
(3, 1, 'Mengakses halaman dashboard', '2024-11-06 13:45:23'),
(4, 1, 'Mengakses halaman dashboard', '2024-11-06 13:45:37'),
(5, 1, 'Mengakses halaman dashboard', '2024-11-06 13:46:58'),
(6, 1, 'Mengakses halaman dashboard', '2024-11-06 14:44:26'),
(7, 1, 'Mengakses halaman user', '2024-11-06 14:44:32'),
(8, 1, 'Mengakses halaman user', '2024-11-06 14:45:33'),
(9, 1, 'Mengubah data user', '2024-11-06 14:45:47'),
(10, 1, 'Mengakses halaman user', '2024-11-06 14:45:48'),
(11, 1, 'Mengubah data user', '2024-11-06 14:46:03'),
(12, 1, 'Mengakses halaman user', '2024-11-06 14:46:06'),
(13, 1, 'Mengakses halaman user', '2024-11-06 14:48:36'),
(14, 1, 'Merestore user yang diedit', '2024-11-06 14:49:05'),
(15, 1, 'Mengakses halaman user', '2024-11-06 14:49:06'),
(16, 1, 'Mengakses halaman dashboard', '2024-11-06 14:49:23'),
(17, 1, 'Mengakses halaman dashboard', '2024-11-06 14:49:52'),
(18, 1, 'Mengakses halaman dashboard', '2024-11-06 14:50:16'),
(19, 1, 'Mengakses halaman restore user', '2024-11-06 14:51:10'),
(20, 1, 'Mengakses halaman restore user', '2024-11-06 14:54:02'),
(21, 1, 'Mengakses halaman restore user', '2024-11-06 14:55:49'),
(22, 1, 'Mengakses halaman restore user', '2024-11-06 15:07:53'),
(23, 1, 'Mengakses halaman dashboard', '2024-11-06 23:07:29'),
(24, 1, 'Mengakses halaman dashboard', '2024-11-06 23:11:17'),
(25, 1, 'Mengakses halaman dashboard', '2024-11-06 23:11:48'),
(26, 1, 'Mengakses halaman surat keluar', '2024-11-06 23:27:01'),
(27, 1, 'Mengakses halaman surat keluar', '2024-11-06 23:27:36'),
(28, 1, 'Mengakses halaman surat keluar', '2024-11-06 23:29:49'),
(29, 1, 'Mengakses halaman surat keluar', '2024-11-06 23:30:02'),
(30, 1, 'Mengakses halaman surat keluar', '2024-11-06 23:30:49'),
(31, 1, 'Mengakses halaman surat keluar', '2024-11-07 00:15:53'),
(32, 1, 'Mengakses halaman surat keluar', '2024-11-07 00:37:43'),
(33, 1, 'Mengakses halaman surat keluar', '2024-11-07 00:42:26'),
(34, 1, 'Mengakses halaman surat keluar', '2024-11-07 00:43:18'),
(35, 1, 'Mengakses halaman surat keluar', '2024-11-07 00:44:55'),
(36, 1, 'Mengakses halaman surat keluar', '2024-11-07 00:45:06'),
(37, 1, 'Mengakses halaman surat keluar', '2024-11-07 00:49:04'),
(38, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:03:01'),
(39, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:04:27'),
(40, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:04:41'),
(41, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:05:12'),
(42, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:06:19'),
(43, 1, 'Mengakses halaman dashboard', '2024-11-07 01:15:23'),
(44, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:15:27'),
(45, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:15:46'),
(46, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:18:02'),
(47, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:20:02'),
(48, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:20:18'),
(49, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:20:54'),
(50, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:21:02'),
(51, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:21:32'),
(52, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:22:15'),
(53, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:22:35'),
(54, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:22:53'),
(55, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:23:47'),
(56, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:27:05'),
(57, 1, 'Menambah data surat keluar', '2024-11-07 01:27:51'),
(58, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:27:51'),
(59, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:29:10'),
(60, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:31:36'),
(61, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:32:29'),
(62, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:34:56'),
(63, 1, 'Menambah data surat keluar', '2024-11-07 01:35:20'),
(64, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:36:27'),
(65, 1, 'Menambah data surat keluar', '2024-11-07 01:36:33'),
(66, 1, 'Menambah data surat keluar', '2024-11-07 01:36:57'),
(67, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:36:57'),
(68, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:42:43'),
(69, 1, 'Mengubah data surat keluar', '2024-11-07 01:43:12'),
(70, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:43:12'),
(71, 1, 'Mengubah data surat keluar', '2024-11-07 01:43:21'),
(72, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:43:21'),
(73, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:44:35'),
(74, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:45:20'),
(75, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:45:46'),
(76, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:46:19'),
(77, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:46:37'),
(78, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:46:53'),
(79, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:46:59'),
(80, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:47:32'),
(81, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:47:43'),
(82, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:47:53'),
(83, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:48:03'),
(84, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:48:32'),
(85, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:49:55'),
(86, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:50:47'),
(87, 1, 'Mengubah data surat keluar', '2024-11-07 01:51:16'),
(88, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:51:17'),
(89, 1, 'Mengubah data surat keluar', '2024-11-07 01:52:06'),
(90, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:52:06'),
(91, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:52:49'),
(92, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:53:21'),
(93, 1, 'Mengakses halaman surat keluar', '2024-11-07 01:57:24'),
(94, 1, 'Mengakses halaman surat keluar', '2024-11-07 02:01:36'),
(95, 1, 'Mengakses halaman surat keluar', '2024-11-07 02:03:29'),
(96, 1, 'Mengakses halaman surat keluar', '2024-11-07 02:03:44'),
(97, 1, 'Mengakses halaman surat keluar', '2024-11-07 02:05:07'),
(98, 1, 'Mengakses halaman surat keluar', '2024-11-07 02:05:28'),
(99, 1, 'Undo edit surat keluar', '2024-11-07 02:05:48'),
(100, 1, 'Mengakses halaman surat keluar', '2024-11-07 02:05:49'),
(101, 1, 'Mengubah data surat keluar', '2024-11-07 02:06:01'),
(102, 1, 'Mengakses halaman surat keluar', '2024-11-07 02:06:02'),
(103, 1, 'Undo edit surat keluar', '2024-11-07 02:06:06'),
(104, 1, 'Mengakses halaman surat keluar', '2024-11-07 02:06:07'),
(105, 1, 'Mengakses halaman surat keluar', '2024-11-07 02:07:19'),
(106, 1, 'Menghapus data surat keluar', '2024-11-07 02:07:32'),
(107, 1, 'Mengakses halaman surat keluar', '2024-11-07 02:07:33'),
(108, 1, 'Mengakses halaman surat keluar', '2024-11-07 02:16:20'),
(109, 1, 'Mengakses halaman surat keluar', '2024-11-07 02:19:04'),
(110, 1, 'Mengakses halaman surat keluar', '2024-11-07 02:19:29'),
(111, 1, 'Mengakses halaman surat keluar', '2024-11-07 02:19:31'),
(112, 1, 'Mengakses halaman surat keluar', '2024-11-07 02:20:03'),
(113, 1, 'Mengakses halaman surat keluar', '2024-11-07 02:27:56'),
(114, 1, 'Mengakses halaman dokumen', '2024-11-07 02:38:02'),
(115, 1, 'Mengakses halaman dokumen', '2024-11-07 02:38:21'),
(116, 1, 'Mengakses halaman dokumen', '2024-11-07 02:38:40'),
(117, 1, 'Mengakses halaman dokumen', '2024-11-07 02:38:53'),
(118, 1, 'Mengakses halaman dokumen', '2024-11-07 02:39:07'),
(119, 1, 'Mengakses halaman dokumen', '2024-11-07 02:39:49'),
(120, 1, 'Mengakses halaman dokumen', '2024-11-07 02:41:17'),
(121, 1, 'Mengakses halaman dokumen', '2024-11-07 02:41:46'),
(122, 1, 'Mengakses halaman dokumen', '2024-11-07 02:42:08'),
(123, 1, 'Mengakses halaman dokumen', '2024-11-07 02:43:54'),
(124, 1, 'Mengakses halaman dokumen', '2024-11-07 02:47:22'),
(125, 1, 'Menambah data surat keluar', '2024-11-07 02:47:41'),
(126, 1, 'Mengakses halaman surat keluar', '2024-11-07 02:47:42'),
(127, 1, 'Mengakses halaman dokumen', '2024-11-07 02:48:21'),
(128, 1, 'Mengakses halaman dokumen', '2024-11-07 02:48:37'),
(129, 1, 'Mengakses halaman dokumen', '2024-11-07 02:48:48'),
(130, 1, 'Menambah data dokumen', '2024-11-07 02:49:09'),
(131, 1, 'Mengakses halaman dokumen', '2024-11-07 02:49:10'),
(132, 1, 'Menambah data dokumen', '2024-11-07 02:49:49'),
(133, 1, 'Mengakses halaman dokumen', '2024-11-07 02:49:50'),
(134, 1, 'Menghapus data surat keluar', '2024-11-07 02:50:26'),
(135, 1, 'Mengakses halaman surat keluar', '2024-11-07 02:50:26'),
(136, 1, 'Mengakses halaman surat keluar', '2024-11-07 02:50:29'),
(137, 1, 'Mengakses halaman surat keluar', '2024-11-07 02:50:48'),
(138, 1, 'Mengakses halaman dokumen', '2024-11-07 02:51:11'),
(139, 1, 'Menghapus data dokumen', '2024-11-07 02:51:31'),
(140, 1, 'Mengakses halaman dokumen', '2024-11-07 02:51:32'),
(141, 1, 'Mengakses halaman dokumen', '2024-11-07 02:52:41'),
(142, 1, 'Mengakses halaman dokumen', '2024-11-07 02:53:22'),
(143, 1, 'Mengakses halaman dokumen', '2024-11-07 02:53:31'),
(144, 1, 'Mengakses halaman dokumen', '2024-11-07 02:54:42'),
(145, 1, 'Menambah data dokumen', '2024-11-07 02:55:11'),
(146, 1, 'Mengakses halaman dokumen', '2024-11-07 02:55:12'),
(147, 1, 'Mengakses halaman dokumen', '2024-11-07 03:00:07'),
(148, 1, 'Menambah data dokumen', '2024-11-07 03:00:16'),
(149, 1, 'Mengakses halaman dokumen', '2024-11-07 03:00:16'),
(150, 1, 'Mengakses halaman dokumen', '2024-11-07 03:02:05'),
(151, 1, 'Mengubah data surat keluar', '2024-11-07 03:02:11'),
(152, 1, 'Mengakses halaman surat keluar', '2024-11-07 03:02:11'),
(153, 1, 'Mengakses halaman dokumen', '2024-11-07 03:02:31'),
(154, 1, 'Mengubah data dokumen', '2024-11-07 03:02:36'),
(155, 1, 'Mengubah data dokumen', '2024-11-07 03:03:23'),
(156, 1, 'Mengubah data dokumen', '2024-11-07 03:03:35'),
(157, 1, 'Mengakses halaman dokumen', '2024-11-07 03:03:35'),
(158, 1, 'Mengubah data dokumen', '2024-11-07 03:03:43'),
(159, 1, 'Mengakses halaman dokumen', '2024-11-07 03:03:43'),
(160, 1, 'Mengakses halaman dokumen', '2024-11-07 03:04:47'),
(161, 1, 'Menambah data dokumen', '2024-11-07 03:04:58'),
(162, 1, 'Mengakses halaman dokumen', '2024-11-07 03:04:59'),
(163, 1, 'Mengakses halaman dokumen', '2024-11-07 03:05:34'),
(164, 1, 'Mengakses halaman dokumen', '2024-11-07 03:07:01'),
(165, 1, 'Mengakses halaman dokumen', '2024-11-07 03:07:27'),
(166, 1, 'Mengubah data dokumen', '2024-11-07 03:07:38'),
(167, 1, 'Mengakses halaman dokumen', '2024-11-07 03:07:38'),
(168, 1, 'Mengakses halaman surat keluar', '2024-11-07 03:07:49'),
(169, 1, 'Menambah data surat keluar', '2024-11-07 03:07:57'),
(170, 1, 'Mengakses halaman surat keluar', '2024-11-07 03:07:57'),
(171, 1, 'Mengubah data surat keluar', '2024-11-07 03:08:03'),
(172, 1, 'Mengakses halaman surat keluar', '2024-11-07 03:08:03'),
(173, 1, 'Mengakses halaman surat keluar', '2024-11-07 03:11:22'),
(174, 1, 'Mengakses halaman dokumen', '2024-11-07 03:11:23'),
(175, 1, 'Menambah data dokumen', '2024-11-07 03:11:35'),
(176, 1, 'Mengakses halaman dokumen', '2024-11-07 03:11:36'),
(177, 1, 'Mengubah data dokumen', '2024-11-07 03:11:41'),
(178, 1, 'Mengakses halaman dokumen', '2024-11-07 03:11:42'),
(179, 1, 'Menambah data dokumen', '2024-11-07 03:13:16'),
(180, 1, 'Mengakses halaman dokumen', '2024-11-07 03:13:16'),
(181, 1, 'Mengubah data dokumen', '2024-11-07 03:13:21'),
(182, 1, 'Mengakses halaman dokumen', '2024-11-07 03:13:21'),
(183, 1, 'Mengakses halaman dokumen', '2024-11-07 03:13:59'),
(184, 1, 'Mengubah data dokumen', '2024-11-07 03:14:06'),
(185, 1, 'Mengakses halaman dokumen', '2024-11-07 03:14:06'),
(186, 1, 'Mengubah data dokumen', '2024-11-07 03:15:10'),
(187, 1, 'Mengakses halaman dokumen', '2024-11-07 03:15:10'),
(188, 1, 'Mengakses halaman dokumen', '2024-11-07 03:16:26'),
(189, 1, 'Undo edit dokumen', '2024-11-07 03:16:34'),
(190, 1, 'Mengakses halaman dokumen', '2024-11-07 03:16:34'),
(191, 1, 'Menghapus data dokumen', '2024-11-07 03:17:05'),
(192, 1, 'Mengakses halaman dokumen', '2024-11-07 03:17:05'),
(193, 1, 'Mengakses halaman dokumen', '2024-11-07 03:18:58'),
(194, 1, 'Mengakses halaman dokumen', '2024-11-07 03:19:10'),
(195, 1, 'Mengakses halaman dokumen', '2024-11-07 03:19:55'),
(196, 1, 'Mengakses halaman dokumen', '2024-11-07 03:21:23'),
(197, 1, 'Mengakses halaman dokumen', '2024-11-07 03:28:03'),
(198, 1, 'Mengakses halaman dokumen', '2024-11-07 03:28:05'),
(199, 1, 'Mengakses halaman dokumen', '2024-11-07 03:29:00'),
(200, 1, 'Mengakses halaman dokumen', '2024-11-07 03:29:53'),
(201, 1, 'Mengakses halaman dokumen', '2024-11-07 03:29:59'),
(202, 1, 'Mengakses halaman dokumen', '2024-11-07 03:30:12'),
(203, 1, 'Mengakses halaman dokumen', '2024-11-07 03:30:22'),
(204, 1, 'Mengakses halaman dokumen', '2024-11-07 03:30:30'),
(205, 1, 'Mengakses halaman dokumen', '2024-11-07 03:30:59'),
(206, 1, 'Mengakses halaman dokumen', '2024-11-07 03:31:33'),
(207, 1, 'Mengakses halaman dokumen', '2024-11-07 03:35:05'),
(208, 1, 'Mengakses halaman dokumen', '2024-11-07 03:35:57'),
(209, 1, 'Mengakses halaman dokumen', '2024-11-07 03:36:42'),
(210, 1, 'Mengakses halaman dokumen', '2024-11-07 03:39:44'),
(211, 1, 'Mengakses halaman dokumen', '2024-11-07 03:41:29'),
(212, 1, 'Mengakses halaman dokumen', '2024-11-07 03:41:40'),
(213, 1, 'Mengakses halaman dokumen', '2024-11-07 03:44:12'),
(214, 1, 'Mengakses halaman dokumen', '2024-11-07 03:46:19'),
(215, 1, 'Mengakses halaman dokumen', '2024-11-07 03:48:05'),
(216, 1, 'Mengakses halaman dokumen', '2024-11-07 03:48:15'),
(217, 1, 'Mengakses halaman dashboard', '2024-11-07 17:02:18'),
(218, 1, 'Mengakses halaman dashboard', '2024-11-07 17:12:18'),
(219, 1, 'Mengakses halaman dashboard', '2024-11-07 17:38:04'),
(220, 1, 'Mengakses halaman surat keluar', '2024-11-07 17:44:19'),
(221, 1, 'Menambah data surat keluar', '2024-11-07 17:44:31'),
(222, 1, 'Mengakses halaman surat keluar', '2024-11-07 17:44:31'),
(223, 1, 'Mengakses halaman surat keluar', '2024-11-07 17:47:32'),
(224, 1, 'Menambah data surat keluar', '2024-11-07 17:47:42'),
(225, 1, 'Mengakses halaman surat keluar', '2024-11-07 17:47:42'),
(226, 1, 'Mengakses halaman surat keluar', '2024-11-07 17:50:31'),
(227, 1, 'Mengakses halaman surat masuk', '2024-11-07 17:50:36'),
(228, 1, 'Mengakses halaman surat keluar', '2024-11-07 17:51:57'),
(229, 1, 'Mengubah data surat keluar', '2024-11-07 17:52:15'),
(230, 1, 'Mengakses halaman surat keluar', '2024-11-07 17:52:16'),
(231, 1, 'Mengubah data surat keluar', '2024-11-07 17:52:54'),
(232, 1, 'Mengakses halaman surat keluar', '2024-11-07 17:52:55'),
(233, 1, 'Mengubah data surat keluar', '2024-11-07 17:53:18'),
(234, 1, 'Mengakses halaman surat keluar', '2024-11-07 17:53:19'),
(235, 1, 'Mengakses halaman surat masuk', '2024-11-07 17:53:40'),
(236, 1, 'Mengakses halaman surat masuk', '2024-11-07 17:55:08'),
(237, 1, 'Menambah data surat masuk', '2024-11-07 17:55:20'),
(238, 1, 'Mengakses halaman surat masuk', '2024-11-07 17:55:21'),
(239, 1, 'Mengakses halaman surat masuk', '2024-11-07 17:55:40'),
(240, 1, 'Mengakses halaman surat masuk', '2024-11-07 17:56:06'),
(241, 1, 'Menambah data surat masuk', '2024-11-07 17:56:17'),
(242, 1, 'Mengakses halaman surat masuk', '2024-11-07 17:56:18'),
(243, 1, 'Menambah data surat masuk', '2024-11-07 17:57:31'),
(244, 1, 'Mengakses halaman surat masuk', '2024-11-07 17:57:31'),
(245, 1, 'Mengakses halaman surat masuk', '2024-11-07 18:00:50'),
(246, 1, 'Mengubah data surat masuk', '2024-11-07 18:00:58'),
(247, 1, 'Mengakses halaman surat masuk', '2024-11-07 18:00:59'),
(248, 1, 'Undo edit surat masuk', '2024-11-07 18:02:55'),
(249, 1, 'Undo edit surat masuk', '2024-11-07 18:03:15'),
(250, 1, 'Mengakses halaman surat masuk', '2024-11-07 18:03:16'),
(251, 1, 'Undo edit surat masuk', '2024-11-07 18:03:33'),
(252, 1, 'Mengakses halaman surat masuk', '2024-11-07 18:03:33'),
(253, 1, 'Menghapus data surat masuk', '2024-11-07 18:03:54'),
(254, 1, 'Mengakses halaman surat masuk', '2024-11-07 18:03:54'),
(255, 1, 'Mengakses halaman surat masuk', '2024-11-07 18:07:57'),
(256, 1, 'Mengakses halaman surat masuk', '2024-11-07 18:08:13'),
(257, 1, 'Mengakses halaman surat masuk', '2024-11-07 18:10:13'),
(258, 1, 'Mengakses halaman surat masuk', '2024-11-07 18:10:19'),
(259, 1, 'Mengakses halaman surat keluar', '2024-11-07 18:10:21'),
(260, 1, 'Mengakses halaman surat keluar', '2024-11-07 18:21:40'),
(261, 1, 'Mengakses halaman surat keluar', '2024-11-07 18:26:34'),
(262, 1, 'Mengakses halaman surat keluar', '2024-11-07 18:28:07'),
(263, 1, 'Mengakses halaman surat keluar', '2024-11-07 18:29:58'),
(264, 1, 'Menambah jenis surat', '2024-11-07 18:30:04'),
(265, 1, 'Mengakses halaman surat keluar', '2024-11-07 18:30:04'),
(266, 1, 'Mengakses halaman surat keluar', '2024-11-07 18:30:30'),
(267, 1, 'Menambah jenis surat', '2024-11-07 18:30:35'),
(268, 1, 'Mengakses halaman surat keluar', '2024-11-07 18:30:36'),
(269, 1, 'Mengakses halaman surat keluar', '2024-11-07 18:31:05'),
(270, 1, 'Mengakses halaman surat keluar', '2024-11-07 18:33:51'),
(271, 1, 'Mengubah data jenis surat', '2024-11-07 18:33:56'),
(272, 1, 'Mengakses halaman surat keluar', '2024-11-07 18:33:56'),
(273, 1, 'Merestore jenis surat yang diedit', '2024-11-07 18:35:16'),
(274, 1, 'Mengakses halaman surat keluar', '2024-11-07 18:35:17'),
(275, 1, 'Mengakses halaman surat keluar', '2024-11-07 18:35:50'),
(276, 1, 'Menghapus data jenis surat', '2024-11-07 18:35:51'),
(277, 1, 'Mengakses halaman surat keluar', '2024-11-07 18:35:52'),
(278, 1, 'Mengakses halaman surat keluar', '2024-11-07 18:36:14'),
(279, 1, 'Mengakses halaman surat keluar', '2024-11-07 18:36:35'),
(280, 1, 'Mengakses halaman surat keluar', '2024-11-07 18:37:33'),
(281, 1, 'Mengakses halaman surat keluar', '2024-11-07 18:37:42'),
(282, 1, 'Mengakses halaman surat keluar', '2024-11-07 18:38:09'),
(283, 1, 'Mengakses halaman surat keluar', '2024-11-07 18:47:25'),
(284, 1, 'Mengakses halaman surat keluar', '2024-11-07 18:47:56'),
(285, 1, 'Mengakses halaman surat keluar', '2024-11-07 18:48:30'),
(286, 1, 'Mengakses halaman surat keluar', '2024-11-07 19:09:05'),
(287, 1, 'Mengakses halaman surat keluar', '2024-11-07 19:09:07'),
(288, 1, 'Mengakses halaman surat keluar', '2024-11-07 19:20:04'),
(289, 1, 'Mengakses halaman surat keluar', '2024-11-07 19:24:06'),
(290, 1, 'Mengakses halaman surat keluar', '2024-11-07 19:24:40'),
(291, 1, 'Mengakses halaman surat keluar', '2024-11-07 19:34:56'),
(292, 1, 'Mengakses halaman surat keluar', '2024-11-07 19:35:17'),
(293, 1, 'Mengakses halaman surat keluar', '2024-11-07 19:37:07'),
(294, 1, 'Mengakses halaman surat keluar', '2024-11-07 19:37:24'),
(295, 1, 'Mengakses halaman surat keluar', '2024-11-07 19:37:31'),
(296, 1, 'Mengakses halaman surat keluar', '2024-11-07 19:37:40'),
(297, 1, 'Mengakses halaman surat keluar', '2024-11-07 19:39:07'),
(298, 1, 'Mengakses halaman surat keluar', '2024-11-07 19:39:38'),
(299, 1, 'Mengakses halaman surat keluar', '2024-11-07 19:42:17'),
(300, 1, 'Mengakses halaman surat keluar', '2024-11-07 19:42:54'),
(301, 1, 'Menambah data surat', '2024-11-07 19:43:04'),
(302, 1, 'Mengakses halaman surat keluar', '2024-11-07 19:43:26'),
(303, 1, 'Menambah data surat', '2024-11-07 19:43:32'),
(304, 1, 'Mengakses halaman surat keluar', '2024-11-07 19:43:33'),
(305, 1, 'Mengakses halaman surat keluar', '2024-11-07 19:44:00'),
(306, 1, 'Mengakses halaman surat keluar', '2024-11-07 19:46:57'),
(307, 1, 'Mengubah data surat', '2024-11-07 19:47:03'),
(308, 1, 'Mengubah data surat', '2024-11-07 19:47:43'),
(309, 1, 'Mengakses halaman surat keluar', '2024-11-07 19:47:44'),
(310, 1, 'Mengubah data surat', '2024-11-07 19:48:32'),
(311, 1, 'Mengakses halaman surat keluar', '2024-11-07 19:48:32'),
(312, 1, 'Mengubah data surat', '2024-11-07 19:49:58'),
(313, 1, 'Mengakses halaman surat keluar', '2024-11-07 19:49:59'),
(314, 1, 'Mengubah data surat', '2024-11-07 19:50:14'),
(315, 1, 'Mengakses halaman surat keluar', '2024-11-07 19:50:15'),
(316, 1, 'Mengubah data surat', '2024-11-07 19:50:22'),
(317, 1, 'Mengakses halaman surat keluar', '2024-11-07 19:50:22'),
(318, 1, 'Mengubah data surat', '2024-11-07 19:52:12'),
(319, 1, 'Mengakses halaman surat keluar', '2024-11-07 19:52:13'),
(320, 1, 'Mengubah data surat', '2024-11-07 19:52:18'),
(321, 1, 'Mengakses halaman surat keluar', '2024-11-07 19:52:19'),
(322, 1, 'Mengakses halaman surat keluar', '2024-11-07 19:53:38'),
(323, 1, 'Mengakses halaman surat keluar', '2024-11-07 19:54:08'),
(324, 1, 'Mengakses halaman surat keluar', '2024-11-07 19:55:06'),
(325, 1, 'Mengakses halaman surat keluar', '2024-11-07 19:55:22'),
(326, 1, 'Undo edit surat', '2024-11-07 19:55:30'),
(327, 1, 'Mengakses halaman surat keluar', '2024-11-07 19:55:31'),
(328, 1, 'Mengubah data surat', '2024-11-07 19:55:57'),
(329, 1, 'Mengakses halaman surat keluar', '2024-11-07 19:55:57'),
(330, 1, 'Undo edit surat', '2024-11-07 19:56:09'),
(331, 1, 'Mengakses halaman surat keluar', '2024-11-07 19:56:09'),
(332, 1, 'Menghapus data surat', '2024-11-07 19:57:11'),
(333, 1, 'Mengakses halaman surat keluar', '2024-11-07 19:57:11'),
(334, 1, 'Mengakses halaman surat masuk', '2024-11-07 19:57:44'),
(335, 1, 'Mengakses halaman surat keluar', '2024-11-07 19:57:48'),
(336, 1, 'Mengakses halaman surat keluar', '2024-11-07 19:57:55'),
(337, 1, 'Mengakses halaman surat keluar', '2024-11-07 19:58:33'),
(338, 1, 'Mengakses halaman surat keluar', '2024-11-07 20:26:45'),
(339, 1, 'Mengakses halaman surat keluar', '2024-11-07 20:27:11'),
(340, 1, 'Mengakses halaman dashboard', '2024-11-07 23:22:41'),
(341, 1, 'Mengakses halaman dashboard', '2024-11-07 23:27:38'),
(342, 1, 'Mengakses halaman surat keluar', '2024-11-07 23:27:58'),
(343, 1, 'Mengakses halaman surat keluar', '2024-11-07 23:28:08'),
(344, 1, 'Mengakses halaman surat keluar', '2024-11-07 23:35:31'),
(345, 1, 'Mengakses halaman surat keluar', '2024-11-07 23:35:53'),
(346, 1, 'Mengakses halaman surat keluar', '2024-11-07 23:42:31'),
(347, 1, 'Mengakses halaman surat keluar', '2024-11-07 23:52:48'),
(348, 1, 'Mengakses halaman surat keluar', '2024-11-08 00:06:53'),
(349, 1, 'Menambah keterlambatan kehadiran', '2024-11-08 00:07:17'),
(350, 1, 'Mengakses halaman surat keluar', '2024-11-08 00:07:18'),
(351, 1, 'Mengubah data keterlambatan kehadiran', '2024-11-08 00:10:14'),
(352, 1, 'Mengakses halaman surat keluar', '2024-11-08 00:10:14'),
(353, 1, 'Mengakses halaman surat keluar', '2024-11-08 00:14:33'),
(354, 1, 'Mengakses halaman surat keluar', '2024-11-08 00:15:00'),
(355, 1, 'Mengakses halaman surat keluar', '2024-11-08 00:15:54'),
(356, 1, 'Mengakses halaman surat keluar', '2024-11-08 00:16:53'),
(357, 1, 'Undo edit keterlambatan kehadiran', '2024-11-08 00:17:39'),
(358, 1, 'Mengakses halaman surat keluar', '2024-11-08 00:17:40'),
(359, 1, 'Mengakses halaman surat keluar', '2024-11-08 00:19:05'),
(360, 1, 'Menghapus data keterlambatan kehadiran', '2024-11-08 00:19:10'),
(361, 1, 'Mengakses halaman surat keluar', '2024-11-08 00:19:10'),
(362, 1, 'Menghapus data keterlambatan kehadiran', '2024-11-08 00:20:08'),
(363, 1, 'Mengakses halaman surat keluar', '2024-11-08 00:20:09'),
(364, 1, 'Mengakses halaman surat keluar', '2024-11-08 00:20:26'),
(365, 1, 'Mengakses halaman surat keluar', '2024-11-08 00:20:33'),
(366, 1, 'Mengakses halaman surat masuk', '2024-11-08 00:31:19'),
(367, 1, 'Mengakses halaman user', '2024-11-08 00:36:15'),
(368, 1, 'Mengakses halaman user', '2024-11-08 00:36:24'),
(369, 1, 'Mengakses halaman user', '2024-11-08 00:38:46'),
(370, 1, 'Mengakses halaman user', '2024-11-08 00:48:39'),
(371, 1, 'Mengakses halaman surat keluar', '2024-11-08 00:48:45'),
(372, 1, 'Mengakses halaman surat keluar', '2024-11-08 00:49:01'),
(373, 1, 'Mengakses halaman surat keluar', '2024-11-08 01:19:25'),
(374, 1, 'Menambah keterlambatan kehadiran', '2024-11-08 01:46:23'),
(375, 1, 'Mengakses halaman surat keluar', '2024-11-08 01:46:24'),
(376, 1, 'Mengakses halaman surat keluar', '2024-11-08 01:47:02'),
(377, 1, 'Menambah permohonan cuti', '2024-11-08 01:47:24'),
(378, 1, 'Mengakses halaman surat keluar', '2024-11-08 01:47:24'),
(379, 1, 'Menambah permohonan cuti', '2024-11-08 01:49:04'),
(380, 1, 'Mengakses halaman surat keluar', '2024-11-08 01:49:04'),
(381, 1, 'Mengakses halaman surat keluar', '2024-11-08 01:49:37'),
(382, 1, 'Mengakses halaman surat keluar', '2024-11-08 01:50:18'),
(383, 1, 'Mengakses halaman surat keluar', '2024-11-08 01:51:25'),
(384, 1, 'Mengakses halaman surat keluar', '2024-11-08 01:53:26'),
(385, 1, 'Mengakses halaman surat keluar', '2024-11-08 01:54:45'),
(386, 1, 'Menambah permohonan cuti', '2024-11-08 02:01:57'),
(387, 1, 'Mengakses halaman surat keluar', '2024-11-08 02:01:58'),
(388, 1, 'Mengakses halaman surat keluar', '2024-11-08 02:02:46'),
(389, 1, 'Mengakses halaman surat keluar', '2024-11-08 02:03:47'),
(390, 1, 'Mengakses halaman surat keluar', '2024-11-08 02:04:02'),
(391, 1, 'Mengakses halaman surat keluar', '2024-11-08 02:05:25'),
(392, 1, 'Mengakses halaman surat keluar', '2024-11-08 02:14:06'),
(393, 1, 'Mengakses halaman surat keluar', '2024-11-08 02:15:26'),
(394, 1, 'Mengakses halaman surat keluar', '2024-11-08 02:15:56'),
(395, 1, 'Mengakses halaman surat keluar', '2024-11-08 02:16:27'),
(396, 1, 'Mengakses halaman surat keluar', '2024-11-08 02:17:31'),
(397, 1, 'Mengakses halaman surat keluar', '2024-11-08 02:20:16'),
(398, 1, 'Mengubah data permohonan cuti', '2024-11-08 02:20:24'),
(399, 1, 'Mengakses halaman surat keluar', '2024-11-08 02:20:25'),
(400, 1, 'Mengubah data permohonan cuti', '2024-11-08 02:21:39'),
(401, 1, 'Mengakses halaman surat keluar', '2024-11-08 02:21:40'),
(402, 1, 'Mengakses halaman surat keluar', '2024-11-08 02:22:03'),
(403, 1, 'Mengakses halaman surat keluar', '2024-11-08 02:24:09'),
(404, 1, 'Mengakses halaman surat keluar', '2024-11-08 02:25:16'),
(405, 1, 'Mengakses halaman surat keluar', '2024-11-08 02:25:59'),
(406, 1, 'Mengakses halaman surat keluar', '2024-11-08 02:27:24'),
(407, 1, 'Undo edit permohonan cuti', '2024-11-08 02:27:29'),
(408, 1, 'Mengakses halaman surat keluar', '2024-11-08 02:27:30'),
(409, 1, 'Mengakses halaman surat keluar', '2024-11-08 02:28:40'),
(410, 1, 'Menghapus data keterlambatan kehadiran', '2024-11-08 02:28:43'),
(411, 1, 'Mengakses halaman surat keluar', '2024-11-08 02:28:43'),
(412, 1, 'Mengakses halaman surat keluar', '2024-11-08 02:29:15'),
(413, 1, 'Menghapus data permohonan cuti', '2024-11-08 02:29:20'),
(414, 1, 'Mengakses halaman surat keluar', '2024-11-08 02:29:35'),
(415, 1, 'Mengakses halaman surat keluar', '2024-11-08 02:31:25'),
(416, 1, 'Mengakses halaman surat keluar', '2024-11-08 02:41:07'),
(417, 1, 'Mengakses halaman surat keluar', '2024-11-08 02:41:43'),
(418, 1, 'Mengakses halaman surat keluar', '2024-11-08 02:44:16'),
(419, 1, 'Mengakses halaman surat keluar', '2024-11-08 02:44:41'),
(420, 1, 'Mengakses halaman surat keluar', '2024-11-08 02:44:55'),
(421, 1, 'Mengakses halaman surat keluar', '2024-11-08 02:46:07'),
(422, 1, 'Mengakses halaman surat keluar', '2024-11-08 02:47:37'),
(423, 1, 'Mengakses halaman surat keluar', '2024-11-08 02:48:15'),
(424, 1, 'Mengakses halaman surat keluar', '2024-11-08 02:50:49'),
(425, 1, 'Mengakses halaman surat keluar', '2024-11-08 02:54:31'),
(426, 1, 'Mengakses halaman surat keluar', '2024-11-08 02:57:07'),
(427, 1, 'Mengakses halaman surat keluar', '2024-11-08 02:57:40'),
(428, 1, 'Mengakses halaman surat keluar', '2024-11-08 03:00:29'),
(429, 1, 'Mengakses halaman surat keluar', '2024-11-08 03:01:27'),
(430, 1, 'Mengakses halaman surat keluar', '2024-11-08 03:08:09'),
(431, 1, 'Mengakses halaman surat keluar', '2024-11-08 03:08:57'),
(432, 1, 'Mengakses halaman surat keluar', '2024-11-08 03:12:24'),
(433, 1, 'Mengakses halaman surat keluar', '2024-11-08 03:13:12'),
(434, 1, 'Mengakses halaman surat keluar', '2024-11-08 03:14:28'),
(435, 1, 'Mengakses halaman surat keluar', '2024-11-08 03:15:00'),
(436, 1, 'Mengakses halaman surat keluar', '2024-11-08 03:18:10'),
(437, 1, 'Mengakses halaman surat keluar', '2024-11-08 03:19:20'),
(438, 1, 'Mengakses halaman surat keluar', '2024-11-08 03:21:51'),
(439, 1, 'Mengakses halaman surat keluar', '2024-11-08 03:24:43'),
(440, 1, 'Mengakses halaman surat keluar', '2024-11-08 03:26:09'),
(441, 1, 'Mengakses halaman surat keluar', '2024-11-08 03:27:35'),
(442, 1, 'Mengakses halaman surat keluar', '2024-11-08 03:27:59'),
(443, 1, 'Mengakses halaman surat keluar', '2024-11-08 03:28:49'),
(444, 1, 'Mengakses halaman surat keluar', '2024-11-08 03:28:54'),
(445, 1, 'Mengakses halaman surat keluar', '2024-11-08 03:29:15'),
(446, 1, 'Mengakses halaman surat keluar', '2024-11-08 03:30:08'),
(447, 1, 'Mengakses halaman surat keluar', '2024-11-08 03:30:16'),
(448, 1, 'Mengakses halaman surat keluar', '2024-11-08 03:32:22'),
(449, 1, 'Mengakses halaman surat keluar', '2024-11-08 03:32:53'),
(450, 1, 'Mengakses halaman surat keluar', '2024-11-08 03:35:17'),
(451, 1, 'Mengakses halaman surat keluar', '2024-11-08 03:35:24'),
(452, 1, 'Mengakses halaman surat keluar', '2024-11-08 03:35:42'),
(453, 1, 'Mengakses halaman surat keluar', '2024-11-08 03:36:50'),
(454, 1, 'Mengakses halaman surat keluar', '2024-11-08 03:38:47'),
(455, 1, 'Mengakses halaman surat keluar', '2024-11-08 03:39:13'),
(456, 1, 'Mengakses halaman surat keluar', '2024-11-08 03:39:33'),
(457, 1, 'Mengakses halaman surat keluar', '2024-11-08 03:49:07'),
(458, 1, 'Mengakses halaman surat keluar', '2024-11-08 03:50:48'),
(459, 1, 'Membagikan pengumuman', '2024-11-08 03:51:19'),
(460, 1, 'Mengakses halaman surat keluar', '2024-11-08 03:53:23'),
(461, 1, 'Membagikan surat keluar', '2024-11-08 03:53:44'),
(462, 1, 'Membagikan surat keluar', '2024-11-08 03:56:22'),
(463, 1, 'Mengakses halaman surat keluar', '2024-11-08 03:56:24'),
(464, 1, 'Membagikan surat keluar', '2024-11-08 03:56:36'),
(465, 1, 'Mengakses halaman surat keluar', '2024-11-08 03:56:37'),
(466, 1, 'Mengubah data surat keluar', '2024-11-08 03:57:10'),
(467, 1, 'Mengakses halaman surat keluar', '2024-11-08 03:57:11'),
(468, 1, 'Membagikan surat keluar', '2024-11-08 03:57:21'),
(469, 1, 'Mengakses halaman surat keluar', '2024-11-08 03:57:22'),
(470, 1, 'Membagikan surat keluar', '2024-11-08 03:58:44'),
(471, 1, 'Mengakses halaman surat keluar', '2024-11-08 03:58:49'),
(472, 1, 'Membagikan surat keluar', '2024-11-08 04:00:46'),
(473, 1, 'Mengakses halaman surat keluar', '2024-11-08 04:00:53'),
(474, 1, 'Membagikan surat keluar', '2024-11-08 04:03:55'),
(475, 1, 'Mengakses halaman surat keluar', '2024-11-08 04:03:56'),
(476, 1, 'Membagikan surat keluar', '2024-11-08 04:05:49'),
(477, 1, 'Mengakses halaman surat keluar', '2024-11-08 04:05:50'),
(478, 1, 'Membagikan surat keluar', '2024-11-08 04:06:53'),
(479, 1, 'Mengakses halaman surat keluar', '2024-11-08 04:06:54'),
(480, 1, 'Membagikan surat keluar', '2024-11-08 04:10:55'),
(481, 1, 'Mengakses halaman surat keluar', '2024-11-08 04:11:00'),
(482, 1, 'Membagikan surat keluar', '2024-11-08 04:11:26'),
(483, 1, 'Mengakses halaman surat keluar', '2024-11-08 04:11:32'),
(484, 1, 'Membagikan surat keluar', '2024-11-08 04:14:16'),
(485, 1, 'Mengakses halaman surat keluar', '2024-11-08 04:14:21'),
(486, 1, 'Membagikan surat keluar', '2024-11-08 04:16:04'),
(487, 1, 'Mengakses halaman surat keluar', '2024-11-08 04:16:09'),
(488, 1, 'Membagikan surat keluar', '2024-11-08 04:19:46'),
(489, 1, 'Mengakses halaman surat keluar', '2024-11-08 04:19:51'),
(490, 1, 'Membagikan surat keluar', '2024-11-08 04:21:01'),
(491, 1, 'Mengakses halaman surat keluar', '2024-11-08 04:21:05'),
(492, 1, 'Mengakses halaman surat keluar', '2024-11-08 04:22:11'),
(493, 1, 'Membagikan surat keluar', '2024-11-08 04:22:16'),
(494, 1, 'Mengakses halaman surat keluar', '2024-11-08 04:22:21'),
(495, 1, 'Mengakses halaman surat keluar', '2024-11-08 04:26:34'),
(496, 1, 'Membagikan surat keluar', '2024-11-08 04:26:39'),
(497, 1, 'Mengakses halaman surat keluar', '2024-11-08 04:26:44'),
(498, 1, 'Mengakses halaman surat keluar', '2024-11-08 04:30:34'),
(499, 1, 'Membagikan surat keluar', '2024-11-08 04:30:39'),
(500, 1, 'Mengakses halaman surat keluar', '2024-11-08 04:30:44'),
(501, 1, 'Mengakses halaman surat keluar', '2024-11-08 04:33:14'),
(502, 1, 'Membagikan surat keluar', '2024-11-08 04:33:21'),
(503, 1, 'Mengakses halaman surat keluar', '2024-11-08 04:33:26'),
(504, 1, 'Mengakses halaman surat keluar', '2024-11-08 04:37:26'),
(505, 1, 'Membagikan surat keluar', '2024-11-08 04:37:31'),
(506, 1, 'Mengakses halaman surat keluar', '2024-11-08 04:37:36'),
(507, 1, 'Mengakses halaman surat keluar', '2024-11-08 04:45:24'),
(508, 1, 'Mengakses halaman dashboard', '2024-11-08 04:50:45'),
(509, 1, 'Mengakses halaman surat keluar', '2024-11-08 04:50:50'),
(510, 1, 'Mengakses halaman surat keluar', '2024-11-08 04:50:55'),
(511, 1, 'Mengakses halaman dashboard', '2024-11-08 04:51:02'),
(512, 1, 'Mengakses halaman surat keluar', '2024-11-08 04:53:11'),
(513, 1, 'Mengakses halaman dashboard', '2024-11-08 04:53:18'),
(514, 1, 'Mengakses halaman surat keluar', '2024-11-08 04:54:09'),
(515, 1, 'Mengakses halaman surat keluar', '2024-11-08 04:54:16'),
(516, 1, 'Membagikan surat keluar', '2024-11-08 04:57:16'),
(517, 1, 'Mengakses halaman surat keluar', '2024-11-08 04:57:17'),
(518, 1, 'Membagikan surat keluar', '2024-11-08 04:57:48'),
(519, 1, 'Mengakses halaman surat keluar', '2024-11-08 04:57:49'),
(520, 1, 'Mengakses halaman surat keluar', '2024-11-08 04:58:44'),
(521, 1, 'Membagikan surat keluar', '2024-11-08 04:58:50'),
(522, 1, 'Mengakses halaman surat keluar', '2024-11-08 04:58:50'),
(523, 1, 'Membagikan surat keluar', '2024-11-08 05:03:29'),
(524, 1, 'Mengakses halaman surat keluar', '2024-11-08 05:03:36'),
(525, 1, 'Mengakses halaman surat keluar', '2024-11-08 05:05:52'),
(526, 1, 'Mengakses halaman surat keluar', '2024-11-08 05:06:03'),
(527, 1, 'Mengirim surat keluar', '2024-11-08 05:06:36'),
(528, 1, 'Mengirim surat keluar', '2024-11-08 05:06:56'),
(529, 1, 'Mengakses halaman surat keluar', '2024-11-08 05:06:56'),
(530, 1, 'Mengirim surat keluar', '2024-11-08 05:07:02'),
(531, 1, 'Mengakses halaman surat keluar', '2024-11-08 05:07:02'),
(532, 1, 'Mengirim surat keluar', '2024-11-08 05:09:19'),
(533, 1, 'Mengakses halaman surat keluar', '2024-11-08 05:09:20'),
(534, 1, 'Mengirim surat keluar', '2024-11-08 05:09:56'),
(535, 1, 'Mengakses halaman surat keluar', '2024-11-08 05:09:57'),
(536, 1, 'Mengirim surat keluar', '2024-11-08 05:11:35'),
(537, 1, 'Mengakses halaman surat keluar', '2024-11-08 05:11:36'),
(538, 1, 'Mengirim surat keluar', '2024-11-08 05:12:23'),
(539, 1, 'Mengakses halaman surat keluar', '2024-11-08 05:12:24'),
(540, 1, 'Mengirim surat keluar', '2024-11-08 05:13:01'),
(541, 1, 'Mengakses halaman surat keluar', '2024-11-08 05:13:02'),
(542, 1, 'Mengirim surat keluar', '2024-11-08 05:14:17'),
(543, 1, 'Mengakses halaman surat keluar', '2024-11-08 05:14:18'),
(544, 1, 'Mengirim surat keluar', '2024-11-08 05:14:47'),
(545, 1, 'Mengakses halaman surat keluar', '2024-11-08 05:14:48'),
(546, 1, 'Mengakses halaman surat keluar', '2024-11-08 05:15:28'),
(547, 1, 'Mengirim surat keluar', '2024-11-08 05:15:33'),
(548, 1, 'Mengakses halaman surat keluar', '2024-11-08 05:15:34'),
(549, 1, 'Membagikan surat keluar', '2024-11-08 05:16:12'),
(550, 1, 'Mengakses halaman surat keluar', '2024-11-08 05:16:17'),
(551, 1, 'Mengakses halaman surat keluar', '2024-11-08 05:20:36'),
(552, 1, 'Membagikan surat keluar', '2024-11-08 05:20:41'),
(553, 1, 'Mengakses halaman surat keluar', '2024-11-08 05:20:47'),
(554, 1, 'Membagikan surat keluar', '2024-11-08 05:24:07'),
(555, 1, 'Mengakses halaman surat keluar', '2024-11-08 05:24:13'),
(556, 1, 'Mengakses halaman dashboard', '2024-11-08 14:28:23'),
(557, 1, 'Mengakses halaman surat keluar', '2024-11-08 14:28:28'),
(558, 1, 'Mengakses halaman surat keluar', '2024-11-08 15:10:22'),
(559, 1, 'Mengakses halaman surat keluar', '2024-11-08 15:20:28'),
(560, 1, 'Mengakses halaman surat keluar', '2024-11-08 15:20:50'),
(561, 1, 'Mengakses halaman surat keluar', '2024-11-08 15:21:51'),
(562, 1, 'Mengakses halaman surat keluar', '2024-11-08 15:22:02'),
(563, 1, 'Mengakses halaman surat keluar', '2024-11-08 15:23:26'),
(564, 1, 'Mengakses halaman surat keluar', '2024-11-08 15:23:32'),
(565, 1, 'Mengakses halaman surat keluar', '2024-11-08 15:24:41'),
(566, 1, 'Mengakses halaman surat keluar', '2024-11-08 15:24:57'),
(567, 1, 'Membagikan surat keluar', '2024-11-08 15:29:01'),
(568, 1, 'Mengakses halaman surat keluar', '2024-11-08 15:29:06'),
(569, 1, 'Membagikan surat keluar', '2024-11-08 15:32:34'),
(570, 1, 'Mengakses halaman surat keluar', '2024-11-08 15:32:41'),
(571, 1, 'Mengakses halaman surat keluar', '2024-11-08 15:36:47'),
(572, 1, 'Membagikan surat keluar', '2024-11-08 15:36:53'),
(573, 1, 'Mengakses halaman surat keluar', '2024-11-08 15:36:58'),
(574, 1, 'Membagikan surat keluar', '2024-11-08 15:38:56'),
(575, 1, 'Mengakses halaman surat keluar', '2024-11-08 15:39:01'),
(576, 1, 'Membagikan surat keluar', '2024-11-08 15:42:27'),
(577, 1, 'Mengakses halaman surat keluar', '2024-11-08 15:42:32'),
(578, 1, 'Mengakses halaman surat keluar', '2024-11-08 15:56:45'),
(579, 1, 'Mengakses halaman surat keluar', '2024-11-08 15:57:45'),
(580, 1, 'Mengakses halaman surat keluar', '2024-11-08 16:00:48'),
(581, 1, 'Mengakses halaman surat keluar', '2024-11-08 16:01:03'),
(582, 1, 'Mengakses halaman surat keluar', '2024-11-08 16:03:03'),
(583, 1, 'Mengakses halaman surat keluar', '2024-11-08 16:03:14'),
(584, 1, 'Mengakses halaman surat keluar', '2024-11-08 16:05:52'),
(585, 1, 'Mengakses halaman surat keluar', '2024-11-08 16:06:02'),
(586, 1, 'Mengakses halaman surat keluar', '2024-11-08 16:09:41'),
(587, 1, 'Mengakses halaman surat keluar', '2024-11-08 16:13:25'),
(588, 1, 'Mengakses halaman surat keluar', '2024-11-08 16:15:34'),
(589, 1, 'Mengakses halaman surat keluar', '2024-11-08 16:15:43'),
(590, 1, 'Mengakses halaman surat keluar', '2024-11-08 16:18:02'),
(591, 1, 'Mengakses halaman surat keluar', '2024-11-08 16:18:19'),
(592, 1, 'Mengakses halaman surat keluar', '2024-11-08 16:20:02'),
(593, 1, 'Mengakses halaman surat keluar', '2024-11-08 16:20:50'),
(594, 1, 'Mengakses halaman surat keluar', '2024-11-08 16:21:00'),
(595, 1, 'Mengakses halaman surat keluar', '2024-11-08 16:21:45'),
(596, 1, 'Mengakses halaman surat keluar', '2024-11-08 16:22:28'),
(597, 1, 'Mengakses halaman surat keluar', '2024-11-08 16:23:19'),
(598, 1, 'Mengakses halaman surat keluar', '2024-11-08 16:23:49'),
(599, 1, 'Mengakses halaman surat keluar', '2024-11-08 16:24:43'),
(600, 1, 'Mengakses halaman surat keluar', '2024-11-08 16:25:46'),
(601, 1, 'Mengakses halaman surat keluar', '2024-11-08 16:25:57'),
(602, 1, 'Mengakses halaman surat keluar', '2024-11-08 16:26:08'),
(603, 1, 'Mengakses halaman surat keluar', '2024-11-08 16:26:37'),
(604, 1, 'Mengakses halaman surat keluar', '2024-11-08 16:29:38'),
(605, 1, 'Mengakses halaman surat keluar', '2024-11-08 16:31:23'),
(606, 1, 'Mengubah data permohonan cuti', '2024-11-08 16:31:37'),
(607, 1, 'Mengakses halaman surat keluar', '2024-11-08 16:31:37'),
(608, 1, 'Mengakses halaman surat keluar', '2024-11-08 16:34:13'),
(609, 1, 'Mengakses halaman surat keluar', '2024-11-08 16:36:08'),
(610, 1, 'Mengakses halaman surat keluar', '2024-11-08 16:42:52'),
(611, 1, 'Mengakses halaman surat keluar', '2024-11-08 16:42:56'),
(612, 1, 'Mengakses halaman surat keluar', '2024-11-08 17:11:41'),
(613, 1, 'Mengakses halaman surat keluar', '2024-11-08 17:12:17'),
(614, 1, 'Mengakses halaman dashboard', '2024-11-08 17:12:25'),
(615, 1, 'Mengakses halaman dashboard', '2024-11-08 17:12:57'),
(616, 1, 'Mengakses halaman dokumen', '2024-11-08 17:13:08'),
(617, 1, 'Mengakses halaman dokumen', '2024-11-08 17:19:04'),
(618, 1, 'Mengakses halaman restore jenis surat', '2024-11-08 17:28:30'),
(619, 1, 'Mengakses halaman restore jenis surat', '2024-11-08 17:29:08'),
(620, 1, 'Mengakses halaman surat keluar', '2024-11-08 17:29:11'),
(621, 1, 'Mengakses halaman restore jenis surat', '2024-11-08 17:30:06'),
(622, 1, 'Mengakses halaman restore jenis surat', '2024-11-08 17:30:48'),
(623, 1, 'Mengakses halaman restore jenis surat', '2024-11-08 17:31:29'),
(624, 1, 'Mengakses halaman restore jenis surat', '2024-11-08 17:31:49'),
(625, 1, 'Mengakses halaman restore jenis surat', '2024-11-08 17:32:25'),
(626, 1, 'Mengakses halaman restore jenis surat', '2024-11-08 17:33:18'),
(627, 1, 'Merestore jenis surat', '2024-11-08 17:33:20'),
(628, 1, 'Mengakses halaman restore jenis surat', '2024-11-08 17:33:21'),
(629, 1, 'Mengakses halaman surat masuk', '2024-11-08 17:33:36'),
(630, 1, 'Mengakses halaman restore surat masuk', '2024-11-08 17:35:51'),
(631, 1, 'Mengakses halaman restore surat masuk', '2024-11-08 17:36:55'),
(632, 1, 'Merestore jenis surat', '2024-11-08 17:37:44'),
(633, 1, 'Mengakses halaman restore jenis surat', '2024-11-08 17:37:45'),
(634, 1, 'Mengakses halaman restore jenis surat', '2024-11-08 17:38:10'),
(635, 1, 'Mengakses halaman surat masuk', '2024-11-08 17:38:19'),
(636, 1, 'Mengakses halaman restore jenis surat', '2024-11-08 17:38:59'),
(637, 1, 'Mengakses halaman restore surat masuk', '2024-11-08 17:39:04'),
(638, 1, 'Merestore surat masuk', '2024-11-08 17:39:06'),
(639, 1, 'Mengakses halaman restore surat masuk', '2024-11-08 17:39:07'),
(640, 1, 'Mengakses halaman surat keluar', '2024-11-08 17:39:24'),
(641, 1, 'Mengakses halaman restore surat keluar', '2024-11-08 17:40:59'),
(642, 1, 'Merestore surat keluar', '2024-11-08 17:41:06'),
(643, 1, 'Mengakses halaman restore surat keluar', '2024-11-08 17:41:07'),
(644, 1, 'Mengakses halaman surat keluar', '2024-11-08 17:41:47'),
(645, 1, 'Mengakses halaman restore permohonana cuti', '2024-11-08 17:44:29'),
(646, 1, 'Merestore permohonan cuti', '2024-11-08 17:44:41'),
(647, 1, 'Mengakses halaman restore permohonana cuti', '2024-11-08 17:44:42'),
(648, 1, 'Mengakses halaman surat keluar', '2024-11-08 17:50:37'),
(649, 1, 'Mengakses halaman restore keterlambatan kehadiran', '2024-11-08 17:54:22'),
(650, 1, 'Mengakses halaman restore keterlambatan kehadiran', '2024-11-08 17:54:48'),
(651, 1, 'Merestore keterlambatan kehadiran', '2024-11-08 17:54:59'),
(652, 1, 'Mengakses halaman restore keterlambatan kehadiran', '2024-11-08 17:54:59'),
(653, 1, 'Mengakses halaman surat keluar', '2024-11-08 17:55:02'),
(654, 1, 'Mengakses halaman surat keluar', '2024-11-08 17:57:02'),
(655, 1, 'Mengakses halaman restore surat', '2024-11-08 17:57:52'),
(656, 1, 'Mengakses halaman restore surat', '2024-11-08 17:59:03'),
(657, 1, 'Mengakses halaman restore surat', '2024-11-08 17:59:10'),
(658, 1, 'Mengakses halaman restore surat', '2024-11-08 17:59:26'),
(659, 1, 'Merestore surat', '2024-11-08 17:59:28'),
(660, 1, 'Mengakses halaman restore surat', '2024-11-08 17:59:28'),
(661, 1, 'Mengakses halaman log aktivitas', '2024-11-08 17:59:40'),
(662, 1, 'Mengakses halaman surat keluar', '2024-11-08 17:59:56'),
(663, 1, 'Mengakses halaman surat masuk', '2024-11-08 18:00:08'),
(664, 1, 'Mengakses halaman surat keluar', '2024-11-08 18:00:34'),
(665, 1, 'Mengakses halaman surat keluar', '2024-11-08 18:00:43'),
(666, 1, 'Mengakses halaman surat keluar', '2024-11-08 18:00:53'),
(667, 1, 'Menghapus data jenis surat', '2024-11-08 18:00:57'),
(668, 1, 'Mengakses halaman surat keluar', '2024-11-08 18:00:57'),
(669, 1, 'Mengakses halaman surat keluar', '2024-11-08 18:01:00'),
(670, 1, 'Mengakses halaman surat keluar', '2024-11-08 18:01:45'),
(671, 1, 'Mengakses halaman surat keluar', '2024-11-08 18:01:54'),
(672, 1, 'Mengakses halaman surat keluar', '2024-11-08 18:02:41'),
(673, 1, 'Mengakses halaman surat keluar', '2024-11-08 18:04:08'),
(674, 1, 'Mengakses halaman dokumen', '2024-11-08 18:04:19'),
(675, 1, 'Mengakses halaman dokumen', '2024-11-08 18:04:40'),
(676, 1, 'Mengakses halaman dokumen', '2024-11-08 18:06:38'),
(677, 1, 'Mengakses halaman dokumen', '2024-11-08 18:06:45'),
(678, 1, 'Mengakses halaman dokumen', '2024-11-08 18:07:21'),
(679, 1, 'Mengakses halaman user', '2024-11-08 18:17:45'),
(680, 1, 'Mengakses halaman user', '2024-11-08 18:18:48'),
(681, 1, 'Mengakses halaman dokumen', '2024-11-08 18:18:55'),
(682, 1, 'Mengakses halaman restore surat', '2024-11-08 19:08:57'),
(683, 1, 'Mengakses halaman restore surat', '2024-11-08 19:20:42'),
(684, 1, 'Mengakses halaman dashboard', '2024-11-08 19:20:44'),
(685, 1, 'Mengakses halaman dashboard', '2024-11-08 19:20:45'),
(686, 1, 'Mengakses halaman restore surat', '2024-11-08 19:20:52'),
(687, 1, 'Mengakses halaman restore surat', '2024-11-08 19:22:28'),
(688, 1, 'Mengakses halaman dashboard', '2024-11-08 19:22:31'),
(689, 1, 'Mengakses halaman restore surat', '2024-11-08 19:22:38'),
(690, 1, 'Mengakses halaman restore surat', '2024-11-08 19:23:14'),
(691, 1, 'Mengakses halaman restore surat', '2024-11-08 19:47:13'),
(692, 1, 'Mengakses halaman restore surat', '2024-11-08 19:47:18'),
(693, 1, 'Mengakses halaman restore surat', '2024-11-08 19:48:15'),
(694, 1, 'Mengakses halaman restore surat', '2024-11-08 19:48:20'),
(695, 1, 'Mengakses halaman restore surat', '2024-11-08 19:48:37'),
(696, 1, 'Mengakses halaman restore surat', '2024-11-08 19:48:49'),
(697, 1, 'Mengakses halaman restore surat', '2024-11-08 19:52:25'),
(698, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-08 19:52:26'),
(699, 1, 'Mengakses halaman restore surat', '2024-11-08 19:52:31'),
(700, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-08 19:52:33'),
(701, 1, 'Mengakses halaman restore surat', '2024-11-08 19:52:42'),
(702, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-08 19:52:44'),
(703, 1, 'Mengakses halaman restore surat', '2024-11-08 19:52:49'),
(704, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-08 19:52:53'),
(705, 1, 'Mengakses halaman restore surat', '2024-11-08 19:52:58'),
(706, 1, 'Mengakses halaman dashboard', '2024-11-08 23:13:37'),
(707, 1, 'Mengakses halaman restore surat', '2024-11-08 23:15:47'),
(708, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-08 23:16:19'),
(709, 1, 'Mengakses halaman restore surat', '2024-11-08 23:16:29'),
(710, 1, 'Mengakses halaman restore surat', '2024-11-08 23:17:06'),
(711, 1, 'Mengakses halaman restore surat', '2024-11-08 23:17:17'),
(712, 1, 'Mengakses halaman restore surat', '2024-11-08 23:17:29'),
(713, 1, 'Mengakses halaman restore surat', '2024-11-08 23:17:41'),
(714, 1, 'Mengakses halaman restore surat', '2024-11-08 23:36:06'),
(715, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-08 23:36:10'),
(716, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-08 23:36:45'),
(717, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-08 23:37:52'),
(718, 1, 'Mengakses halaman restore surat', '2024-11-08 23:37:57'),
(719, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-08 23:38:01'),
(720, 1, 'Mengakses halaman restore surat', '2024-11-08 23:38:07'),
(721, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-08 23:38:09'),
(722, 1, 'Mengakses halaman restore surat', '2024-11-08 23:38:12'),
(723, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-08 23:38:14'),
(724, 1, 'Mengakses halaman restore surat', '2024-11-08 23:38:20'),
(725, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-08 23:38:23'),
(726, 1, 'Mengakses halaman restore surat', '2024-11-08 23:38:26'),
(727, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-08 23:38:28'),
(728, 1, 'Mengakses halaman restore surat', '2024-11-08 23:38:34'),
(729, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-08 23:38:37'),
(730, 1, 'Mengakses halaman restore surat', '2024-11-08 23:38:42'),
(731, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-08 23:38:44'),
(732, 1, 'Mengakses halaman restore surat', '2024-11-08 23:38:46'),
(733, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-08 23:38:47'),
(734, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-08 23:39:39'),
(735, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-08 23:40:06'),
(736, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-08 23:40:16'),
(737, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-08 23:40:35'),
(738, 1, 'Mengakses halaman restore surat', '2024-11-08 23:40:44'),
(739, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-08 23:40:47'),
(740, 1, 'Mengakses halaman restore surat', '2024-11-08 23:40:52'),
(741, 1, 'Mengakses halaman restore surat', '2024-11-08 23:41:02'),
(742, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-08 23:41:07'),
(743, 1, 'Mengakses halaman restore surat', '2024-11-08 23:41:13'),
(744, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-08 23:41:15'),
(745, 1, 'Mengakses halaman restore surat', '2024-11-08 23:41:23'),
(746, 1, 'Mengakses halaman restore surat', '2024-11-08 23:41:33'),
(747, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-08 23:41:40'),
(748, 1, 'Mengakses halaman restore surat', '2024-11-08 23:41:44'),
(749, 1, 'Mengakses halaman restore surat', '2024-11-08 23:45:44'),
(750, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-08 23:45:47'),
(751, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-08 23:45:59'),
(752, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-08 23:46:24'),
(753, 1, 'Mengakses halaman restore surat', '2024-11-08 23:46:34'),
(754, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-08 23:46:50'),
(755, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-08 23:47:49'),
(756, 1, 'Mengakses halaman restore surat', '2024-11-08 23:48:02'),
(757, 1, 'Mengakses halaman surat keluar', '2024-11-08 23:48:03'),
(758, 1, 'Mengakses halaman surat masuk', '2024-11-08 23:48:06'),
(759, 1, 'Mengakses halaman surat masuk', '2024-11-08 23:48:54'),
(760, 1, 'Mengakses halaman surat masuk', '2024-11-08 23:49:00'),
(761, 1, 'Mengakses halaman surat masuk', '2024-11-08 23:49:08'),
(762, 1, 'Menambah data surat masuk', '2024-11-08 23:49:33'),
(763, 1, 'Mengakses halaman surat masuk', '2024-11-08 23:49:34'),
(764, 1, 'Mengakses halaman surat keluar', '2024-11-08 23:49:39'),
(765, 1, 'Menambah data surat keluar', '2024-11-08 23:49:53'),
(766, 1, 'Mengakses halaman surat keluar', '2024-11-08 23:49:54'),
(767, 1, 'Mengakses halaman surat keluar', '2024-11-08 23:49:58'),
(768, 1, 'Menambah permohonan cuti', '2024-11-08 23:50:27'),
(769, 1, 'Mengakses halaman surat keluar', '2024-11-08 23:50:28'),
(770, 1, 'Mengakses halaman surat keluar', '2024-11-08 23:50:31'),
(771, 1, 'Menambah keterlambatan kehadiran', '2024-11-08 23:50:55'),
(772, 1, 'Mengakses halaman surat keluar', '2024-11-08 23:50:56'),
(773, 1, 'Mengakses halaman surat keluar', '2024-11-08 23:51:01'),
(774, 1, 'Mengakses halaman surat keluar', '2024-11-08 23:51:56'),
(775, 1, 'Mengakses halaman surat keluar', '2024-11-08 23:55:55'),
(776, 1, 'Menambah data surat', '2024-11-08 23:56:09'),
(777, 1, 'Mengakses halaman surat keluar', '2024-11-08 23:56:10'),
(778, 1, 'Mengakses halaman restore surat', '2024-11-08 23:56:13'),
(779, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-08 23:56:16'),
(780, 1, 'Mengakses halaman restore surat', '2024-11-08 23:56:22'),
(781, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-08 23:56:25'),
(782, 1, 'Mengakses halaman restore surat', '2024-11-08 23:56:32'),
(783, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-08 23:56:43'),
(784, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-08 23:57:00'),
(785, 1, 'Mengakses halaman restore surat', '2024-11-08 23:57:04');
INSERT INTO `activity_log` (`id`, `id_user`, `activity`, `timestamp`) VALUES
(786, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-08 23:57:06'),
(787, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-08 23:57:18'),
(788, 1, 'Mengakses halaman restore surat', '2024-11-08 23:57:21'),
(789, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-08 23:57:22'),
(790, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-08 23:59:15'),
(791, 1, 'Mengakses halaman restore surat', '2024-11-08 23:59:23'),
(792, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-08 23:59:26'),
(793, 1, 'Mengakses halaman restore surat', '2024-11-08 23:59:30'),
(794, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-08 23:59:32'),
(795, 1, 'Mengakses halaman restore surat', '2024-11-08 23:59:37'),
(796, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-08 23:59:44'),
(797, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-08 23:59:59'),
(798, 1, 'Mengakses halaman restore surat', '2024-11-09 00:00:03'),
(799, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-09 00:00:07'),
(800, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-09 00:00:36'),
(801, 1, 'Mengakses halaman restore surat', '2024-11-09 00:00:44'),
(802, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-09 00:00:59'),
(803, 1, 'Mengakses halaman restore surat', '2024-11-09 00:01:16'),
(804, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-09 00:01:28'),
(805, 1, 'Mengakses halaman restore surat', '2024-11-09 00:01:37'),
(806, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-09 00:03:51'),
(807, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-09 00:04:57'),
(808, 1, 'Mengakses halaman restore surat', '2024-11-09 00:05:02'),
(809, 1, 'Mengakses halaman restore surat', '2024-11-09 00:08:45'),
(810, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-09 00:08:47'),
(811, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-09 00:08:50'),
(812, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-09 00:09:35'),
(813, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-09 00:09:38'),
(814, 1, 'Mengakses halaman surat keluar', '2024-11-09 00:09:47'),
(815, 1, 'Mengakses halaman surat masuk', '2024-11-09 00:09:51'),
(816, 1, 'Mengubah data surat masuk', '2024-11-09 00:10:07'),
(817, 1, 'Mengakses halaman surat masuk', '2024-11-09 00:10:08'),
(818, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-09 00:10:25'),
(819, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-09 00:12:04'),
(820, 1, 'Mengakses halaman surat masuk', '2024-11-09 00:14:11'),
(821, 1, 'Undo edit surat masuk', '2024-11-09 00:14:17'),
(822, 1, 'Mengakses halaman surat masuk', '2024-11-09 00:14:18'),
(823, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-09 00:14:32'),
(824, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-09 00:14:42'),
(825, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-09 00:17:28'),
(826, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-09 00:17:46'),
(827, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-09 00:18:10'),
(828, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-09 00:18:13'),
(829, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-09 00:19:00'),
(830, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-09 00:19:47'),
(831, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-09 00:21:30'),
(832, 1, 'Mengakses halaman restore surat', '2024-11-09 00:22:26'),
(833, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-09 00:22:29'),
(834, 1, 'Mengakses halaman restore surat', '2024-11-09 00:22:34'),
(835, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-09 00:22:39'),
(836, 1, 'Mengakses halaman restore surat', '2024-11-09 00:22:43'),
(837, 1, 'Mengakses halaman restore surat', '2024-11-09 00:23:23'),
(838, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-09 00:23:25'),
(839, 1, 'Mengakses halaman restore surat', '2024-11-09 00:23:28'),
(840, 1, 'Mengakses halaman restore surat', '2024-11-09 00:23:51'),
(841, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-09 00:23:53'),
(842, 1, 'Mengakses halaman restore surat', '2024-11-09 00:23:56'),
(843, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-09 00:23:58'),
(844, 1, 'Mengakses halaman surat keluar', '2024-11-09 00:24:05'),
(845, 1, 'Mengubah data surat', '2024-11-09 00:24:18'),
(846, 1, 'Mengakses halaman surat keluar', '2024-11-09 00:24:20'),
(847, 1, 'Mengakses halaman restore surat', '2024-11-09 00:24:23'),
(848, 1, 'Mengakses halaman detail jenis dokumen', '2024-11-09 00:24:28'),
(849, 1, 'Mengakses halaman restore surat', '2024-11-09 00:24:43'),
(850, 1, 'Mengakses halaman detail dokumen', '2024-11-09 00:26:32'),
(851, 1, 'Mengakses halaman dokumen', '2024-11-09 00:26:36'),
(852, 1, 'Mengakses halaman surat keluar', '2024-11-09 00:27:35'),
(853, 1, 'Mengakses halaman surat keluar', '2024-11-09 00:27:50'),
(854, 1, 'Mengakses halaman surat keluar', '2024-11-09 00:29:19'),
(855, 1, 'Mengakses halaman surat keluar', '2024-11-09 00:34:57'),
(856, 1, 'Mengakses halaman surat keluar', '2024-11-09 00:37:30'),
(857, 1, 'Mengakses halaman surat keluar', '2024-11-09 00:37:44'),
(858, 1, 'Mengakses halaman surat keluar', '2024-11-09 00:38:34'),
(859, 1, 'Mengakses halaman surat keluar', '2024-11-09 00:38:54'),
(860, 1, 'Mengakses halaman surat keluar', '2024-11-09 00:39:14'),
(861, 1, 'Mengakses halaman surat keluar', '2024-11-09 00:39:34'),
(862, 1, 'Mengakses halaman surat keluar', '2024-11-09 00:39:58'),
(863, 1, 'Mengakses halaman surat keluar', '2024-11-09 00:41:37'),
(864, 1, 'Mengakses halaman surat keluar', '2024-11-09 00:43:04'),
(865, 1, 'Mengakses halaman surat keluar', '2024-11-09 00:47:50'),
(866, 1, 'Mengakses halaman surat keluar', '2024-11-09 00:49:26'),
(867, 1, 'Mengakses halaman permohonan cuti', '2024-11-09 01:15:17'),
(868, 1, 'Mengakses halaman dokumen', '2024-11-09 01:15:18'),
(869, 1, 'Mengakses halaman dokumen', '2024-11-09 01:15:44'),
(870, 1, 'Mengakses halaman dokumen', '2024-11-09 01:28:54'),
(871, 1, 'Mengakses halaman dokumen', '2024-11-09 01:29:03'),
(872, 1, 'Mengakses halaman dokumen', '2024-11-09 01:29:39'),
(873, 1, 'Mengakses halaman dokumen', '2024-11-09 01:31:15'),
(874, 1, 'Mengakses halaman dokumen', '2024-11-09 01:31:37'),
(875, 1, 'Mengakses halaman dokumen', '2024-11-09 01:31:45'),
(876, 1, 'Mengakses halaman user', '2024-11-09 01:31:58'),
(877, 1, 'Menambah user', '2024-11-09 01:32:19'),
(878, 1, 'Mengakses halaman user', '2024-11-09 01:32:19'),
(879, 2, 'Mengakses halaman dashboard', '2024-11-09 01:32:36'),
(880, 2, 'Mengakses halaman dashboard', '2024-11-09 01:34:16'),
(881, 2, 'Mengakses halaman dokumen', '2024-11-09 01:34:54'),
(882, 2, 'Mengakses halaman dokumen', '2024-11-09 01:35:00'),
(883, 2, 'Mengakses halaman dokumen', '2024-11-09 01:35:34'),
(884, 2, 'Mengakses halaman detail dokumen', '2024-11-09 01:35:40'),
(885, 2, 'Mengakses halaman dokumen', '2024-11-09 01:35:44'),
(886, 2, 'Mengakses halaman dokumen', '2024-11-09 01:37:02'),
(887, 2, 'Mengakses halaman dokumen', '2024-11-09 01:37:31'),
(888, 2, 'Mengakses halaman dokumen', '2024-11-09 01:37:36'),
(889, 2, 'Mengakses halaman dokumen', '2024-11-09 01:38:30'),
(890, 2, 'Mengakses halaman dokumen', '2024-11-09 01:38:37'),
(891, 2, 'Mengakses halaman dokumen', '2024-11-09 01:39:00'),
(892, 2, 'Mengakses halaman dokumen', '2024-11-09 01:40:14'),
(893, 2, 'Mengakses halaman surat masuk', '2024-11-09 01:40:22'),
(894, 2, 'Mengakses halaman surat keluar', '2024-11-09 01:40:24'),
(895, 2, 'Mengakses halaman permohonan cuti', '2024-11-09 01:40:26'),
(896, 2, 'Mengakses halaman keterlambatan kehadiran', '2024-11-09 01:40:27'),
(897, 2, 'Mengakses halaman surat keluar', '2024-11-09 01:40:29'),
(898, 2, 'Mengakses halaman dokumen', '2024-11-09 01:40:31'),
(899, 2, 'Mengakses halaman detail dokumen', '2024-11-09 01:40:34'),
(900, 2, 'Mengakses halaman dokumen', '2024-11-09 01:40:36'),
(901, 2, 'Mengakses halaman dokumen', '2024-11-09 01:41:23'),
(902, 2, 'Mengakses halaman dokumen', '2024-11-09 01:41:43'),
(903, 2, 'Mengakses halaman detail dokumen', '2024-11-09 01:41:51'),
(904, 2, 'Mengakses halaman dokumen', '2024-11-09 01:41:52'),
(905, 1, 'Mengakses halaman dashboard', '2024-11-09 01:42:02'),
(906, 1, 'Mengakses halaman dokumen', '2024-11-09 01:42:04'),
(907, 1, 'Mengakses halaman user', '2024-11-09 01:42:41'),
(908, 1, 'Menambah user', '2024-11-09 01:43:00'),
(909, 1, 'Mengakses halaman user', '2024-11-09 01:43:01'),
(910, 3, 'Mengakses halaman dashboard', '2024-11-09 01:43:11'),
(911, 3, 'Mengakses halaman permohonan cuti', '2024-11-09 01:43:14'),
(912, 3, 'Mengakses halaman permohonan cuti', '2024-11-09 01:44:40'),
(913, 3, 'Menambah permohonan cuti', '2024-11-09 01:44:47'),
(914, 3, 'Mengakses halaman permohonan cuti', '2024-11-09 01:44:48'),
(915, 3, 'Mengakses halaman keterlambatan kehadiran', '2024-11-09 01:45:55'),
(916, 3, 'Menambah keterlambatan kehadiran', '2024-11-09 01:46:00'),
(917, 3, 'Mengakses halaman keterlambatan kehadiran', '2024-11-09 01:46:01'),
(918, 1, 'Mengakses halaman dashboard', '2024-11-09 01:46:26'),
(919, 1, 'Mengakses halaman user', '2024-11-09 01:46:30'),
(920, 1, 'Menambah user', '2024-11-09 01:46:51'),
(921, 1, 'Mengakses halaman user', '2024-11-09 01:46:52'),
(922, 1, 'Menambah user', '2024-11-09 01:47:11'),
(923, 1, 'Mengakses halaman user', '2024-11-09 01:47:11'),
(924, 1, 'Menambah user', '2024-11-09 01:47:29'),
(925, 1, 'Mengakses halaman user', '2024-11-09 01:47:29'),
(926, 4, 'Mengakses halaman dashboard', '2024-11-09 01:47:46'),
(927, 4, 'Mengakses halaman dokumen', '2024-11-09 01:47:48'),
(928, 4, 'Mengakses halaman surat masuk', '2024-11-09 01:47:50'),
(929, 4, 'Mengakses halaman surat keluar', '2024-11-09 01:47:52'),
(930, 4, 'Mengakses halaman permohonan cuti', '2024-11-09 01:47:53'),
(931, 4, 'Mengakses halaman permohonan cuti', '2024-11-09 01:47:55'),
(932, 4, 'Mengakses halaman surat keluar', '2024-11-09 01:47:57'),
(933, 4, 'Mengakses halaman dokumen', '2024-11-09 01:47:58'),
(934, 4, 'Mengakses halaman dokumen', '2024-11-09 01:48:23'),
(935, 4, 'Mengakses halaman detail dokumen', '2024-11-09 01:48:26'),
(936, 4, 'Mengakses halaman dokumen', '2024-11-09 01:48:28'),
(937, 3, 'Mengakses halaman dashboard', '2024-11-09 01:48:52'),
(938, 3, 'Mengakses halaman permohonan cuti', '2024-11-09 01:48:57'),
(939, 3, 'Mengakses halaman permohonan cuti', '2024-11-09 01:52:08'),
(940, 3, 'Menambah permohonan cuti', '2024-11-09 01:52:14'),
(941, 3, 'Mengakses halaman permohonan cuti', '2024-11-09 01:52:15'),
(942, 3, 'Mengakses halaman permohonan cuti', '2024-11-09 01:52:44'),
(943, 1, 'Mengakses halaman dashboard', '2024-11-09 01:53:24'),
(944, 1, 'Mengakses halaman permohonan cuti', '2024-11-09 01:53:29'),
(945, 1, 'Mengakses halaman permohonan cuti', '2024-11-09 01:53:36'),
(946, 1, 'Mengakses halaman permohonan cuti', '2024-11-09 01:53:51'),
(947, 1, 'Mengakses halaman permohonan cuti', '2024-11-09 01:54:07'),
(948, 1, 'Mengakses halaman dokumen', '2024-11-09 01:54:08'),
(949, 1, 'Mengakses halaman dokumen', '2024-11-09 01:54:31'),
(950, 1, 'Mengakses halaman detail dokumen', '2024-11-09 01:54:39'),
(951, 1, 'Mengakses halaman dokumen', '2024-11-09 01:54:44'),
(952, 1, 'Mengakses halaman dashboard', '2024-11-09 19:46:28'),
(953, 1, 'Mengakses halaman user', '2024-11-09 19:47:01'),
(954, 1, 'Mengakses halaman user', '2024-11-09 19:47:38'),
(955, 1, 'Mengakses halaman jenis surat', '2024-11-09 19:47:59'),
(956, 1, 'Mengakses halaman surat masuk', '2024-11-09 19:48:27'),
(957, 1, 'Mengakses halaman surat keluar', '2024-11-09 19:49:24'),
(958, 1, 'Mengakses halaman permohonan cuti', '2024-11-09 19:49:58'),
(959, 1, 'Mengakses halaman keterlambatan kehadiran', '2024-11-09 19:50:25'),
(960, 1, 'Mengakses halaman surat keluar', '2024-11-09 19:51:03'),
(961, 1, 'Mengakses halaman dokumen', '2024-11-09 19:51:25'),
(962, 1, 'Mengakses halaman setting', '2024-11-09 19:51:48'),
(963, 1, 'Mengakses halaman log aktivitas', '2024-11-09 19:52:01'),
(964, 1, 'Mengakses halaman restore user', '2024-11-09 19:52:18'),
(965, 1, 'Mengakses halaman dashboard', '2024-11-09 23:23:19'),
(966, 2, 'Mengakses halaman dashboard', '2024-11-09 23:29:06'),
(967, 2, 'Mengakses halaman surat masuk', '2024-11-09 23:29:25'),
(968, 3, 'Mengakses halaman dashboard', '2024-11-09 23:30:28'),
(969, 1, 'Mengakses halaman dashboard', '2024-11-09 23:33:06'),
(970, 1, 'Mengakses halaman profile', '2024-11-09 23:33:13'),
(971, 1, 'Mengubah data profile', '2024-11-09 23:33:27'),
(972, 1, 'Mengakses halaman profile', '2024-11-09 23:33:28'),
(973, 1, 'Mengakses halaman user', '2024-11-09 23:34:19'),
(974, 1, 'Mengubah data user', '2024-11-09 23:35:09'),
(975, 1, 'Mengakses halaman user', '2024-11-09 23:35:10'),
(976, 1, 'Merestore user yang diedit', '2024-11-09 23:35:22'),
(977, 1, 'Mengakses halaman user', '2024-11-09 23:35:23'),
(978, 1, 'Mengakses halaman jenis surat', '2024-11-09 23:35:29'),
(979, 1, 'Mengakses halaman jenis surat', '2024-11-09 23:38:36'),
(980, 1, 'Mengakses halaman jenis surat', '2024-11-09 23:38:53'),
(981, 1, 'Mengubah data jenis surat', '2024-11-09 23:39:05'),
(982, 1, 'Mengakses halaman jenis surat', '2024-11-09 23:39:06'),
(983, 1, 'Mengakses halaman jenis surat', '2024-11-09 23:40:06'),
(984, 1, 'Mengakses halaman jenis surat', '2024-11-09 23:40:21'),
(985, 1, 'Mengakses halaman jenis surat', '2024-11-09 23:40:35'),
(986, 1, 'Menghapus data jenis surat', '2024-11-09 23:41:34'),
(987, 1, 'Mengakses halaman jenis surat', '2024-11-09 23:41:35'),
(988, 1, 'Mengakses halaman restore jenis surat', '2024-11-09 23:41:43'),
(989, 1, 'Merestore jenis surat', '2024-11-09 23:41:47'),
(990, 1, 'Mengakses halaman restore jenis surat', '2024-11-09 23:41:48'),
(991, 1, 'Mengakses halaman jenis surat', '2024-11-09 23:41:50'),
(992, 1, 'Mengubah data jenis surat', '2024-11-09 23:41:58'),
(993, 1, 'Mengakses halaman jenis surat', '2024-11-09 23:41:59'),
(994, 1, 'Merestore jenis surat yang diedit', '2024-11-09 23:42:25'),
(995, 1, 'Mengakses halaman jenis surat', '2024-11-09 23:42:26'),
(996, 1, 'Mengakses halaman surat masuk', '2024-11-09 23:48:31'),
(997, 1, 'Mengakses halaman surat masuk', '2024-11-09 23:48:54'),
(998, 1, 'Mengakses halaman surat masuk', '2024-11-09 23:52:02'),
(999, 1, 'Mengubah data surat masuk', '2024-11-09 23:53:16'),
(1000, 1, 'Mengakses halaman surat masuk', '2024-11-09 23:53:17'),
(1001, 1, 'Undo edit surat masuk', '2024-11-09 23:55:50'),
(1002, 1, 'Mengakses halaman surat masuk', '2024-11-09 23:55:52'),
(1003, 1, 'Mengakses halaman surat keluar', '2024-11-09 23:55:54'),
(1004, 1, 'Mengubah data surat keluar', '2024-11-09 23:58:26'),
(1005, 1, 'Mengakses halaman surat keluar', '2024-11-09 23:58:27'),
(1006, 1, 'Undo edit surat keluar', '2024-11-09 23:58:40'),
(1007, 1, 'Mengakses halaman surat keluar', '2024-11-09 23:58:41'),
(1008, 1, 'Mengakses halaman permohonan cuti', '2024-11-10 00:05:24'),
(1009, 1, 'Mengakses halaman permohonan cuti', '2024-11-10 00:06:17'),
(1010, 1, 'Mengakses halaman keterlambatan kehadiran', '2024-11-10 00:07:15'),
(1011, 1, 'Mengakses halaman permohonan cuti', '2024-11-10 00:07:23'),
(1012, 1, 'Mengubah data permohonan cuti', '2024-11-10 00:10:12'),
(1013, 1, 'Mengakses halaman permohonan cuti', '2024-11-10 00:10:12'),
(1014, 1, 'Undo edit permohonan cuti', '2024-11-10 00:10:28'),
(1015, 1, 'Mengakses halaman permohonan cuti', '2024-11-10 00:10:29'),
(1016, 1, 'Mengakses halaman keterlambatan kehadiran', '2024-11-10 00:15:26'),
(1017, 1, 'Mengakses halaman keterlambatan kehadiran', '2024-11-10 00:15:52'),
(1018, 1, 'Mengakses halaman keterlambatan kehadiran', '2024-11-10 00:16:58'),
(1019, 1, 'Mengubah data keterlambatan kehadiran', '2024-11-10 00:17:15'),
(1020, 1, 'Mengakses halaman keterlambatan kehadiran', '2024-11-10 00:17:16'),
(1021, 1, 'Mengakses halaman jenis surat', '2024-11-10 00:19:15'),
(1022, 1, 'Mengakses halaman surat masuk', '2024-11-10 00:19:16'),
(1023, 1, 'Mengakses halaman surat keluar', '2024-11-10 00:20:27'),
(1024, 1, 'Mengakses halaman jenis surat', '2024-11-10 00:21:39'),
(1025, 1, 'Mengakses halaman permohonan cuti', '2024-11-10 00:21:40'),
(1026, 1, 'Mengakses halaman keterlambatan kehadiran', '2024-11-10 00:23:04'),
(1027, 1, 'Mengakses halaman surat keluar', '2024-11-10 00:26:01'),
(1028, 1, 'Undo edit surat', '2024-11-10 00:26:51'),
(1029, 1, 'Mengakses halaman surat keluar', '2024-11-10 00:26:52'),
(1030, 1, 'Mengakses halaman dokumen', '2024-11-10 00:30:20'),
(1031, 1, 'Mengakses halaman detail dokumen', '2024-11-10 00:31:20'),
(1032, 1, 'Mengakses halaman dokumen', '2024-11-10 00:31:42'),
(1033, 1, 'Mengakses halaman setting', '2024-11-10 00:31:50'),
(1034, 1, 'Mengakses halaman log aktivitas', '2024-11-10 00:32:04'),
(1035, 1, 'Mengakses halaman restore user', '2024-11-10 00:32:19'),
(1036, 1, 'Mengakses halaman user', '2024-11-10 00:32:23'),
(1037, 1, 'Menghapus data user', '2024-11-10 00:32:27'),
(1038, 1, 'Mengakses halaman user', '2024-11-10 00:32:28'),
(1039, 1, 'Mengakses halaman jenis surat', '2024-11-10 00:32:33'),
(1040, 1, 'Menghapus data jenis surat', '2024-11-10 00:32:39'),
(1041, 1, 'Mengakses halaman jenis surat', '2024-11-10 00:32:40'),
(1042, 1, 'Mengakses halaman surat masuk', '2024-11-10 00:32:42'),
(1043, 1, 'Menghapus data surat masuk', '2024-11-10 00:32:46'),
(1044, 1, 'Mengakses halaman surat masuk', '2024-11-10 00:32:47'),
(1045, 1, 'Mengakses halaman surat keluar', '2024-11-10 00:32:49'),
(1046, 1, 'Menghapus data surat keluar', '2024-11-10 00:32:55'),
(1047, 1, 'Mengakses halaman surat keluar', '2024-11-10 00:32:56'),
(1048, 1, 'Mengakses halaman restore user', '2024-11-10 00:34:03'),
(1049, 1, 'Mengakses halaman restore user', '2024-11-10 00:34:32'),
(1050, 1, 'Mengakses halaman restore jenis surat', '2024-11-10 00:34:36'),
(1051, 1, 'Mengakses halaman restore surat masuk', '2024-11-10 00:35:09'),
(1052, 1, 'Mengakses halaman restore surat keluar', '2024-11-10 00:35:26'),
(1053, 1, 'Mengakses halaman restore permohonana cuti', '2024-11-10 00:35:39'),
(1054, 1, 'Merestore permohonan cuti', '2024-11-10 00:35:51'),
(1055, 1, 'Mengakses halaman restore permohonana cuti', '2024-11-10 00:35:51'),
(1056, 1, 'Mengakses halaman restore keterlambatan kehadiran', '2024-11-10 00:35:53'),
(1057, 1, 'Merestore keterlambatan kehadiran', '2024-11-10 00:36:05'),
(1058, 1, 'Mengakses halaman restore keterlambatan kehadiran', '2024-11-10 00:36:06'),
(1059, 1, 'Mengakses halaman restore surat', '2024-11-10 00:36:08'),
(1060, 1, 'Merestore surat', '2024-11-10 00:36:18'),
(1061, 1, 'Mengakses halaman restore surat', '2024-11-10 00:36:19'),
(1062, 1, 'Mengakses halaman restore user', '2024-11-10 00:36:21'),
(1063, 1, 'Mengakses halaman restore user', '2024-11-10 00:37:49'),
(1064, 1, 'Mengakses halaman restore user', '2024-11-10 00:38:18'),
(1065, 1, 'Mengakses halaman restore user', '2024-11-10 00:39:05'),
(1066, 1, 'Mengakses halaman restore user', '2024-11-10 00:40:00'),
(1067, 1, 'Merestore user', '2024-11-10 00:40:22'),
(1068, 1, 'Mengakses halaman restore user', '2024-11-10 00:40:22'),
(1069, 1, 'Mengakses halaman restore jenis surat', '2024-11-10 00:40:28'),
(1070, 1, 'Merestore jenis surat', '2024-11-10 00:40:30'),
(1071, 1, 'Mengakses halaman restore jenis surat', '2024-11-10 00:40:30'),
(1072, 1, 'Mengakses halaman restore surat keluar', '2024-11-10 00:40:33'),
(1073, 1, 'Merestore surat keluar', '2024-11-10 00:40:34'),
(1074, 1, 'Mengakses halaman restore surat keluar', '2024-11-10 00:40:35'),
(1075, 1, 'Mengakses halaman restore surat keluar', '2024-11-10 00:40:39'),
(1076, 1, 'Mengakses halaman restore surat masuk', '2024-11-10 00:40:44'),
(1077, 1, 'Merestore surat masuk', '2024-11-10 00:40:47'),
(1078, 1, 'Mengakses halaman restore surat masuk', '2024-11-10 00:40:47'),
(1079, 1, 'Mengakses halaman restore jenis surat', '2024-11-10 00:40:50'),
(1080, 1, 'Mengakses halaman restore surat masuk', '2024-11-10 00:40:53'),
(1081, 1, 'Mengakses halaman restore surat keluar', '2024-11-10 00:40:56'),
(1082, 1, 'Mengakses halaman restore permohonana cuti', '2024-11-10 00:40:59'),
(1083, 1, 'Mengakses halaman dashboard', '2024-11-10 00:50:11'),
(1084, 1, 'Mengakses halaman dokumen', '2024-11-10 00:50:17'),
(1085, 1, 'Mengakses halaman detail dokumen', '2024-11-10 00:50:19'),
(1086, 1, 'Mengakses halaman dashboard', '2024-11-10 16:40:00'),
(1087, 1, 'Mengakses halaman surat masuk', '2024-11-10 16:40:08'),
(1088, 1, 'Mengakses halaman surat masuk', '2024-11-10 16:48:45'),
(1089, 1, 'Menghapus data surat masuk', '2024-11-10 16:48:52'),
(1090, 1, 'Mengakses halaman surat masuk', '2024-11-10 16:48:53'),
(1091, 1, 'Mengakses halaman restore surat masuk', '2024-11-10 16:48:57'),
(1092, 1, 'Merestore surat masuk', '2024-11-10 16:49:01'),
(1093, 1, 'Mengakses halaman surat masuk', '2024-11-10 16:49:02'),
(1094, 1, 'Mengubah data surat masuk', '2024-11-10 16:49:12'),
(1095, 1, 'Mengakses halaman surat masuk', '2024-11-10 16:49:13'),
(1096, 1, 'Undo edit surat masuk', '2024-11-10 16:49:24'),
(1097, 1, 'Mengakses halaman surat masuk', '2024-11-10 16:49:27'),
(1098, 1, 'Menambah data surat masuk', '2024-11-10 16:49:34'),
(1099, 1, 'Mengakses halaman surat masuk', '2024-11-10 16:49:35'),
(1100, 1, 'Menghapus data surat masuk', '2024-11-10 16:49:40'),
(1101, 1, 'Mengakses halaman surat masuk', '2024-11-10 16:49:41'),
(1102, 1, 'Mengakses halaman surat keluar', '2024-11-10 16:49:50'),
(1103, 1, 'Mengakses halaman surat keluar', '2024-11-10 16:56:37'),
(1104, 1, 'Menambah data surat keluar', '2024-11-10 16:56:49'),
(1105, 1, 'Mengakses halaman surat keluar', '2024-11-10 16:56:54'),
(1106, 1, 'Mengubah data surat keluar', '2024-11-10 16:57:03'),
(1107, 1, 'Mengakses halaman surat keluar', '2024-11-10 16:57:05'),
(1108, 1, 'Undo edit surat keluar', '2024-11-10 16:57:12'),
(1109, 1, 'Mengakses halaman surat keluar', '2024-11-10 16:57:13'),
(1110, 1, 'Menghapus data surat keluar', '2024-11-10 16:57:21'),
(1111, 1, 'Mengakses halaman surat keluar', '2024-11-10 16:57:22'),
(1112, 1, 'Mengakses halaman surat keluar', '2024-11-10 16:57:28'),
(1113, 1, 'Mengakses halaman surat keluar', '2024-11-10 17:03:13'),
(1114, 1, 'Menambah data surat', '2024-11-10 17:03:24'),
(1115, 1, 'Mengakses halaman surat keluar', '2024-11-10 17:03:25'),
(1116, 1, 'Mengubah data surat', '2024-11-10 17:03:34'),
(1117, 1, 'Mengakses halaman surat keluar', '2024-11-10 17:03:35'),
(1118, 1, 'Mengubah data surat', '2024-11-10 17:05:44'),
(1119, 1, 'Mengakses halaman surat keluar', '2024-11-10 17:05:45'),
(1120, 1, 'Undo edit surat', '2024-11-10 17:05:51'),
(1121, 1, 'Mengakses halaman surat keluar', '2024-11-10 17:05:52'),
(1122, 1, 'Mengakses halaman keterlambatan kehadiran', '2024-11-10 17:06:09'),
(1123, 1, 'Mengakses halaman keterlambatan kehadiran', '2024-11-10 17:14:47'),
(1124, 1, 'Mengakses halaman keterlambatan kehadiran', '2024-11-10 17:15:24'),
(1125, 1, 'Mengakses halaman keterlambatan kehadiran', '2024-11-10 17:20:25'),
(1126, 1, 'Mengakses halaman keterlambatan kehadiran', '2024-11-10 17:20:38'),
(1127, 1, 'Mengakses halaman keterlambatan kehadiran', '2024-11-10 17:21:03'),
(1128, 1, 'Mengakses halaman keterlambatan kehadiran', '2024-11-10 17:21:22'),
(1129, 1, 'Mengakses halaman keterlambatan kehadiran', '2024-11-10 17:23:53'),
(1130, 1, 'Mengakses halaman keterlambatan kehadiran', '2024-11-10 17:24:48'),
(1131, 1, 'Mengakses halaman keterlambatan kehadiran', '2024-11-10 17:26:11'),
(1132, 1, 'Mengubah data keterlambatan kehadiran', '2024-11-10 17:26:33'),
(1133, 1, 'Mengakses halaman keterlambatan kehadiran', '2024-11-10 17:26:34'),
(1134, 1, 'Mengubah data keterlambatan kehadiran', '2024-11-10 17:27:01'),
(1135, 1, 'Mengakses halaman keterlambatan kehadiran', '2024-11-10 17:27:01'),
(1136, 1, 'Undo edit keterlambatan kehadiran', '2024-11-10 17:27:11'),
(1137, 1, 'Mengakses halaman keterlambatan kehadiran', '2024-11-10 17:27:12'),
(1138, 2, 'Mengakses halaman dashboard', '2024-11-10 17:31:33'),
(1139, 2, 'Mengakses halaman keterlambatan kehadiran', '2024-11-10 17:31:53'),
(1140, 2, 'Mengakses halaman permohonan cuti', '2024-11-10 17:31:58'),
(1141, 2, 'Mengakses halaman permohonan cuti', '2024-11-10 17:37:03'),
(1142, 2, 'Mengakses halaman permohonan cuti', '2024-11-10 17:37:39'),
(1143, 2, 'Mengakses halaman permohonan cuti', '2024-11-10 17:37:51'),
(1144, 2, 'Mengakses halaman keterlambatan kehadiran', '2024-11-10 17:38:30'),
(1145, 2, 'Mengakses halaman surat masuk', '2024-11-10 17:38:41'),
(1146, 2, 'Mengakses halaman dokumen', '2024-11-10 17:38:47'),
(1147, 2, 'Mengakses halaman dashboard', '2024-11-10 17:38:49'),
(1148, 1, 'Mengakses halaman dashboard', '2024-11-10 17:39:02'),
(1149, 1, 'Mengakses halaman dokumen', '2024-11-10 17:39:14'),
(1150, 1, 'Mengakses halaman dokumen', '2024-11-10 17:43:22'),
(1151, 1, 'Mengakses halaman dokumen', '2024-11-10 17:44:32'),
(1152, 1, 'Mengakses halaman dokumen', '2024-11-10 17:44:46'),
(1153, 4, 'Mengakses halaman dashboard', '2024-11-10 17:45:40'),
(1154, 4, 'Mengakses halaman dokumen', '2024-11-10 17:45:44'),
(1155, 4, 'Mengakses halaman detail dokumen', '2024-11-10 17:45:46'),
(1156, 4, 'Mengakses halaman dokumen', '2024-11-10 17:45:49'),
(1157, 4, 'Mengakses halaman detail dokumen', '2024-11-10 17:45:51'),
(1158, 4, 'Mengakses halaman dokumen', '2024-11-10 17:45:53'),
(1159, 4, 'Mengakses halaman surat masuk', '2024-11-10 17:45:55'),
(1160, 4, 'Mengakses halaman surat keluar', '2024-11-10 17:46:01'),
(1161, 4, 'Mengakses halaman permohonan cuti', '2024-11-10 17:46:05'),
(1162, 4, 'Mengakses halaman keterlambatan kehadiran', '2024-11-10 17:46:13'),
(1163, 4, 'Mengakses halaman surat keluar', '2024-11-10 17:46:25'),
(1164, 4, 'Menghapus data surat', '2024-11-10 17:46:32'),
(1165, 4, 'Mengakses halaman surat keluar', '2024-11-10 17:46:33'),
(1166, 4, 'Mengakses halaman permohonan cuti', '2024-11-10 17:46:35'),
(1167, 4, 'Mengakses halaman permohonan cuti', '2024-11-10 17:52:49'),
(1168, 4, 'Mengakses halaman permohonan cuti', '2024-11-10 17:58:46'),
(1169, 4, 'Mengakses halaman permohonan cuti', '2024-11-10 17:59:07'),
(1170, 1, 'Mengakses halaman dashboard', '2024-11-10 22:59:47'),
(1171, 1, 'Mengakses halaman permohonan cuti', '2024-11-10 22:59:54'),
(1172, 1, 'Mengakses halaman permohonan cuti', '2024-11-10 23:08:03'),
(1173, 1, 'Mengakses halaman permohonan cuti', '2024-11-10 23:10:59'),
(1174, 1, 'Mengakses halaman permohonan cuti', '2024-11-10 23:16:18'),
(1175, 1, 'Mengubah data permohonan cuti', '2024-11-10 23:16:41'),
(1176, 1, 'Mengakses halaman permohonan cuti', '2024-11-10 23:16:42'),
(1177, 1, 'Mengakses halaman permohonan cuti', '2024-11-10 23:28:01'),
(1178, 1, 'Menambah permohonan cuti', '2024-11-10 23:28:09'),
(1179, 1, 'Mengakses halaman permohonan cuti', '2024-11-10 23:28:10'),
(1180, 1, 'Mengakses halaman permohonan cuti', '2024-11-10 23:29:02'),
(1181, 1, 'Mengubah data permohonan cuti', '2024-11-10 23:30:50'),
(1182, 1, 'Mengakses halaman permohonan cuti', '2024-11-10 23:30:51'),
(1183, 1, 'Undo edit permohonan cuti', '2024-11-10 23:30:59'),
(1184, 1, 'Mengakses halaman permohonan cuti', '2024-11-10 23:30:59'),
(1185, 1, 'Mengakses halaman permohonan cuti', '2024-11-10 23:39:16'),
(1186, 1, 'Mengakses halaman permohonan cuti', '2024-11-10 23:39:29'),
(1187, 1, 'Mengakses halaman permohonan cuti', '2024-11-10 23:39:57'),
(1188, 1, 'Mengakses halaman permohonan cuti', '2024-11-10 23:40:23'),
(1189, 1, 'Mengakses halaman permohonan cuti', '2024-11-10 23:40:34'),
(1190, 1, 'Mengakses halaman permohonan cuti', '2024-11-10 23:40:46'),
(1191, 1, 'Mengakses halaman permohonan cuti', '2024-11-10 23:41:25'),
(1192, 1, 'Mengakses halaman jenis surat', '2024-11-10 23:41:34'),
(1193, 1, 'Mengakses halaman surat masuk', '2024-11-10 23:41:40'),
(1194, 1, 'Mengakses halaman permohonan cuti', '2024-11-10 23:41:45'),
(1195, 1, 'Mengakses halaman keterlambatan kehadiran', '2024-11-10 23:41:53'),
(1196, 1, 'Mengakses halaman dokumen', '2024-11-10 23:42:38'),
(1197, 1, 'Mengakses halaman dokumen', '2024-11-10 23:42:45'),
(1198, 1, 'Mengakses halaman dokumen', '2024-11-10 23:42:54'),
(1199, 1, 'Mengakses halaman restore jenis surat', '2024-11-10 23:43:13'),
(1200, 1, 'Mengakses halaman restore permohonana cuti', '2024-11-10 23:43:23'),
(1201, 1, 'Mengakses halaman restore permohonana cuti', '2024-11-10 23:44:40'),
(1202, 1, 'Mengakses halaman restore keterlambatan kehadiran', '2024-11-10 23:44:47'),
(1203, 1, 'Mengakses halaman restore surat', '2024-11-10 23:44:55'),
(1204, 1, 'Mengakses halaman restore surat', '2024-11-10 23:48:09'),
(1205, 1, 'Mengakses halaman dashboard', '2024-11-10 23:51:00'),
(1206, 1, 'Mengakses halaman user', '2024-11-10 23:51:02'),
(1207, 1, 'Mengakses halaman dokumen', '2024-11-10 23:51:11'),
(1208, 1, 'Mengakses halaman detail dokumen', '2024-11-10 23:51:14'),
(1209, 1, 'Mengakses halaman dashboard', '2024-11-11 00:49:37'),
(1210, 1, 'Mengakses halaman dokumen', '2024-11-11 01:12:34'),
(1211, 1, 'Mengakses halaman detail dokumen', '2024-11-11 01:13:18'),
(1212, 1, 'Mengakses halaman dokumen', '2024-11-11 01:13:28'),
(1213, 1, 'Mengakses halaman surat masuk', '2024-11-11 01:52:21'),
(1214, 1, 'Mengubah data surat masuk', '2024-11-11 01:57:37'),
(1215, 1, 'Mengakses halaman surat masuk', '2024-11-11 01:57:39'),
(1216, 1, 'Mengakses halaman surat keluar', '2024-11-11 01:58:01'),
(1217, 1, 'Mengubah data surat keluar', '2024-11-11 01:58:25'),
(1218, 1, 'Mengakses halaman surat keluar', '2024-11-11 01:58:26'),
(1219, 1, 'Mengakses halaman permohonan cuti', '2024-11-11 01:58:51'),
(1220, 1, 'Menghapus data permohonan cuti', '2024-11-11 01:59:58'),
(1221, 1, 'Mengakses halaman permohonan cuti', '2024-11-11 01:59:59'),
(1222, 1, 'Mengubah data permohonan cuti', '2024-11-11 02:07:32'),
(1223, 1, 'Mengakses halaman permohonan cuti', '2024-11-11 02:07:33'),
(1224, 1, 'Mengubah data permohonan cuti', '2024-11-11 02:07:49'),
(1225, 1, 'Mengakses halaman permohonan cuti', '2024-11-11 02:07:50'),
(1226, 1, 'Undo edit permohonan cuti', '2024-11-11 02:08:05'),
(1227, 1, 'Mengakses halaman permohonan cuti', '2024-11-11 02:08:05'),
(1228, 1, 'Mengakses halaman keterlambatan kehadiran', '2024-11-11 02:08:14'),
(1229, 1, 'Mengubah data keterlambatan kehadiran', '2024-11-11 02:08:41'),
(1230, 1, 'Mengakses halaman keterlambatan kehadiran', '2024-11-11 02:08:42'),
(1231, 1, 'Mengakses halaman surat keluar', '2024-11-11 02:09:08'),
(1232, 1, 'Mengubah data surat', '2024-11-11 02:09:35'),
(1233, 1, 'Mengakses halaman surat keluar', '2024-11-11 02:09:36'),
(1234, 1, 'Undo edit surat', '2024-11-11 02:09:49'),
(1235, 1, 'Mengakses halaman surat keluar', '2024-11-11 02:09:50'),
(1236, 1, 'Mengakses halaman dokumen', '2024-11-11 02:09:57'),
(1237, 1, 'Mengakses halaman restore user', '2024-11-11 02:10:37'),
(1238, 1, 'Mengakses halaman restore surat masuk', '2024-11-11 02:10:45'),
(1239, 1, 'Mengakses halaman restore surat keluar', '2024-11-11 02:10:51'),
(1240, 1, 'Mengakses halaman restore permohonana cuti', '2024-11-11 02:10:59'),
(1241, 1, 'Merestore permohonan cuti', '2024-11-11 02:11:12'),
(1242, 1, 'Mengakses halaman restore permohonana cuti', '2024-11-11 02:11:12'),
(1243, 1, 'Mengakses halaman permohonan cuti', '2024-11-11 02:11:16'),
(1244, 1, 'Menghapus data permohonan cuti', '2024-11-11 02:11:22'),
(1245, 1, 'Mengakses halaman permohonan cuti', '2024-11-11 02:11:23'),
(1246, 1, 'Mengakses halaman restore permohonana cuti', '2024-11-11 02:11:25'),
(1247, 1, 'Merestore permohonan cuti', '2024-11-11 02:11:34'),
(1248, 1, 'Mengakses halaman restore permohonana cuti', '2024-11-11 02:11:35'),
(1249, 1, 'Mengakses halaman restore keterlambatan kehadiran', '2024-11-11 02:11:44'),
(1250, 1, 'Mengakses halaman restore surat', '2024-11-11 02:11:53'),
(1251, 3, 'Mengakses halaman dashboard', '2024-11-11 02:15:16'),
(1252, 3, 'Mengakses halaman dashboard', '2024-11-11 02:16:26'),
(1253, 3, 'Mengakses halaman dashboard', '2024-11-11 02:16:54'),
(1254, 1, 'Mengakses halaman dashboard', '2024-11-11 23:11:24'),
(1255, 1, 'Mengakses halaman user', '2024-11-11 23:11:28'),
(1256, 1, 'Mengubah data user', '2024-11-11 23:11:40'),
(1257, 1, 'Mengakses halaman user', '2024-11-11 23:11:41'),
(1258, 1, 'Menambah user', '2024-11-11 23:12:01'),
(1259, 1, 'Mengakses halaman user', '2024-11-11 23:12:01'),
(1260, 1, 'Mengubah data user', '2024-11-11 23:12:15'),
(1261, 1, 'Mengakses halaman user', '2024-11-11 23:12:15'),
(1262, 1, 'Mengakses halaman user', '2024-11-11 23:13:36'),
(1263, 1, 'Mengakses halaman user', '2024-11-11 23:14:26'),
(1264, 1, 'Mengubah data user', '2024-11-11 23:14:37'),
(1265, 1, 'Mengakses halaman user', '2024-11-11 23:14:38'),
(1266, 1, 'Mengubah data user', '2024-11-11 23:14:47'),
(1267, 1, 'Mengakses halaman user', '2024-11-11 23:14:48'),
(1268, 1, 'Mengubah data user', '2024-11-11 23:14:57'),
(1269, 1, 'Mengakses halaman user', '2024-11-11 23:14:58'),
(1270, 1, 'Mengubah data user', '2024-11-11 23:15:05'),
(1271, 1, 'Mengakses halaman user', '2024-11-11 23:15:06'),
(1272, 1, 'Mengubah data user', '2024-11-11 23:15:13'),
(1273, 1, 'Mengakses halaman user', '2024-11-11 23:15:14'),
(1274, 1, 'Mengakses halaman jenis surat', '2024-11-11 23:15:30'),
(1275, 1, 'Mengakses halaman surat masuk', '2024-11-11 23:15:34'),
(1276, 1, 'Mengakses halaman surat keluar', '2024-11-11 23:15:48'),
(1277, 1, 'Mengakses halaman surat keluar', '2024-11-11 23:16:48'),
(1278, 1, 'Mengakses halaman permohonan cuti', '2024-11-11 23:17:02'),
(1279, 1, 'Menghapus data permohonan cuti', '2024-11-11 23:17:10'),
(1280, 1, 'Mengakses halaman permohonan cuti', '2024-11-11 23:17:11'),
(1281, 1, 'Mengakses halaman keterlambatan kehadiran', '2024-11-11 23:17:20'),
(1282, 1, 'Mengakses halaman surat keluar', '2024-11-11 23:17:30'),
(1283, 1, 'Mengakses halaman dokumen', '2024-11-11 23:17:44'),
(1284, 1, 'Mengakses halaman detail dokumen', '2024-11-11 23:17:55'),
(1285, 1, 'Mengakses halaman keterlambatan kehadiran', '2024-11-11 23:19:09'),
(1286, 1, 'Mengakses halaman permohonan cuti', '2024-11-11 23:19:25'),
(1287, 1, 'Menambah permohonan cuti', '2024-11-11 23:19:45'),
(1288, 1, 'Mengakses halaman permohonan cuti', '2024-11-11 23:19:46'),
(1289, 1, 'Menambah permohonan cuti', '2024-11-11 23:20:50'),
(1290, 1, 'Mengakses halaman permohonan cuti', '2024-11-11 23:20:50'),
(1291, 1, 'Mengakses halaman permohonan cuti', '2024-11-11 23:21:16'),
(1292, 1, 'Mengubah data permohonan cuti', '2024-11-11 23:21:29'),
(1293, 1, 'Mengakses halaman permohonan cuti', '2024-11-11 23:21:30'),
(1294, 1, 'Mengubah data permohonan cuti', '2024-11-11 23:21:38'),
(1295, 1, 'Mengakses halaman permohonan cuti', '2024-11-11 23:21:39'),
(1296, 2, 'Mengakses halaman dashboard', '2024-11-11 23:21:58'),
(1297, 2, 'Mengakses halaman surat masuk', '2024-11-11 23:22:01'),
(1298, 2, 'Mengakses halaman surat keluar', '2024-11-11 23:22:02'),
(1299, 2, 'Mengakses halaman permohonan cuti', '2024-11-11 23:22:04'),
(1300, 2, 'Mengakses halaman keterlambatan kehadiran', '2024-11-11 23:22:06'),
(1301, 2, 'Mengakses halaman surat keluar', '2024-11-11 23:22:07'),
(1302, 2, 'Mengakses halaman dokumen', '2024-11-11 23:22:08'),
(1303, 2, 'Mengakses halaman detail dokumen', '2024-11-11 23:22:11'),
(1304, 2, 'Mengakses halaman dokumen', '2024-11-11 23:22:12'),
(1305, 4, 'Mengakses halaman dashboard', '2024-11-11 23:22:22'),
(1306, 4, 'Mengakses halaman surat masuk', '2024-11-11 23:22:24'),
(1307, 4, 'Mengakses halaman surat keluar', '2024-11-11 23:22:28'),
(1308, 4, 'Mengakses halaman permohonan cuti', '2024-11-11 23:22:33'),
(1309, 4, 'Mengakses halaman permohonan cuti', '2024-11-11 23:23:21'),
(1310, 4, 'Mengakses halaman permohonan cuti', '2024-11-11 23:23:34'),
(1311, 4, 'Mengakses halaman permohonan cuti', '2024-11-11 23:23:53'),
(1312, 4, 'Mengakses halaman permohonan cuti', '2024-11-11 23:24:19'),
(1313, 4, 'Mengakses halaman permohonan cuti', '2024-11-11 23:24:26'),
(1314, 4, 'Mengakses halaman permohonan cuti', '2024-11-11 23:24:36'),
(1315, 4, 'Mengakses halaman dokumen', '2024-11-11 23:24:37'),
(1316, 4, 'Mengakses halaman detail dokumen', '2024-11-11 23:24:39'),
(1317, 4, 'Mengakses halaman dokumen', '2024-11-11 23:24:40'),
(1318, 5, 'Mengakses halaman dashboard', '2024-11-11 23:24:53'),
(1319, 5, 'Mengakses halaman surat masuk', '2024-11-11 23:24:56'),
(1320, 5, 'Mengakses halaman surat masuk', '2024-11-11 23:25:02'),
(1321, 5, 'Mengakses halaman surat keluar', '2024-11-11 23:25:02'),
(1322, 5, 'Mengakses halaman keterlambatan kehadiran', '2024-11-11 23:25:04'),
(1323, 5, 'Mengakses halaman dokumen', '2024-11-11 23:25:06'),
(1324, 2, 'Mengakses halaman dashboard', '2024-11-11 23:25:21'),
(1325, 2, 'Mengakses halaman surat masuk', '2024-11-11 23:25:23'),
(1326, 2, 'Mengakses halaman surat keluar', '2024-11-11 23:25:24'),
(1327, 2, 'Mengakses halaman keterlambatan kehadiran', '2024-11-11 23:25:26'),
(1328, 2, 'Mengakses halaman surat keluar', '2024-11-11 23:25:28'),
(1329, 2, 'Mengakses halaman dokumen', '2024-11-11 23:25:29'),
(1330, 2, 'Mengakses halaman detail dokumen', '2024-11-11 23:25:31'),
(1331, 2, 'Mengakses halaman dokumen', '2024-11-11 23:25:33'),
(1332, 6, 'Mengakses halaman dashboard', '2024-11-11 23:25:44'),
(1333, 6, 'Mengakses halaman surat masuk', '2024-11-11 23:25:47'),
(1334, 6, 'Mengakses halaman permohonan cuti', '2024-11-11 23:25:51'),
(1335, 6, 'Mengakses halaman dokumen', '2024-11-11 23:25:55'),
(1336, 3, 'Mengakses halaman dashboard', '2024-11-11 23:26:25'),
(1337, 3, 'Mengakses halaman permohonan cuti', '2024-11-11 23:26:27'),
(1338, 3, 'Mengakses halaman keterlambatan kehadiran', '2024-11-11 23:26:29'),
(1339, 3, 'Mengakses halaman dokumen', '2024-11-11 23:26:30'),
(1340, 7, 'Mengakses halaman dashboard', '2024-11-11 23:26:44'),
(1341, 7, 'Mengakses halaman surat masuk', '2024-11-11 23:26:48'),
(1342, 7, 'Mengakses halaman permohonan cuti', '2024-11-11 23:26:52'),
(1343, 7, 'Mengakses halaman dokumen', '2024-11-11 23:26:54'),
(1344, 1, 'Mengakses halaman dashboard', '2024-11-11 23:27:09'),
(1345, 1, 'Mengakses halaman dokumen', '2024-11-11 23:27:29'),
(1346, 1, 'Mengakses halaman dokumen', '2024-11-11 23:27:36'),
(1347, 1, 'Mengakses halaman dokumen', '2024-11-11 23:27:51'),
(1348, 1, 'Mengakses halaman dashboard', '2024-11-11 23:27:59'),
(1349, 1, 'Mengakses halaman dashboard', '2024-11-11 23:37:37'),
(1350, 1, 'Mengakses halaman dashboard', '2024-11-11 23:38:50'),
(1351, 1, 'Mengakses halaman profile', '2024-11-11 23:39:07'),
(1352, 1, 'Mengakses halaman user', '2024-11-11 23:39:44'),
(1353, 1, 'Mengubah data user', '2024-11-11 23:40:14'),
(1354, 1, 'Mengakses halaman user', '2024-11-11 23:40:15'),
(1355, 1, 'Undo edit data user', '2024-11-11 23:40:57'),
(1356, 1, 'Mengakses halaman user', '2024-11-11 23:40:58'),
(1357, 1, 'Mengakses halaman jenis surat', '2024-11-11 23:41:13'),
(1358, 1, 'Mengakses halaman surat masuk', '2024-11-11 23:41:52'),
(1359, 1, 'Mengakses halaman surat keluar', '2024-11-11 23:42:16'),
(1360, 1, 'Mengakses halaman permohonan cuti', '2024-11-11 23:42:42'),
(1361, 1, 'Mengakses halaman keterlambatan kehadiran', '2024-11-11 23:43:08'),
(1362, 1, 'Mengakses halaman surat keluar', '2024-11-11 23:43:28'),
(1363, 1, 'Mengakses halaman dokumen', '2024-11-11 23:43:45'),
(1364, 1, 'Mengakses halaman detail dokumen', '2024-11-11 23:44:04'),
(1365, 1, 'Mengakses halaman dokumen', '2024-11-11 23:44:09'),
(1366, 1, 'Mengakses halaman detail dokumen', '2024-11-11 23:44:14'),
(1367, 1, 'Mengakses halaman dokumen', '2024-11-11 23:44:18'),
(1368, 1, 'Mengakses halaman dokumen', '2024-11-11 23:44:39'),
(1369, 1, 'Mengakses halaman setting', '2024-11-11 23:44:58'),
(1370, 1, 'Mengakses halaman log aktivitas', '2024-11-11 23:45:10'),
(1371, 1, 'Mengakses halaman setting', '2024-11-11 23:45:15'),
(1372, 1, 'Mengakses halaman log aktivitas', '2024-11-11 23:45:22'),
(1373, 1, 'Mengakses halaman restore user', '2024-11-11 23:45:37'),
(1374, 1, 'Mengakses halaman surat masuk', '2024-11-11 23:45:54'),
(1375, 1, 'Menghapus data surat masuk', '2024-11-11 23:45:59'),
(1376, 1, 'Mengakses halaman surat masuk', '2024-11-11 23:46:00'),
(1377, 1, 'Mengakses halaman restore surat masuk', '2024-11-11 23:46:03'),
(1378, 1, 'Merestore surat masuk', '2024-11-11 23:46:12'),
(1379, 1, 'Mengakses halaman restore surat masuk', '2024-11-11 23:46:13'),
(1380, 4, 'Mengakses halaman dashboard', '2024-11-11 23:46:44'),
(1381, 4, 'Mengakses halaman profile', '2024-11-11 23:46:50'),
(1382, 4, 'Mengakses halaman dashboard', '2024-11-11 23:46:54'),
(1383, 4, 'Mengakses halaman permohonan cuti', '2024-11-11 23:47:02'),
(1384, 4, 'Mengakses halaman permohonan cuti', '2024-11-11 23:47:18'),
(1385, 4, 'Mengakses halaman dokumen', '2024-11-11 23:47:35'),
(1386, 4, 'Mengakses halaman detail dokumen', '2024-11-11 23:47:41'),
(1387, 4, 'Mengakses halaman dokumen', '2024-11-11 23:47:45'),
(1388, 2, 'Mengakses halaman dashboard', '2024-11-11 23:48:07'),
(1389, 2, 'Mengakses halaman surat masuk', '2024-11-11 23:48:13'),
(1390, 2, 'Mengakses halaman permohonan cuti', '2024-11-11 23:48:23'),
(1391, 2, 'Mengakses halaman dokumen', '2024-11-11 23:48:35'),
(1392, 3, 'Mengakses halaman dashboard', '2024-11-11 23:48:59'),
(1393, 3, 'Mengakses halaman permohonan cuti', '2024-11-11 23:49:15'),
(1394, 3, 'Mengakses halaman keterlambatan kehadiran', '2024-11-11 23:49:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `akses`
--

CREATE TABLE `akses` (
  `id_akses` int(11) NOT NULL,
  `level` varchar(255) DEFAULT NULL,
  `id_jenis` int(11) DEFAULT NULL,
  `can_access` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `akses`
--

INSERT INTO `akses` (`id_akses`, `level`, `id_jenis`, `can_access`) VALUES
(14, '3', 6, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `backup_cuti`
--

CREATE TABLE `backup_cuti` (
  `id_cuti` int(11) NOT NULL,
  `nama_cuti` varchar(255) DEFAULT NULL,
  `nik_cuti` varchar(255) DEFAULT NULL,
  `cabang` varchar(255) DEFAULT NULL,
  `tgl_pengajuan` date DEFAULT NULL,
  `jenis_cuti` varchar(255) DEFAULT NULL,
  `tgl_mulai` date DEFAULT NULL,
  `tgl_terakhir` date DEFAULT NULL,
  `total_hari` varchar(255) DEFAULT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `ambil_alih` varchar(255) DEFAULT NULL,
  `alamat_cuti` text DEFAULT NULL,
  `alasan_cuti` text DEFAULT NULL,
  `jatah_cuti` varchar(255) DEFAULT NULL,
  `cuti_diajukan` varchar(255) DEFAULT NULL,
  `sisa_cuti` varchar(255) DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `issetuju` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `isdelete` int(11) NOT NULL,
  `id_jenis` int(11) DEFAULT NULL,
  `jabatan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `backup_cuti`
--

INSERT INTO `backup_cuti` (`id_cuti`, `nama_cuti`, `nik_cuti`, `cabang`, `tgl_pengajuan`, `jenis_cuti`, `tgl_mulai`, `tgl_terakhir`, `total_hari`, `tgl_kembali`, `ambil_alih`, `alamat_cuti`, `alasan_cuti`, `jatah_cuti`, `cuti_diajukan`, `sisa_cuti`, `catatan`, `issetuju`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `isdelete`, `id_jenis`, `jabatan`) VALUES
(2, 'erwe', 'werwe', 'werwe', '2024-11-08', 'Cuti Khusus', '2024-11-08', '2024-11-08', 'werwe  ', '2024-11-09', 'wer ', 'wer  ', 'wer ', 'wer', 'wer', 'wer', 'wer', 2, '2024-11-08 09:01:57', 1, '2024-11-08 09:20:24', 1, NULL, NULL, 0, NULL, ''),
(6, 'admin', 'tes', 'cuti', '2024-11-11', 'Cuti Tahunan', '2024-11-01', '2024-11-08', '8  ', '2024-11-12', ' cuti ', '  cuti  ', ' cuti ', '2', 'cuti', '2', 'cuti', 3, '2024-11-11 06:28:09', 1, '2024-11-12 06:21:30', 1, NULL, NULL, 0, 3, 'Admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `backup_jenis`
--

CREATE TABLE `backup_jenis` (
  `id_jenis` int(11) NOT NULL,
  `nama_jenis` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `isdelete` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `backup_keterlambatan`
--

CREATE TABLE `backup_keterlambatan` (
  `id_keterlambatan` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `nik` varchar(255) DEFAULT NULL,
  `bagian` varchar(255) DEFAULT NULL,
  `tgl` date DEFAULT NULL,
  `jam_datang` time DEFAULT NULL,
  `jumlah_telat` varchar(255) DEFAULT NULL,
  `alasan_telat` text DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `isdelete` int(11) NOT NULL,
  `id_jenis` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `backup_keterlambatan`
--

INSERT INTO `backup_keterlambatan` (`id_keterlambatan`, `nama`, `nik`, `bagian`, `tgl`, `jam_datang`, `jumlah_telat`, `alasan_telat`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `isdelete`, `id_jenis`) VALUES
(3, 'telat', 'telat', 'telat', '2024-11-09', '07:53:00', '53 menit', 'telat', '2024-11-09', 1, '2024-11-11 00:26:34', 1, NULL, NULL, 0, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `backup_surat`
--

CREATE TABLE `backup_surat` (
  `id_surat` int(11) NOT NULL,
  `nomor_surat` varchar(255) DEFAULT NULL,
  `perihal` text DEFAULT NULL,
  `lampiran` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `isdelete` int(11) NOT NULL,
  `id_jenis` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `backup_suratk`
--

CREATE TABLE `backup_suratk` (
  `id_keluar` int(11) NOT NULL,
  `nomor_surat` varchar(255) DEFAULT NULL,
  `tgl_kirim` date DEFAULT NULL,
  `perihal` text DEFAULT NULL,
  `penerima` text DEFAULT NULL,
  `lampiran` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `isdelete` int(11) NOT NULL,
  `id_jenis` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `backup_suratk`
--

INSERT INTO `backup_suratk` (`id_keluar`, `nomor_surat`, `tgl_kirim`, `perihal`, `penerima`, `lampiran`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `isdelete`, `id_jenis`) VALUES
(5, 'SK-20241107-002', NULL, 'zxc', 'xzcxz', 'lampiran/ELLY GOU Penambahan Nilai PBO.docx', '2024-11-07 10:07:57', 1, NULL, NULL, NULL, NULL, 0, NULL),
(7, 'SK-20241108-002', '2024-11-08', 'ijojoaasdasdasadasd', 'iijoij', NULL, '2024-11-08 00:47:42', 1, '2024-11-08 00:53:18', 1, NULL, NULL, 0, 5),
(8, 'SK-20241109-001', '2024-11-09', 'suratkeluar', 'suratkeluar', 'lampiran/ELLY GOU Penambahan Nilai PBO.docx', '2024-11-09 06:49:53', 1, NULL, NULL, NULL, NULL, 0, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `backup_suratm`
--

CREATE TABLE `backup_suratm` (
  `id_masuk` int(11) NOT NULL,
  `nomor_surat` varchar(255) DEFAULT NULL,
  `tgl_terima` date DEFAULT NULL,
  `perihal` text DEFAULT NULL,
  `pengirim` text DEFAULT NULL,
  `lampiran` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `isdelete` int(11) NOT NULL,
  `id_jenis` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `backup_user`
--

CREATE TABLE `backup_user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(255) DEFAULT NULL,
  `email` text DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `nohp` varchar(255) DEFAULT NULL,
  `jk` varchar(255) DEFAULT NULL,
  `tgl_lhr` date DEFAULT NULL,
  `foto` text DEFAULT NULL,
  `isdelete` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `nuptk` varchar(255) DEFAULT NULL,
  `nik` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `backup_user`
--

INSERT INTO `backup_user` (`id_user`, `nama_user`, `email`, `password`, `level`, `nohp`, `jk`, `tgl_lhr`, `foto`, `isdelete`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`, `nuptk`, `nik`) VALUES
(1, 'admin', 'admin@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 1, '62', '', '0000-00-00', 'default.jpg', 0, NULL, NULL, 1, '2024-11-10 06:33:27', NULL, NULL, NULL, 'tes'),
(2, 'yayasan', 'yayasan@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 2, '62', 'Perempuan', '2024-11-09', 'default.jpg', 0, 1, '2024-11-09 08:32:19', NULL, NULL, NULL, NULL, '1', '1'),
(3, 'guru', 'guru@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 7, '62', 'Perempuan', '2024-11-09', 'default.jpg', 0, 1, '2024-11-09 08:43:00', NULL, NULL, NULL, NULL, '1', '1'),
(4, 'kepsek', 'kepsek@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 3, '62', 'Perempuan', '2024-11-09', 'default.jpg', 0, 1, '2024-11-09 08:46:51', NULL, NULL, NULL, NULL, '1', '1'),
(5, 'wakepsek', 'wakepsek@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 4, '62', 'Laki-laki', '2024-11-09', 'default.jpg', 0, 1, '2024-11-09 08:47:11', NULL, NULL, NULL, NULL, '1', '1'),
(6, 'kesiswaan', 'kesiswaan@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 5, '62', 'Perempuan', '2024-11-09', 'default.jpg', 0, 1, '2024-11-09 08:47:29', NULL, NULL, NULL, NULL, '1', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cuti`
--

CREATE TABLE `cuti` (
  `id_cuti` int(11) NOT NULL,
  `nama_cuti` varchar(255) DEFAULT NULL,
  `nik_cuti` varchar(255) DEFAULT NULL,
  `cabang` varchar(255) DEFAULT NULL,
  `tgl_pengajuan` date DEFAULT NULL,
  `jenis_cuti` varchar(255) DEFAULT NULL,
  `tgl_mulai` date DEFAULT NULL,
  `tgl_terakhir` date DEFAULT NULL,
  `total_hari` varchar(255) DEFAULT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `ambil_alih` varchar(255) DEFAULT NULL,
  `alamat_cuti` text DEFAULT NULL,
  `alasan_cuti` text DEFAULT NULL,
  `jatah_cuti` varchar(255) DEFAULT NULL,
  `cuti_diajukan` varchar(255) DEFAULT NULL,
  `sisa_cuti` varchar(255) DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `issetuju` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `isdelete` int(11) NOT NULL,
  `id_jenis` int(11) DEFAULT NULL,
  `jabatan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `cuti`
--

INSERT INTO `cuti` (`id_cuti`, `nama_cuti`, `nik_cuti`, `cabang`, `tgl_pengajuan`, `jenis_cuti`, `tgl_mulai`, `tgl_terakhir`, `total_hari`, `tgl_kembali`, `ambil_alih`, `alamat_cuti`, `alasan_cuti`, `jatah_cuti`, `cuti_diajukan`, `sisa_cuti`, `catatan`, `issetuju`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `isdelete`, `id_jenis`, `jabatan`) VALUES
(3, 'cuti', 'cuti', 'cuti', '2024-11-09', 'Cuti Tahunan', '2024-11-01', '2024-11-11', '11', NULL, 'cuti ', 'cuti  ', 'cuti ', 'cuti', 'cuti', 'cuti', 'cuti', 2, '2024-11-09 06:50:27', 1, '2024-11-11 06:16:41', 1, '2024-11-12 06:17:10', 1, 1, 3, ''),
(6, 'admin', 'tes', 'cuti', '2024-11-11', 'Cuti Tahunan', '2024-11-01', '2024-11-08', '8    ', '2024-11-12', ' cuti  ', '  cuti    ', ' cuti  ', '2', 'cuti', '2', 'cuti', 1, '2024-11-11 06:28:09', 1, '2024-11-12 06:21:38', 1, NULL, NULL, 0, 3, 'Admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis`
--

CREATE TABLE `jenis` (
  `id_jenis` int(11) NOT NULL,
  `nama_jenis` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `isdelete` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jenis`
--

INSERT INTO `jenis` (`id_jenis`, `nama_jenis`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `isdelete`) VALUES
(1, 'Undangan', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(2, 'Pemberitahuan', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(3, 'Permohonan Cuti', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(4, 'Keterlambatan Kehadiran', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(5, 'Surat Keluar', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(6, 'Surat Masuk', NULL, NULL, '2024-11-10 06:39:06', 1, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `keterlambatan`
--

CREATE TABLE `keterlambatan` (
  `id_keterlambatan` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `nik` varchar(255) DEFAULT NULL,
  `bagian` varchar(255) DEFAULT NULL,
  `tgl` date DEFAULT NULL,
  `jam_datang` time DEFAULT NULL,
  `jumlah_telat` varchar(255) DEFAULT NULL,
  `alasan_telat` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `isdelete` int(11) NOT NULL,
  `id_jenis` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `keterlambatan`
--

INSERT INTO `keterlambatan` (`id_keterlambatan`, `nama`, `nik`, `bagian`, `tgl`, `jam_datang`, `jumlah_telat`, `alasan_telat`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `isdelete`, `id_jenis`) VALUES
(3, 'telat', 'telat', 'telat', '2024-11-09', '07:53:00', '53 menit', 'telat', '2024-11-09 00:00:00', 1, '2024-11-11 09:08:41', 1, NULL, NULL, 0, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `setting`
--

CREATE TABLE `setting` (
  `id_setting` int(11) NOT NULL,
  `nama_setting` varchar(255) DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `nama_sekolah` text DEFAULT NULL,
  `nohp` varchar(255) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `setting`
--

INSERT INTO `setting` (`id_setting`, `nama_setting`, `logo`, `alamat`, `nama_sekolah`, `nohp`, `updated_by`, `updated_at`) VALUES
(1, 'E-OFFICE', 'logo_sph.png', 'Komp.Batu Batam Mas, Jl. Gajah Mada Blok D & E No.1,2,3, Baloi Indah, Kec. Lubuk Baja, Kota Batam, Kepulauan Riau 29444', 'SEKOLAH PERMATA HARAPAN', '(0778) 431318', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_keluar`
--

CREATE TABLE `surat_keluar` (
  `id_keluar` int(11) NOT NULL,
  `nomor_surat` varchar(255) DEFAULT NULL,
  `tgl_kirim` date DEFAULT NULL,
  `perihal` text DEFAULT NULL,
  `penerima` text DEFAULT NULL,
  `lampiran` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `isdelete` int(11) NOT NULL,
  `id_jenis` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `surat_keluar`
--

INSERT INTO `surat_keluar` (`id_keluar`, `nomor_surat`, `tgl_kirim`, `perihal`, `penerima`, `lampiran`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `isdelete`, `id_jenis`) VALUES
(8, 'SK-20241109-001', '2024-11-09', 'suratkeluar', 'suratkeluar', 'lampiran/ELLY GOU Penambahan Nilai PBO.docx', '2024-11-09 06:49:53', 1, '2024-11-11 08:58:25', 1, NULL, NULL, 0, 5),
(9, 'SM-20241109-002', '2024-11-10', '', '', NULL, '2024-11-10 23:56:49', 1, NULL, NULL, '2024-11-10 23:57:21', 1, 1, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_masuk`
--

CREATE TABLE `surat_masuk` (
  `id_masuk` int(11) NOT NULL,
  `nomor_surat` varchar(255) DEFAULT NULL,
  `tgl_terima` date DEFAULT NULL,
  `perihal` text DEFAULT NULL,
  `pengirim` text DEFAULT NULL,
  `lampiran` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `isdelete` int(11) NOT NULL,
  `id_jenis` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `surat_masuk`
--

INSERT INTO `surat_masuk` (`id_masuk`, `nomor_surat`, `tgl_terima`, `perihal`, `pengirim`, `lampiran`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `isdelete`, `id_jenis`) VALUES
(3, 'SM-20241109-001', '2024-11-09', 'suratmasuk', 'suratmasuk', 'lampiran/ELLY GOU Penambahan Nilai PBO.docx', '2024-11-09 06:49:33', 1, '2024-11-11 08:57:38', 1, NULL, NULL, 0, 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_surat`
--

CREATE TABLE `surat_surat` (
  `id_surat` int(11) NOT NULL,
  `nomor_surat` varchar(255) DEFAULT NULL,
  `perihal` text DEFAULT NULL,
  `lampiran` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `isdelete` int(11) NOT NULL,
  `id_jenis` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `surat_surat`
--

INSERT INTO `surat_surat` (`id_surat`, `nomor_surat`, `perihal`, `lampiran`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `isdelete`, `id_jenis`) VALUES
(3, 'NS-20241109-001', 'surat lain', 'lampiran/ELLY GOU Penambahan Nilai PBO.docx', '2024-11-09 06:56:09', 1, NULL, NULL, NULL, NULL, 0, '2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(255) DEFAULT NULL,
  `email` text DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `nohp` varchar(255) DEFAULT NULL,
  `jk` varchar(255) DEFAULT NULL,
  `tgl_lhr` date DEFAULT NULL,
  `foto` text DEFAULT NULL,
  `isdelete` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `nuptk` varchar(255) DEFAULT NULL,
  `nik` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `email`, `password`, `level`, `nohp`, `jk`, `tgl_lhr`, `foto`, `isdelete`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`, `nuptk`, `nik`) VALUES
(1, 'admin', 'admin@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 1, '62', '', '0000-00-00', 'default.jpg', 0, NULL, NULL, 1, '2024-11-12 06:11:41', NULL, NULL, NULL, '1'),
(2, 'yayasan', 'yayasan@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 2, '62', 'Perempuan', '2024-11-09', 'default.jpg', 0, 1, '2024-11-09 08:32:19', 1, '2024-11-12 06:12:15', NULL, NULL, '2', '2'),
(3, 'guru', 'guru@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 7, '62', 'Perempuan', '2024-11-09', 'default.jpg', 0, 1, '2024-11-09 08:43:00', 1, '2024-11-12 06:14:37', NULL, NULL, '3', '3'),
(4, 'kepsek', 'kepsek@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 3, '62', 'Perempuan', '2024-11-09', 'default.jpg', 0, 1, '2024-11-09 08:46:51', 1, '2024-11-12 06:14:48', NULL, NULL, '4', '4'),
(5, 'wakepsek', 'wakepsek@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 4, '62', 'Laki-laki', '2024-11-09', 'default.jpg', 0, 1, '2024-11-09 08:47:11', 1, '2024-11-12 06:14:57', NULL, NULL, '5', '5'),
(6, 'kesiswaan', 'kesiswaan@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 5, '62', 'Perempuan', '2024-11-09', 'default.jpg', 0, 1, '2024-11-09 08:47:29', 1, '2024-11-12 06:15:06', NULL, NULL, '6', '6'),
(7, 'hrd', 'hrd@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 6, '62', 'Perempuan', '2024-11-12', 'default.jpg', 0, 1, '2024-11-12 06:12:01', 1, '2024-11-12 06:15:14', NULL, NULL, '7', '7');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `akses`
--
ALTER TABLE `akses`
  ADD PRIMARY KEY (`id_akses`);

--
-- Indeks untuk tabel `backup_cuti`
--
ALTER TABLE `backup_cuti`
  ADD PRIMARY KEY (`id_cuti`);

--
-- Indeks untuk tabel `backup_jenis`
--
ALTER TABLE `backup_jenis`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indeks untuk tabel `backup_keterlambatan`
--
ALTER TABLE `backup_keterlambatan`
  ADD PRIMARY KEY (`id_keterlambatan`);

--
-- Indeks untuk tabel `backup_surat`
--
ALTER TABLE `backup_surat`
  ADD PRIMARY KEY (`id_surat`);

--
-- Indeks untuk tabel `backup_suratk`
--
ALTER TABLE `backup_suratk`
  ADD PRIMARY KEY (`id_keluar`) USING BTREE;

--
-- Indeks untuk tabel `backup_suratm`
--
ALTER TABLE `backup_suratm`
  ADD PRIMARY KEY (`id_masuk`);

--
-- Indeks untuk tabel `backup_user`
--
ALTER TABLE `backup_user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indeks untuk tabel `cuti`
--
ALTER TABLE `cuti`
  ADD PRIMARY KEY (`id_cuti`);

--
-- Indeks untuk tabel `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indeks untuk tabel `keterlambatan`
--
ALTER TABLE `keterlambatan`
  ADD PRIMARY KEY (`id_keterlambatan`);

--
-- Indeks untuk tabel `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id_setting`);

--
-- Indeks untuk tabel `surat_keluar`
--
ALTER TABLE `surat_keluar`
  ADD PRIMARY KEY (`id_keluar`) USING BTREE;

--
-- Indeks untuk tabel `surat_masuk`
--
ALTER TABLE `surat_masuk`
  ADD PRIMARY KEY (`id_masuk`);

--
-- Indeks untuk tabel `surat_surat`
--
ALTER TABLE `surat_surat`
  ADD PRIMARY KEY (`id_surat`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1395;

--
-- AUTO_INCREMENT untuk tabel `akses`
--
ALTER TABLE `akses`
  MODIFY `id_akses` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `backup_cuti`
--
ALTER TABLE `backup_cuti`
  MODIFY `id_cuti` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `backup_jenis`
--
ALTER TABLE `backup_jenis`
  MODIFY `id_jenis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `backup_keterlambatan`
--
ALTER TABLE `backup_keterlambatan`
  MODIFY `id_keterlambatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `backup_surat`
--
ALTER TABLE `backup_surat`
  MODIFY `id_surat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `backup_suratk`
--
ALTER TABLE `backup_suratk`
  MODIFY `id_keluar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `backup_suratm`
--
ALTER TABLE `backup_suratm`
  MODIFY `id_masuk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `backup_user`
--
ALTER TABLE `backup_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `cuti`
--
ALTER TABLE `cuti`
  MODIFY `id_cuti` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `jenis`
--
ALTER TABLE `jenis`
  MODIFY `id_jenis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `keterlambatan`
--
ALTER TABLE `keterlambatan`
  MODIFY `id_keterlambatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `setting`
--
ALTER TABLE `setting`
  MODIFY `id_setting` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `surat_keluar`
--
ALTER TABLE `surat_keluar`
  MODIFY `id_keluar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `surat_masuk`
--
ALTER TABLE `surat_masuk`
  MODIFY `id_masuk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `surat_surat`
--
ALTER TABLE `surat_surat`
  MODIFY `id_surat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
