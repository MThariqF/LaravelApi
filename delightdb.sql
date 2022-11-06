-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 06 Nov 2022 pada 09.24
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `delightdb`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `cekAkun` (IN `email` VARCHAR(60), IN `pass` VARCHAR(12))  BEGIN
SELECT * FROM akun WHERE Email_Akun = email AND Password_Akun = pass;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `hapusResep` (IN `id` INT(8))  BEGIN
DELETE FROM resep WHERE ID_Resep = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tambahAkun` (IN `id` INT(8), IN `nama` VARCHAR(64), IN `email` VARCHAR(64), IN `pass` VARCHAR(12))  BEGIN
INSERT INTO akun
VALUES (id, nama, email, NULL, NULL, pass);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tambahFavorite` (IN `id` INT(8), IN `id_resep` INT(8))  BEGIN
INSERT INTO favorit
VALUES (id, id_resep);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tambahResep` (IN `id` INT(8), IN `nama` VARCHAR(64), IN `desk` TEXT, IN `gambar` BLOB, IN `rating` FLOAT, IN `jumlah` INT(11), IN `id_penulis` INT(8))  BEGIN
INSERT INTO resep
VALUES (id, nama, desk, gambar, rating, jumlah, id_penulis);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tampilFavorite` (IN `id_akun` INT(8))  BEGIN
SELECT * FROM resep WHERE ID_Akun = id_akun;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tampilResep` ()  BEGIN
SELECT * FROM resep;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `akun`
--

CREATE TABLE `akun` (
  `ID_Akun` int(8) NOT NULL,
  `Nama_Akun` varchar(64) NOT NULL,
  `Email_Akun` varchar(64) DEFAULT NULL,
  `Tanggal_Lahir` date DEFAULT NULL,
  `Gambar_Akun` blob DEFAULT NULL,
  `Password_Akun` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `akun`
--

INSERT INTO `akun` (`ID_Akun`, `Nama_Akun`, `Email_Akun`, `Tanggal_Lahir`, `Gambar_Akun`, `Password_Akun`) VALUES
(0, 'torik', 'torikbocil@bocil.com', NULL, NULL, '123bocil'),
(1, 'Ardin', 'ardin@email.com', NULL, NULL, 'ardino12'),
(2, 'torik', 'torikbocil@bocil.com', NULL, NULL, '123bocil'),
(3, 'Torikah', 'torikah@anjay.com', NULL, NULL, '123Torikah');

-- --------------------------------------------------------

--
-- Struktur dari tabel `bahan`
--

CREATE TABLE `bahan` (
  `ID_Bahan` int(8) NOT NULL,
  `Nama_Bahan` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `bahan`
--

INSERT INTO `bahan` (`ID_Bahan`, `Nama_Bahan`) VALUES
(1, 'Garam'),
(2, 'Gula'),
(25, 'Ayam'),
(47, 'Jamur Tiram');

-- --------------------------------------------------------

--
-- Struktur dari tabel `favorit`
--

CREATE TABLE `favorit` (
  `ID_Akun` int(8) NOT NULL,
  `ID_Resep` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `ID_Kategori` int(8) NOT NULL,
  `Nama_Kategori` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`ID_Kategori`, `Nama_Kategori`) VALUES
(1, 'Makanan Ringan'),
(2, 'Makanan Berat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `komentar`
--

CREATE TABLE `komentar` (
  `ID_Akun` int(8) NOT NULL,
  `ID_Resep` int(8) NOT NULL,
  `Komentar` text DEFAULT NULL,
  `Beri_Rating` float DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `resep`
--

CREATE TABLE `resep` (
  `ID_Resep` int(8) NOT NULL,
  `Nama_Resep` varchar(64) NOT NULL,
  `Deskripsi` text NOT NULL,
  `Gambar_Resep` blob DEFAULT NULL,
  `Rating_Total` float DEFAULT 0,
  `Jumlah_Penilai` int(11) DEFAULT 0,
  `ID_Akun_Penulis` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `resep`
--

INSERT INTO `resep` (`ID_Resep`, `Nama_Resep`, `Deskripsi`, `Gambar_Resep`, `Rating_Total`, `Jumlah_Penilai`, `ID_Akun_Penulis`) VALUES
(101, 'Ayam Panggang Krispi', 'HAYUUK DICOBA', NULL, 0, 0, 1),
(102, 'Jamur Krispi', 'INI JUGA DICOBA YGY', NULL, 0, 0, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `resep_has_bahan`
--

CREATE TABLE `resep_has_bahan` (
  `ID_Resep` int(8) NOT NULL,
  `ID_Bahan` int(8) NOT NULL,
  `Jumlah` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `resep_has_bahan`
--

INSERT INTO `resep_has_bahan` (`ID_Resep`, `ID_Bahan`, `Jumlah`) VALUES
(101, 1, '2 Sendok Makan'),
(101, 25, '1 Ekor');

-- --------------------------------------------------------

--
-- Struktur dari tabel `resep_has_kategori`
--

CREATE TABLE `resep_has_kategori` (
  `ID_Resep` int(8) NOT NULL,
  `ID_Kategori` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `resep_has_kategori`
--

INSERT INTO `resep_has_kategori` (`ID_Resep`, `ID_Kategori`) VALUES
(101, 1),
(101, 2),
(102, 1),
(102, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `resep_has_tag`
--

CREATE TABLE `resep_has_tag` (
  `ID_Resep` int(8) NOT NULL,
  `ID_Tag` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tag`
