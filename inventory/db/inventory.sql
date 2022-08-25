-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2022 at 04:27 AM
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
-- Database: `inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `kd_barang` char(5) NOT NULL,
  `nm_barang` varchar(100) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  `merek` varchar(100) NOT NULL,
  `tipe` varchar(100) NOT NULL,
  `jumlah` int(6) NOT NULL,
  `satuan` varchar(10) NOT NULL,
  `kd_kategori` char(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kd_barang`, `nm_barang`, `keterangan`, `merek`, `tipe`, `jumlah`, `satuan`, `kd_kategori`) VALUES
('B0002', 'TOSHIBA Satellite C40-A106 - Black', 'Notebook / Laptop 13 inch - 14 inch Intel Core i3-2348M, 2GB DDR3, 500GB HDD, DVD±RW, WiFi, Bluetooth, VGA Intel HD Graphics, Camera, 14', 'TOSHIBA', '', 3, 'Unit', 'K002'),
('B0003', 'Printer Canon LBP 5100 Laser Jet', 'Canon LBP 5100 Laser Jet', 'Canon', '', 2, 'Unit', 'K003'),
('B0006', 'UPS Prolink Pro 700', 'Prolink Pro 700', 'Prolink', '', 2, 'Unit', 'K004'),
('B0016', 'pensil', 'Pensil 2B', 'stabilo', 'pensil tulis', 20, 'Buah', 'K007'),
('B0013', 'Laptop ASUS ROG', 'contoh', 'ASUS ROG', 'Baru', 3, 'Unit', 'K002'),
('B0014', 'PC Gamming', 'contoh', 'ASUS ROG', 'Baru', 1, 'Unit', 'K001'),
('B0015', 'HP ASUS ROG', 's', 'Asus', 'Baru', 10, 'Unit', 'K001');

-- --------------------------------------------------------

--
-- Table structure for table `barang_inventaris`
--

