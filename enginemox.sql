-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Des 2023 pada 06.10
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `enginemox`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `config`
--

CREATE TABLE `config` (
  `id` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `npsn` varchar(50) NOT NULL,
  `sk_pendirian` varchar(50) NOT NULL,
  `tgl_pendirian` date NOT NULL,
  `jenjang` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `kel` varchar(50) NOT NULL,
  `kec` varchar(50) NOT NULL,
  `kab` varchar(50) NOT NULL,
  `telepon` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `web` varchar(50) NOT NULL,
  `akreditasi` varchar(10) NOT NULL,
  `sk_akreditasi` varchar(50) NOT NULL,
  `kurikulum` varchar(50) NOT NULL,
  `longitude` varchar(15) NOT NULL,
  `latitude` varchar(15) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `creator` varchar(50) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `config`
--

INSERT INTO `config` (`id`, `name`, `npsn`, `sk_pendirian`, `tgl_pendirian`, `jenjang`, `alamat`, `kel`, `kec`, `kab`, `telepon`, `email`, `web`, `akreditasi`, `sk_akreditasi`, `kurikulum`, `longitude`, `latitude`, `icon`, `creator`, `create_date`, `status`) VALUES
('c2023110300001', 'Yayasan Sekolah Kristen Bina Bakti', '20230001', '', '2017-06-15', 'Sekolah', 'Jl. Kapten Rahmad Buddin, Komplek Grya Pesona Minimalis Blok BB 44', 'Terjun', 'Medan-Marelan', 'Medan', '081362262699', 'carollous.developer@gmail.com', '-', 'A', 'none', '2023', '98.6629', '3.5847', '-', 'carollousdc', '2023-11-03 11:57:33', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `dashboard`
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
-- Struktur dari tabel `functions`
--

CREATE TABLE `functions` (
  `id` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `kode` varchar(10) NOT NULL,
  `type` varchar(50) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `creator` varchar(50) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `functions`
--

INSERT INTO `functions` (`id`, `name`, `kode`, `type`, `icon`, `creator`, `create_date`, `status`) VALUES
('FC2023110100001', 'Status Pegawai', 'SP', 'option', '', 'carollousdc', '2023-11-01 16:00:26', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `functions_detail`
--

CREATE TABLE `functions_detail` (
  `id` varchar(50) NOT NULL,
  `functions` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `hash` varchar(50) NOT NULL,
  `creator` varchar(50) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `functions_detail`
--

INSERT INTO `functions_detail` (`id`, `functions`, `name`, `hash`, `creator`, `create_date`, `status`) VALUES
('FD2023110100002', 'FC2023110100001', 'Karyawan Tetap', '2458994152', 'carollousdc', '2023-11-01 21:37:09', 0),
('FD2023110100003', 'FC2023110100001', 'Honorer', '3851842942', 'carollousdc', '2023-11-01 21:37:09', 0),
('FD2023110100004', 'FC2023110100001', 'Kerja Praktek', '2079514845', 'carollousdc', '2023-11-01 21:37:09', 0),
('FD2023110100005', 'FC2023110100001', 'Tamu', '217436235', 'carollousdc', '2023-11-01 21:37:09', 0),
('FD2023110100008', 'FC2023110100001', 'Outsourcing', '1917103350', 'carollousdc', '2023-11-01 21:37:09', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru`
--

CREATE TABLE `guru` (
  `id` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sp` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  `creator` varchar(50) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `guru`
--

INSERT INTO `guru` (`id`, `name`, `sp`, `user`, `creator`, `create_date`, `status`) VALUES
('g2023110100001', 'Carollous Dachi', '3851842942', '1', 'carollousdc', '2023-11-01 22:26:10', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `tingkat` varchar(50) NOT NULL,
  `wali_kelas` varchar(50) NOT NULL,
  `creator` varchar(50) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id`, `name`, `tingkat`, `wali_kelas`, `creator`, `create_date`, `status`) VALUES
('k2023110100001', 'Grape', 't2023110100001', '', 'carollousdc', '2023-11-01 11:39:33', 0),
('k2023110100002', 'Banana', 't2023110100001', '', 'carollousdc', '2023-11-01 11:39:44', 0),
('k2023110100003', 'Manggo', 't2023110100001', '', 'carollousdc', '2023-11-01 11:40:07', 0),
('k2023110100004', 'I - A', 't2023110100002', '', 'carollousdc', '2023-11-01 11:41:14', 0),
('k2023110100005', 'I - B', 't2023110100002', '', 'carollousdc', '2023-11-01 11:46:47', 0),
('k2023110100006', 'I - C', 't2023110100002', '', 'carollousdc', '2023-11-01 11:47:06', 0),
('k2023110100007', 'I - D', 't2023110100002', '', 'carollousdc', '2023-11-01 11:47:15', 0),
('k2023110100008', 'II - A', 't2023110100002', '', 'carollousdc', '2023-11-01 11:47:37', 0),
('k2023110100009', 'II - B', 't2023110100002', '', 'carollousdc', '2023-11-01 11:47:42', 0),
('k2023110100010', 'II - C', 't2023110100002', '', 'carollousdc', '2023-11-01 11:47:48', 0),
('k2023110100011', 'II - D', 't2023110100002', '', 'carollousdc', '2023-11-01 11:47:55', 0),
('k2023110100012', 'III - A', 't2023110100002', '', 'carollousdc', '2023-11-01 11:48:20', 0),
('k2023110100013', 'III - B', 't2023110100002', '', 'carollousdc', '2023-11-01 11:48:31', 0),
('k2023110100014', 'VII - A', 't2023110100003', '', 'carollousdc', '2023-11-01 11:49:09', 0),
('k2023110100015', 'VII - B', 't2023110100003', '', 'carollousdc', '2023-11-01 11:49:22', 0),
('k2023110100016', 'VIII - A', 't2023110100003', '', 'carollousdc', '2023-11-01 11:49:32', 0),
('k2023110100017', 'VIII - B', 't2023110100003', '', 'carollousdc', '2023-11-01 11:49:47', 0),
('k2023110100018', 'IX - A', 't2023110100003', '', 'carollousdc', '2023-11-01 11:49:56', 0),
('k2023110100019', 'IX - B', 't2023110100003', '', 'carollousdc', '2023-11-01 11:50:05', 0),
('k2023110100020', 'X - A', 't2023110100003', '', 'carollousdc', '2023-11-01 11:50:15', 0),
('k2023110100021', 'X - B', 't2023110100003', '', 'carollousdc', '2023-11-01 11:50:21', 0),
('k2023110100022', 'XI - A', 't2023110100004', '', 'carollousdc', '2023-11-01 11:50:31', 0),
('k2023110100023', 'XI - B', 't2023110100004', '', 'carollousdc', '2023-11-01 11:50:39', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mata_pelajaran`
--

CREATE TABLE `mata_pelajaran` (
  `id` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `tingkat` varchar(50) NOT NULL,
  `creator` varchar(50) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mata_pelajaran`
--

INSERT INTO `mata_pelajaran` (`id`, `name`, `tingkat`, `creator`, `create_date`, `status`) VALUES
('m2023120200001', 'Matematika', 't2023110100001', 'carollousdc', '2023-12-02 14:57:47', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `navigation`
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
-- Dumping data untuk tabel `navigation`
--

INSERT INTO `navigation` (`id`, `name`, `link`, `tipe`, `root`, `icon`, `creator`, `create_date`, `status`) VALUES
('NAVI00001', 'Dashboard', 'dashboard', 0, '0', 'fas fa-tachometer-alt', 'carollousdc', '2023-10-25 13:45:10', 0),
('NAVI00002', 'User', 'user', 1, 'NAVI00013', 'fab fa-gratipay', 'carollousdc', '2023-11-01 09:57:14', 0),
('NAVI00003', 'Navigation', 'navigation', 1, 'NAVI00011', 'fa fa-bars', 'carollousdc', '2023-10-31 11:53:49', 0),
('NAVI00004', 'Role', 'role', 1, 'NAVI00013', 'fas fa-envelope', 'carollousdc', '2023-11-01 09:55:50', 0),
('NAVI00005', 'Permission', 'permission', 1, 'NAVI00013', 'fas fa-info-circle', 'carollousdc', '2023-11-01 09:56:20', 0),
('NAVI00006', 'List Functions', 'functions', 1, 'NAVI00011', 'fas fa-i-cursor', 'carollousdc', '2023-10-31 11:53:34', 0),
('NAVI00008', 'Youtube', 'youtube', 1, 'NAVI00009', 'far fa-circle', 'carollousdc', '2023-10-31 11:47:39', 0),
('NAVI00009', 'Social Media', '#', 0, '0', 'fa fa-share-alt', 'carollousdc', '2023-10-30 15:26:18', 0),
('NAVI00010', 'Facebook', 'facebook', 1, 'NAVI00009', 'far fa-circle', 'carollousdc', '2023-10-31 11:47:45', 0),
('NAVI00011', 'Settings', '#', 0, '', 'fas fa-cog', 'carollousdc', '2023-10-31 11:52:52', 0),
('NAVI00012', 'Data Master', '#', 0, '', 'fas fa-th', 'carollousdc', '2023-11-01 09:52:29', 0),
('NAVI00013', 'Data User', '#', 0, '', 'fa fa-users', 'carollousdc', '2023-11-01 09:55:22', 0),
('NAVI00014', 'Tahun Ajaran', 'tahun_ajaran', 1, 'NAVI00012', 'far fa-calendar-alt', 'carollousdc', '2023-11-01 10:05:28', 0),
('NAVI00018', 'Tingkat', 'tingkat', 1, 'NAVI00012', 'far fa-circle', 'carollousdc', '2023-11-03 12:10:06', 0),
('NAVI00015', 'Kelas', 'kelas', 1, 'NAVI00012', 'far fa-circle', 'carollousdc', '2023-11-03 12:08:40', 0),
('NAVI00016', 'Guru', 'guru', 1, 'NAVI00013', 'far fa-circle', 'carollousdc', '2023-11-03 12:08:40', 0),
('NAVI00017', 'Profil Sekolah', 'config', 1, 'NAVI00011', 'fas fa-school', 'carollousdc', '2023-11-03 12:08:40', 0),
('n2023120200001', 'Config', 'config', 1, 'NAVI00011', 'fas fa-info-circle', 'carollousdc', '2023-12-02 13:43:04', 0),
('n2023120200002', 'Mata Pelajaran', 'mata_pelajaran', 1, 'NAVI00012', '', 'carollousdc', '2023-12-02 14:17:30', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `permission`
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
-- Dumping data untuk tabel `permission`
--

INSERT INTO `permission` (`id`, `name`, `link`, `creator`, `create_date`, `status`) VALUES
('NVM00001', 'User', 'user', 'carollousdc', '2023-10-23 20:19:18', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `permission_role`
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
-- Struktur dari tabel `permission_role_detail`
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
-- Struktur dari tabel `role`
--

CREATE TABLE `role` (
  `id` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `creator` varchar(50) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `role`
--

INSERT INTO `role` (`id`, `name`, `creator`, `create_date`, `status`) VALUES
('ROL00001', 'Developer', '1', '2023-10-30 10:23:18', 0),
('ROL00002', 'Admin', 'carollousdc', '2023-10-30 12:44:35', 0),
('ROL00003', 'Teacher', '1', '2023-10-30 10:24:14', 0),
('ROL00004', 'Parent', '1', '2023-10-30 10:24:15', 0),
('ROL00005', 'Student', '1', '2023-10-30 10:24:15', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tahun_ajaran`
--

CREATE TABLE `tahun_ajaran` (
  `id` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `creator` varchar(50) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tahun_ajaran`
--

INSERT INTO `tahun_ajaran` (`id`, `name`, `creator`, `create_date`, `status`) VALUES
('THN00001', '2023', 'carollousdc', '2023-11-01 10:22:51', 0),
('THN00002', '2024', 'carollousdc', '2023-11-01 10:22:55', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tingkat`
--

CREATE TABLE `tingkat` (
  `id` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `singkatan` varchar(50) NOT NULL,
  `urutan` int(11) NOT NULL,
  `creator` varchar(50) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tingkat`
--

INSERT INTO `tingkat` (`id`, `name`, `singkatan`, `urutan`, `creator`, `create_date`, `status`) VALUES
('t2023110100001', 'Taman Kanak-Kanak', 'TK', 1, 'carollousdc', '2023-11-01 10:47:11', 0),
('t2023110100002', 'Sekolah Dasar', 'SD', 2, 'carollousdc', '2023-11-01 10:47:23', 0),
('t2023110100003', 'Sekolah Menengah Pertama', 'SMP', 3, 'carollousdc', '2023-11-01 10:47:36', 0),
('t2023110100004', 'Sekolah Menengah Atas', 'SMA', 4, 'carollousdc', '2023-11-01 10:47:53', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
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
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `name`, `role`, `hash`, `password`, `creator`, `create_date`, `status`) VALUES
(1, 'carollousdc', 'Carollous Dachi', 'ROL00001', '160696', '$2y$05$Kn2xYh1/UFxRJbsE2sgGPeLNjsBNFHjx47H9s2Xao11biWw6dofgG', 'carollousdc', '2023-10-25 13:48:54', 0),
(2, 'paulusdc', 'Paulus Dachi', 'ROL00003', '170716', '$2y$11$2fmeIqN5iBHaIjwI8q5uwON19GxyLDwEv1MesF5zPoBIGTiW1xXaG', 'carollousdc', '2023-10-25 13:49:08', 0),
(3, 'josuadc', 'Josua Christian Dachi', 'ROL00005', '221204', '$2y$11$JEzTONz58Z9317314ngDBOiKDeUwCXivpMFVUduoDQYziavoBqIDe', 'carollousdc', '2023-10-25 13:49:36', 0),
(4, 'dirgadachi', 'Dirga Putra Dachi', 'ROL00004', '', '$2y$12$5d4afGbXYUCNM97N683AZesMmvEOkQGt4bEBQO0N2kU7Ospfx307a', 'carollousdc', '2023-10-30 09:44:30', 0);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `dashboard`
--
ALTER TABLE `dashboard`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `dashboard`
--
ALTER TABLE `dashboard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
