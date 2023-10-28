-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 26, 2023 at 06:40 AM
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
-- Database: `adminlte`
--

-- --------------------------------------------------------

--
-- Table structure for table `dashboard`
--

CREATE TABLE `dashboard` (
  `id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `name` varchar(50) NOT NULL,
  `apikey` varchar(250) NOT NULL,
  `location` varchar(250) NOT NULL,
  `logo` varchar(250) NOT NULL,
  `status` int(11) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `function`
--

CREATE TABLE `function` (
  `id` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `creator` varchar(50) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `function`
--

INSERT INTO `function` (`id`, `name`, `icon`, `creator`, `create_date`, `status`) VALUES
('NVM00001', 'Add', 'fas fa-pencil-alt', 'carollousdc', '2023-10-23 20:38:52', 0);

-- --------------------------------------------------------

--
-- Table structure for table `navigation`
--

CREATE TABLE `navigation` (
  `id` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `link` varchar(50) NOT NULL,
  `tipe` int(11) NOT NULL,
  `root` varchar(50) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `creator` varchar(50) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `navigation`
--

INSERT INTO `navigation` (`id`, `name`, `link`, `tipe`, `root`, `icon`, `creator`, `create_date`, `status`) VALUES
('NAVI00001', 'Dashboard', 'dashboard', 0, '0', 'fas fa-tachometer-alt', 'carollousdc', '2023-10-25 13:45:10', 0),
('NAVI00002', 'User', 'user', 0, '0', 'fab fa-gratipay', 'carollousdc', '2023-10-25 13:46:14', 0),
('NAVI00003', 'Navigation', 'navigation', 0, '0', 'fa fa-bars', 'carollousdc', '2023-10-25 13:46:14', 0),
('NAVI00004', 'Role', 'role', 0, '0', 'fas fa-envelope', 'carollousdc', '2023-10-25 13:46:14', 0),
('NAVI00005', 'Permission', 'permission', 0, '0', 'fas fa-info-circle', 'carollousdc', '2023-10-25 13:46:14', 0),
('NAVI00006', 'List Functions', 'functions', 0, '0', 'fas fa-i-cursor', 'carollousdc', '2023-10-25 13:46:14', 0);

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `id` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `link` varchar(150) NOT NULL,
  `creator` varchar(50) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`id`, `name`, `link`, `creator`, `create_date`, `status`) VALUES
('NVM00001', 'User', 'user', 'carollousdc', '2023-10-23 20:19:18', 0);

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `id` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  `permission` varchar(50) NOT NULL,
  `creator` varchar(50) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `permission_role_detail`
--

CREATE TABLE `permission_role_detail` (
  `permission_role` varchar(50) NOT NULL,
  `function` varchar(50) NOT NULL,
  `creator` varchar(50) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `creator` varchar(50) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `creator`, `create_date`, `status`) VALUES
('ROL00001', 'Developer', 'carollousdc', '2023-10-25 13:48:29', 0),
('ROL00002', 'Admin', 'carollousdc', '2023-10-25 13:48:29', 0),
('ROL00003', 'Teacher', 'carollousdc', '2023-10-25 13:48:29', 0),
('ROL00004', 'Parent', 'carollousdc', '2023-10-25 13:48:29', 0),
('ROL00005', 'Student', 'carollousdc', '2023-10-25 13:48:29', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `role` varchar(50) NOT NULL,
  `hash` varchar(50) NOT NULL,
  `password` varchar(250) NOT NULL,
  `creator` varchar(50) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `name`, `role`, `hash`, `password`, `creator`, `create_date`, `status`) VALUES
(1, 'carollousdc', 'Carollous Dachi', 'ROL00001', '160696', '$2y$05$Kn2xYh1/UFxRJbsE2sgGPeLNjsBNFHjx47H9s2Xao11biWw6dofgG', 'carollousdc', '2023-10-25 13:48:54', 0),
(2, 'paulusdc', 'Paulus Dachi', 'ROL00003', '170716', '$2y$11$2fmeIqN5iBHaIjwI8q5uwON19GxyLDwEv1MesF5zPoBIGTiW1xXaG', 'carollousdc', '2023-10-25 13:49:08', 0),
(3, 'josuadc', 'Josua Christian Dachi', 'ROL00005', '221204', '$2y$11$JEzTONz58Z9317314ngDBOiKDeUwCXivpMFVUduoDQYziavoBqIDe', 'carollousdc', '2023-10-25 13:49:36', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dashboard`
--
ALTER TABLE `dashboard`
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
-- AUTO_INCREMENT for table `dashboard`
--
ALTER TABLE `dashboard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