CREATE TABLE `barang_inventaris` (
  `kd_inventaris` char(12) NOT NULL,
  `kd_barang` char(5) NOT NULL,
  `no_pengadaan` char(7) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `tahun_datang` varchar(4) NOT NULL,
  `tahun_digunakan` varchar(4) NOT NULL,
  `nomor_seri` varchar(30) NOT NULL,
  `masa_habis_kalibrasi` varchar(10) NOT NULL,
  `no_sertifikat_kalibrasi` varchar(30) NOT NULL,
  `pembuat_sertifikat` varchar(100) NOT NULL,
  `asal_barang` varchar(100) NOT NULL,
  `harga_barang` int(12) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `status_barang` enum('Tersedia','Ditempatkan','Dipinjam') NOT NULL DEFAULT 'Tersedia',
  `pegawai_yang_menggunakan` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang_inventaris`
--

INSERT INTO `barang_inventaris` (`kd_inventaris`, `kd_barang`, `no_pengadaan`, `tgl_masuk`, `tahun_datang`, `tahun_digunakan`, `nomor_seri`, `masa_habis_kalibrasi`, `no_sertifikat_kalibrasi`, `pembuat_sertifikat`, `asal_barang`, `harga_barang`, `keterangan`, `status_barang`, `pegawai_yang_menggunakan`) VALUES
('B0016.000095', 'B0016', 'BB00016', '2022-07-11', '2022', '', '', '', '', '', '', 5000, 'pembelian pensil untuk dipakai di bidang renbang', 'Tersedia', ''),
('B0002.000003', 'B0002', 'BB00002', '2015-08-06', '', '', '', '', '', '', '', 0, '', 'Ditempatkan', ''),
('B0002.000004', 'B0002', 'BB00002', '2015-08-06', '2016', '2016', '343434343', '2020', '34343432323', 'POM RI', 'Semarang', 5000000, 'Barang jaminan spesial', 'Ditempatkan', ''),
('B0002.000005', 'B0002', 'BB00002', '2015-08-06', '', '', '', '', '', '', '', 0, '', 'Tersedia', ''),
('B0003.000006', 'B0003', 'BB00003', '2015-08-06', '', '', '', '', '', '', '', 0, '', 'Tersedia', ''),
('B0003.000007', 'B0003', 'BB00003', '2015-08-06', '', '', '', '', '', '', '', 0, '', 'Tersedia', ''),
('B0016.000087', 'B0016', 'BB00014', '2022-07-08', '2022', '', '', '', '', '', '', 1000, 'pembelian pensil untuk dipakai di bidang renbang', 'Tersedia', ''),
('B0016.000086', 'B0016', 'BB00014', '2022-07-08', '2022', '', '', '', '', '', '', 1000, 'pembelian pensil untuk dipakai di bidang renbang', 'Tersedia', ''),
('B0016.000083', 'B0016', 'BB00014', '2022-07-08', '2022', '', '', '', '', '', '', 1000, 'pembelian pensil untuk dipakai di bidang renbang', 'Tersedia', ''),
('B0016.000082', 'B0016', 'BB00014', '2022-07-08', '2022', '', '', '', '', '', '', 1000, 'pembelian pensil untuk dipakai di bidang renbang', 'Tersedia', ''),
('B0006.000018', 'B0006', 'BB00004', '2015-08-06', '', '', '', '', '', '', '', 0, '', 'Tersedia', ''),
('B0006.000019', 'B0006', 'BB00004', '2015-08-06', '', '', '', '', '', '', '', 0, '', 'Tersedia', ''),
('B0016.000085', 'B0016', 'BB00014', '2022-07-08', '2022', '', '', '', '', '', '', 1000, 'pembelian pensil untuk dipakai di bidang renbang', 'Tersedia', ''),
('B0016.000084', 'B0016', 'BB00014', '2022-07-08', '2022', '', '', '', '', '', '', 1000, 'pembelian pensil untuk dipakai di bidang renbang', 'Tersedia', ''),
('B0016.000090', 'B0016', 'BB00015', '2022-07-11', '2022', '', '', '', '', '', '', 1000, 'pembelian pensil untuk dipakai di bidang renbang', 'Tersedia', ''),
('B0016.000089', 'B0016', 'BB00015', '2022-07-11', '2022', '', '', '', '', '', '', 1000, 'pembelian pensil untuk dipakai di bidang renbang', 'Tersedia', ''),
('B0016.000088', 'B0016', 'BB00014', '2022-07-08', '2022', '', '', '', '', '', '', 1000, 'pembelian pensil untuk dipakai di bidang renbang', 'Tersedia', ''),
('B0016.000094', 'B0016', 'BB00016', '2022-07-11', '2022', '', '', '', '', '', '', 5000, 'pembelian pensil untuk dipakai di bidang renbang', 'Tersedia', ''),
('B0016.000081', 'B0016', 'BB00014', '2022-07-08', '2022', '', '', '', '', '', '', 1000, 'pembelian pensil untuk dipakai di bidang renbang', 'Tersedia', ''),
('B0016.000092', 'B0016', 'BB00015', '2022-07-11', '2022', '', '', '', '', '', '', 1000, 'pembelian pensil untuk dipakai di bidang renbang', 'Tersedia', ''),
('B0016.000091', 'B0016', 'BB00015', '2022-07-11', '2022', '', '', '', '', '', '', 1000, 'pembelian pensil untuk dipakai di bidang renbang', 'Tersedia', ''),
('B0016.000093', 'B0016', 'BB00015', '2022-07-11', '2022', '', '', '', '', '', '', 1000, 'pembelian pensil untuk dipakai di bidang renbang', 'Tersedia', ''),
('B0016.000080', 'B0016', 'BB00014', '2022-07-08', '2022', '', '', '', '', '', '', 1000, 'pembelian pensil untuk dipakai di bidang renbang', 'Tersedia', ''),
('B0016.000079', 'B0016', 'BB00014', '2022-07-08', '2022', '', '', '', '', '', '', 1000, 'pembelian pensil untuk dipakai di bidang renbang', 'Ditempatkan', 'P0001'),
('B0013.000065', 'B0013', 'BB00010', '2022-06-14', '2022', '', '', '', '', '', '', 5000000, 'contoh', 'Tersedia', ''),
('B0013.000066', 'B0013', 'BB00010', '2022-06-14', '2022', '', '', '', '', '', '', 5000000, 'contoh', 'Tersedia', ''),
('B0013.000067', 'B0013', 'BB00010', '2022-06-14', '2022', '', '', '', '', '', '', 5000000, 'contoh', 'Ditempatkan', 'P0004'),
('B0014.000068', 'B0014', 'BB00011', '2022-06-14', '2022', '', '', '', '', '', '', 5000000, 'contoh', 'Ditempatkan', 'P0002'),
('B0015.000069', 'B0015', 'BB00012', '2022-06-21', '2022', '', '', '', '', '', '', 5000000, 'contoh', 'Tersedia', ''),
('B0015.000070', 'B0015', 'BB00012', '2022-06-21', '2022', '', '', '', '', '', '', 5000000, 'contoh', 'Tersedia', ''),
('B0015.000071', 'B0015', 'BB00012', '2022-06-21', '2022', '', '', '', '', '', '', 5000000, 'contoh', 'Tersedia', ''),
('B0015.000072', 'B0015', 'BB00012', '2022-06-21', '2022', '', '', '', '', '', '', 5000000, 'contoh', 'Tersedia', ''),
('B0015.000073', 'B0015', 'BB00012', '2022-06-21', '2022', '', '', '', '', '', '', 5000000, 'contoh', 'Ditempatkan', 'P0002'),
('B0015.000074', 'B0015', 'BB00013', '2022-06-21', '2022', '', '', '', '', '', '', 5000000, 'contoh', 'Tersedia', ''),
('B0015.000075', 'B0015', 'BB00013', '2022-06-21', '2022', '', '', '', '', '', '', 5000000, 'contoh', 'Tersedia', ''),
('B0015.000076', 'B0015', 'BB00013', '2022-06-21', '2022', '', '', '', '', '', '', 5000000, 'contoh', 'Tersedia', ''),
('B0015.000077', 'B0015', 'BB00013', '2022-06-21', '2022', '', '', '', '', '', '', 5000000, 'contoh', 'Tersedia', ''),
('B0015.000078', 'B0015', 'BB00013', '2022-06-21', '2022', '', '', '', '', '', '', 5000000, 'contoh', 'Tersedia', ''),
('B0016.000096', 'B0016', 'BB00016', '2022-07-11', '2022', '', '', '', '', '', '', 5000, 'pembelian pensil untuk dipakai di bidang renbang', 'Tersedia', ''),
('B0016.000097', 'B0016', 'BB00016', '2022-07-11', '2022', '', '', '', '', '', '', 5000, 'pembelian pensil untuk dipakai di bidang renbang', 'Tersedia', ''),
('B0016.000098', 'B0016', 'BB00016', '2022-07-11', '2022', '', '', '', '', '', '', 5000, 'pembelian pensil untuk dipakai di bidang renbang', 'Ditempatkan', 'P0001');

-- --------------------------------------------------------

--
-- Table structure for table `departemen`
--

CREATE TABLE `departemen` (
  `kd_departemen` char(4) NOT NULL,
  `nm_departemen` varchar(100) NOT NULL,
  `keterangan` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departemen`
--

INSERT INTO `departemen` (`kd_departemen`, `nm_departemen`, `keterangan`) VALUES
('D001', 'Bidang Renbang', 'Bidang Rencana dan Pengembangan'),
('D002', 'Bidang Pajak', 'Bidang Pajak');

-- --------------------------------------------------------

--
-- Table structure for table `hak_akses`
--

CREATE TABLE `hak_akses` (
  `id` int(4) NOT NULL,
  `kd_petugas` char(4) NOT NULL,
  `mu_data_petugas` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mu_data_supplier` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mu_data_pegawai` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mu_data_departemen` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mu_data_kategori` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mu_data_lokasi` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mu_data_barang` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mu_data_inventaris` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mu_pencarian` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mu_barcode` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mu_trans_pengadaan` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mu_trans_penempatan` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mu_trans_mutasi` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mu_trans_peminjaman` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mu_trans_pemeliharaan` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mu_laporan_cetak` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mu_backup_restore` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mu_export_import` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mu_export_barang` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mu_export_pegawai` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mu_import_barang` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mu_import_pegawai` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mlap_petugas` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mlap_supplier` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mlap_pegawai` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mlap_departemen` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mlap_kategori` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mlap_lokasi` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mlap_barang_kategori` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mlap_barang_lokasi` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mlap_inventaris_barang_1` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mlap_inventaris_barang_2` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mlap_pengadaan_periode` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mlap_pengadaan_bulan` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mlap_pengadaan_supplier` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mlap_pengadaan_barang_periode` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mlap_pengadaan_barang_bulan` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mlap_pengadaan_barang_kategori` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mlap_pengadaan_departemen` enum('Yes','No','','') NOT NULL,
  `mlap_pengadaan_barang_supplier` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mlap_penempatan_periode` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mlap_penempatan_bulan` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mlap_penempatan_lokasi` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mlap_mutasi_periode` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mlap_mutasi_bulan` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mlap_mutasi_lokasi` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mlap_peminjaman_periode` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mlap_peminjaman_bulan` enum('No','Yes') NOT NULL DEFAULT 'No',
  `mlap_peminjaman_pegawai` enum('No','Yes') NOT NULL DEFAULT 'No'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hak_akses`
--

INSERT INTO `hak_akses` (`id`, `kd_petugas`, `mu_data_petugas`, `mu_data_supplier`, `mu_data_pegawai`, `mu_data_departemen`, `mu_data_kategori`, `mu_data_lokasi`, `mu_data_barang`, `mu_data_inventaris`, `mu_pencarian`, `mu_barcode`, `mu_trans_pengadaan`, `mu_trans_penempatan`, `mu_trans_mutasi`, `mu_trans_peminjaman`, `mu_trans_pemeliharaan`, `mu_laporan_cetak`, `mu_backup_restore`, `mu_export_import`, `mu_export_barang`, `mu_export_pegawai`, `mu_import_barang`, `mu_import_pegawai`, `mlap_petugas`, `mlap_supplier`, `mlap_pegawai`, `mlap_departemen`, `mlap_kategori`, `mlap_lokasi`, `mlap_barang_kategori`, `mlap_barang_lokasi`, `mlap_inventaris_barang_1`, `mlap_inventaris_barang_2`, `mlap_pengadaan_periode`, `mlap_pengadaan_bulan`, `mlap_pengadaan_supplier`, `mlap_pengadaan_barang_periode`, `mlap_pengadaan_barang_bulan`, `mlap_pengadaan_barang_kategori`, `mlap_pengadaan_departemen`, `mlap_pengadaan_barang_supplier`, `mlap_penempatan_periode`, `mlap_penempatan_bulan`, `mlap_penempatan_lokasi`, `mlap_mutasi_periode`, `mlap_mutasi_bulan`, `mlap_mutasi_lokasi`, `mlap_peminjaman_periode`, `mlap_peminjaman_bulan`, `mlap_peminjaman_pegawai`) VALUES
(1, 'P001', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes'),
(2, 'P002', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'No', 'No', 'No', 'No', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'No', 'No', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `kd_kategori` char(4) NOT NULL,
  `nm_kategori` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`kd_kategori`, `nm_kategori`) VALUES
('K001', 'Komputer'),
('K002', 'Laptop'),
('K003', 'Printer'),
('K004', 'UPS Power Suply'),
('K005', 'Meja Komputer'),
('K006', 'Monitor'),
('K007', 'ATK');

-- --------------------------------------------------------

--
-- Table structure for table `lokasi`
--

CREATE TABLE `lokasi` (
  `kd_lokasi` char(5) NOT NULL,
  `nm_lokasi` varchar(100) NOT NULL,
  `kd_departemen` char(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lokasi`
--

INSERT INTO `lokasi` (`kd_lokasi`, `nm_lokasi`, `kd_departemen`) VALUES
('L0001', 'Ruang Server', 'D001'),
('L0002', 'Ruangan Kabid Renbang', 'D001'),
('L0003', 'Ruangan Kabid Renbang', 'D002');

-- --------------------------------------------------------

--
-- Table structure for table `mutasi`
--

CREATE TABLE `mutasi` (
  `no_mutasi` char(7) NOT NULL,
  `tgl_mutasi` date NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `kd_petugas` char(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mutasi`
--

INSERT INTO `mutasi` (`no_mutasi`, `tgl_mutasi`, `keterangan`, `kd_petugas`) VALUES
('MB00001', '2017-01-26', 'Salah tempat', 'P001'),
('MB00002', '2017-01-26', 'Salah tempat', 'P001');

-- --------------------------------------------------------

--
-- Table structure for table `mutasi_asal`
--

CREATE TABLE `mutasi_asal` (
  `id` int(4) NOT NULL,
  `no_mutasi` char(7) NOT NULL,
  `no_penempatan` char(7) NOT NULL,
  `kd_inventaris` char(12) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mutasi_asal`
--

INSERT INTO `mutasi_asal` (`id`, `no_mutasi`, `no_penempatan`, `kd_inventaris`) VALUES
(4, 'MB00002', 'PB00005', 'B0002.000004'),
(3, 'MB00001', 'PB00003', 'B0004.000009');

-- --------------------------------------------------------

--
-- Table structure for table `mutasi_tujuan`
--

CREATE TABLE `mutasi_tujuan` (
  `no_mutasi` char(7) NOT NULL,
  `no_penempatan` char(7) NOT NULL,
  `keterangan` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mutasi_tujuan`
--

INSERT INTO `mutasi_tujuan` (`no_mutasi`, `no_penempatan`, `keterangan`) VALUES
('MB00001', 'PB00004', 'Untuk membuat laporan'),
('MB00002', 'PB00006', 'Untuk dipakai pada Prodi MI');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `kd_pegawai` char(5) NOT NULL,
  `nm_pegawai` varchar(100) NOT NULL,
  `jns_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `kelamin` enum('L','P') NOT NULL DEFAULT 'L',
  `alamat` varchar(200) NOT NULL,
  `no_telepon` varchar(20) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `Berita_acara` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`kd_pegawai`, `nm_pegawai`, `jns_kelamin`, `kelamin`, `alamat`, `no_telepon`, `foto`, `Berita_acara`) VALUES
('P0001', 'Christian Katuuk (Kominfo)', '', 'L', 'Jl.manado bitung', '081911818188', 'P0001.bunafit 2.png', ''),
('P0002', 'Cristafael Kandouw', 'Laki-laki', 'L', 'Jl.manado tomohon', '021511881818', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `pemeliharaan`
--

CREATE TABLE `pemeliharaan` (
  `no_pemeliharaan` varchar(7) NOT NULL,
  `tgl_pemeliharaan` date NOT NULL,
  `kd_inventaris` char(12) NOT NULL,
  `biaya` int(12) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `kd_petugas` char(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pemeliharaan`
--

INSERT INTO `pemeliharaan` (`no_pemeliharaan`, `tgl_pemeliharaan`, `kd_inventaris`, `biaya`, `keterangan`, `kd_petugas`) VALUES
('PB00001', '2017-02-04', 'B0002.000004', 200000, 'Memperbaiki Keyboard yang error, dan instal Sistem Operasi\r\ndi Toko Mega Buana', 'P001'),
('PB00002', '2017-02-05', 'B0001.000001', 100000, 'Penginstalan ulang', 'P001');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `no_peminjaman` char(7) NOT NULL,
  `tgl_peminjaman` date NOT NULL,
  `tgl_akan_kembali` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `kd_pegawai` char(5) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `status_kembali` enum('Pinjam','Kembali') NOT NULL DEFAULT 'Pinjam',
  `kd_petugas` char(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman_item`
--

CREATE TABLE `peminjaman_item` (
  `no_peminjaman` char(7) NOT NULL,
  `kd_inventaris` char(12) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `penempatan`
--

CREATE TABLE `penempatan` (
  `no_penempatan` char(7) NOT NULL,
  `tgl_penempatan` date NOT NULL,
  `kd_lokasi` char(5) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `jenis` enum('Baru','Mutasi') NOT NULL DEFAULT 'Baru',
  `kd_petugas` char(4) NOT NULL,
  `pegawai` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penempatan`
--

INSERT INTO `penempatan` (`no_penempatan`, `tgl_penempatan`, `kd_lokasi`, `keterangan`, `jenis`, `kd_petugas`, `pegawai`) VALUES
('PB00003', '2017-01-26', 'L0003', 'Printer', 'Baru', 'P001', ''),
('PB00004', '2017-01-26', 'L0004', 'Untuk membuat laporan', 'Mutasi', 'P001', ''),
('PB00005', '2017-01-26', 'L0003', 'Penempatan laptop dan printer', 'Baru', 'P001', ''),
('PB00006', '2017-01-26', 'L0005', 'Untuk dipakai pada Prodi MI', 'Mutasi', 'P001', ''),
('PB00001', '2017-01-26', 'L0001', 'Penempatan Laptop', 'Baru', 'P001', ''),
('PB00002', '2017-01-26', 'L0002', 'Komputer satu set', 'Baru', 'P001', ''),
('PB00007', '2022-06-14', 'L0001', 'contoh', 'Baru', 'P001', 'P0001'),
('PB00008', '2022-06-14', 'L0003', 'contoh', 'Baru', 'P001', 'P0004'),
('PB00009', '2022-06-14', 'L0003', 'contoh', 'Baru', 'P001', 'P0002'),
('PB00010', '2022-06-21', 'L0001', 'contoh', 'Baru', 'P001', 'P0002'),
('PB00011', '2022-07-11', 'L0001', 'pembelian pensil untuk dipakai di bidang renbang', 'Baru', 'P001', 'P0001'),
('PB00012', '2022-07-11', 'L0002', 'Penempatan di departmen Bidang Renbang', 'Baru', 'P001', 'P0001');

-- --------------------------------------------------------

--
-- Table structure for table `penempatan_item`
--

CREATE TABLE `penempatan_item` (
  `no_penempatan` char(7) NOT NULL,
  `kd_inventaris` char(12) NOT NULL,
  `status_aktif` enum('Yes','No') NOT NULL DEFAULT 'Yes'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penempatan_item`
--

INSERT INTO `penempatan_item` (`no_penempatan`, `kd_inventaris`, `status_aktif`) VALUES
('PB00001', 'B0002.000003', 'Yes'),
('PB00001', 'B0001.000001', 'Yes'),
('PB00002', 'B0009.000034', 'Yes'),
('PB00002', 'B0004.000008', 'Yes'),
('PB00002', 'B0008.000027', 'Yes'),
('PB00002', 'B0007.000020', 'Yes'),
('PB00003', 'B0004.000009', 'No'),
('PB00004', 'B0004.000009', 'Yes'),
('PB00005', 'B0004.000010', 'Yes'),
('PB00005', 'B0002.000004', 'No'),
('PB00006', 'B0002.000004', 'Yes'),
('PB00007', 'B0012.000064', 'Yes'),
('PB00008', 'B0013.000067', 'Yes'),
('PB00009', 'B0014.000068', 'Yes'),
('PB00010', 'B0015.000073', 'Yes'),
('PB00011', 'B0016.000079', 'Yes'),
('PB00012', 'B0016.000098', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `pengadaan`
--

CREATE TABLE `pengadaan` (
  `no_pengadaan` char(7) NOT NULL,
  `tgl_pengadaan` date NOT NULL,
  `kd_supplier` char(4) NOT NULL,
  `kd_departemen` varchar(30) NOT NULL,
  `jenis_pengadaan` varchar(100) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  `kd_petugas` char(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengadaan`
--

INSERT INTO `pengadaan` (`no_pengadaan`, `tgl_pengadaan`, `kd_supplier`, `kd_departemen`, `jenis_pengadaan`, `keterangan`, `kd_petugas`) VALUES
('BB00001', '2015-06-04', 'S001', '', 'Pembelian', 'Pembelian dari Khas Kantor', 'P001'),
('BB00002', '2015-07-07', 'S002', '', 'Pembelian', 'Pengadaan dari uang Kas', 'P001'),
('BB00003', '2015-07-22', 'S002', '', 'Sumbangan', 'Sumbangan Uang dari Pemda', 'P001'),
('BB00004', '2015-08-06', 'S002', '', 'Pembelian', 'Pembelian dari Kas Kantor', 'P001'),
('BB00005', '2015-08-06', 'S004', '', 'Pembelian', 'Pembelian dari Kas Kantor', 'P001'),
('BB00006', '2015-08-06', 'S001', '', 'Pembelian', 'Pembelian dari Kas Kantor', 'P001'),
('BB00007', '2016-07-28', 'S001', '', 'Pembelian', 'pembelian', 'P001'),
('BB00008', '2016-07-28', 'S001', '', 'Pembelian', 'pembelian', 'P001'),
('BB00009', '2022-06-14', 'S002', '', 'Pembelian', 'contoh', 'P001'),
('BB00010', '2022-06-14', 'S001', '', 'Pembelian', 'contoh', 'P001'),
('BB00011', '2022-06-14', 'S002', '', 'Pembelian', 'contoh', 'P001'),
('BB00012', '2022-06-21', 'S001', '', 'Pembelian', 'contoh', 'P001'),
('BB00013', '2022-06-21', 'S001', 'D002', 'Pembelian', 'contoh', 'P001'),
('BB00014', '2022-07-08', 'S005', 'D001', 'Pembelian', 'pembelian pensil untuk dipakai di bidang renbang', 'P001'),
('BB00015', '2022-07-11', 'S003', 'D001', 'Pembelian', 'pembelian pensil untuk dipakai di bidang renbang', 'P001'),
('BB00016', '2022-07-11', 'S003', 'D001', 'Pembelian', 'pembelian pensil untuk dipakai di bidang renbang', 'P001');

-- --------------------------------------------------------

--
-- Table structure for table `pengadaan_item`
--

CREATE TABLE `pengadaan_item` (
  `no_pengadaan` char(7) NOT NULL,
  `kd_barang` char(5) NOT NULL,
  `deskripsi` varchar(100) NOT NULL,
  `harga_beli` int(12) NOT NULL,
  `jumlah` int(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengadaan_item`
--

INSERT INTO `pengadaan_item` (`no_pengadaan`, `kd_barang`, `deskripsi`, `harga_beli`, `jumlah`) VALUES
('BB00001', 'B0010', 'Komputer Rakitan Core 2 Duwo CPU Komplit', 3200000, 2),
('BB00001', 'B0009', 'Komputer Rakitan Dual Core CPU Komplit', 3000000, 4),
('BB00002', 'B0001', 'Toshiba Satellite C800D-1003 Black', 7300000, 2),
('BB00002', 'B0002', 'Toshiba Satelite C40-A106 Black baru', 5800000, 3),
('BB00003', 'B0004', 'Printer Canon IP 2770', 470000, 6),
('BB00003', 'B0005', 'Printer Brother Colour Laser HL-2150N Mono', 1200000, 4),
('BB00003', 'B0003', 'Printer Canon LBP 5100 Laser Jet', 1350000, 2),
('BB00004', 'B0006', 'UPS Prolink Pro 700', 450000, 2),
('BB00004', 'B0007', 'UPS Prolink IPS 500i Inverter 500VA', 680000, 7),
('BB00005', 'B0008', 'Meja Komputer Crystal Grace 101', 270000, 7),
('BB00006', 'B0011', 'LCD LG 19 Inch', 1250000, 7),
('BB00007', 'B0009', 'Beli komputer lagi', 3500000, 5),
('BB00008', 'B0010', 'Pembelian lagi', 2500000, 3),
('BB00010', 'B0013', 'barang baru', 5000000, 3),
('BB00009', 'B0012', 'barang baru', 1000000, 9),
('BB00011', 'B0014', 'barang baru', 5000000, 1),
('BB00012', 'B0015', 'barang baru', 5000000, 5),
('BB00013', 'B0015', 'barang baru', 5000000, 5),
('BB00014', 'B0016', 'pensil 2B', 1000, 10),
('BB00015', 'B0016', 'pensil 2B', 1000, 5),
('BB00016', 'B0016', 'pensil 2B', 5000, 5);

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian`
--

CREATE TABLE `pengembalian` (
  `no_pengembalian` char(7) NOT NULL,
  `tgl_pengembalian` date NOT NULL,
  `no_peminjaman` char(7) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `kd_petugas` char(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `kd_petugas` char(4) NOT NULL,
  `nm_petugas` varchar(100) NOT NULL,
  `kelamin` enum('L','P') NOT NULL DEFAULT 'L',
  `alamat` varchar(100) NOT NULL,
  `no_telepon` varchar(20) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(200) NOT NULL,
  `level` varchar(20) NOT NULL DEFAULT 'Kasir'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`kd_petugas`, `nm_petugas`, `kelamin`, `alamat`, `no_telepon`, `foto`, `username`, `password`, `level`) VALUES
('P001', 'Michael Tumewu', 'L', 'Jl.manado bitung', '081911111111111', 'P001.bunafit 2.png', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Admin'),
('P002', 'Efraim Kaur', 'L', 'Desa Tombulu', '081911111111', '', 'efraim', '21232f297a57a5a743894a0e4a801fc3', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `resume_inventaris`
--

CREATE TABLE `resume_inventaris` (
  `id` int(11) NOT NULL,
  `kd_inventaris` char(12) NOT NULL,
  `hasil_resume` varchar(100) NOT NULL,
  `kondisi_barang` varchar(100) NOT NULL,
  `kd_petugas` char(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `resume_inventaris`
--

INSERT INTO `resume_inventaris` (`id`, `kd_inventaris`, `hasil_resume`, `kondisi_barang`, `kd_petugas`) VALUES
(1, 'B0002.000004', 'Harus cepat diperbaiki', 'Buruk', 'P001'),
(2, 'B0002.000004', 'Harus cepat cepat diperbaiki', 'Buruk sekali', 'P001');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `kd_supplier` char(4) NOT NULL,
  `nm_supplier` varchar(100) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `no_telepon` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`kd_supplier`, `nm_supplier`, `alamat`, `no_telepon`) VALUES
('S001', 'ELS Computer', 'Jl.manado bitung', '02741111111'),
('S002', 'Central Game Manado', 'Kawasan Mega Mas Manado no.27', '08191010101'),
('S003', 'Golden ', 'Jl.Boulevard Manado', '081912121212');

-- --------------------------------------------------------

--
-- Table structure for table `tmp_mutasi`
--

CREATE TABLE `tmp_mutasi` (
  `id` int(4) NOT NULL,
  `no_penempatan` char(7) NOT NULL,
  `kd_inventaris` char(12) NOT NULL,
  `kd_petugas` char(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_peminjaman`
--

CREATE TABLE `tmp_peminjaman` (
  `id` int(4) NOT NULL,
  `kd_petugas` char(4) NOT NULL,
  `kd_inventaris` char(12) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_penempatan`
--

CREATE TABLE `tmp_penempatan` (
  `id` int(4) NOT NULL,
  `kd_petugas` char(4) NOT NULL,
  `kd_inventaris` char(12) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_pengadaan`
--

CREATE TABLE `tmp_pengadaan` (
  `id` int(4) NOT NULL,
  `kd_petugas` char(4) NOT NULL,
  `kd_barang` char(5) NOT NULL,
  `deskripsi` varchar(100) NOT NULL,
  `harga_beli` int(12) NOT NULL,
  `jumlah` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tmp_pengadaan`
--

INSERT INTO `tmp_pengadaan` (`id`, `kd_petugas`, `kd_barang`, `deskripsi`, `harga_beli`, `jumlah`) VALUES
(14, 'P001', 'B0015', 'pensil 2B', 13000000, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kd_barang`),
  ADD UNIQUE KEY `kd_buku` (`kd_barang`);

--
-- Indexes for table `barang_inventaris`
--
ALTER TABLE `barang_inventaris`
  ADD PRIMARY KEY (`kd_inventaris`);

--
-- Indexes for table `departemen`
--
ALTER TABLE `departemen`
  ADD PRIMARY KEY (`kd_departemen`);

--
-- Indexes for table `hak_akses`
--
ALTER TABLE `hak_akses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kd_kategori`);

--
-- Indexes for table `lokasi`
--
ALTER TABLE `lokasi`
  ADD PRIMARY KEY (`kd_lokasi`);

--
-- Indexes for table `mutasi`
--
ALTER TABLE `mutasi`
  ADD PRIMARY KEY (`no_mutasi`);

--
-- Indexes for table `mutasi_asal`
--
ALTER TABLE `mutasi_asal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`kd_pegawai`);

--
-- Indexes for table `pemeliharaan`
--
ALTER TABLE `pemeliharaan`
  ADD PRIMARY KEY (`no_pemeliharaan`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`no_peminjaman`);

--
-- Indexes for table `penempatan`
--
ALTER TABLE `penempatan`
  ADD PRIMARY KEY (`no_penempatan`);

--
-- Indexes for table `pengadaan`
--
ALTER TABLE `pengadaan`
  ADD PRIMARY KEY (`no_pengadaan`);

--
-- Indexes for table `pengadaan_item`
--
ALTER TABLE `pengadaan_item`
  ADD KEY `nomor_penjualan_tamu` (`no_pengadaan`,`kd_barang`);

--
-- Indexes for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`no_pengembalian`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`kd_petugas`);

--
-- Indexes for table `resume_inventaris`
--
ALTER TABLE `resume_inventaris`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`kd_supplier`);

--
-- Indexes for table `tmp_mutasi`
--
ALTER TABLE `tmp_mutasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_peminjaman`
--
ALTER TABLE `tmp_peminjaman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_penempatan`
--
ALTER TABLE `tmp_penempatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_pengadaan`
--
ALTER TABLE `tmp_pengadaan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hak_akses`
--
ALTER TABLE `hak_akses`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `mutasi_asal`
--
ALTER TABLE `mutasi_asal`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `resume_inventaris`
--
ALTER TABLE `resume_inventaris`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tmp_mutasi`
--
ALTER TABLE `tmp_mutasi`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_peminjaman`
--
ALTER TABLE `tmp_peminjaman`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tmp_penempatan`
--
ALTER TABLE `tmp_penempatan`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tmp_pengadaan`
--
ALTER TABLE `tmp_pengadaan`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
