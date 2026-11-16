# UTS Pemrograman Mobile Lanjutan — Aplikasi Profil Mahasiswa

Repository ini berisi hasil pengerjaan Ujian Tengah Semester (UTS) mata kuliah **Pemrograman Mobile Lanjutan** menggunakan framework **Flutter**.

---

## Identitas Mahasiswa

| Keterangan | Detail |
| :--- | :--- |
| **Nama Lengkap** | `Muhammad Aditya Saputra` |
| **NIM** | `1124160009` |
| **Kelas** | `TI 2 P SE-3` |
| **Program Studi** | Teknik Informatika |
| **Mata Kuliah** | Aplikasi Mobile |
| **Dosen Pengampu** | I Ketut Gunawan, S.Kom., M.T |
| **Institusi** | Institut Teknologi & Bisnis Bina Sarana Global |

---

## Tautan Penting

* **Video Presentasi YouTube:** `yutub`
  *(Judul Video: `UTS PML - Aplikasi Profil - Muhammad Aditya Saputra - 1124160009`)*
* **Unduh File APK (`v1.0.0`):** [GitHub Releases v1.0.0](https://github.com/TYASAP-dev/uts-pml-1124160009/releases/tag/v1.0.0)

---

## Struktur Repository

```text
uts-pml-1124160009/
├── soal1-live-coding/      # Proyek Flutter Soal 1 (Halaman Profil StatelessWidget)
├── soal2-profil-app/       # Proyek Flutter Soal 2 (Aplikasi Android Profil Lengkap)
├── screenshots/            # Folder penyimpanan gambar tangkapan layar aplikasi
└── README.md               # Dokumentasi utama repository
```

---

## Daftar Fitur Aplikasi

### 1. Soal 1 — Live Coding (`soal1-live-coding`)
* Implementasi penuh menggunakan `StatelessWidget` tanpa `StatefulWidget` maupun `setState()`.
* Konfigurasi `MaterialApp` dengan Material 3 (`useMaterial3: true`), `ColorScheme.fromSeed`, serta dukungan `darkTheme` otomatis mengikuti sistem (`ThemeMode.system`).
* Layout profil responsif dengan `SafeArea`, `SingleChildScrollView`, `CircleAvatar`, serta widget reusable `InfoTile` untuk informasi kontak dan keahlian/hobi.
* Interaksi `FloatingActionButton` yang menampilkan `SnackBar`.

### 2. Soal 2 — Proyek Aplikasi Android (`soal2-profil-app`)
* **Halaman Login (`login_page.dart`):** Validasi input email dan password menggunakan `Form` + `validator`, indikator loading asynchronous, serta perpindahan halaman menggunakan `Navigator.pushReplacementNamed`.
* **Halaman Profil Utama (`profile_page.dart`):** Menampilkan foto profil lokal dari `assets/images/`, nama lengkap, NIM, program studi, kelas, bio singkat, serta daftar kontak menggunakan `Card` dan widget reusable `InfoTile`.
* **Navigasi & Scaffold Lengkap:** Dilengkapi `AppBar`, `Drawer`, `BottomNavigationBar`, dan `FloatingActionButton`.
* **Halaman Edit Profil (`edit_profile_page.dart`):** Form terisi otomatis (`TextEditingController`) dari data profil saat ini dengan validasi nama wajib diisi, format email valid, dan nomor HP khusus angka 10–13 digit. Data terbaru dikembalikan menggunakan `Navigator.pop(context, dataBaru)` dan langsung diperbarui dengan `setState()`.
* **Halaman Tentang Saya (`about_page.dart`):** Menampilkan daftar keahlian/hobi serta riwayat pendidikan menggunakan `ListView`.
* **Tema Terang & Gelap (Light / Dark Mode):** Pengaturan tema langsung di dalam aplikasi melalui ikon pada `AppBar` maupun switch pada `Drawer`.
* **Identitas Aplikasi Android:** Nama aplikasi pada perangkat Android telah disesuaikan melalui atribut `android:label` di `AndroidManifest.xml`.

---

## Screenshot Aplikasi (Soal 2)

> *Catatan: Simpan file tangkapan layar ke dalam folder `screenshots/` sesuai nama file di bawah ini agar gambar tampil otomatis di GitHub.*

| Halaman Login | Halaman Profil (Light Mode) |
| :---: | :---: |
| ![Halaman Login](screenshots/1_login.png) | ![Halaman Profil](screenshots/2_profil.png) |

| Halaman Edit Profil | Halaman Tentang Saya & Dark Mode |
| :---: | :---: |
| ![Halaman Edit Profil](screenshots/3_edit_profil.png) | ![Halaman Tentang Saya](screenshots/4_tentang_saya.png) |

---

## Cara Menjalankan Proyek

Pastikan **Flutter SDK** sudah terpasang dan perangkat Android / Emulator sudah aktif.

1. **Clone repository ini:**
   ```bash
   git clone https://github.com/TYASAP-dev/uts-pml-1124160009.git
   cd uts-pml-1124160009
   ```

2. **Masuk ke folder proyek yang ingin dijalankan (misalnya Soal 2):**
   ```bash
   cd soal2-profil-app
   ```

3. **Unduh seluruh dependensi paket:**
   ```bash
   flutter pub get
   ```

4. **Jalankan aplikasi di emulator atau perangkat Android:**
   ```bash
   flutter run
   ```

5. **Untuk melakukan build file APK Release:**
   ```bash
   flutter build apk --release
   ```
   File hasil build akan tersimpan di `build/app/outputs/flutter-apk/app-release.apk`.