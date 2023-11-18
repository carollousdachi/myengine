-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2023 at 06:06 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wadesktop`
--

-- --------------------------------------------------------

--
-- Table structure for table `blank`
--

CREATE TABLE `blank` (
  `id` varchar(30) NOT NULL,
  `kontak` varchar(30) NOT NULL,
  `id_whatsapp` varchar(50) NOT NULL,
  `name` text NOT NULL,
  `process_date` date NOT NULL,
  `m_status` int(11) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator` varchar(30) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard`
--

CREATE TABLE `dashboard` (
  `id` varchar(30) NOT NULL,
  `name` varchar(150) NOT NULL,
  `short_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `apikey` varchar(100) NOT NULL,
  `whatsapp` varchar(30) NOT NULL,
  `location` text NOT NULL,
  `instagram` varchar(150) NOT NULL,
  `facebook` varchar(150) NOT NULL,
  `youtube` varchar(150) NOT NULL,
  `logo` varchar(250) NOT NULL,
  `status` int(11) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dashboard`
--

INSERT INTO `dashboard` (`id`, `name`, `short_name`, `email`, `apikey`, `whatsapp`, `location`, `instagram`, `facebook`, `youtube`, `logo`, `status`, `create_date`, `creator`) VALUES
('BB1', 'Whatsapp API', 'Engine', '-', 'XAX9XVD8VP4VV08BHRZ9', '6282166230778', 'Jl. Karo No. 20 Belawan', '', '', '', 'whatsapp_api.png', 0, '2023-10-10 18:33:33', 'carollousdc');

-- --------------------------------------------------------

--
-- Table structure for table `kontak`
--

CREATE TABLE `kontak` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `persen2a` int(11) NOT NULL,
  `persen3a` int(11) NOT NULL,
  `persen4a` int(11) NOT NULL,
  `hd2a` int(11) NOT NULL,
  `hd3a` int(11) NOT NULL,
  `hd4a` int(11) NOT NULL,
  `hd_a2` varchar(10) NOT NULL,
  `hd_a3` varchar(10) NOT NULL,
  `hd_a4` varchar(10) NOT NULL,
  `h2_s2` varchar(10) NOT NULL,
  `h2_s3` varchar(10) NOT NULL,
  `persencb` varchar(10) NOT NULL,
  `hdcb1` varchar(10) NOT NULL,
  `hdcb2` varchar(10) NOT NULL,
  `hdcb3` varchar(10) NOT NULL,
  `hdcb4` varchar(10) NOT NULL,
  `persencp` varchar(10) NOT NULL,
  `hdcp1` varchar(10) NOT NULL,
  `hdcp2` varchar(10) NOT NULL,
  `hdcp3` varchar(10) NOT NULL,
  `persencn` varchar(10) NOT NULL,
  `hdcn1` varchar(10) NOT NULL,
  `hdcn2` varchar(10) NOT NULL,
  `persenck` varchar(10) NOT NULL,
  `hdck` varchar(10) NOT NULL,
  `persence` varchar(10) NOT NULL,
  `hdce` varchar(10) NOT NULL,
  `persensh` varchar(10) NOT NULL,
  `hdsh` varchar(10) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator` varchar(30) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kontak`
--

INSERT INTO `kontak` (`id`, `name`, `phone`, `persen2a`, `persen3a`, `persen4a`, `hd2a`, `hd3a`, `hd4a`, `hd_a2`, `hd_a3`, `hd_a4`, `h2_s2`, `h2_s3`, `persencb`, `hdcb1`, `hdcb2`, `hdcb3`, `hdcb4`, `persencp`, `hdcp1`, `hdcp2`, `hdcp3`, `persencn`, `hdcn1`, `hdcn2`, `persenck`, `hdck`, `persence`, `hdce`, `persensh`, `hdsh`, `create_date`, `creator`, `status`) VALUES
(1, 'M Yoggi', '6288262881388', 12, 55, 0, 67, 45, 94, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-05-13 01:10:32', 'carollousdc', 0),
(2, 'Carollous Dachi', '6281377457800', 28, 28, 28, 70, 500, 5000, '213213', '123213', '32', '123', '23', '28', '2.5', '4', '5.5', '7', '0', '7', '10', '13', '0', '19', '19', '0', '8', '0', '8', '0', '0', '2021-04-25 18:38:58', 'carollousdc', 0),
(3, 'Yoga Pratama', '6289607864737', 64, 44, 0, 46, 76, 66, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-04-09 15:10:10', '', 0),
(7, 'Isak', '6281258642409', 2, 2, 2, 2, 2, 2, '2', '2', '232', '52', '56', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-04-16 20:24:21', 'carollousdc', 0),
(8, 'Dirga Putra Dachi', '6282161155300', 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-04-16 22:31:21', 'carollousdc', 0),
(10, 'Heru Hardiansyah', '6288807728607', 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-04-16 23:40:26', 'carollousdc', 0),
(13, 'Ibu Sri', '6289653739490', 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-04-19 13:28:33', 'carollousdc', 0),
(14, 'Richan Hutabarat', '6281284097989', 28, 28, 28, 70, 500, 3000, '', '', '', '', '', '0', '2.5', '4', '5.5', '7', '0', '7', '10', '13', '', '', '', '', '', '', '', '', '', '2021-04-19 18:55:03', 'carollousdc', 0),
(15, 'Yoggi Simpati', '6282274376128', 28, 28, 28, 70, 500, 3000, '', '', '', '', '', '22', '22', '22', '22', '2', '0', '2', '2', '2', '0', '2', '22', '0', '8', '0', '5', '0', '0', '2021-04-19 19:04:57', 'carollousdc', 0),
(17, 'Roda Hafiz', '6281398172301', 28, 28, 28, 70, 500, 3000, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-04-25 02:53:57', 'carollousdc', 0),
(18, 'Raditya', '6285156297323', 28, 28, 28, 70, 500, 3000, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-04-25 06:54:34', 'carollousdc', 0),
(19, 'adas', 'd2312321321321', 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-05-03 23:20:09', 'carollousdc', 0),
(20, 'Yoggi XL', '6282274376128', 28, 0, 28, 500, 0, 3000, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-05-15 08:57:40', 'carollousdc', 0),
(21, 'Olus', '6282297943451', 28, 28, 28, 70, 500, 3000, '', '', '', '', '', '0', '2.5', '4', '5.5', '7', '0', '7', '10', '13', '0', '20', '20', '9', '9', '9', '9', '0', '0', '2021-05-23 00:20:52', 'carollousdc', 0),
(22, 'Agus AM', '6282166230778', 28, 28, 28, 70, 500, 3000, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-06-07 12:49:48', 'carollousdc', 0),
(23, 'MGS 2', '6282110919767', 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-06-09 17:21:21', 'carollousdc', 0),
(24, 'Bang Fikri', '6282210576594', 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-06-10 15:42:38', 'carollousdc', 0),
(25, 'Ressa AM', '6282267049828', 28, 28, 28, 70, 500, 3000, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-06-14 11:37:44', 'carollousdc', 0),
(26, 'Razi AM', '6282294607047', 28, 28, 28, 70, 500, 3000, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-06-14 15:36:55', 'carollousdc', 0),
(27, 'Balibey', '601111718145', 28, 28, 28, 70, 500, 3000, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2021-06-19 13:37:18', 'carollousdc', 0);

-- --------------------------------------------------------

--
-- Table structure for table `navigation`
--

CREATE TABLE `navigation` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `link` varchar(50) NOT NULL,
  `second_id` varchar(30) NOT NULL,
  `tipe` varchar(30) NOT NULL,
  `root` int(11) NOT NULL,
  `urutan` int(11) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `creator` varchar(30) NOT NULL,
  `create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `navigation`
