-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 17 Mei 2017 pada 16.00
-- Versi Server: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tubesvisual`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `berita`
--

CREATE TABLE IF NOT EXISTS `berita` (
  `kd_berita` varchar(8) NOT NULL DEFAULT '',
  `judul` text,
  `isi` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen_staff`
--

CREATE TABLE IF NOT EXISTS `dosen_staff` (
  `kd_dosen` varchar(8) NOT NULL DEFAULT '',
  `nip` int(11) DEFAULT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `alamat` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal`
--

CREATE TABLE IF NOT EXISTS `jadwal` (
  `kd_dosen` varchar(8) DEFAULT NULL,
  `kd_mk` varchar(8) DEFAULT NULL,
  `id_status` varchar(8) DEFAULT NULL,
  `hari` date DEFAULT NULL,
  `jam` time DEFAULT NULL,
  `Kelas` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kehadiran`
--

CREATE TABLE IF NOT EXISTS `kehadiran` (
  `id_status` int(11) NOT NULL,
  `status` varchar(10) NOT NULL,
  `kd_dosen` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mata_kuliah`
--

CREATE TABLE IF NOT EXISTS `mata_kuliah` (
  `kd_mk` varchar(8) NOT NULL DEFAULT '',
  `nama_mk` varchar(30) DEFAULT NULL,
  `kd_dosen` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mengajar`
--

CREATE TABLE IF NOT EXISTS `mengajar` (
  `kd_mk` varchar(8) DEFAULT NULL,
  `kd_dosen` varchar(8) DEFAULT NULL,
  `kelas` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `berita`
--
ALTER TABLE `berita`
 ADD PRIMARY KEY (`kd_berita`);

--
-- Indexes for table `dosen_staff`
--
ALTER TABLE `dosen_staff`
 ADD PRIMARY KEY (`kd_dosen`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
 ADD KEY `doja` (`kd_dosen`), ADD KEY `maja` (`kd_mk`);

--
-- Indexes for table `kehadiran`
--
ALTER TABLE `kehadiran`
 ADD PRIMARY KEY (`id_status`);

--
-- Indexes for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
 ADD PRIMARY KEY (`kd_mk`), ADD KEY `kd` (`kd_dosen`);

--
-- Indexes for table `mengajar`
--
ALTER TABLE `mengajar`
 ADD KEY `dojar` (`kd_dosen`), ADD KEY `majar` (`kd_mk`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
ADD CONSTRAINT `doja` FOREIGN KEY (`kd_dosen`) REFERENCES `dosen_staff` (`kd_dosen`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `maja` FOREIGN KEY (`kd_mk`) REFERENCES `mata_kuliah` (`kd_mk`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
ADD CONSTRAINT `kd` FOREIGN KEY (`kd_dosen`) REFERENCES `dosen_staff` (`kd_dosen`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `mengajar`
--
ALTER TABLE `mengajar`
ADD CONSTRAINT `dojar` FOREIGN KEY (`kd_dosen`) REFERENCES `dosen_staff` (`kd_dosen`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `majar` FOREIGN KEY (`kd_mk`) REFERENCES `mata_kuliah` (`kd_mk`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
