-- SOAL 1 : Buat Table & Database
CREATE DATABASE books_store;

CREATE TABLE books (
    Id_Buku INTEGER AUTO_INCREMENT PRIMARY KEY,
    Judul_Buku VARCHAR(255),
    Pengarang VARCHAR(255),
    Tahun_Terbit INTEGER,
    Penerbit VARCHAR(255),
    Tanggal_Dibuat DATE,
    Tanggal_Diupdate DATE);

CREATE TABLE category (
    Id_Category INTEGER AUTO_INCREMENT PRIMARY KEY,
    Nama_Category VARCHAR(255),
    Tanggal_Dibuat DATE,
    Tanggal_Diupdate DATE);

-- SOAL 2 : Tambahkan Data Baru

INSERT INTO books (Judul_Buku, Pengarang, Tahun_Terbit, Penerbit, Tanggal_Dibuat, Tanggal_Diupdate)
VALUES
    ('Building Microservices', 'Sam Newman', '2014', 'O`Reilly Media', '2023-09-18', '2023-09-18'),
    ('Clean Code', 'Robert C. Martin', '2008', 'Prentice Hall', '2023-09-18', '2023-09-18'),
    ('The Pragmatic Programmer', 'Andrew Hunt', '1999', 'Addison-Wesley', '2023-09-18', '2023-09-18'),
    ('Design Patterns', 'Erich Gamma', '1994', 'Addison-Wesley', '2023-09-18', '2023-09-18'),
    ('Introduction to Algorithms', 'Thomas H. Cormen', '1990', 'MIT Press', '2023-09-18', '2023-09-18'),
    ('The Art of Computer Programming', 'Donald E. Knuth', '1968', 'Addison-Wesley', '2023-09-18', '2023-09-18'),
    ('Clean Architecture', 'Robert C. Martin', '2017', 'Prentice Hall', '2023-09-18', '2023-09-18'),
    ('Refactoring', 'Martin Fowler', '1999', 'Addison-Wesley', '2023-09-18', '2023-09-18'),
    ('Domain-Driven Design', 'Eric Evans', '2003', 'Addison-Wesley', '2023-09-18', '2023-09-18'),
    ('The Mythical Man-Month', 'Frederick Brooks', '1975', 'Addison-Wesley', '2023-09-18', '2023-09-18');

INSERT INTO category (Nama_Category, Tanggal_Dibuat, Tanggal_Diupdate)
VALUES
    ('Pemrograman', '2023-09-18', '2023-09-18'),
    ('Fiksi', '2023-09-18', '2023-09-18'),
    ('Nonfiksi', '2023-09-18', '2023-09-18'),
    ('Bisnis', '2023-09-18', '2023-09-18'),
    ('Teknologi', '2023-09-18', '2023-09-18'),
    ('Seni', '2023-09-18', '2023-09-18'),
    ('Sejarah', '2023-09-18', '2023-09-18'),
    ('Sains', '2023-09-18', '2023-09-18'),
    ('Hukum', '2023-09-18', '2023-09-18'),
    ('Kesehatan', '2023-09-18', '2023-09-18');

-- SOAL 3 : Tampilkan Semua Data
SELECT * FROM books;
SELECT * FROM category;

-- SOAL 4 : Update Data Tertentu
UPDATE books SET Judul_Buku = 'Building Microservices: Designing Fine-Grained Systems 1st',
    Tahun_Terbit = 2015, Tanggal_Diupdate = '2023-09-20' WHERE Id_Buku = 1;


-- SOAL 5 : Hapus Data Tertentu
DELETE FROM books WHERE Id_Buku = 10;
DELETE FROM category WHERE Id_Category = 10;

-- SOAL 6 : Tampilkan Data Buku Tertentu
SELECT Judul_Buku FROM Books WHERE Penerbit = 'Addison-Wesley';

SELECT * FROM books WHERE Tahun_Terbit BETWEEN 2003 AND 2023;

SELECT * FROM books WHERE Judul_Buku LIKE '%design%';

-- SOAL 7 : Buatlah Tabel Book Category
CREATE TABLE book_categories (
    Id INTEGER AUTO_INCREMENT PRIMARY KEY,
    Id_Category INTEGER,
    Id_Book INTEGER,
    Tanggal_Dibuat DATE,
    Tanggal_Diupdate DATE,
    FOREIGN KEY (Id_Category) REFERENCES category(Id_Category),
    FOREIGN KEY (Id_Book) REFERENCES books(Id_Buku));

-- SOAL 8 : Tambahkan Data Baru Pada Tabel Book Category
INSERT INTO book_categories (Id_Category, Id_Book, Tanggal_Dibuat, Tanggal_Diupdate)
VALUES (1, 2, '2023-09-18', '2023-09-18'),
       (5, 3, '2023-09-18', '2023-09-18'),
       (1, 1, '2023-09-18', '2023-09-18');

-- SOAL 9 : Tampilkan Data Relasi Antar Tabel
SELECT b.Id_Buku AS id, b.Judul_Buku AS judul_buku, c.Nama_Category AS nama_category
FROM books AS b
JOIN book_categories AS bc ON b.Id_Buku = bc.Id_Book
JOIN category AS c ON bc.Id_Category = c.Id_Category;

-- SOAL 10 : Ubah Struktur Tabel
ALTER TABLE books ADD Jumlah_Halaman INT;
