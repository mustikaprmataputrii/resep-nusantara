# LAPORAN UJIAN TENGAH SEMESTER MOBILE PROGRAMMING

## Aplikasi Resep Makanan Rasa Nusantara

Nama: Sri Mustika Indah Permata Putri  
NIM: 240605110159  
Kelas: L

**JURUSAN TEKNIK INFORMATIKA**  
**FAKULTAS SAINS DAN TEKNOLOGI**  
**UNIVERSITAS ISLAM NEGERI MAULANA MALIK IBRAHIM MALANG**  
**GANJIL 2025/2026**

## 2. Pendahuluan

Rasa Nusantara adalah aplikasi resep makanan yang menyajikan inspirasi masakan Indonesia. Pengguna dapat melihat resep pilihan, mencari masakan berdasarkan nama atau daerah, menyaring daftar berdasarkan kategori, membaca petunjuk memasak, dan menyimpan resep favorit.

Tema kuliner dipilih karena resep merupakan informasi sehari-hari yang berguna dan mudah dipahami melalui perangkat mobile. Daftar resep terstruktur membantu pengguna menemukan ide masakan, sedangkan detail bahan dan langkah memasak dapat dibaca saat menyiapkan hidangan.

Pengembangan ini relevan dengan pemrograman mobile karena menerapkan antarmuka yang dapat digulir, navigasi ant halaman, interaksi pencarian dan filter, serta penyajian data pada layar berukuran kecil. Data contoh disimpan lokal untuk tahap rancangan dan dapat disambungkan ke API ketika layanan server tersedia.

Tujuan aplikasi adalah membuat antarmuka resep menggunakan Flutter/Dart, menerapkan halaman yang saling terhubung, mengolah data dummy terstruktur, dan menyusun tata letak yang proporsional pada berbagai ukuran layar.

## 3. Perancangan Antarmuka (UI Design)

Antarmuka memakai tema masakan Nusantara dan prinsip clean interface. Latar krem (`#FAF8F2`) memberi kesan hangat, aksen hijau zaitun (`#687354`) dipakai untuk tombol dan penanda aktif, sedangkan kartu putih membedakan kelompok informasi dari latar.

Ikon Material digunakan untuk pencarian, kategori, bookmark, waktu, dan navigasi. Emoji makanan menjadi penanda visual tiap resep. Tipografi sans serif dengan judul tegas dan teks isi yang lebih kecil membentuk hierarki informasi. Tata letak memakai kartu, jarak antarelemen konsisten, serta area gulir untuk daftar panjang.

Rancangan awal mandiri yang menjadi acuan visual disertakan pada `assets/ui_design_rasa_nusantara.svg` dan ditampilkan di bagian ini pada versi PDF.

## 4. Implementasi Program

### Struktur halaman dan navigasi

- **Beranda:** resep pilihan, kategori, dan resep populer.
- **Jelajah:** pencarian nama/daerah, filter kategori, dan daftar resep.
- **Detail Resep:** deskripsi, durasi, kesulitan, bahan, dan langkah memasak.
- **Tersimpan:** daftar resep yang ditandai favorit.

`NavigationBar` menghubungkan Beranda, Jelajah, dan Tersimpan. Pemilihan resep membuka Detail Resep melalui `NavigatorState.push` dengan `MaterialPageRoute`.

### Widget, layout, dan data

Widget yang digunakan antara lain `Scaffold`, `SafeArea`, `CustomScrollView`, `SliverList`, `ListView`, `Row`, `Column`, `Container`, `Card`, `ChoiceChip`, `TextField`, dan `NavigationBar`. Konten dibatasi maksimal 760 piksel pada layar lebar dan mengikuti lebar layar ponsel.

Data lima resep lokal berada di `lib/data/sample_recipes.dart`. Model `Recipe` di `lib/models/recipe.dart` menyediakan `fromJson` dan `toJson` untuk memudahkan pemetaan data API di tahap berikutnya.

Cuplikan kode navigasi dan pemetaan JSON disediakan di PDF. **Screenshot hasil belum dimasukkan:** halaman PDF 5–6 menyediakan area kosong untuk screenshot Beranda, Jelajah, Detail Resep, dan Tersimpan.

## 5. Hasil dan Pembahasan

Implementasi mengikuti rancangan melalui warna krem dan hijau zaitun, kartu putih, ikon yang sesuai fungsi, serta hierarki teks yang jelas. Pengguna dapat berpindah antarhalaman utama melalui `NavigationBar`; kartu resep membuka detail; pencarian dan filter menyaring data lokal; tombol bookmark memperbarui daftar Tersimpan.

Konten dibatasi lebarnya di layar besar dan dapat mengikuti lebar ponsel. Pemeriksaan `flutter analyze --no-pub` tidak menemukan masalah dan build Flutter Web berhasil dibuat. Pengembangan berikutnya dapat menambahkan foto resep, penyimpanan favorit permanen, integrasi API, dan pengujian pada beragam perangkat.

## 6. Kesimpulan

Aplikasi Rasa Nusantara berhasil dirancang dan diimplementasikan menggunakan Flutter dan Dart. Aplikasi memiliki halaman Beranda, Jelajah, Detail Resep, dan Tersimpan dengan navigasi antarlayar. Widget Flutter digunakan untuk menyusun layout, menampilkan data resep, serta menerima interaksi pencarian, filter, dan penyimpanan favorit.

Data dummy dipisahkan dari antarmuka dan model mendukung pemetaan JSON sebagai dasar integrasi API. Analisis statis bersih, build Flutter Web berhasil, dan rancangan UI mandiri menjadi acuan visual implementasi.

**Repository:** https://github.com/mustikaprmataputrii/resep-nusantara  
**Branch:** `main` · **Commit project:** `a29f7d4`
