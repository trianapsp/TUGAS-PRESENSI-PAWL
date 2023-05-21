-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2023 at 01:09 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `presensi`
--

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `kode_dosen` int(50) DEFAULT NULL,
  `kode_mk` int(50) NOT NULL,
  `nama_mk` varchar(50) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `no_telepon` int(50) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`kode_dosen`, `kode_mk`, `nama_mk`, `nama`, `username`, `password`, `no_telepon`, `foto`) VALUES
(209017502, 214, 'Arsitektur & Sistem Enterprise', 'Ibnu Elmi, S.Kom., M.Cs.', 'ibnu01', '089061', 562828289, ''),
(208018503, 215, 'Arsitektur Komputer & Sistem Operasi', 'Nining Arwana, S.Si., M.Si.', 'nining02', '089062', 628263892, ''),
(207016504, 216, 'Pemrograman Basis Data', 'Anas Ma\'mun, S.T., M.Cs.', 'anas03', '089063', 729837634, ''),
(206015501, 217, 'Pengantar Statistika & Ilmu Data', 'Supriyanto Wijaya Kusuma, S.Kom., M.Kom.', 'supriyanto04', '089064', 688623324, ''),
(205014499, 218, 'Pengembangan Aplikasi Web Lanjut', 'Agung Pranowo, S.Kom., M.Kom.', 'agung05', '089065', 654321234, ''),
(204013488, 219, 'Rekayasa Perangkat Lunak', 'Desy Ratnasari, S.T., M.Cs.', 'desy06', '089066', 897865433, '');

-- --------------------------------------------------------

--
-- Table structure for table `isi_presensi`
--

