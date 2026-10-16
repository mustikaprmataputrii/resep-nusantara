# Rasa Nusantara

Aplikasi resep makanan berbasis Flutter dan Dart untuk menjelajahi inspirasi masakan Indonesia. Project memakai data dummy lokal yang terstruktur dan model dengan serialisasi JSON, sehingga sumber data dapat diganti dengan API pada pengembangan selanjutnya.

## Halaman dan navigasi

- **Beranda** menampilkan resep pilihan, kategori, dan resep populer.
- **Jelajah** menyediakan pencarian nama/daerah dan filter kategori.
- **Tersimpan** menampilkan resep favorit selama aplikasi berjalan.
- **Detail resep** menampilkan deskripsi, asal, durasi, tingkat kesulitan, bahan, dan langkah memasak.
- `NavigationBar` menghubungkan tiga halaman utama dan `Navigator.push` membuka detail resep.

## Struktur data dan project

```text
lib/
  data/sample_recipes.dart  # Lima contoh data resep lokal
  models/recipe.dart        # Model Recipe dengan fromJson/toJson
  theme/app_theme.dart      # Warna dan tema aplikasi
  main.dart                 # Navigasi, halaman, dan widget UI
assets/
  ui_design_rasa_nusantara.svg  # Rancangan antarmuka
screenshots/                    # Hasil tampilan aplikasi
```

Antarmuka menggunakan `Scaffold`, `SafeArea`, `CustomScrollView`, `SliverList`, `ListView`, `Row`, `Column`, `Card`, `ChoiceChip`, `TextField`, dan `NavigationBar`. Konten dibatasi maksimal 760 piksel pada layar lebar serta mengikuti lebar layar ponsel.

## Menjalankan aplikasi di VS Code

Pasang Flutter SDK dan ekstensi Flutter/Dart di Visual Studio Code, buka folder project ini, lalu jalankan dari terminal:

```bash
flutter pub get
flutter run
```

Pilih emulator/perangkat melalui **Flutter: Select Device**. Project ini juga dapat dibuka dan dijalankan menggunakan Visual Studio Code karena kode aplikasi berada di `lib/` dan memakai Flutter SDK standar.

Untuk memeriksa project dan membuat build web:

```bash
flutter analyze --no-pub
flutter build web --no-pub --no-web-resources-cdn
```

## Data dan pengembangan berikutnya

Data favorit dan pencarian saat ini berjalan lokal. `Recipe.fromJson` dan `Recipe.toJson` menjadi dasar untuk memetakan payload API; lapisan repository/service dapat ditambahkan saat endpoint server tersedia. Favorit persisten, foto resep, dan integrasi API merupakan pengembangan lanjutan.
