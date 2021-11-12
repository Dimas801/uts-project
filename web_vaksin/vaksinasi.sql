-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Okt 2021 pada 09.40
-- Versi server: 10.4.20-MariaDB
-- Versi PHP: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vaksinasi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kabupaten_kota`
--

CREATE TABLE `kabupaten_kota` (
  `id_kab_kota` int(10) UNSIGNED NOT NULL,
  `id_provinsi` int(10) UNSIGNED NOT NULL,
  `nama_kab_kota` varchar(200) DEFAULT NULL,
  `jml_total_penduduk` double DEFAULT NULL,
  `jml_lansia` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `kabupaten_kota`
--

INSERT INTO `kabupaten_kota` (`id_kab_kota`, `id_provinsi`, `nama_kab_kota`, `jml_total_penduduk`, `jml_lansia`) VALUES
(1, 15, 'Sleman', 200, 40),
(2, 14, 'Semarang', 250, 50),
(3, 12, 'Jakarta Selatan', 400, 100),
(4, 16, 'Blitas', 200, 50),
(5, 12, 'Jakarta Utara', 500, 200);

-- --------------------------------------------------------

--
-- Struktur dari tabel `provinsi`
--

CREATE TABLE `provinsi` (
  `id_provinsi` int(10) UNSIGNED NOT NULL,
  `nama_provinsi` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `provinsi`
--

INSERT INTO `provinsi` (`id_provinsi`, `nama_provinsi`) VALUES
(1, 'Nanggroe Aceh Darussalam'),
(2, 'Sumatera Utara'),
(3, 'Sumatera Barat'),
(4, 'Riau'),
(5, 'Jambi'),
(6, 'Sumatera Selatan'),
(7, 'Bengkulu'),
(8, 'Lampung'),
(9, 'Kep. Bangka Belitung'),
(10, 'Kepulauan Riau'),
(11, 'Banten'),
(12, 'Dki Jakarta'),
(13, 'Jawa Barat'),
(14, 'Jawa Tengah'),
(15, 'D.I. Yogyakarta'),
(16, 'Jawa Timur'),
(17, 'Banten'),
(18, 'Bali'),
(19, 'Nusa Tenggara Barat'),
(20, 'Nusa Tenggara Timur'),
(21, 'Kalimantan Barat'),
(22, 'Kalimantan Tengah'),
(23, 'Kalimantan Selatan'),
(24, 'Kalimantan Timur'),
(25, 'Gorontalo'),
(26, 'Sulawesi Utara'),
(27, 'Sulawesi Tengah'),
(28, 'Sulawesi Selatan'),
(29, 'Sulawesi Tenggara'),
(30, 'Gorontalo'),
(31, 'Sulawesi Barat'),
(32, 'Maluku'),
(33, 'Maluku Utara'),
(34, 'Maluku Utara'),
(35, 'Papua Barat'),
(36, 'Irian Jaya'),
(37, 'Papua'),
(38, 'Papua Barat'),
(39, 'Papua'),
(40, 'Luar Negeri'),
(41, 'Lainnya');

-- --------------------------------------------------------

--
-- Struktur dari tabel `vaksinasi`
--

CREATE TABLE `vaksinasi` (
  `id_vaksinasi` int(10) UNSIGNED NOT NULL,
  `id_kab_kota` int(10) UNSIGNED NOT NULL,
  `jml_total_vaksinasi` double DEFAULT NULL,
  `jml_lansia_vaksinasi` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `vaksinasi`
--

INSERT INTO `vaksinasi` (`id_vaksinasi`, `id_kab_kota`, `jml_total_vaksinasi`, `jml_lansia_vaksinasi`) VALUES
(2, 2, 50, 10),
(3, 3, 220, 200),
(5, 1, 120, 25),
(7, 5, 200, 50);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kabupaten_kota`
--
ALTER TABLE `kabupaten_kota`
  ADD PRIMARY KEY (`id_kab_kota`),
  ADD KEY `id_provinsi` (`id_provinsi`);

--
-- Indeks untuk tabel `provinsi`
--
ALTER TABLE `provinsi`
  ADD PRIMARY KEY (`id_provinsi`);

--
-- Indeks untuk tabel `vaksinasi`
--
ALTER TABLE `vaksinasi`
  ADD PRIMARY KEY (`id_vaksinasi`),
  ADD KEY `id_kab_kota` (`id_kab_kota`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kabupaten_kota`
--
ALTER TABLE `kabupaten_kota`
  MODIFY `id_kab_kota` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `provinsi`
--
ALTER TABLE `provinsi`
  MODIFY `id_provinsi` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT untuk tabel `vaksinasi`
--
ALTER TABLE `vaksinasi`
  MODIFY `id_vaksinasi` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `kabupaten_kota`
--
ALTER TABLE `kabupaten_kota`
  ADD CONSTRAINT `kabupaten_kota_ibfk_1` FOREIGN KEY (`id_provinsi`) REFERENCES `provinsi` (`id_provinsi`);

--
-- Ketidakleluasaan untuk tabel `vaksinasi`
--
ALTER TABLE `vaksinasi`
  ADD CONSTRAINT `vaksinasi_ibfk_1` FOREIGN KEY (`id_kab_kota`) REFERENCES `kabupaten_kota` (`id_kab_kota`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
