-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Bulan Mei 2023 pada 17.35
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webnikis`
--
CREATE DATABASE IF NOT EXISTS `webnikis` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `webnikis`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admins`
--

INSERT DELAYED IGNORE INTO `admins` (`id`, `name`, `password`) VALUES
(0, 'admin', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2'),
(0, 'gita', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `message`
--

INSERT DELAYED IGNORE INTO `message` (`id`, `user_id`, `name`, `email`, `number`, `message`) VALUES
(1, 37, 'x x', 'gitasaraswati48@gmail.com', '3', 'sx');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `email` varchar(100) NOT NULL,
  `method` varchar(50) NOT NULL,
  `checkin` date NOT NULL,
  `checkout` date NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` varchar(50) NOT NULL,
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `details` varchar(10000) NOT NULL,
  `details_mini` varchar(300) NOT NULL,
  `location` varchar(100) NOT NULL,
  `image_01` varchar(100) NOT NULL,
  `image_02` varchar(100) NOT NULL,
  `image_03` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT DELAYED IGNORE INTO `products` (`id`, `name`, `details`, `details_mini`, `location`, `image_01`, `image_02`, `image_03`) VALUES
(10, 'Bukit Merese', 'Bukit Merese atau warga setempat menyebutnya Merisik yang artinya bukit gundul. Disebut gundul karena tidak ditemui pepohonan di atasnya, hanya satu buah pohon di ujung barat bukit yang oleh para pengunjung sering disebut Pohon Galau. \r\nDari Bukit Merese anda juga bisa melihat dua moment spesial yaitu saat matahari terbit dan terbenam. Di jalan setapak saat mulai menaiki bukit anda akan melihat papan penunjuk arah yang akan mengarahkan anda jika ingin melihat sunset atau sunrise.', 'Sejauh mata memandang, rerumputan itu akan membuat penglihatan Anda terasa segar. Luar biasanya, di musim kering Bukit Merese tetap menyimpan keindahan.', 'Jl. Kuta Lombok, Kuta, Kec. Pujut, Kabupaten Lombok Tengah, Nusa Tenggara Barat', 'bukit merese.jpg', 'd5620e190608.jpg', 'Lokasi Bukit Merese Tanjung Aan Lombok Tengah.jpg'),
(11, 'Air Terjun Benang Kelambu', 'Air terjun yang berada di wilayah Lombok Tengah yang cukup terkenal itu, salah satunya bernama air terjun Benang Kelambu. Air terjun ini bersumber dari alur kawasan hutan kaki Gunung Rinjani yang mengalir ke bagian selatan dan tumpah tepat di bagian utara wilayah Kabuptaen Lombok Tengah. Air terjun yang tumpah dari sela rerimbun semak terlihat seperti tirai atau benang kelambu. Tak heran jika air terjun ini dinamakan Benang Kelambu. Airnya yang tumpah terasa lembut dan tipis-tipis. ', 'Air yang terus mengalir ke dalam kolam membuat air meluber keluar dari bibir kolam dan jatuh lagi menuju bebatuan di bawahnya dan terlihat seperti air.', 'Desa, Aik Berik, Kec. Batukliang Utara, Kabupaten Lombok Tengah, Nusa Tenggara Barat', 'benang-kelambu-exploring_lombok.jpg', 'air-terjun-benang-kelambu-lombok-3.jpg', 'download.jpg'),
(12, 'Gunung Rinjani', 'Gunung Rinjani adalah gunung berapi yang terletak di Pulau Lombok, Nusa Tenggara Barat, Indonesia. Dengan ketinggian mencapai 3.726 meter di atas permukaan laut, Gunung Rinjani merupakan gunung tertinggi kedua di Indonesia di luar Papua. Gunung ini juga menjadi bagian dari Taman Nasional Gunung Rinjani yang luasnya mencapai 41.330 hektar.\r\n\r\nGunung Rinjani memiliki daya tarik yang kuat bagi para pendaki dan pecinta alam. Pemandangan alamnya yang memukau meliputi danau kaldera Segara Anak, Gunung', 'Gunung Rinjani adalah sebuah gunung berapi aktif di Indonesia dan merupakan titik tertinggi di pulau Lombok, provinsi Nusa Tenggara Barat.', 'Sembalun Lawang, Kec. Sembalun, Kabupaten Lombok Timur, Nusa Tenggara Bar.', 'pendakian-di-gunung-rinjani-tetap-dibuka-penutupan-hanya-di-yila.webp', 'photo0jpg.jpg', 'Rinjani-742x440.jpg'),
(13, 'Pantai Kuta Mandalika', 'Pantai Senggigi adalah salah satu destinasi pantai populer di pulau Lombok, Indonesia. Terletak di sebelah barat daya pulau Lombok, pantai ini menawarkan pemandangan yang menakjubkan dengan pasir putih yang lembut, air laut biru yang jernih, dan pemandangan matahari terbenam yang spektakuler.\r\n\r\nPantai Senggigi memiliki panjang sekitar 10 kilometer dan terdiri dari beberapa pantai kecil yang saling terhubung. Daerah sekitar pantai ini juga dikelilingi oleh bukit-bukit hijau yang memberikan latar belakang yang indah.\r\n\r\nPantai Senggigi menawarkan berbagai aktivitas dan fasilitas bagi para pengunjung. Anda dapat menikmati berjemur di pasir putih yang lembut, berenang atau snorkeling di air laut yang tenang, atau bahkan mencoba olahraga air seperti selancar atau menyewa perahu untuk menjelajahi pulau-pulau kecil di sekitar pantai.\r\n\r\nSelain itu, Pantai Senggigi juga memiliki berbagai tempat penginapan, restoran, bar, dan toko suvenir yang menawarkan berbagai pilihan makanan, minuman, dan barang-barang unik.\r\n\r\nPantai Senggigi juga merupakan titik awal yang bagus untuk menjelajahi keindahan lainnya di pulau Lombok, termasuk Gunung Rinjani, Air Terjun Sendang Gile, atau mengunjungi pulau-pulau Gili yang terkenal di sekitarnya.\r\n\r\nSecara keseluruhan, Pantai Senggigi adalah tempat yang menarik untuk menikmati keindahan alam pantai yang memesona, aktivitas rekreasi, dan suasana yang santai di pulau Lombok.\r\n', 'Kuta Adalah Salah Satu Desa Di Kecamatan Pujut, Kabupaten Lombok Tengah. Penduduk Kuta Mengamalkan Upacara Adat Bernama &#34;Ngapung&#34;.', 'Kecamatan Pujut, Kabupaten Lombok Tengah, Nusa Tenggara Barat', 'guide-kuta-lombok-indonesia.jpg', 'Kawasan-Wisata-Mandalika-Lombok.jpg', 'info-pantai-kuta-lombok.jpg'),
(14, 'Pantai Senggigi', 'Pantai Senggigi adalah salah satu destinasi pantai populer di pulau Lombok, Indonesia. Terletak di sebelah barat daya pulau Lombok, pantai ini menawarkan pemandangan yang menakjubkan dengan pasir putih yang lembut, air laut biru yang jernih, dan pemandangan matahari terbenam yang spektakuler.\r\n\r\nPantai Senggigi memiliki panjang sekitar 10 kilometer dan terdiri dari beberapa pantai kecil yang saling terhubung. Daerah sekitar pantai ini juga dikelilingi oleh bukit-bukit hijau yang memberikan latar', 'Pantai Senggigi adalah salah satu destinasi pantai populer di pulau Lombok, Indonesia. Terletak di sebelah barat daya pulau Lombok, pantai ini menawarkan pemandangan yang menakjubkan.', 'Kec. Batu Layar, Kabupaten Lombok Barat, Nusa Tenggara Bar. 83355', 'Paket-Wisata-ke-Pantai-Senggigi-Lombok-dari-Jakarta.jpg', '10080n000000e0g2u3C7D.jpg', 'Pantai-Senggigi.jpg'),
(15, 'Pantai Selong Belanak', 'Pantai Selong Belanak adalah salah satu pantai yang indah dan terkenal di pulau Lombok, Indonesia. Terletak di sebelah selatan pulau, pantai ini menawarkan panorama yang menakjubkan dengan pasir putih yang lembut, Pantai Selong Belanak adalah salah satu pantai yang indah dan terkenal di pulau Lombok, Indonesia. Terletak di sebelah selatan pulau, pantai ini menawarkan panorama yang menakjubkan dengan pasir putih yang lembut, air laut yang biru jernih, dan ombak yang tenang.\r\n\r\nPantai Selong Belanak memiliki bentuk setengah lingkaran yang luas dan panjangnya sekitar 1,5 kilometer. Keindahan pantai ini terletak pada kombinasi antara hamparan pasir putih yang lebar dan landai serta perbukitan hijau yang mengelilinginya.\r\n\r\nPantai ini adalah tempat yang sempurna untuk berjemur di bawah sinar matahari, bermain-main di pasir putih yang halus, atau berenang di air laut yang sejuk dan tenang. Ombak yang tidak terlalu kuat di pantai ini juga menjadikannya tempat yang cocok untuk belajar selancar bagi pemula.\r\n\r\nSelain itu, Pantai Selong Belanak juga memiliki fasilitas yang cukup baik, seperti warung-warung makanan dan minuman, tempat penyewaan peralatan selancar, dan tempat penyewaan kursi pantai. Anda juga dapat menikmati hidangan lezat hasil laut di restoran-restoran lokal di sekitar pantai.\r\n\r\nPantai Selong Belanak menawarkan pemandangan yang memukau, suasana yang tenang, dan keindahan alam yang menenangkan. Apakah Anda ingin bersantai, bermain air, atau hanya menikmati keindahan pantai, Pantai Selong Belanak adalah tempat yang ideal untuk dikunjungi di pulau Lombok.', 'Pantai Selong Belanak adalah salah satu pantai yang indah dan terkenal di pulau Lombok, Indonesia. Terletak di sebelah selatan pulau, pantai ini menawarkan panorama yang menakjubkan dengan pasir putih yang lembut, air laut yang biru jernih, dan ombak yang tenang.', 'Selong Belanak, Kec. Praya Bar., Kabupaten Lombok Tengah, Nusa Tenggara Bar. 83572', 'Pantai-Selong-Belanak.jpg', '14416576129_f7d57e4956_b.jpg', '654226159.jpg'),
(16, 'Air Terjun Benang Stokel', 'Air Terjun Benang Stokel adalah salah satu destinasi alam yang menarik di pulau Lombok, Indonesia. Terletak di daerah Aik Berik, Kecamatan Central Lombok, air terjun ini menawarkan pemandangan yang spektakuler dan keindahan alam yang memukau.\r\n\r\nAir Terjun Benang Stokel memiliki dua tingkat air terjun yang terpisah namun saling terhubung. Air terjun pertama memiliki tinggi sekitar 15 meter, sedangkan air terjun kedua memiliki tinggi sekitar 20 meter. Kedua air terjun ini mengalir melalui tebing-', 'Air Terjun Benang Stokel adalah salah satu destinasi alam yang menarik di pulau Lombok, Indonesia. Terletak di daerah Aik Berik, Kecamatan Central Lombok, air terjun ini menawarkan pemandangan yang spektakuler dan keindahan alam yang memukau.', 'Aik Berik, Kec. Batukliang Utara, Kabupaten Lombok Tengah, Nusa Tenggara Bar. 83552', 'benang-stokel_691182583.jpg', 'benang-stokel-waterfall-lombok-00125.jpg', 'df56af2edbc0cf9a4d3f9e72d4f2822c.jpg'),
(17, 'Bukit Seger', 'Bukit Seger adalah sebuah bukit yang terletak di pulau Lombok, Indonesia. Bukit ini terkenal karena menawarkan pemandangan yang menakjubkan dan panorama yang indah.\r\n\r\nBukit Seger terletak di desa Pujut, Lombok Tengah, dan merupakan salah satu destinasi favorit para wisatawan yang ingin menikmati keindahan alam pulau ini. Bukit ini dikenal dengan keindahan pemandangan laut yang luas dan hamparan perbukitan hijau yang mengelilinginya.\r\n\r\nDari puncak Bukit Seger, pengunjung dapat menyaksikan pemandangan panorama yang menakjubkan. Laut biru yang membentang, pantai-pantai yang indah, serta desa-desa tradisional yang terhampar di bawahnya menciptakan pemandangan yang memesona.\r\n\r\nBukit Seger juga merupakan tempat yang populer untuk menikmati matahari terbit atau matahari terbenam. Suasana yang tenang dan pemandangan yang menakjubkan membuat pengunjung merasa damai dan terpesona oleh keindahan alam yang disajikan.\r\n\r\nSelain itu, di Bukit Seger terdapat beberapa spot foto yang menarik, yang memungkinkan pengunjung untuk mengabadikan momen indah mereka dengan latar belakang pemandangan yang spektakuler.\r\n\r\nUntuk mencapai puncak Bukit Seger, pengunjung harus melewati jalan setapak dan menaiki bukit. Namun, usaha tersebut akan terbayar dengan pemandangan yang luar biasa ketika tiba di puncak.\r\n\r\nBukit Seger adalah tempat yang cocok untuk para pecinta alam dan fotografi yang ingin menikmati keindahan alam pulau Lombok. Dengan panorama yang memukau dan pemandangan yang menenangkan, Bukit Seger menawarkan pengalaman yang tak terlupakan bagi setiap pengunjungnya.', 'Bukit Seger terletak di desa Pujut, Lombok Tengah, dan merupakan salah satu destinasi favorit para wisatawan yang ingin menikmati keindahan alam pulau ini.', '37RX+VR3, Jl. Beach Walk, Kuta, Kec. Pujut, Kabupaten Lombok Tengah, Nusa Tenggara Bar. 83573', 'Bukit_Seger.jpg', 'c654eb5210ab5ad90b87fe025e37bc22.jpg', 'pantai-seger-lombok.png'),
(18, 'Bukit Bengkaung', 'Bukit Bengkaung adalah sebuah bukit yang terletak di pulau Lombok, Indonesia. Terletak di Desa Batu Kumbung, Kabupaten Lombok Tengah, bukit ini menawarkan pemandangan alam yang menakjubkan dan panorama yang indah.\r\n\r\nBukit Bengkaung terkenal dengan keindahan pemandangan matahari terbit yang spektakuler. Pada pagi hari, pengunjung dapat menyaksikan sinar matahari yang perlahan muncul di cakrawala, menerangi hamparan lautan dan bukit-bukit di sekitarnya. Pemandangan ini menciptakan momen yang memukau dan sangat cocok bagi pecinta fotografi.\r\n\r\nDari puncak Bukit Bengkaung, pengunjung juga dapat menikmati pemandangan yang luas. Hamparan perbukitan hijau yang menghijau sejauh mata memandang, padang rumput yang indah, serta desa-desa tradisional yang terhampar di bawahnya memberikan pengalaman yang menenangkan dan damai.\r\n\r\nUntuk mencapai puncak Bukit Bengkaung, pengunjung harus melakukan pendakian melalui jalur setapak yang terbentang di tengah pepohonan. Perjalanan ini menambah keasyikan petualangan dan memberikan kesempatan untuk menikmati keindahan alam sekitar.\r\n\r\nBukit Bengkaung adalah tempat yang ideal untuk melarikan diri dari kebisingan perkotaan dan menikmati kedamaian serta keindahan alam pulau Lombok. Pengunjung dapat menghirup udara segar, menikmati keindahan alam, dan menikmati momen tenang di atas bukit yang menakjubkan ini.\r\n\r\nBagi pecinta fotografi, Bukit Bengkaung juga menawarkan berbagai spot foto yang menarik, di mana mereka dapat mengabadikan momen indah mereka dengan latar belakang pemandangan yang menakjubkan.\r\n\r\nDengan pemandangan alam yang mempesona dan suasana yang menenangkan, Bukit Bengkaung adalah tempat yang sempurna untuk bersantai, menikmati alam, dan menikmati keindahan pulau Lombok dengan cara yang unik dan istimewa.', 'Bukit Bengkaung adalah sebuah bukit yang terletak di pulau Lombok, Indonesia. Terletak di Desa Batu Kumbung, Kabupaten Lombok Tengah, bukit ini menawarkan pemandangan alam yang menakjubkan dan panorama yang indah.', 'F3XR+R56, Lembah Sari, Kec. Batu Layar, Kabupaten Lombok Barat, Nusa Tenggara Bar. 83355', 'Bukit-Bengkaung-3.jpg', '135456110_195220948947391_8962364224926261504_n-1024x768.webp', 'taman-langit-di-bukit-bengkaung-menyaksian-daerah-sekitar-l-xmwb.webp'),
(19, 'Gili Trawangan', 'Gili Trawangan adalah salah satu pulau kecil yang terletak di sebelah barat laut Lombok, Indonesia. Pulau ini merupakan salah satu dari tiga pulau Gili yang terkenal di wilayah tersebut, bersama dengan Gili Air dan Gili Meno. Gili Trawangan terkenal karena keindahan pantainya, air laut yang jernih, serta suasana pulau yang santai.\r\n\r\nPulau Gili Trawangan menawarkan pemandangan yang menakjubkan dengan pasir putih yang lembut, laut berwarna biru kristal yang mempesona, dan terumbu karang yang indah. Snorkeling dan menyelam menjadi kegiatan populer di pulau ini, karena keberagaman hayati yang luar biasa di bawah permukaan lautnya.\r\n\r\nDi sepanjang pantai pulau, terdapat bar-bar, restoran, dan kafe yang menawarkan makanan lezat dan minuman segar. Suasana pulau yang santai dan ramah membuat pengunjung merasa nyaman dan rileks. Jalan-jalan di sekitar pulau dapat dilakukan dengan berjalan kaki, bersepeda, atau menggunakan cidomo (kereta kuda) yang merupakan alat transportasi tradisional di pulau tersebut.\r\n\r\nSelain kegiatan pantai, Gili Trawangan juga terkenal dengan kehidupan malamnya yang hidup. Terdapat berbagai tempat hiburan malam, seperti bar dan klub yang menawarkan musik dan suasana yang menyenangkan bagi pengunjung yang ingin bersenang-senang di malam hari.\r\n\r\nPulau Gili Trawangan adalah tempat yang populer bagi wisatawan yang mencari liburan yang santai, berjemur di bawah sinar matahari, berenang, menyelam, snorkeling, atau sekadar menikmati keindahan alam yang menakjubkan. Dengan suasana yang ramah, panorama yang indah, dan kehidupan malam yang menyenangkan, Gili Trawangan menjadi destinasi yang menarik di pulau Lombok.', 'Pulau Gili Trawangan menawarkan pemandangan yang menakjubkan dengan pasir putih yang lembut, laut berwarna biru kristal yang mempesona, dan terumbu karang yang indah.', 'Gili Indah, Kec. Pemenang, Kabupaten Lombok Utara, Nusa Tenggara Bar.', 'Gili-Trawangan.jpg', '8120d8e6-0629-4303-8301-dcb4c8dbbf71-1602223746140-38935a774877b5b56d0177e01576113b.webp', 'hotel-ombak-sunset.jpg'),
(20, 'Gili Air', 'Gili Air adalah salah satu dari tiga pulau Gili yang terletak di sebelah barat laut Lombok, Indonesia. Pulau ini terkenal karena keindahan alamnya, suasana yang tenang, dan pantai-pantainya yang menakjubkan.\r\n\r\nGili Air menawarkan suasana pulau yang lebih tenang dan santai dibandingkan dengan Gili Trawangan yang lebih ramai. Pulau ini memiliki pantai berpasir putih yang lembut dan air laut yang jernih dengan beragam warna biru yang mempesona. Pasirnya yang putih dan airnya yang jernih menjadikan', 'Gili Air menawarkan suasana pulau yang lebih tenang dan santai dibandingkan dengan Gili Trawangan yang lebih ramai. Pulau ini memiliki pantai berpasir putih yang lembut dan air laut yang jernih dengan beragam warna biru yang mempesona. Pasirnya yang putih dan airnya yang jernih menjadikan Gili Air s', 'Gili Indah, Kec. Pemenang, Kabupaten Lombok Utara, Nusa Tenggara Bar.', '623436cab9f4e.jpg', 'gili-air.webp', 'things-to-do-gili-air-drone-island.jpg'),
(21, 'Gili Meno', 'Gili Meno adalah salah satu dari tiga pulau Gili yang terletak di sebelah barat laut Lombok, Indonesia. Pulau ini dikenal sebagai pulau terkecil dan paling tenang di antara ketiga pulau Gili.\r\n\r\nGili Meno menawarkan suasana yang tenang, alam yang indah, dan kehidupan laut yang mempesona. Pulau ini terkenal karena pantai-pantainya yang cantik dengan pasir putih yang halus dan air laut yang jernih. Pengunjung dapat bersantai di pantai, berjemur di bawah sinar matahari, atau berenang di air laut ya', 'Gili Meno menawarkan suasana yang tenang, alam yang indah, dan kehidupan laut yang mempesona. Pulau ini terkenal karena pantai-pantainya yang cantik dengan pasir putih yang halus dan air laut yang jernih. Pengunjung dapat bersantai di pantai, berjemur di bawah sinar matahari, atau berenang di air la', 'Gili Indah, Kec. Pemenang, Kabupaten Lombok Utara, Nusa Tenggara Bar.', 'gilimeno-video-thumbnail.jpg', 'snorkeling-gili-meno.jpg', '9fa05e49-dfcc-43ce-8acb-e3a1f0509785_169.jpg'),
(22, 'Taman Narmada', 'Taman Narmada adalah sebuah taman yang terletak di Lombok Barat, Nusa Tenggara Barat, Indonesia. Taman ini memiliki keindahan alam yang menakjubkan dan sejarah yang kaya.\r\n\r\nTaman Narmada didirikan pada abad ke-19 oleh Raja Mataram, Anak Agung Ngurah Karang Asem. Taman ini dibangun sebagai replika dari Gunung Rinjani, gunung tertinggi di pulau Lombok. Di dalam taman, terdapat danau buatan yang mewakili Danau Segara Anak di Gunung Rinjani.\r\n\r\nTaman Narmada dikelilingi oleh pepohonan hijau dan pemandangan alam yang indah. Pengunjung dapat berjalan-jalan di sekitar taman, menikmati udara segar, dan menikmati pemandangan yang menenangkan.\r\n\r\nSalah satu fitur menarik dari Taman Narmada adalah Pura Kalasa, sebuah pura Hindu yang terletak di tengah taman. Pura ini digunakan untuk perayaan Hindu dan menjadi tempat yang penting bagi umat Hindu di pulau Lombok.\r\n\r\nTaman Narmada juga terkenal dengan air sumber mata airnya yang dipercaya memiliki khasiat penyembuhan. Pengunjung dapat menikmati air yang jernih dan segar di sumber mata air tersebut.\r\n\r\nSelain itu, taman ini juga memiliki kolam renang buatan yang dapat digunakan oleh pengunjung untuk berenang dan bersantai.\r\n\r\nTaman Narmada adalah tempat yang populer bagi wisatawan yang ingin menikmati keindahan alam, menjelajahi sejarah lokal, dan merasakan ketenangan di tengah lingkungan yang indah. Dengan suasana yang damai, pemandangan alam yang menakjubkan, dan sejarah yang kaya, Taman Narmada menjadi tujuan yang menarik untuk dikunjungi di pulau Lombok.', 'Taman Narmada didirikan pada abad ke-19 oleh Raja Mataram, Anak Agung Ngurah Karang Asem. Taman ini dibangun sebagai replika dari Gunung Rinjani, gunung tertinggi di pulau Lombok. Di dalam taman, terdapat danau buatan yang mewakili Danau Segara Anak di Gunung Rinjani.', 'Jl. Raya Mataram - Labuhan Lombok, Lembuak, Kec. Narmada, Kabupaten Lombok Barat, Nusa Tenggara Bar.', 'Taman-Narmada-sumber-ig-bangsatriopu.webp', 'Kolam-Padmawangi-Taman-Narmada-by-@khafidmukriyanto.jpg', 'f9241e015c38ece48052819d77e939a1.jpg'),
(23, 'Taman Mayura', 'Taman Mayura adalah sebuah taman sejarah yang terletak di Kota Mataram, Lombok, Indonesia. Taman ini memiliki nilai sejarah yang tinggi dan merupakan salah satu tempat wisata yang populer di pulau Lombok.\r\n\r\nTaman Mayura didirikan pada abad ke-18 oleh Raja Anak Agung Gede Ngurah Karangasem sebagai tempat pertemuan dan upacara kerajaan. Taman ini memiliki arsitektur tradisional Bali yang menarik, dengan kolam air besar di tengahnya yang dikelilingi oleh taman yang indah.\r\n\r\nSalah satu daya tarik utama Taman Mayura adalah Bale Kambang, sebuah paviliun mengapung yang terletak di atas kolam air. Bale Kambang digunakan sebagai tempat peristirahatan dan pertunjukan tari tradisional Bali. Saat ini, paviliun ini digunakan sebagai tempat acara budaya dan upacara adat.\r\n\r\nSelain itu, Taman Mayura juga dikelilingi oleh taman yang hijau dan pohon-pohon rindang, menciptakan suasana yang nyaman dan tenang bagi pengunjung. Taman ini sering digunakan oleh warga setempat untuk bersantai, berjalan-jalan, atau sekadar menikmati keindahan alam di sekitarnya.\r\n\r\nTaman Mayura juga memiliki makam raja-raja dari Kerajaan Karangasem yang terletak di bagian belakang taman. Makam ini memiliki nilai sejarah yang tinggi dan menjadi tempat ziarah bagi masyarakat setempat.\r\n\r\nTaman Mayura adalah tempat yang ideal bagi para wisatawan yang ingin menjelajahi sejarah dan budaya lokal. Dengan arsitektur tradisional yang menarik, paviliun mengapung yang indah, dan suasana yang tenang, Taman Mayura memberikan pengalaman yang unik dan menarik di pulau Lombok.', 'Taman Mayura didirikan pada abad ke-18 oleh Raja Anak Agung Gede Ngurah Karangasem sebagai tempat pertemuan dan upacara kerajaan. Taman ini memiliki arsitektur tradisional Bali yang menarik, dengan kolam air besar di tengahnya yang dikelilingi oleh taman yang indah.', 'Jl. Purbasari No.29, Mayura, Kec. Cakranegara, Kota Mataram, Nusa Tenggara Bar. 83239', 'Taman Mayura.png', 'taman-mayura-nusa-tenggara-barat.jpg', 'Foto-udara-taman-Mayura-di-Lombok-sumber-ig-@inengahsuarna.jpg'),
(24, 'Taman Hutan Raya Nuraksa', 'Taman Hutan Raya Nuraksa, juga dikenal sebagai Taman Wisata Alam Hutan Raya Mataram, adalah sebuah taman hutan yang terletak di Kabupaten Lombok Barat, Nusa Tenggara Barat, Indonesia. Taman ini merupakan kawasan konservasi alam yang luas dan memiliki beragam keanekaragaman hayati.\r\n\r\nTaman Hutan Raya Nuraksa menawarkan pengunjung suasana yang alami dan segar dengan pepohonan hijau yang rindang. Taman ini adalah rumah bagi berbagai spesies tumbuhan dan hewan, termasuk flora langka dan endemik. Pengunjung dapat menjelajahi jalan setapak dan jalur hiking yang ada di taman ini sambil menikmati pemandangan alam yang indah.\r\n\r\nSelain menjelajahi hutan, pengunjung juga dapat mengamati burung-burung yang hidup di taman ini, mengamati kehidupan serangga, atau bahkan mempelajari tentang tumbuhan obat tradisional yang tumbuh di dalamnya.\r\n\r\nTaman Hutan Raya Nuraksa juga memiliki beberapa air terjun yang menarik untuk dikunjungi. Air terjun-air terjun ini menawarkan suasana yang menenangkan dan pemandangan yang indah. Pengunjung dapat merasakan keajaiban alam saat mereka menikmati suara gemuruh air terjun dan menikmati keindahan sekitarnya.\r\n\r\nTaman Hutan Raya Nuraksa juga menyediakan fasilitas seperti jalur hiking, area piknik, dan tempat perkemahan untuk para pengunjung yang ingin menjelajahi dan menikmati keindahan alam di taman ini.\r\n\r\nTaman Hutan Raya Nuraksa adalah tempat yang cocok bagi mereka yang mencari petualangan alam dan ingin menikmati keindahan hutan tropis yang alami. Dengan keanekaragaman hayati yang kaya, air terjun yang menakjubkan, dan suasana yang tenang, Taman Hutan Raya Nuraksa menawarkan pengalaman alam yang menarik di pulau Lombok.', 'Taman Hutan Raya Nuraksa menawarkan pengunjung suasana yang alami dan segar dengan pepohonan hijau yang rindang. Taman ini adalah rumah bagi berbagai spesies tumbuhan dan hewan, termasuk flora langka dan endemik.', 'G827+H42, Unnamed Road, Lantan, Kec. Batukliang Utara, Kabupaten Lombok Tengah, Nusa Tenggara Bar. 8', '0713492022-Jembatan_gantung_di_Taman_Hutan_Raya_Ir._H._Djuanda.jpg', '013648100_1541841610-Julien_R.jpg', '3596695807.jpg'),
(25, 'Pura Suranadi', 'Pura Suranadi, juga dikenal sebagai Pura Lingsar Suranadi, adalah sebuah pura yang terletak di Desa Suranadi, Lombok Barat, Nusa Tenggara Barat, Indonesia. Pura ini memiliki nilai sejarah dan religius yang tinggi serta menjadi salah satu tempat suci bagi umat Hindu di pulau Lombok.\r\n\r\nPura Suranadi adalah pura yang penting bagi masyarakat Hindu di Lombok. Pura ini dianggap sebagai tempat suci yang dikaitkan dengan dewa-dewa Hindu. Pura ini juga merupakan tempat ziarah bagi umat Hindu yang datang untuk berdoa dan menghormati leluhur mereka.\r\n\r\nSalah satu fitur menarik dari Pura Suranadi adalah kompleks hutan suci yang mengelilingi pura. Hutan ini dipercaya memiliki energi spiritual yang kuat dan dihuni oleh makhluk-makhluk gaib. Pengunjung dapat menjelajahi jalan setapak yang melintasi hutan dan menikmati keindahan alam serta kedamaian spiritual yang terasa di tempat ini.\r\n\r\nPura Suranadi juga memiliki kolam suci yang dipercaya memiliki khasiat penyembuhan. Air kolam suci ini dianggap sakral oleh umat Hindu dan sering digunakan untuk upacara ritual dan pembersihan rohani.\r\n\r\nSelain sebagai tempat ibadah, Pura Suranadi juga menjadi tujuan wisata spiritual dan budaya bagi wisatawan yang tertarik untuk mempelajari tradisi dan kepercayaan Hindu di Lombok. Pura ini juga sering menjadi lokasi upacara adat dan festival keagamaan.\r\n\r\nPura Suranadi adalah tempat yang penting bagi umat Hindu dan juga menarik bagi wisatawan yang ingin merasakan atmosfer keagamaan dan spiritual di Lombok. Dengan hutan suci yang indah, kolam suci yang sakral, dan nilai sejarah yang tinggi, Pura Suranadi merupakan tujuan yang menarik untuk dikunjungi di pulau Lombok.', 'Pura Suranadi, juga dikenal sebagai Pura Lingsar Suranadi, adalah sebuah pura yang terletak di Desa Suranadi, Lombok Barat, Nusa Tenggara Barat, Indonesia.', 'Jalan Raya Suranadi - Sesaot, Selat, Narmada, Suranadi, Lombok Barat, Kabupaten Lombok Barat, Nusa T', 'pura-di-tempat-wisata-suranadi-lombok-barat.jpg', '11198238.jpg', 'image.webp'),
(26, 'Desa Sade', 'Desa Sade adalah sebuah desa adat yang terletak di Lombok Tengah, Nusa Tenggara Barat, Indonesia. Desa ini merupakan salah satu destinasi wisata budaya yang populer di pulau Lombok.\r\n\r\nDesa Sade terkenal karena mempertahankan tradisi dan gaya hidup Sasak, suku asli pulau Lombok. Desa ini menjadi tempat tinggal bagi masyarakat Sasak yang masih menjalankan kehidupan tradisional mereka.\r\n\r\nSalah satu ciri khas Desa Sade adalah rumah tradisional Sasak yang disebut \"rumah panggung\". Rumah-rumah ini terbuat dari bambu, kayu, dan alang-alang sebagai atapnya. Pengunjung dapat melihat secara langsung bagaimana rumah-rumah ini dibangun dan mengetahui fungsi serta keunikan dari setiap bagian rumah tradisional Sasak.\r\n\r\nSelain itu, Desa Sade juga menawarkan pengalaman budaya yang autentik. Pengunjung dapat melihat dan belajar tentang keterampilan tradisional seperti menenun kain ikat, membuat kerajinan tangan dari bambu, dan berbagai aktivitas sehari-hari masyarakat Sasak.\r\n\r\nDesa Sade juga memiliki sistem adat yang masih dijaga dengan ketat. Pengunjung dapat melihat bagaimana masyarakat Desa Sade menjalankan adat dan tradisi mereka, termasuk upacara adat dan tarian tradisional Sasak.\r\n\r\nSelain itu, Desa Sade juga memiliki keindahan alam yang menakjubkan. Desa ini dikelilingi oleh perbukitan hijau yang memanjakan mata. Pengunjung dapat menjelajahi area sekitar desa dan menikmati panorama alam yang indah.\r\n\r\nDesa Sade adalah tempat yang ideal bagi wisatawan yang ingin mempelajari budaya lokal Sasak, mengalami kehidupan tradisional, dan menikmati keindahan alam yang alami. Dengan rumah tradisional yang unik, kegiatan budaya yang menarik, dan pemandangan alam yang memukau, Desa Sade memberikan pengalaman wisata yang berbeda di pulau Lombok.', 'Desa Sade terkenal karena mempertahankan tradisi dan gaya hidup Sasak, suku asli pulau Lombok. Desa ini menjadi tempat tinggal bagi masyarakat Sasak yang masih menjalankan kehidupan tradisional mereka', 'Rembitan, Kec. Pujut, Kabupaten Lombok Tengah, Nusa Tenggara Bar. 83573', 'c3152e253780261179057628774b6cb5.jpg', '61444cc56cede.jpg', 'akurat_20171203060735_N78jsG.jpg'),
(28, 'Islamic Center', 'Islamic Center Lombok, juga dikenal sebagai Masjid Islamic Center atau Pusat Islam Lombok, adalah sebuah kompleks masjid yang terletak di Mataram, Pulau Lombok, Nusa Tenggara Barat, Indonesia. Kompleks ini merupakan salah satu landmark penting dan pusat kegiatan keagamaan di Lombok.\r\n\r\nIslamic Center Lombok memiliki arsitektur yang megah dan menakjubkan. Menara masjid yang tinggi menjulang menjadi ciri khasnya dan menjadi salah satu landmark yang terlihat jelas dari berbagai sudut kota. Bangunan masjid ini menggabungkan gaya arsitektur Timur Tengah dengan sentuhan lokal yang khas, menciptakan suasana yang indah dan mencolok.\r\n\r\nDi dalam kompleks masjid, terdapat halaman luas yang digunakan sebagai tempat untuk melaksanakan salat berjamaah dan kegiatan keagamaan lainnya. Masjid utama memiliki kapasitas yang besar dan bisa menampung ribuan jamaah.\r\n\r\nSelain fungsi keagamaan, Islamic Center Lombok juga menyediakan fasilitas seperti aula serbaguna, ruang pertemuan, perpustakaan, dan toko buku Islam. Kompleks ini sering digunakan untuk mengadakan acara keagamaan, seminar, konferensi, dan kegiatan sosial yang berkaitan dengan Islam.\r\n\r\nIslamic Center Lombok juga memiliki lokasi strategis dengan pemandangan indah. Dari beberapa sudut kompleks, pengunjung dapat menikmati pemandangan kota Mataram, pantai, dan perbukitan yang mengelilingi pulau Lombok.\r\n\r\nKompleks Islamic Center Lombok tidak hanya menjadi tempat ibadah bagi umat Muslim, tetapi juga menjadi daya tarik wisata bagi pengunjung dari berbagai latar belakang. Kecantikan arsitektur, kegiatan keagamaan yang beragam, dan pemandangan yang memukau membuat Islamic Center Lombok menjadi salah satu tempat yang menarik untuk dikunjungi di pulau Lombok.', 'Islamic Center Lombok, juga dikenal sebagai Masjid Islamic Center atau Pusat Islam Lombok, adalah sebuah kompleks masjid yang terletak di Mataram, Pulau Lombok, Nusa Tenggara Barat, Indonesia. Kompleks ini merupakan salah satu landmark penting dan pusat kegiatan keagamaan di Lombok.', 'Jl. Udayana, Gomong, Kec. Selaparang, Kota Mataram, Nusa Tenggara Bar. 83125', 'Masjid-Islamic-Center-NTB-1200x900.png', 'masjid-raya-hubbul-wathan-islamic-center-mataram-lombok-west-nusa-tenggara-indonesia-masjid-raya-hub', 'islamic_center_lombok_di_mataram.width-800.format-webp.webp');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_type` varchar(20) NOT NULL DEFAULT 'user',
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT DELAYED IGNORE INTO `users` (`id`, `name`, `email`, `password`, `user_type`, `image`) VALUES
(36, 'gitasaras', 's@gmail.com', '202cb962ac59075b964b07152d234b70', 'user', 'pic-6.png'),
(37, 'xxsz', 'zs@gmail.com', '202cb962ac59075b964b07152d234b70', 'user', 'icon1.png'),
(38, 'ayu', 'gitasar@gmail.com', '8cb2237d0679ca88db6464eac60da96345513964', 'user', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `villas`
--

DROP TABLE IF EXISTS `villas`;
CREATE TABLE `villas` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `details` varchar(5000) NOT NULL,
  `details_mini` varchar(500) NOT NULL,
  `location` varchar(500) NOT NULL,
  `price` int(100) NOT NULL,
  `image_01` varchar(100) NOT NULL,
  `image_02` varchar(200) NOT NULL,
  `image_03` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `villas`
--

INSERT DELAYED IGNORE INTO `villas` (`id`, `name`, `details`, `details_mini`, `location`, `price`, `image_01`, `image_02`, `image_03`) VALUES
(2, 'Villa Sapi', 'Villa Sapi terletak di tepi pantai dan hanya berselang 5 menit naik perahu dari Gili Trawangan. Vila ini menawarkan sebuah kolam renang pribadi mewah dengan teras berjemur yang dikelilingi oleh pepohonan palem. Tersedia Wi-Fi gratis di seluruh area vila.\r\n\r\nKamar-kamarnya ber-AC, serta dilengkapi dengan area tempat duduk dan kamar mandi dalam yang mencakup shower dan bathtub. Semua kamar menyuguhkan pemandangan dan memiliki teras.', 'Villa Sapi terletak di tepi pantai dan hanya berselang 5 menit naik perahu dari Gili Trawangan. Vila ini menawarkan sebuah kolam renang pribadi mewah dengan teras berjemur yang dikelilingi oleh pepohonan palem. Tersedia Wi-Fi gratis di seluruh area vila.', 'Jl. Pantai Sire Tanjung, Sigar Penjalin, Pemenang, Kab. Lombok Utara, Lombok, Lombok Utara', 1500, 'xVillaP20SapiP20-P20ContemporaryP20architecture.jpg.pagespeed.ic_.7zBSAj4nxM.jpg', '7372521dd7e3931dd222099748b54035.jpg', '216022879.jpg'),
(3, 'Jeeva Mandalika', 'Villa Jeeva Mandalika adalah sebuah akomodasi mewah yang terletak di kawasan Mandalika, Lombok, Nusa Tenggara Barat, Indonesia. Villa ini menawarkan pengalaman menginap yang eksklusif dan layanan yang berkualitas tinggi.\r\n\r\nVilla Jeeva Mandalika dirancang dengan gaya arsitektur yang modern namun tetap mempertahankan unsur tradisional pulau Lombok. Setiap villa memiliki desain yang elegan dan ruang yang luas, dilengkapi dengan fasilitas modern dan perlengkapan yang nyaman.', 'Villa Jeeva Mandalika adalah sebuah akomodasi mewah yang terletak di kawasan Mandalika, Lombok, Nusa Tenggara Barat, Indonesia. Villa ini menawarkan pengalaman menginap yang eksklusif dan layanan yang berkualitas tinggi.', 'Sukadana, Kec. Pujut, Kabupaten Lombok Tengah, Nusa Tenggara Bar.', 3600, '377906835.jpg', 'villa-jeeva-mandalika-red-0227-635b8a4d0f447.jpg', 'villa-jeeva-mandalika-red-0260-635b8a60b801f.jpg'),
(4, 'Kalma Bamboo Eco Villa', 'Kalma Bamboo Eco Villa adalah sebuah tempat penginapan unik yang terletak di Pulau Lombok, Nusa Tenggara Barat, Indonesia. Villa ini menawarkan pengalaman menginap yang ramah lingkungan dan terbuat dari bahan-bahan alami seperti bambu.\r\n\r\nVilla-villa di Kalma Bamboo Eco Villa dirancang dengan gaya arsitektur yang ramah lingkungan dan menyatu dengan alam sekitarnya. Setiap villa terbuat dari bambu berkualitas tinggi, memberikan nuansa alami dan suasana yang tenang. Desain interior yang modern dan nyaman menciptakan tempat yang sempurna untuk bersantai dan menikmati liburan.\r\n\r\nSelain komitmen terhadap keberlanjutan, Kalma Bamboo Eco Villa juga menawarkan pemandangan alam yang indah. Terletak di tengah perkebunan hijau dan pohon-pohon tropis, tamu dapat menikmati keindahan alam Lombok dari dek villa mereka atau menjelajahi sekitar dengan berjalan kaki.\r\n\r\nFasilitas yang disediakan di Kalma Bamboo Eco Villa meliputi kolam renang, restoran dengan menu sehat dan lezat, spa untuk relaksasi, serta berbagai kegiatan dan tur yang tersedia untuk menjelajahi keindahan pulau Lombok.\r\n\r\nLokasinya yang strategis juga memungkinkan akses mudah ke objek wisata terkenal di sekitarnya, seperti Pantai Senggigi, Pantai Kuta Lombok, dan Gunung Rinjani. Pengunjung dapat menikmati pantai-pantai berpasir putih yang menakjubkan, melakukan aktivitas air seperti menyelam atau berselancar, atau menjelajahi keindahan alam yang menawan.\r\n\r\nKalma Bamboo Eco Villa adalah pilihan akomodasi yang sempurna bagi mereka yang mencari pengalaman menginap yang unik, nyaman, dan berkelanjutan di pulau Lombok. Dengan fokus pada lingkungan dan kenyamanan tamu, Kalma Bamboo Eco Villa menawarkan pengalaman liburan yang istimewa dan menyatu dengan alam sekitar.', 'Kalma Bamboo Eco Villa adalah sebuah tempat penginapan unik yang terletak di Pulau Lombok, Nusa Tenggara Barat, Indonesia. Villa ini menawarkan pengalaman menginap yang ramah lingkungan dan terbuat dari bahan-bahan alami seperti bambu.', 'Jl. Kuta Lombok, Kuta, Kec. Pujut, Kabupaten Lombok Tengah, Nusa Tenggara Bar. 83573 ', 3000, '365136137.jpg', '365119375.jpg', 'Kalma-Bamboo-Eco-Lodge-Kuta-Exterior.jpg'),
(5, 'Kelapa Villa', 'Kelapa Villa Lombok adalah sebuah akomodasi yang terletak di Pulau Lombok, Nusa Tenggara Barat, Indonesia. Villa ini menawarkan penginapan yang nyaman dan suasana tropis yang menawan.\r\n\r\nKelapa Villa Lombok didesain dengan gaya arsitektur yang menggabungkan elemen modern dan tradisional, menciptakan tempat yang indah dan memikat. Setiap villa dilengkapi dengan fasilitas yang lengkap, termasuk kamar tidur yang nyaman, ruang tamu yang luas, dan dapur yang dilengkapi dengan peralatan memasak.\r\n\r\nVilla-villa ini dikelilingi oleh kebun kelapa yang hijau dan rindang, memberikan suasana yang tenang dan damai. Pengunjung dapat bersantai di teras atau balkon villa mereka sambil menikmati pemandangan alam yang indah.\r\n\r\nFasilitas yang disediakan di Kelapa Villa Lombok termasuk kolam renang, taman yang indah, dan area tempat duduk yang nyaman untuk bersantai. Villa ini juga menawarkan layanan staf yang ramah dan profesional, siap membantu memenuhi kebutuhan dan kenyamanan tamu.\r\n\r\nLokasinya yang strategis memungkinkan akses mudah ke objek wisata terkenal di sekitarnya, seperti Pantai Senggigi, Pantai Kuta Lombok, dan Pantai Selong Belanak. Pengunjung dapat menikmati pantai-pantai yang indah, melakukan aktivitas air seperti berselancar atau menyelam, atau menjelajahi keindahan alam dan budaya Lombok.\r\n\r\nKelapa Villa Lombok adalah tempat yang sempurna untuk menghabiskan liburan yang tenang dan santai di pulau Lombok. Dengan suasana tropis yang memikat, fasilitas yang lengkap, dan pelayanan yang ramah, Kelapa Villa Lombok menawarkan pengalaman menginap yang menyenangkan bagi para tamu.', 'Kelapa Villa Lombok didesain dengan gaya arsitektur yang menggabungkan elemen modern dan tradisional, menciptakan tempat yang indah dan memikat. Setiap villa dilengkapi dengan fasilitas yang lengkap, termasuk kamar tidur yang nyaman, ruang tamu yang luas, dan dapur yang dilengkapi dengan peralatan memasak.', 'Jl. Vila Klp., Gili Trawangan, Kec. Pemenang, Kabupaten Lombok Utara, Nusa Tenggara Bar. 83355', 1500, 'Kelapavillas-Main-Photo.jpg', '201540482.jpg', 'Superior-Luxury-Villas-7.jpg'),
(6, 'Melase Hill Villa', 'Melase Hill Villa adalah sebuah penginapan yang terletak di daerah perbukitan di Pulau Lombok, Nusa Tenggara Barat, Indonesia. Villa ini menawarkan pengalaman menginap yang tenang, dengan pemandangan indah dan udara segar pegunungan.\r\n\r\nMelase Hill Villa dirancang dengan gaya arsitektur yang modern namun tetap menggambarkan keaslian budaya dan keindahan alam sekitarnya. Setiap villa dilengkapi dengan fasilitas yang lengkap, termasuk kamar tidur yang nyaman, ruang tamu yang luas, dapur lengkap, dan teras pribadi yang menawarkan pemandangan spektakuler.\r\n\r\nDengan berada di perbukitan, Melase Hill Villa menawarkan ketenangan dan kebebasan dari hiruk-pikuk kehidupan kota. Pengunjung dapat menikmati suasana yang tenang, jauh dari keramaian, sambil menikmati pemandangan hijau perbukitan yang mengelilingi villa.\r\n\r\nFasilitas yang disediakan di Melase Hill Villa meliputi kolam renang pribadi, taman yang indah, dan area bersantai yang nyaman. Pengunjung dapat bersantai di tepi kolam renang, menikmati keindahan alam sekitarnya, atau menjelajahi area sekitar dengan berjalan kaki.\r\n\r\nLokasi Melase Hill Villa juga memungkinkan akses mudah ke objek wisata terkenal di sekitarnya, seperti Pantai Senggigi, Pantai Kuta Lombok, dan Gunung Rinjani. Pengunjung dapat menjelajahi keindahan alam, melakukan trekking di pegunungan, atau mengunjungi pantai-pantai yang menakjubkan.\r\n\r\nMelase Hill Villa adalah pilihan yang sempurna bagi mereka yang mencari tempat menginap yang tenang, nyaman, dan memberikan pengalaman dekat dengan alam di pulau Lombok. Dengan suasana perbukitan yang menenangkan, fasilitas yang lengkap, dan pelayanan yang ramah, Melase Hill Villa menawarkan pengalaman liburan yang menyenangkan dan tak terlupakan.', 'Melase Hill Villa dirancang dengan gaya arsitektur yang modern namun tetap menggambarkan keaslian budaya dan keindahan alam sekitarnya. Setiap villa dilengkapi dengan fasilitas yang lengkap, termasuk kamar tidur yang nyaman, ruang tamu yang luas, dapur lengkap, dan teras pribadi yang menawarkan pemandangan spektakuler.', 'F3HC+23M, Batu Layar, Kec. Batu Layar, Kabupaten Lombok Barat, Nusa Tenggara Bar. 83355 ', 900, 'deab0109-3320-4364-865b-bc77616890e0-1638679523952-b8b18686d25afd551ed29c72a2b0e403.webp', '0224o12000aasavu5832C_R_960_660_R5_D.webp', '330414051.jpg'),
(7, 'Mora Royal Villa', 'Mora Royal Villa Lombok adalah sebuah vila mewah yang terletak di Pulau Lombok, Nusa Tenggara Barat, Indonesia. Vila ini menawarkan pengalaman menginap yang istimewa dengan kemewahan dan kenyamanan yang tak tertandingi.\r\n\r\nMora Royal Villa Lombok didesain dengan gaya arsitektur yang elegan dan modern, menciptakan suasana yang mewah dan memikat. Setiap vila dilengkapi dengan fasilitas yang lengkap, termasuk kamar tidur yang mewah, ruang tamu yang luas, dapur lengkap, kolam renang pribadi, dan taman yang indah.\r\n\r\nVila-vila ini menawarkan privasi yang optimal, dengan ruang yang luas untuk bersantai dan menikmati liburan. Terdapat pemandangan yang menakjubkan dari vila, termasuk pemandangan laut biru yang indah dan pemandangan alam sekitarnya yang hijau.\r\n\r\nFasilitas yang disediakan di Mora Royal Villa Lombok meliputi restoran mewah, bar, pusat kebugaran, spa, dan berbagai layanan terbaik untuk kenyamanan tamu. Staf yang ramah dan profesional siap membantu memenuhi kebutuhan dan permintaan tamu dengan pelayanan yang prima.\r\n\r\nLokasi Mora Royal Villa Lombok juga memungkinkan akses mudah ke objek wisata terkenal di sekitarnya, seperti Pantai Senggigi, Pantai Kuta Lombok, dan Pantai Selong Belanak. Pengunjung dapat menikmati pantai-pantai yang indah, melakukan aktivitas air seperti berselancar atau snorkeling, atau menjelajahi keindahan alam dan budaya Lombok.\r\n\r\nMora Royal Villa Lombok adalah pilihan yang sempurna bagi mereka yang mencari pengalaman menginap yang mewah dan tak terlupakan di pulau Lombok. Dengan fasilitas yang lengkap, pemandangan yang menakjubkan, dan pelayanan yang terbaik, Mora Royal Villa Lombok menawarkan pengalaman liburan yang istimewa dan mengesankan.', 'Mora Royal Villa Lombok didesain dengan gaya arsitektur yang elegan dan modern, menciptakan suasana yang mewah dan memikat. Setiap vila dilengkapi dengan fasilitas yang lengkap, termasuk kamar tidur yang mewah, ruang tamu yang luas, dapur lengkap, kolam renang pribadi, dan taman yang indah.', 'F3P6+6X7, Jl. Bukit Batu Layar, Batu Layar, Kec. Batu Layar, Kabupaten Lombok Barat, Nusa Tenggara B', 1000, '91882841.jpg', '89601494.jpg', 'Mora-Royal-Villa-Lombok-Exterior.jpg'),
(8, 'Ponte Villas', 'Pontes Villa Lombok adalah sebuah vila eksklusif yang terletak di Pulau Lombok, Nusa Tenggara Barat, Indonesia. Vila ini menawarkan pengalaman menginap yang mewah dan penuh keramahan.\r\n\r\nPontes Villa Lombok dirancang dengan gaya arsitektur modern yang menciptakan suasana yang elegan dan nyaman. Setiap vila dilengkapi dengan fasilitas yang lengkap, termasuk kamar tidur yang mewah, ruang tamu yang luas, dapur lengkap, dan kolam renang pribadi yang indah.\r\n\r\nKeindahan alam sekitar vila sangat menakjubkan, dengan pemandangan laut yang luas dan pantai pasir putih yang berkilau. Pengunjung dapat menikmati keindahan alam dari teras atau balkon vila mereka sambil merasakan angin sepoi-sepoi dan ketenangan.\r\n\r\nFasilitas yang disediakan di Pontes Villa Lombok meliputi restoran berkualitas tinggi, bar, pusat kebugaran, spa, dan berbagai pilihan layanan untuk memanjakan tamu. Staf yang profesional dan ramah siap memberikan pelayanan yang terbaik untuk memenuhi kebutuhan tamu.\r\n\r\nLokasi Pontes Villa Lombok sangat strategis, memungkinkan akses mudah ke objek wisata terkenal di sekitarnya, seperti Pantai Senggigi, Pantai Kuta Lombok, dan Gili Trawangan. Pengunjung dapat menikmati kegiatan air seperti snorkeling, menyelam, atau berselancar, serta menjelajahi pesona alam dan kebudayaan Lombok.\r\n\r\nPontes Villa Lombok adalah pilihan yang sempurna bagi mereka yang mencari pengalaman menginap yang mewah dan penuh kenyamanan di pulau Lombok. Dengan fasilitas yang lengkap, pemandangan yang menakjubkan, dan layanan yang terbaik, Pontes Villa Lombok menawarkan pengalaman liburan yang luar biasa dan tak terlupakan.', 'Pontes Villa Lombok adalah sebuah vila eksklusif yang terletak di Pulau Lombok, Nusa Tenggara Barat, Indonesia. Vila ini menawarkan pengalaman menginap yang mewah dan penuh keramahan.', 'Jl. Pantai Gili Trawangan, Gili Indah, Kec. Pemenang, Kabupaten Lombok Utara, Nusa Tenggara Bar. 833', 2250, '115485701.jpg', '220c0y000000mfi5qBB84.jpg', 'ce81cc10fd6a20c183530af3ddbeafa16ff2bab2.jpeg'),
(9, 'Sunyi Villa', 'Sunyi Villa Lombok adalah sebuah vila yang terletak di Pulau Lombok, Nusa Tenggara Barat, Indonesia. Vila ini menawarkan pengalaman menginap yang tenang dan damai, di tengah keindahan alam yang memukau.\r\n\r\nSunyi Villa Lombok dirancang dengan gaya arsitektur tradisional Lombok yang menggabungkan nuansa modern dan alami. Setiap vila dilengkapi dengan fasilitas yang nyaman, termasuk kamar tidur yang luas, ruang tamu yang menyambut, dapur lengkap, dan taman yang indah.\r\n\r\nVila-vila ini menawarkan privasi yang sempurna, dengan suasana yang tenang dan hening. Pengunjung dapat menikmati ketenangan dan kebebasan dari kehidupan sehari-hari, sambil menikmati pemandangan alam sekitar yang menakjubkan.\r\n\r\nFasilitas yang disediakan di Sunyi Villa Lombok meliputi kolam renang pribadi, restoran dengan hidangan lezat, spa untuk relaksasi, dan berbagai layanan yang memanjakan tamu. Staf yang ramah dan profesional siap membantu memenuhi kebutuhan dan permintaan tamu dengan pelayanan terbaik.\r\n\r\nLokasi Sunyi Villa Lombok sangat dekat dengan pantai-pantai indah di sekitarnya, seperti Pantai Senggigi dan Pantai Kuta Lombok. Pengunjung dapat menjelajahi keindahan alam, melakukan kegiatan air, atau bersantai di tepi pantai yang pasirnya putih bersih.\r\n\r\nSunyi Villa Lombok adalah pilihan yang sempurna bagi mereka yang mencari pengalaman menginap yang tenang dan dekat dengan alam di pulau Lombok. Dengan suasana yang damai, fasilitas yang nyaman, dan pemandangan alam yang mempesona, Sunyi Villa Lombok menawarkan pengalaman liburan yang santai dan memikat.', 'Vila-vila ini menawarkan privasi yang sempurna, dengan suasana yang tenang dan hening. Pengunjung dapat menikmati ketenangan dan kebebasan dari kehidupan sehari-hari, sambil menikmati pemandangan alam sekitar yang menakjubkan.', 'Jl. Mawun No.3, Kuta, Kec. Pujut, Kabupaten Lombok Tengah, Nusa Tenggara Bar. 83573', 2250, '258404836.jpg', '258404822.jpg', 'Sunyi-Villas-Kuta-Exterior.jpg'),
(10, 'Telescope Villas ', 'Telescope Villa Lombok adalah sebuah vila eksklusif yang terletak di Pulau Lombok, Nusa Tenggara Barat, Indonesia. Vila ini menawarkan pengalaman menginap yang mewah dan unik dengan sentuhan astronomi yang menarik.\r\n\r\nTelescope Villa Lombok didesain dengan konsep yang menggabungkan kemewahan dan observasi bintang yang menakjubkan. Setiap vila dilengkapi dengan fasilitas lengkap, termasuk kamar tidur yang elegan, ruang tamu yang nyaman, dapur lengkap, dan area lounge dengan teleskop profesional untuk memandangi langit malam yang indah.\r\n\r\nVila-vila ini menawarkan pengalaman yang luar biasa bagi para pecinta astronomi, di mana tamu dapat mengamati bintang, planet, dan fenomena langit lainnya dengan bantuan teleskop yang tersedia. Pemandangan langit yang jernih dan minim polusi cahaya di Pulau Lombok menciptakan pengalaman yang menakjubkan bagi pengunjung.\r\n\r\nFasilitas lain yang disediakan di Telescope Villa Lombok meliputi kolam renang pribadi, restoran dengan hidangan lezat, bar, spa untuk relaksasi, dan pelayanan yang ramah dan profesional. Staf yang berpengalaman akan membantu tamu dengan segala kebutuhan mereka untuk memastikan tinggal mereka menjadi pengalaman yang tak terlupakan.\r\n\r\nLokasi Telescope Villa Lombok juga memungkinkan akses mudah ke objek wisata lain di sekitarnya, seperti pantai-pantai indah, air terjun, dan tempat-tempat menarik lainnya di Pulau Lombok.\r\n\r\nTelescope Villa Lombok adalah pilihan sempurna bagi mereka yang mencari pengalaman menginap yang unik dan menakjubkan dengan fokus pada astronomi. Dengan fasilitas yang lengkap, pengamatan langit yang spektakuler, dan keramahan yang hangat, Telescope Villa Lombok menawarkan pengalaman liburan yang luar biasa bagi para pecinta alam semesta.', 'Telescope Villa Lombok adalah sebuah vila eksklusif yang terletak di Pulau Lombok, Nusa Tenggara Barat, Indonesia. Vila ini menawarkan pengalaman menginap yang mewah dan unik dengan sentuhan astronomi yang menarik.', '47C7+2H4, Prabu, Kec. Pujut, Kabupaten Lombok Tengah, Nusa Tenggara Bar. 83573', 900, '376300793.jpg', 'Telescope-Resort-Lombok-Kuta-Exterior (1).jpg', 'Telescope-Resort-Lombok-Kuta-Exterior.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE `wishlist` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `location` varchar(200) NOT NULL,
  `details_mini` varchar(500) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `wishlist`
--

INSERT DELAYED IGNORE INTO `wishlist` (`id`, `user_id`, `pid`, `name`, `location`, `details_mini`, `image`) VALUES
(5, 38, 10, 'Bukit Merese', '', '', 'bukit merese.jpg');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `villas`
--
ALTER TABLE `villas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `message`
--
ALTER TABLE `message`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT untuk tabel `villas`
--
ALTER TABLE `villas`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
