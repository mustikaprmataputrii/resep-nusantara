# Laporan UTS Mobile Programming — Rasa Nusantara

> Lengkapi NIM, kelas, dan logo fakultas sebelum laporan dikumpulkan. Tambahkan screenshot aplikasi pada bagian 3 dan 4 setelah aplikasi dijalankan pada perangkat/emulator.

## Halaman Judul

**RASA NUSANTARA — APLIKASI RESEP MASAKAN INDONESIA**  
Laporan Ujian Tengah Semester Mobile Programming  
Semester Ganjil 2025/2026

- Nama: Sri Mustika Indah Permata Putri
- NIM: **[lengkapi]**
- Kelas: **[lengkapi]**
- Fakultas/Universitas: **[lengkapi]**
- Logo fakultas: **[sisipkan logo resmi]**

## 1. Pendahuluan

Rasa Nusantara adalah aplikasi mobile untuk menjelajahi resep masakan Indonesia dan kreasi rumahan. Aplikasi menampilkan resep secara ringkas, lalu menyediakan bahan dan cara memasak dalam halaman detail. Tema ini dipilih karena resep merupakan informasi praktis yang mudah dijelajahi melalui perangkat mobile dan dapat dikembangkan dengan katalog/API resep.

Tujuan proyek adalah menerapkan widget Flutter, layout responsif, navigasi ant halaman, serta pengolahan data dummy terstruktur. Data disimpan dalam model `Recipe` agar nantinya dapat dipetakan dari JSON API.

## 2. Perancangan Antarmuka (UI Design)

Konsep visual memakai gaya editorial kuliner yang bersih dan hangat. Latar krem (`#FAF8F2`) memberi kesan rumahan, aksen hijau zaitun (`#687354`) dipakai untuk navigasi dan tindakan utama, sedangkan kartu putih menjaga keterbacaan. Judul memakai hierarki tebal, informasi pendukung memakai abu-abu, dan ilustrasi emoji makanan memberi identitas hidangan tanpa aset eksternal.

Struktur layar dirancang sebagai berikut:

1. Beranda: identitas aplikasi, sapaan, pencarian, kartu resep pilihan, kategori, resep populer.
2. Jelajah: kolom pencarian, filter kategori, dan daftar kartu resep.
3. Detail: ilustrasi hidangan, informasi ringkas, bahan, dan langkah.
4. Tersimpan: daftar favorit yang dipilih pengguna.

**Desain awal / referensi:** rancangan mandiri berdasarkan prinsip clean interface; komponen visual diterapkan langsung pada widget Flutter.  
**Sisipkan gambar desain/screenshot beranda di sini.**

## 3. Implementasi Program

Seluruh implementasi awal berada di `lib/main.dart` agar mudah dijalankan. `Recipe` menyimpan identitas, nama, asal, kategori, durasi, tingkat kesulitan, rating, warna/ilustrasi, deskripsi, bahan, dan langkah. Daftar `recipes` menjadi sumber data dummy.

`ResepNusantaraApp` mengelola navigasi tab menggunakan `NavigationBar` dan `IndexedStack`. Daftar resep dapat difilter berdasarkan pencarian dan kategori. Pemilihan resep membuka `RecipeDetailPage` melalui `Navigator.push`. Status tersimpan diangkat ke state aplikasi agar perubahan pada kartu ikut terlihat pada tab Tersimpan.

Widget/layout yang digunakan meliputi `Scaffold`, `SafeArea`, `CustomScrollView`, `SliverAppBar`, `SliverList`, `ListView`, `Row`, `Column`, `Card`, `ChoiceChip`, `TextField`, dan `NavigationBar`.

**Cuplikan model data:**

```dart
class Recipe {
  const Recipe({required this.id, required this.name, required this.region,
    required this.category, required this.duration, required this.difficulty,
    required this.rating, required this.emoji, required this.color,
    required this.description, required this.ingredients, required this.steps});
  final String id, name, region, category, duration, difficulty, emoji, description;
  final double rating;
  final Color color;
  final List<String> ingredients, steps;
}
```

**Cuplikan navigasi detail:**

```dart
Navigator.of(context).push(MaterialPageRoute<void>(
  builder: (_) => RecipeDetailPage(recipe: recipe, ...),
));
```

**Sisipkan screenshot implementasi beranda, jelajah, dan detail resep di sini.**

## 4. Hasil dan Pembahasan

Hasil implementasi mencakup empat tampilan/fungsi yang terhubung. Beranda memberi titik masuk berupa resep pilihan dan kategori; Jelajah menyediakan pencarian langsung dan filter; Detail menyajikan informasi memasak secara berurutan; Tersimpan memuat resep pilihan pengguna. Navigasi tab tetap tersedia pada halaman utama, sementara tombol kartu membawa pengguna ke detail dan tombol kembali membawa pengguna ke daftar.

Layout menggunakan area gulir vertikal dan komponen yang menyesuaikan lebar layar. Data resep terhubung dari kartu ke halaman detail melalui objek `Recipe` yang sama. Favorit dikelola dalam memori, sehingga belum bertahan setelah aplikasi ditutup.

**Perbandingan desain dan implementasi:** struktur visual yang dirancang—warna hangat, aksen zaitun, kartu resep, pencarian, kategori, dan detail bertahap—diterapkan dalam widget. Tambahkan screenshot final untuk menunjukkan kesesuaian pada perangkat yang digunakan.

## 5. Kesimpulan

Proyek menghasilkan prototipe Flutter resep makanan dengan navigasi tab dan halaman detail, pencarian/filter resep, serta data dummy yang terstruktur. Model resep memudahkan pengembangan ke integrasi API. Pengembangan selanjutnya dapat menambahkan penyimpanan favorit permanen, gambar hidangan, data JSON/API, dan pengujian pada beberapa ukuran perangkat.

## Lampiran

- Source code dan petunjuk menjalankan aplikasi: `README.md`.
- Tangkapan layar hasil implementasi: **[tambahkan setelah menjalankan aplikasi]**.
- Tautan repositori GitHub: **[tambahkan setelah repositori dibuat]**.
