CREATE DATABASE PerpusTeknik;

USE PerpusTeknik;

CREATE TABLE `Buku` (
  `nomorKlas` varchar(10) NOT NULL PRIMARY KEY,
  `judul` varchar(255) NOT NULL
);

CREATE TABLE `Anggota_Perpus` (
  `nomorAnggota` varchar(12) NOT NULL PRIMARY KEY,
  `npm` varchar(12) DEFAULT NULL UNIQUE,
  `namaPeminjam` varchar(255) DEFAULT NULL,
  `pekerjaan` enum('Dosen', 'Mahasiswa', 'Staff') NOT NULL,
  `jurusan` enum('Arsitektur', 'Sipil', 'Mesin', 'Industri', 'Informatika', 'Elektro', 'Perkeretaapian') NOT NULL,
  `alamat` varchar(255) NOT NULL
);

CREATE TABLE `Pinjam` (
  `idPeminjaman` int(10) NOT NULL PRIMARY KEY,
  `nomorAnggota` varchar(12) NOT NULL,
  `nomorKlas` varchar(10) NOT NULL,
  `tgl` date NOT NULL,  -- "YYYY-MM-DD" --
  `signature` varchar(255) NOT NULL,
  FOREIGN KEY (nomorAnggota) REFERENCES Anggota_Perpus(nomorAnggota),
  FOREIGN KEY (nomorKlas) REFERENCES Buku(nomorKlas)
);

INSERT INTO Buku VALUES
  ('AR001', 'Arsitektur Hijau'),
  ('AR002', 'Desain Interior Modern'),
  ('EL001', 'Pengenalan Jaringan Dasar LAN'),
  ('EL002', 'Mikrokontroler dan Pemrogramannya'),
  ('IN001', 'Statistik untuk Teknik Industri'),
  ('IN002', 'Manajemen Rantai Pasok'),
  ('IT001', 'Pemrograman Dasar Java'),
  ('IT002', 'Pemrograman Dasar Python'),
  ('TM001', 'Teknik Fluida'),
  ('TM002', 'Termodinamika dalam Mesin'),
  ('TP001', 'Teknik Pemeliharaan Jalur Kereta Api'),
  ('TP002', 'Sistem Sinyal Perkeretaapian'),
  ('TS001', 'Teknik Drainase'),
  ('TS002', 'Struktur Beton')
;

INSERT INTO Anggota_Perpus VALUES
  ('IT / 0001', '4522210094', 'Adam Kaze', 'Mahasiswa', 'Informatika', 'JL.PAGENTONGAN NO.9 RT02/06 BOGOR'),
  ('IN / 0002', '4522210098', 'Muhammad Azhar Rabbani', 'Mahasiswa', 'Industri', 'JL.OLAHRAGA 1 NO.47 RT08/05 JAKARTA TIMUR'),
  ('E / 0003', '4522210147', 'Dhandi Adam', 'Mahasiswa', 'Elektro', 'JL.KEBAGUSAN RAYA 1 NO.31 RT01/04 JAKARTA SELATAN')
;

INSERT INTO Pinjam VALUES
  (1, 'IT / 0001', 'EL001', '2023-11-08', 'C:/Signature/my_signature.jpg'),
  (2, 'IN / 0002', 'IT002', '2023-11-08', 'C:/Signature/signature_098.jpg'),
  (3, 'IT / 0001', 'IT001', '2023-11-09', 'C:/Signature/my_signature.jpg')
;