--

INSERT INTO `navigation` (`id`, `name`, `link`, `second_id`, `tipe`, `root`, `urutan`, `icon`, `creator`, `create`, `status`) VALUES
(1, 'Master Menu', '', 'mastermenu', '0', 0, 1, 'nav-icon fas fa-tachometer-alt', 'carollousdc', '2021-01-28 06:21:34', 0),
(3, 'User', 'user', 'user', '1', 29, 3, 'far fa-circle nav-icon', 'carollousdc', '2021-01-28 06:21:34', 0),
(6, 'Settings', '', 'settings', '0', 0, 6, 'fas fa-cog nav-icon', 'carollousdc', '2021-05-06 10:14:03', 0),
(7, 'Menu Navigation', 'navigation', 'navigation', '1', 6, 7, 'far fa-circle nav-icon', 'carollousdc', '2021-05-06 10:14:03', 0),
(11, 'Laporan', 'laporan', 'documentation', '2', 0, 9, 'nav-icon fas fa-file', 'carollousdc', '2021-05-30 17:18:06', 0),
(12, 'Logout', 'logout', 'logout', '2', 0, 12, 'nav-icon fas fa-sign-out-alt', 'carollousdc', '2021-01-28 06:21:34', 0),
(29, 'Master SDM', '', 'mastersdm', '0', 0, 0, 'fas fa-users nav-icon', 'carollousdc', '2021-05-06 10:14:03', 0),
(43, 'Role', 'role', 'role', '1', 29, 0, 'far fa-circle nav-icon', 'carollousdc', '2021-05-06 10:14:03', 0),
(44, 'Permission', 'permission', 'permission', '1', 6, 0, 'far fa-circle nav-icon', 'carollousdc', '2021-05-06 10:14:03', 0),
(51, 'Kontak', 'kontak', 'kontak', '1', 29, 0, 'far fa-circle nav-icon', 'carollousdc', '2021-05-06 10:14:03', 0),
(58, 'Blank', 'blank', '', '1', 1, 3, 'fas fa-envelope nav-icon', 'carollousdc', '2023-10-11 15:04:01', 0);

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `id` int(11) NOT NULL,
  `role` int(11) NOT NULL,
  `menu` int(11) NOT NULL,
  `action` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`id`, `role`, `menu`, `action`, `status`, `create_date`, `creator`) VALUES
