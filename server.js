
const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');
const path = require('path');
const multer = require('multer');
const fs = require('fs');

const app = express();
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, 'public')));

// Pastikan folder public/uploads ada
const uploadDir = path.join(__dirname, 'public', 'uploads');
if (!fs.existsSync(uploadDir)) {
    fs.mkdirSync(uploadDir, { recursive: true });
}

// Konfigurasi Multer untuk Upload Dokumen/File
const storage = multer.diskStorage({
    destination: (req, file, cb) => cb(null, uploadDir),
    filename: (req, file, cb) => cb(null, Date.now() + '-' + file.originalname)
});
const upload = multer({ storage: storage });

// Koneksi ke Database MySQL XAMPP
const db = mysql.createConnection({
    host: process.env.DB_HOST || 'localhost',
    user: process.env.DB_USER || 'root',
    password: process.env.DB_PASSWORD || '',
    database: process.env.DB_NAME || 'pbp_db',
    port: process.env.DB_PORT || 3306
});

db.connect(err => {
    if (err) {
        console.error('Koneksi MySQL Gagal:', err);
        return;
    }
    console.log('Berhasil terhubung ke database MySQL pbp_db!');
});

// API Get Materi
app.get('/api/materi', (req, res) => {
    const kategori = req.query.kategori;
    let query = 'SELECT * FROM materi';
    let params = [];

    if (kategori && kategori !== 'Semua') {
        query += ' WHERE kategori = ?';
        params.push(kategori);
    }
    query += ' ORDER BY pertemuan ASC';

    db.query(query, params, (err, results) => {
        if (err) return res.status(500).json({ sukses: false, pesan: err.message });
        res.json({ sukses: true, data: results });
    });
});

// API Tambah Materi
app.post('/api/materi', (req, res) => {
    const { pertemuan, kategori, judul, tujuan, isi, lkp } = req.body;
    const query = 'INSERT INTO materi (pertemuan, kategori, judul, tujuan, isi, lkp) VALUES (?, ?, ?, ?, ?, ?)';
    db.query(query, [pertemuan, kategori, judul, tujuan, isi, lkp], (err, result) => {
        if (err) return res.status(500).json({ sukses: false, pesan: err.message });
        res.json({ sukses: true, id: result.insertId });
    });
});

// API Edit Materi
app.put('/api/materi/:id', (req, res) => {
    const { pertemuan, kategori, judul, tujuan, isi, lkp } = req.body;
    const query = 'UPDATE materi SET pertemuan=?, kategori=?, judul=?, tujuan=?, isi=?, lkp=? WHERE id=?';
    db.query(query, [pertemuan, kategori, judul, tujuan, isi, lkp, req.params.id], (err) => {
        if (err) return res.status(500).json({ sukses: false, pesan: err.message });
        res.json({ sukses: true });
    });
});

// API Hapus Materi
app.delete('/api/materi/:id', (req, res) => {
    db.query('DELETE FROM materi WHERE id = ?', [req.params.id], (err) => {
        if (err) return res.status(500).json({ sukses: false, pesan: err.message });
        res.json({ sukses: true });
    });
});

// API Get Tugas
app.get('/api/tugas', (req, res) => {
    db.query('SELECT * FROM tugas_mahasiswa ORDER BY submitted_at DESC', (err, results) => {
        if (err) return res.status(500).json({ sukses: false, pesan: err.message });
        res.json({ sukses: true, data: results });
    });
});

// API Submit Tugas dengan Upload File
app.post('/api/tugas', upload.single('file_tugas'), (req, res) => {
    const { pertemuan, nim, nama_mahasiswa, link_tugas, catatan } = req.body;
    const file_path = req.file ? `/uploads/${req.file.filename}` : '';

    const query = 'INSERT INTO tugas_mahasiswa (pertemuan, nim, nama_mahasiswa, link_tugas, file_path, catatan) VALUES (?, ?, ?, ?, ?, ?)';
    db.query(query, [pertemuan, nim, nama_mahasiswa, link_tugas || '', file_path, catatan], (err, result) => {
        if (err) return res.status(500).json({ sukses: false, pesan: err.message });
        res.json({ sukses: true, id: result.insertId });
    });
});

const PORT = 3000;
app.listen(PORT, () => {
    console.log(`Server berjalan mulus di http://localhost:${PORT}`);
});