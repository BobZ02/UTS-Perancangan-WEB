-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 18 Okt 2023 pada 20.28
-- Versi server: 8.0.33-0ubuntu0.22.04.4
-- Versi PHP: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES latin1 */;

--
-- Database: `bobzpersonal_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `biodata`
--

CREATE TABLE `biodata` (
  `id` int NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `short_desc` varchar(255) NOT NULL,
  `deskripsi` text,
  `alamat` varchar(255) DEFAULT NULL,
  `keyakinan` varchar(255) DEFAULT NULL,
  `tempat_lahir` varchar(255) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_Ci;

--
-- Dumping data untuk tabel `biodata`
--

INSERT INTO `biodata` (`id`, `nama`, `nickname`, `short_desc`, `deskripsi`,`keyakinan`, `alamat`, `tempat_lahir`, `tanggal_lahir`) VALUES
(1, 'Prananda Romi Alim', 'Bobz', '\"Saya mahasiswa aktif di Universitas Pembangunan Jaya, jurusan Sistem Informasi. Fleksibel dalam kerja individu atau kelompok, tertarik dengan hal baru, dan sangat terstruktur serta cepat beradaptasi\"', '\"Saya adalah seorang mahasiswa aktif di Universitas Pembangunan Jaya dengan jurusan Sistem Informasi yang mampu berkerja secara individu ataupun kelompok serta memilki ketertarikan dengan suatu hal-hal baru dan cepat beradaptasi terhadap lingkungan baru. Saya juga memiliki ketelitian yang tinggi sehingga sangat terstruktur ketika mengerjakan sesuatu\"', 'Islam', 'Jl. Rosella II, Villa Mutiara Serpong Blok F1 No.30\r\n', 'Sidoarjo', '2001-11-02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `blog`
--

CREATE TABLE `blog` (
  `id` int NOT NULL,
  `judul` varchar(255) NOT NULL,
  `isi` text,
  `tanggal_publikasi` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_Ci;

--
-- Dumping data untuk tabel `blog`
--

INSERT INTO `blog` (`id`, `judul`, `isi`, `tanggal_publikasi`) VALUES
(1, 'Riwayat Hidup Ku', 'Hallo everybody, Perkenalkan namaku Prananda Romi Alim,tinggal di Villa Mutiara Serpong, pondok jagung.\r\nAsal sekolah SMK Pustek Serpong saya mengambil jurusan Tehknik Komputer Jaringan, umur saya 18 tahun dan saya kuliah di upj mengambil Sistem Informasi.\r\n\r\nTerima kasih.', '2019-08-31'),
(2, 'Karya Kita', 'Setiap orang pasti pernah melakukan sesuatu dan pastinya akan berguna bagi seseorang. Seseorang yang menghasilkan karya biasa akan dipamerkan di suatu tempat dan barang tersebut biasanya akan menjadi terkenal dan akan dijual jika banyak yang berminat, Orang yang berkarya sudah pasti menciptakan hal yang baru.\r\nBanyak anak indonesia yang membuat karya berupa mobil dan robot yang dapat menarik perhatian banyak orang dan sampai viral di media sosial. Selain itu bukan hanya berupa benda saja, tetapi ada pula yang berinovatif membuat makanan yang unik dan menarik konsumen untuk mencoba makanan tersebut.\r\nMelalui fashion juga sangat berinovatif, karena anak muda milenial sekarang sangat mengutamakan fashion yang yang unik dan menonjol agar lebih modis dan kekinian, mulai dari baju yang terbuat dari berbagai macam bahan, tetapi semuanya pasti beresiko dan keputusan ada di tangan kita akan melanjutinya atau tidak.\r\nJangan pernah meremehkan setiap hasil karya orang lain, apalagi hasilkarya bangsa sendiri. karna sesuatu yang di buat oleh dibuat anak bangsa kita harus bangga belum tentu kita bisa membuat hal yang sama seperti itu. Kita harus mengubah diri kita yang suka bermalas malasan karna sifat yang bermalas malasan akan merugikan bagi kita dan orang lain biasa dainggap dengan sampah masyarakat dan membuat orang pengangguran makin bertambah banyak.\r\nDi tahun ke depan bangsa Indonesia pasti akan terus berkembang dan menyiptakan sesuatu yang baru dan akan membuat kagum seluruh warga Negara Indonesia. Makin banyak yang berlomba lomba untuk membuat teknologi teknologi canggih.\r\nDengan adanya kemauan dan niat yang tinggi, berinovatif sangat lah mudah, untuk menumbuhkan imajinasi yang tinggi dan menghasilkan, apapun yang di awali dengan niat yang tinggi pastilah berhasil dan membangun anak – anak bangsa untuk lebih kreatif, dan membuka lapangan pekerjaan bagi orang yang tidak memiliki pekerjaan.', '2019-12-09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `media_sosial`
--

CREATE TABLE `media_sosial` (
  `id` int NOT NULL,
  `platform` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_Ci;

--
-- Dumping data untuk tabel `media_sosial`
--

INSERT INTO `media_sosial` (`id`, `platform`, `username`) VALUES
(1, 'Instagram', '@pranandalim'),
(2, 'Telegram', '@pranandalim'),
(3, 'WhatsApp', '089656174411');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengalaman`
--

CREATE TABLE `pengalaman` (
  `id` int NOT NULL,
  `nama_pt` varchar(255) DEFAULT NULL,
  `posisi` varchar(255) DEFAULT NULL,
  `deskripsi_pekerjaan` text CHARACTER SET latin1 COLLATE latin1_swedish_Ci NOT NULL,
  `tahun_mulai` int DEFAULT NULL,
  `tahun_selesai` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_Ci;

--
-- Dumping data untuk tabel `pengalaman`
--

INSERT INTO `pengalaman` (`id`, `nama_pt`, `posisi`, `deskripsi_pekerjaan`, `tahun_mulai`, `tahun_selesai`) VALUES
(1, 'PUPR', 'Teknisi Jaringan', '• Implementasi jaringan komputer menggunakan router mikrotik pada gedung PUPR. \r\n• Membuat jaringan komputer pada gedung PUPR. \r\n• Melakukan monitoring jaringan wifi dan lan yang ada pada gedung PUPR Mengatasi masalah jaringan yang di hadapi oleh pengguna dalam gedung PUPR', 2022, NULL),
(2, 'Universitas Pembangunan Jaya', 'ICT', '• Menganalisa Form menggunakan power Bl\r\n• Pengujian Testing dan memasukan data pada Form, Automate dan Sharepoint', 2021, NULL),
(3, 'Universitas Pembangunan Jaya', 'ICT', '• Teknisi pengecekan LAN dan Wifi\r\n• Teknisi instalasi PC dan instalisasi LAN', 2020, NULL),
(4, 'KIA YI LI SHA', 'Mekanik Bengkel', '• Sevice kendaraan mobil\r\n• Mengganti oli\r\n• Pengecekan kaki kaki kendaraan, pengereman, air radiator, freon ac', 2019, NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `biodata`
--
ALTER TABLE `biodata`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `media_sosial`
--
ALTER TABLE `media_sosial`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pengalaman`
--
ALTER TABLE `pengalaman`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `biodata`
--
ALTER TABLE `biodata`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `media_sosial`
--
ALTER TABLE `media_sosial`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pengalaman`
--
ALTER TABLE `pengalaman`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