CREATE TABLE `isi_presensi` (
  `nomer` int(50) NOT NULL,
  `nim` int(50) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `prodi` varchar(50) NOT NULL,
  `semester` varchar(50) NOT NULL,
  `nama_mk` varchar(50) NOT NULL,
  `jadwal` varchar(50) NOT NULL,
  `tgl` varchar(50) NOT NULL,
  `jam` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `isi_presensi`
--

INSERT INTO `isi_presensi` (`nomer`, `nim`, `nama`, `prodi`, `semester`, `nama_mk`, `jadwal`, `tgl`, `jam`, `status`) VALUES
(7, 212103001, 'Afriani', 'Sistem Informasi', '4', 'Arsitektur & Sistem Enterprise', '', '2023-03-01', '15:48', 'Alfa'),
(8, 212103001, 'Afriani', 'Sistem Informasi', '4', 'Rekayasa Perangkat Lunak', '', '2023-04-01', '22:29', 'Hadir'),
(9, 212103004, 'Baskara Putra', 'Sistem Informasi', '4', 'Pengembangan Aplikasi Web Lanjut', '', '2023-04-01', '22:31', 'Izin'),
(10, 212103004, 'Baskara Putra', 'Sistem Informasi', '4', 'Arsitektur & Sistem Enterprise', '', '2023-04-01', '22:32', 'Hadir'),
(11, 212103004, 'Baskara Putra', 'Sistem Informasi', '4', 'Arsitektur & Sistem Enterprise', '', '2023-04-18', '22:33', 'Sakit'),
(12, 212103001, 'Afriani', 'Sistem Informasi', '4', 'Arsitektur & Sistem Enterprise', '', '2023-04-03', '21:19', 'Izin'),
(13, 212103001, 'Afriani', 'Sistem Informasi', '4', 'Pengembangan Aplikasi Web Lanjut', '', '2023-04-03', '21:24', 'Sakit'),
(14, 212103001, 'Afriani', 'Sistem Informasi', '4', 'Arsitektur & Sistem Enterprise', '', '2023-04-07', '01:35', 'Hadir'),
(15, 212103001, 'Afriani', 'Sistem Informasi', '4', 'Pengembangan Aplikasi Web Lanjut', '', '2023-04-09', '20:05', 'Hadir'),
(16, 212103001, 'Afriani', 'Sistem Informasi', '4', 'Rekayasa Perangkat Lunak', '', '2023-04-09', '20:08', 'Sakit'),
(17, 212103001, 'Afriani', 'Sistem Informasi', '4', 'Pengantar Statistika & Ilmu Data', '', '2023-04-09', '20:09', 'Izin'),
(18, 212103001, 'Afriani', 'Sistem Informasi', '4', 'Arsitektur Komputer & Sistem Operasi', '', '2023-04-09', '20:09', 'Alpa'),
(19, 212103004, 'Baskara Putra', 'Sistem Informasi', '4', 'Arsitektur Komputer & Sistem Operasi', '', '2023-04-10', '15:25', 'Hadir'),
(20, 212103004, 'Baskara Putra', 'Sistem Informasi', '4', 'Arsitektur Komputer & Sistem Operasi', '', '2023-04-10', '15:36', 'Hadir'),
(21, 212103001, 'Afriani', 'Sistem Informasi', '4', 'Rekayasa Perangkat Lunak', '', '2023-04-11', '12:50', 'Hadir'),
(22, 212103004, 'Baskara Putra', 'Sistem Informasi', '4', 'Arsitektur & Sistem Enterprise', '', '2023-04-28', '22:24', 'Hadir'),
(23, 212103004, 'Baskara Putra', 'Sistem Informasi', '4', 'Pemrograman Basis Data', '', '2023-04-28', '22:27', 'Hadir'),
(24, 212103004, 'Baskara Putra', 'Sistem Informasi', '4', 'Pemrograman Basis Data', 'Minggu 1', '2023-04-28', '22:27', 'Hadir'),
(25, 212103004, 'Baskara Putra', 'Sistem Informasi', '4', 'Rekayasa Perangkat Lunak', 'Minggu 1', '2023-04-28', '22:29', 'Hadir'),
(26, 212103001, 'Afriani', 'Sistem Informasi', '4', 'Pemrograman Basis Data', 'Minggu 1', '2023-05-09', '23:53', 'Hadir'),
(27, 212103001, 'Afriani', 'Sistem Informasi', '4', 'Pemrograman Basis Data', 'Minggu 2', '2023-05-09', '23:55', 'Hadir'),
(28, 212103001, 'Afriani', 'Sistem Informasi', '4', 'Pemrograman Basis Data', 'Minggu 1', '2023-05-10', '00:02', 'Hadir'),
(29, 212103001, 'Afriani', 'Sistem Informasi', '4', 'Pemrograman Basis Data', 'Minggu 2', '2023-05-10', '00:03', 'Sakit');

-- --------------------------------------------------------

--
-- Table structure for table `jmlh_presensi`
--

CREATE TABLE `jmlh_presensi` (
  `nim` int(50) NOT NULL,
  `jmlh_sakit` int(50) NOT NULL,
  `jmlh_izin` int(50) NOT NULL,
  `jmlh_hadir` int(50) NOT NULL,
  `jmlh_alfa` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jmlh_presensi`
--

INSERT INTO `jmlh_presensi` (`nim`, `jmlh_sakit`, `jmlh_izin`, `jmlh_hadir`, `jmlh_alfa`) VALUES
(212103001, 1, 0, 3, 0),
(212103002, 0, 0, 0, 0),
(212103003, 0, 0, 0, 0),
(212103004, 0, 0, 2, 0),
(212103005, 0, 0, 0, 0),
(212103006, 0, 0, 0, 0),
(212103007, 0, 0, 0, 0),
(212103008, 0, 0, 0, 0),
(212103009, 0, 0, 0, 0),
(212103010, 0, 0, 0, 0),
(212103011, 0, 0, 0, 0),
(212103012, 0, 0, 0, 0),
(212103013, 0, 0, 0, 0),
(212103014, 0, 0, 0, 0),
(212103015, 0, 0, 0, 0),
(212103016, 0, 0, 0, 0),
(212103017, 0, 0, 0, 0),
(212103018, 0, 0, 0, 0),
(212103019, 0, 0, 0, 0),
(212103020, 0, 0, 0, 0),
(212103021, 0, 0, 0, 0),
(212103022, 0, 0, 0, 0),
(212103023, 0, 0, 0, 0),
(212103024, 0, 0, 0, 0),
(212103025, 0, 0, 0, 0),
(212103026, 0, 0, 0, 0),
(212103027, 0, 0, 0, 0),
(212103028, 0, 0, 0, 0),
(212103029, 0, 0, 0, 0),
(212103030, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` int(50) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `Prodi` varchar(50) NOT NULL,
  `Semester` varchar(50) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `username`, `password`, `Prodi`, `Semester`, `foto`) VALUES
(212103001, 'Afriani', 'afriani08', '089621', 'Sistem Informasi', '4', ''),
(212103002, 'Agisni Amalia Lugina', 'agisni02', '089622', 'Sistem Informasi', '4', ''),
(212103003, 'Ai rida Marliana', 'airida03', '089623', 'Sistem Informasi', '4', ''),
(212103004, 'Baskara Putra', 'baskara04', '089624', 'Sistem Informasi', '4', ''),
(212103005, 'Bella Banzira', 'bella05', '089625', 'Sistem Informasi', '4', ''),
(212103006, 'Boby Prasetio', 'boby06', '089626', 'Sistem Informasi', '4', ''),
(212103007, 'Cindy Putri', 'cindy07', '089627', 'Sistem Informasi', '4', ''),
(212103008, 'Cinta Putri Adinda', 'cinta08', '089628', 'Sistem Informasi', '4', ''),
(212103009, 'Cut Alizah', 'cut09', '089629', 'Sistem Informasi', '4', ''),
(212103010, 'Dandi Pratama', 'dandi10', '089630', 'Sistem Informasi', '4', ''),
(212103011, 'Dinda Adelia', 'dinda11', '089631', 'Sistem Informasi', '4', ''),
(212103012, 'Doni Saputra', 'doni12', '089632', 'Sistem Informasi', '4', ''),
(212103013, 'Ferdi Sambo', 'ferdi13', '089633', 'Sistem Informasi', '4', ''),
(212103014, 'Fina Dwi Lestari', 'fina14', '089634', 'Sistem Informasi', '4', ''),
(212103015, 'Fiony Putri Larasati', 'fiony15', '089635', 'Sistem Informasi', '4', ''),
(212103016, 'Galih Gunawan', 'galih16', '089636', 'Sistem Informasi', '4', ''),
(212103017, 'Gina Regina', 'gina17', '089637', 'Sistem Informasi', '4', ''),
(212103018, 'Gigi Hadid', 'gigi18', '089638', 'Sistem Informasi', '4', ''),
(212103019, 'Hana Hanun', 'hana19', '089639', 'Sistem Informasi', '4', ''),
(212103020, 'Heru Heriyanto', 'heru20', '089640', 'Sistem Informasi', '4', ''),
(212103021, 'Holand Sihombing', 'holand21', '089641', 'Sistem Informasi', '4', ''),
(212103022, 'Indah Permatasari', 'indah22', '089642', 'Sistem Informasi', '4', ''),
(212103023, 'Intan Randitha', 'intan23', '089643', 'Sistem Informasi', '4', ''),
(212103024, 'Ipin Mubarok', 'ipin24', '089644', 'Sistem Informasi', '4', ''),
(212103025, 'Joni Joko', 'joni25', '089645', 'Sistem Informasi', '4', ''),
(212103026, 'Kiki Saputri', 'kiki26', '089646', 'Sistem Informasi', '4', ''),
(212103027, 'Komang Wahyuni', 'komang27', '089647', 'Sistem Informasi', '4', ''),
(212103028, 'Lula Lahfah', 'lula28', '089648', 'Sistem Informasi', '4', ''),
(212103029, 'Mutia Fadillah', 'mutia29', '089649', 'Sistem Informasi', '4', ''),
(212103030, 'Nurul Azzahri', 'nurul30', '089650', 'Sistem Informasi', '4', '');

-- --------------------------------------------------------

--
-- Table structure for table `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `kode_mk` int(50) NOT NULL,
  `nama_mk` varchar(255) NOT NULL,
  `jumlah_sks` int(50) NOT NULL,
  `kode_dosen` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`kode_mk`, `nama_mk`, `jumlah_sks`, `kode_dosen`) VALUES
(214, 'Arsitektur & Sistem Enterprise', 4, 209017502),
(215, 'Arsitektur Komputer & Sistem Operasi', 2, 208018503),
(216, 'Pemrograman Basis Data', 3, 207016504),
(217, 'Pengantar Statistika & Ilmu Data', 4, 206015501),
(218, 'Pengembangan Aplikasi Web Lanjut', 4, 205014499),
(219, 'Rekayasa Perangkat Lunak', 4, 204013488);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`kode_mk`);

--
-- Indexes for table `isi_presensi`
--
ALTER TABLE `isi_presensi`
  ADD PRIMARY KEY (`nomer`);

--
-- Indexes for table `jmlh_presensi`
--
ALTER TABLE `jmlh_presensi`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`kode_mk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `isi_presensi`
--
ALTER TABLE `isi_presensi`
  MODIFY `nomer` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