(1, 3, 16, 0, 0, '2021-02-03 14:02:57', ''),
(2, 3, 24, 0, 0, '2021-02-04 06:39:38', ''),
(3, 4, 40, 0, 0, '2021-02-04 06:40:42', '');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `keterangan` text NOT NULL,
  `status` int(11) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `keterangan`, `status`, `create_date`, `creator`) VALUES
(1, 'Admin', 'Full access control dashboard.', 0, '2021-02-03 14:02:42', '');

-- --------------------------------------------------------

--
-- Table structure for table `tipe`
--

CREATE TABLE `tipe` (
  `id` varchar(30) NOT NULL,
  `name` varchar(100) NOT NULL,
  `fieldname` varchar(50) NOT NULL,
  `role` varchar(30) NOT NULL,
  `status` int(11) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipe`
--

INSERT INTO `tipe` (`id`, `name`, `fieldname`, `role`, `status`, `create_date`, `creator`) VALUES
('Tip00001', 'Fixed Cost', 'tipe', 'pengeluaran', 0, '2021-01-28 05:26:00', ''),
('Tip00002', 'Cooker', 'jabatan', 'karyawan', 0, '2021-01-28 05:27:02', ''),
('Tip00003', 'Cashier', 'jabatan', 'karyawan', 0, '2021-01-28 05:27:11', ''),
('Tip00004', 'Cleaning Service', 'jabatan', 'karyawan', 0, '2021-01-28 05:27:31', ''),
('Tip00005', 'Master Menu', 'tipe', 'navigation', 0, '2021-01-28 06:16:26', ''),
('Tip00006', 'Root', 'tipe', 'navigation', 0, '2021-01-28 06:16:33', ''),
('Tip00007', 'Single', 'tipe', 'navigation', 0, '2021-01-28 06:16:38', ''),
('Tip00008', 'Operational Cost', 'tipe', 'pengeluaran', 0, '2021-01-28 13:30:42', '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` varchar(25) NOT NULL,
  `id_whatsapp` varchar(30) NOT NULL,
  `email` varchar(25) NOT NULL,
  `firstname` varchar(25) NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `gender` int(11) NOT NULL,
  `password` varchar(250) NOT NULL,
  `role` int(11) NOT NULL,
  `notification` int(11) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `creator` varchar(30) NOT NULL,
  `last_login` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `id_whatsapp`, `email`, `firstname`, `lastname`, `gender`, `password`, `role`, `notification`, `picture`, `creator`, `last_login`, `is_active`, `status`) VALUES
('carollousdc', '6285765633475', 'carollousdc@gmail.com', 'Carollous', 'Dachi', 0, '$2y$09$TZoHGO4c3WjjtQbYGGolM.CcgAfQJCkFHDQ556GCF0IwOpx5U8206', 1, 0, 'download.png', 'carollousdc', '2021-05-30 16:26:06', 1, 0),
('opyoga', '6281377457800', 'opyogga@wa.app', 'OP', 'Yogga', 0, '$2y$09$1nn85PZRz.Yj5rQp.3pDuOYyKDXrfYXOwEG/iQ/CogoGnB3dQ53Ri', 1, 0, 'download.png', 'carollousdc', '2021-05-15 08:37:51', NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blank`
--
ALTER TABLE `blank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dashboard`
--
ALTER TABLE `dashboard`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kontak`
--
ALTER TABLE `kontak`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `navigation`
--
ALTER TABLE `navigation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipe`
--
ALTER TABLE `tipe`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kontak`
--
ALTER TABLE `kontak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `navigation`
--
ALTER TABLE `navigation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