--

CREATE TABLE `tag` (
  `ID_Tag` int(8) NOT NULL,
  `Nama_Tag` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`ID_Akun`);

--
-- Indeks untuk tabel `bahan`
--
ALTER TABLE `bahan`
  ADD PRIMARY KEY (`ID_Bahan`);

--
-- Indeks untuk tabel `favorit`
--
ALTER TABLE `favorit`
  ADD PRIMARY KEY (`ID_Akun`,`ID_Resep`),
  ADD KEY `ID_Akun` (`ID_Akun`),
  ADD KEY `ID_Resep` (`ID_Resep`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`ID_Kategori`);

--
-- Indeks untuk tabel `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`ID_Akun`,`ID_Resep`),
  ADD KEY `ID_Akun` (`ID_Akun`),
  ADD KEY `ID_Resep` (`ID_Resep`);

--
-- Indeks untuk tabel `resep`
--
ALTER TABLE `resep`
  ADD PRIMARY KEY (`ID_Resep`),
  ADD KEY `ID_Akun_Penulis` (`ID_Akun_Penulis`);

--
-- Indeks untuk tabel `resep_has_bahan`
--
ALTER TABLE `resep_has_bahan`
  ADD PRIMARY KEY (`ID_Resep`,`ID_Bahan`),
  ADD KEY `ID_Resep` (`ID_Resep`),
  ADD KEY `ID_Bahan` (`ID_Bahan`);

--
-- Indeks untuk tabel `resep_has_kategori`
--
ALTER TABLE `resep_has_kategori`
  ADD PRIMARY KEY (`ID_Resep`,`ID_Kategori`),
  ADD KEY `ID_Resep` (`ID_Resep`),
  ADD KEY `ID_Kategori` (`ID_Kategori`);

--
-- Indeks untuk tabel `resep_has_tag`
--
ALTER TABLE `resep_has_tag`
  ADD PRIMARY KEY (`ID_Resep`,`ID_Tag`),
  ADD KEY `ID_Resep` (`ID_Resep`),
  ADD KEY `ID_Tag` (`ID_Tag`);

--
-- Indeks untuk tabel `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`ID_Tag`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `favorit`
--
ALTER TABLE `favorit`
  ADD CONSTRAINT `favorit_ibfk_1` FOREIGN KEY (`ID_Akun`) REFERENCES `akun` (`ID_Akun`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorit_ibfk_2` FOREIGN KEY (`ID_Resep`) REFERENCES `resep` (`ID_Resep`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `komentar`
--
ALTER TABLE `komentar`
  ADD CONSTRAINT `komentar_ibfk_1` FOREIGN KEY (`ID_Akun`) REFERENCES `akun` (`ID_Akun`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `komentar_ibfk_2` FOREIGN KEY (`ID_Resep`) REFERENCES `resep` (`ID_Resep`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `resep`
--
ALTER TABLE `resep`
  ADD CONSTRAINT `resep_ibfk_1` FOREIGN KEY (`ID_Akun_Penulis`) REFERENCES `akun` (`ID_Akun`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `resep_has_bahan`
--
ALTER TABLE `resep_has_bahan`
  ADD CONSTRAINT `resep_has_bahan_ibfk_2` FOREIGN KEY (`ID_Bahan`) REFERENCES `bahan` (`ID_Bahan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `resep_has_bahan_ibfk_3` FOREIGN KEY (`ID_Resep`) REFERENCES `resep` (`ID_Resep`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `resep_has_kategori`
--
ALTER TABLE `resep_has_kategori`
  ADD CONSTRAINT `resep_has_kategori_ibfk_1` FOREIGN KEY (`ID_Resep`) REFERENCES `resep` (`ID_Resep`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `resep_has_kategori_ibfk_2` FOREIGN KEY (`ID_Kategori`) REFERENCES `kategori` (`ID_Kategori`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `resep_has_tag`
--
ALTER TABLE `resep_has_tag`
  ADD CONSTRAINT `resep_has_tag_ibfk_1` FOREIGN KEY (`ID_Tag`) REFERENCES `tag` (`ID_Tag`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `resep_has_tag_ibfk_2` FOREIGN KEY (`ID_Resep`) REFERENCES `resep` (`ID_Resep`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
