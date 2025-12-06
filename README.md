📱 Aplikasi Inventaris Komputer Yohana
Aplikasi Inventaris Komputer Yohana adalah aplikasi mobile berbasis Flutter yang digunakan untuk mengelola inventaris perangkat komputer secara efisien. Aplikasi ini menyediakan fitur autentikasi pengguna serta CRUD (Create, Read, Update, Delete) untuk data inventaris.

👩‍💻 Identitas Pengembang
Detail Informasi Nama Yohana Des Ingrid Patricia Butarbutar NIM H1D023031 Shift Baru E Shift Asal A

📌 Deskripsi Singkat Aplikasi
Aplikasi ini dibuat untuk mempermudah pengelolaan inventaris komputer, seperti monitor, keyboard, dan perangkat lainnya. Pengguna dapat:

Mendaftar akun baru

Login ke aplikasi

Melihat daftar inventaris

Menambah inventaris baru

Mengubah inventaris

Menghapus inventaris

Logout dari aplikasi

UI dibuat menggunakan prinsip Material Design 3, dengan tampilan modern dan clean.

🎥 Video Demo Aplikasi
👉 Link Video Demo: tempel link video Anda di sini

Video demo mencakup:

Registrasi akun

Login

Menampilkan daftar inventaris

Menambah data inventaris

Edit inventaris

Hapus inventaris

Logout

🔌 Spesifikasi API (Backend)

Base URL: http://localhost:3000

Authentication Endpoints POST /auth/register { "nama": "string", "email": "string", "password": "string" }
POST /auth/login { "email": "string", "password": "string" }

Inventaris Endpoints
GET /inventaris — Menampilkan semua inventaris

POST /inventaris — Menambah inventaris

PUT /inventaris/{id} — Update inventaris

DELETE /inventaris/{id} — Hapus inventaris

🧩 Struktur Folder lib/ ├── main.dart
├── models/ │ └── inventaris.dart
├── pages/ │ ├── login_page.dart
│ ├── register_page.dart
│ ├── home_page.dart
│ ├── add_page.dart
│ └── edit_page.dart
└── services/ ├── auth_service.dart
└── inventaris_service.dart

🛠 Teknologi yang Digunakan
Teknologi Keterangan Flutter Framework UI Dart 3.9.2+ Bahasa pemrograman HTTP Package Akses REST API Node.js / Express API Backend MySQL / PostgreSQL Database 🌟 Fitur Aplikasi 🔐 Autentikasi

Register

Login

Logout

📦 CRUD Inventaris
Menampilkan data inventaris

Input data inventaris

Edit data

Hapus data

🎨 Pengalaman Pengguna
Snackbar notifikasi

Validasi form

Loading indicator

Date picker

Format harga rupiah

📝 Cara Menjalankan Aplikasi
Jalankan backend pada localhost:3000

Install dependencies

flutter pub get

Jalankan aplikasi

flutter run

Build release APK

flutter build apk --release

📦 Dependencies (pubspec.yaml)
dependencies: flutter: sdk: flutter http: ^1.1.0 cupertino_icons: ^1.0.8

dev_dependencies: flutter_lints: ^5.0.0

🙌 Penutup
Aplikasi Inventaris Komputer ini dibuat oleh Yohana Des Ingrid Patricia Butarbutar sebagai bagian dari pembelajaran Flutter dan REST API.
