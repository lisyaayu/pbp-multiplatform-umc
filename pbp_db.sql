-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2026 at 06:00 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pbp_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `materi`
--

CREATE TABLE `materi` (
  `id` int(11) NOT NULL,
  `pertemuan` int(11) NOT NULL,
  `kategori` enum('Umum','Web','Desktop','Mobile') NOT NULL,
  `judul` varchar(200) NOT NULL,
  `tujuan` text NOT NULL,
  `isi` text NOT NULL,
  `lkp` varchar(200) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `materi`
--

INSERT INTO `materi` (`id`, `pertemuan`, `kategori`, `judul`, `tujuan`, `isi`, `lkp`, `created_at`) VALUES
(1, 1, 'Umum', 'Pengenalan Pemrograman Berbasis Platform & Setup Environment', 'Menjelaskan konsep platform dan perbedaannya.\nMenyiapkan lingkungan pengembangan (tools & VCS).', 'Platform adalah kombinasi hardware dan software yang menjadi lingkungan berjalannya aplikasi. Platform menentukan cara aplikasi dibangun, didistribusikan, dan digunakan.\n\nJenis platform: Web (berjalan di browser, tanpa instalasi), Desktop (terinstal di OS, bisa offline), Mobile (terinstal di smartphone, akses sensor & GPS), Game, dan Industrial/IoT.\n\nArsitektur dasar: Client-Server, Event-Driven, serta Native vs Cross-Platform.\n\nEkosistem pengembangan: VCS (Git, GitHub), package manager (NPM, Gradle/Maven), IDE (VS Code, IntelliJ IDEA, Android Studio), dan runtime (Node.js, JVM, Android Runtime).\n\nPraktikum: install Git, Node.js, VS Code, IntelliJ IDEA, Android Studio; buat repository GitHub; buat Hello World di Web, Node.js, dan Java Desktop; isi tabel analisis platform.', 'LKP 1 - Setup Environment & Eksplorasi Platform', '2026-11-07 14:58:15'),
(2, 2, 'Web', 'HTML5 & CSS Dasar', 'Membangun struktur halaman web dengan HTML5 semantik.\nMenerapkan CSS untuk styling dasar.', 'Struktur HTML5 semantik: header, nav, main, section, article, aside, footer.\n\nElemen penting: heading h1-h6, paragraf, list (ul/ol), link, gambar (img + alt), form (input, textarea, button), dan tabel.\n\nCSS dasar: cara menyisipkan CSS (inline, internal, eksternal - eksternal direkomendasikan), selector (element, class, id, pseudo-class), box model, dan Flexbox untuk layout.\n\nPraktikum: membuat halaman profil pribadi statis dengan HTML5 semantik dan stylesheet eksternal.', 'LKP 2A - Halaman Profil Pribadi dengan HTML5 & CSS', '2026-11-07 14:58:15'),
(3, 3, 'Web', 'Responsive Design', 'Menerapkan prinsip responsive design dengan media queries.', 'Responsive design membuat tampilan menyesuaikan ukuran layar (mobile, tablet, desktop). Pendekatan yang disarankan adalah mobile-first: mulai dari layar kecil lalu ditingkatkan untuk layar besar.\n\nViewport meta tag wajib ada agar browser mobile tidak melakukan zoom-out otomatis.\n\nMedia queries dengan min-width mengatur perubahan layout pada breakpoint umum (sekitar 480px, 768px, 1024px, 1200px).\n\nSatuan relatif (%, em, rem, vw, vh) dan gambar responsif (max-width: 100%) membantu layout fleksibel.\n\nPraktikum: mengubah halaman profil menjadi responsif dan mengambil 3 screenshot (mobile, tablet, desktop).', 'LKP 2B - Membuat Halaman Profil Responsif', '2026-11-07 14:58:15'),
(4, 4, 'Web', 'JavaScript Fundamentals & DOM', 'Menggunakan JavaScript ES6+ untuk logika aplikasi.\nMemanipulasi DOM dan menangani event.', 'Dasar JavaScript ES6+: variabel (let/const) dan tipe data, function dan arrow function, destructuring, serta array methods (map, filter, find, forEach).\n\nDOM manipulation: memilih elemen (getElementById, querySelector), mengubah isi dan style, membuat dan menghapus elemen.\n\nEvent handling memakai addEventListener (click, input, keydown). localStorage dipakai untuk menyimpan data di browser.\n\nPraktikum: aplikasi To-Do List (tambah, tandai selesai, hapus) dengan JavaScript murni.', 'LKP 3A - Aplikasi To-Do List dengan JavaScript Murni', '2026-11-07 14:58:15'),
(5, 5, 'Web', 'React Fundamentals', 'Membangun aplikasi React dengan komponen dan state.', 'React adalah library JavaScript untuk membangun UI berbasis komponen. Project disiapkan dengan Vite.\n\nKonsep inti: JSX, component dan props, state dengan useState, efek samping dengan useEffect, serta rendering list dengan key.\n\nPraktikum: mengonversi To-Do List JavaScript murni menjadi aplikasi React dengan beberapa komponen.', 'LKP 3B - Konversi To-Do List ke React', '2026-11-07 14:58:15'),
(6, 6, 'Web', 'Back-End dengan Express.js', 'Membangun server Express dan RESTful API dasar.', 'Node.js adalah runtime JavaScript di sisi server, dengan NPM sebagai package manager. Express adalah framework untuk membuat server dan routing.\n\nRESTful API memakai HTTP methods: GET (baca), POST (tambah), PUT (ubah), DELETE (hapus). Status code penting: 200 OK, 201 Created, 400 Bad Request, 404 Not Found, 500 Server Error.\n\nRouting dengan parameter (/api/items/:id) dan membaca request body JSON.\n\nPraktikum: membuat REST API in-memory dan mengujinya dengan Postman.', 'LKP 4A - RESTful API Sederhana dengan Express', '2026-11-07 14:58:15'),
(7, 7, 'Web', 'Integrasi Database (MongoDB)', 'Menghubungkan Express dengan MongoDB menggunakan Mongoose.', 'MongoDB adalah database NoSQL berbasis dokumen; Mongoose adalah ODM untuk Node.js. Langkahnya: koneksi ke MongoDB Atlas, membuat Schema dan Model, lalu operasi CRUD (create, find, findByIdAndUpdate, findByIdAndDelete).\n\nGunakan async/await dengan try-catch untuk error handling dan kirim status code yang tepat.\n\nPraktikum: mengubah REST API in-memory menjadi API yang menyimpan data permanen di MongoDB Atlas.', 'LKP 4B - Integrasi API dengan MongoDB Atlas', '2026-11-07 14:58:15'),
(8, 8, 'Web', 'UTS - Proyek Web Full-Stack', 'Membangun aplikasi web full-stack sederhana secara individu.', 'Ketentuan UTS: Front-End React minimal 3 komponen, Back-End Express + MongoDB, minimal 3 operasi CRUD pada satu entitas, UI responsif di mobile dan desktop.\n\nPengumpulan: repository GitHub, video demo (maks 3 menit), dan README.md berisi cara install & run.\n\nRubrik: kelengkapan CRUD 30, integrasi front-end & back-end 25, kualitas UI/UX 20, struktur kode 15, dokumentasi & demo 10.', 'Proyek individu (tanpa LKP)', '2026-11-07 14:58:15'),
(9, 9, 'Desktop', 'Konsep Event-Driven Programming & JavaFX', 'Memahami konsep event-driven programming (EDP).\nMembuat aplikasi JavaFX dasar.', 'Event-Driven Programming: alur program ditentukan oleh event seperti klik dan input keyboard. Komponennya: event source, event object, dan event handler/listener. Alur: User Action > Event Source > Event Object > Event Handler > Response.\n\nJavaFX adalah framework GUI modern untuk Java dengan konsep Stage (jendela), Scene (isi jendela), Node (elemen UI), dan Layout (VBox, HBox, GridPane, BorderPane).\n\nKomponen UI dasar: Label, Button, TextField. Event handling memakai setOnAction.\n\nPraktikum: aplikasi sapaan sederhana dengan input nama dan tombol.', 'LKP 5A - Aplikasi JavaFX \"Halo, JavaFX!\"', '2026-11-07 14:58:15'),
(10, 10, 'Desktop', 'Event Handling Lanjutan & Aplikasi Kalkulator', 'Membuat aplikasi dengan multiple event handler (kalkulator).', 'GridPane dipakai untuk menata tombol kalkulator. Banyak tombol dapat ditangani dengan satu handler yang membaca teks tombol.\n\nState kalkulator disimpan sebagai operand pertama, operator, dan input saat ini. Pembagian dengan nol harus ditangani agar aplikasi tidak error.\n\nPraktikum: membuat kalkulator JavaFX dengan operasi dasar dan penanganan division by zero.', 'LKP 5B - Aplikasi Kalkulator JavaFX', '2026-11-07 14:58:15'),
(11, 11, 'Mobile', 'Android Fundamentals & UI Dasar', 'Membuat project Android dan UI dasar dengan Jetpack Compose.', 'Struktur project Android: folder java/kotlin, res, AndroidManifest.xml (komponen, permission, activity), dan Gradle.\n\nJetpack Compose adalah toolkit UI deklaratif (alternatif dari XML). Konsepnya: composable function, state, komponen UI umum (Text, Button, TextField, Column, Row), dan Modifier.\n\nPraktikum: aplikasi Halo Android dengan input, output, dan state, diuji di emulator.', 'LKP 6A - Aplikasi \"Halo Android\" dengan Compose', '2026-11-07 14:58:15'),
(12, 12, 'Mobile', 'Activity Lifecycle & State Management', 'Memahami Activity Lifecycle Android.\nMenyimpan state saat konfigurasi berubah (rotasi).', 'Lifecycle Activity: onCreate, onStart, onResume, onPause, onStop, onDestroy. Rotasi layar membuat Activity dibuat ulang sehingga state biasa hilang.\n\nrememberSaveable menyimpan state melewati perubahan konfigurasi, sedangkan remember tidak. Logging lifecycle dilihat lewat Logcat.\n\nPraktikum: membandingkan remember dan rememberSaveable saat layar diputar.', 'LKP 6B - Eksplorasi Activity Lifecycle', '2026-11-07 14:58:15'),
(13, 13, 'Mobile', 'Persistensi Data dengan Room', 'Mengimplementasikan Room database untuk CRUD lokal.', 'Room adalah library ORM resmi Android (bagian Jetpack) di atas SQLite. Komponennya: Entity (tabel), DAO (query), Database, dan ViewModel untuk mengelola data UI.\n\nPraktikum: aplikasi catatan dengan CRUD lokal yang datanya tetap ada setelah aplikasi ditutup.', 'LKP 6C - Aplikasi Catatan dengan Room', '2026-11-07 14:58:15'),
(14, 14, 'Mobile', 'Konsumsi API dari Android (Retrofit)', 'Mengonsumsi REST API dari aplikasi Android menggunakan Retrofit.', 'Retrofit adalah library HTTP client untuk Android. Langkahnya: tambah dependency, buat data class, definisikan interface API (GET, POST, PUT, DELETE), setup Retrofit dengan BASE_URL, lalu panggil dari ViewModel.\n\nCatatan: emulator mengakses localhost komputer lewat 10.0.2.2. Traffic http (cleartext) perlu diizinkan di manifest saat pengembangan.\n\nPraktikum: aplikasi Android yang mengambil dan mengubah data dari REST API.', 'LKP 7 - Aplikasi Android Konsumsi REST API', '2026-11-07 14:58:15'),
(15, 15, 'Umum', 'Finalisasi Proyek Akhir & Deployment', 'Memahami proses deployment aplikasi multi-platform.\nMenyiapkan dokumentasi proyek akhir.', 'Deployment: web (Vercel), backend (Railway/Render), mobile (Generate Signed APK dengan keystore), dan desktop (JAR atau jpackage).\n\nREADME minimal berisi deskripsi, arsitektur, teknologi, cara install & run, dokumentasi API, screenshot, dan pembagian tugas tim.\n\nPresentasi 10 menit: latar belakang, arsitektur, demo live, tantangan, dan tanya jawab.', 'Konsultasi Proyek Akhir', '2026-11-07 14:58:15'),
(16, 16, 'Umum', 'UAS - Presentasi & Demo Proyek Akhir', 'Mempresentasikan dan mendemokan solusi multi-platform.', 'Presentasi 10 menit + 5 menit Q&A, dengan demo live web, mobile, dan backend.\n\nSkenario demo wajib: buka web dan mobile bersamaan, tambah data di mobile, refresh di web (data muncul), hapus di web, refresh di mobile (data hilang).\n\nPengumpulan H-1: link repository, link deploy, APK release, slide (PDF), dan video demo.', 'Presentasi kelompok', '2026-11-07 14:58:15');

-- --------------------------------------------------------

--
-- Table structure for table `tugas_mahasiswa`
--

CREATE TABLE `tugas_mahasiswa` (
  `id` int(11) NOT NULL,
  `pertemuan` int(11) NOT NULL,
  `nim` varchar(50) NOT NULL,
  `nama_mahasiswa` varchar(200) NOT NULL,
  `link_tugas` text NOT NULL,
  `file_path` text DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `materi`
--
ALTER TABLE `materi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tugas_mahasiswa`
--
ALTER TABLE `tugas_mahasiswa`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `materi`
--
ALTER TABLE `materi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tugas_mahasiswa`
--
ALTER TABLE `tugas_mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
