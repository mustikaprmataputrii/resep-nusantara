# Rasa Nusantara

Aplikasi resep makanan berbasis Flutter yang membantu pengguna menemukan inspirasi masakan rumahan Indonesia. Proyek UTS Mobile Programming ini memakai data dummy lokal dengan struktur model yang siap dipindahkan ke sumber API.

## Halaman dan navigasi

- **Beranda**: resep pilihan, kategori, dan daftar resep populer.
- **Jelajah**: pencarian resep berdasarkan nama/daerah dan filter kategori.
- **Tersimpan**: koleksi resep favorit selama aplikasi berjalan.
- **Detail resep**: deskripsi, daerah asal, rating, durasi, tingkat kesulitan, bahan, dan langkah memasak. Halaman dibuka dengan `Navigator.push`.
- Navigasi utama menggunakan `NavigationBar` Material 3.

## Struktur proyek

```text
lib/
  main.dart       # Model Recipe, data dummy, navigasi, dan seluruh halaman UI
screenshots/      # Screenshot hasil implementasi untuk laporan
Laporan_UTS_Rasa_Nusantara.pdf   # Draf laporan UTS
Laporan_UTS_Rasa_Nusantara.html  # Sumber laporan yang dapat diedit
```

Data resep saat ini didefinisikan di `lib/main.dart` sebagai `List<Recipe>`. Untuk integrasi API, model dapat dipindahkan ke folder `models/`, data ke `services/`, lalu tambahkan serialisasi `fromJson` dan layanan HTTP tanpa mengubah kontrak widget yang memakai `Recipe`.

## Menjalankan aplikasi

Pastikan Flutter SDK sudah terpasang, lalu dari folder proyek jalankan:

```bash
flutter pub get
flutter run
```

Untuk memilih perangkat yang tersedia:

```bash
flutter devices
flutter run -d <device-id>
```

## Tema visual

Antarmuka menggunakan latar krem, aksen hijau zaitun, kartu putih, ikon Material, dan ilustrasi emoji makanan agar aplikasi tetap ringan dan dapat dipakai tanpa koneksi gambar eksternal. Layout memakai `CustomScrollView`, `SliverList`, `ListView`, `Row`, `Column`, `Card`, dan `NavigationBar`.

## Pengembangan lanjutan

Favorit saat ini disimpan dalam state selama aplikasi aktif. Pengembangan berikutnya dapat menambahkan penyimpanan lokal, API resep, gambar hidangan, akun pengguna, dan pengujian widget.

## Laporan UTS

Draf laporan tersedia sebagai `Laporan_UTS_Rasa_Nusantara.pdf`, dengan sumber HTML yang dapat diedit. Sebelum dikumpulkan, lengkapi NIM, kelas, fakultas/logo, tambahkan screenshot halaman Jelajah dan Detail, lalu unggah PDF final ke Google Drive.
