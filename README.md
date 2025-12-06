# 📱 Aplikasi Inventaris Komputer — Yohana

Aplikasi **Inventaris Komputer Yohana** adalah aplikasi mobile berbasis **Flutter** yang digunakan untuk mengelola inventaris perangkat komputer secara efisien. Aplikasi ini dilengkapi fitur autentikasi dan operasi CRUD (Create, Read, Update, Delete) data inventaris.

---

## 👩‍💻 Identitas Pengembang

| Detail | Informasi |
|-------|-----------|
| **Nama** | Yohana Des Ingrid Patricia Butarbutar |
| **NIM** | H1D023031 |
| **Shift Baru** | E |
| **Shift Asal** | A |

---

## 📌 Deskripsi Singkat Aplikasi
Aplikasi ini dibuat untuk mempermudah pengelolaan inventaris komputer seperti monitor, keyboard, CPU, mouse, dan perangkat lainnya.

Pengguna dapat melakukan:

- Registrasi akun baru  
- Login  
- Melihat daftar inventaris  
- Menambah inventaris  
- Mengubah inventaris  
- Menghapus inventaris  
- Logout  

UI dibangun menggunakan **Material Design 3** dengan tampilan yang modern dan clean.

---

## 🎥 Demo Aplikasi

### 👉 Preview Demo
![Demo Aplikasi](https://github.com/YohanaDes12/H1D023031_Yohana-Des-Ingrid-Patricia-Butarbutar_Responsi-2-Paket-1_Pemrograman-Mobile/blob/main/demo-responsi-2_paket-1_pemrograman-mobile.gif)

Demo mencakup:
- Registrasi akun  
- Login  
- Menampilkan daftar inventaris  
- Menambah data  
- Mengedit data  
- Menghapus data  
- Logout  

---

## 🔌 Spesifikasi API (Backend)

### **Base URL**
http://localhost:5000 

### **Authentication Endpoints**
#### Register
POST /auth/register
POST /auth/register
{
  "nama": "string",
  "email": "string",
  "password": "string"
}
- Menjelaskan endpoint registrasi.
- Data dikirim dalam format JSON.
- Method POST digunakan untuk mengirim data baru.
  
#### Login
POST /auth/login
{
"email": "string",
"password": "string"
}


---

### **Inventaris Endpoints**
GET /inventaris
POST /inventaris
PUT /inventaris/{id}
DELETE /inventaris/{id}

- GET → ambil data
- POST → tambah data
- PUT → update data berdasarkan ID
- DELETE → hapus data berdasarkan ID

---

## 🧩 Struktur Folder
lib/
├── constants/
│   └── app_constants.dart
├── models/
│   └── inventaris_model.dart
├── screens/
│   ├── auth/
│   │   ├── login_screen.dart
│   │   └── register_screen.dart
│   └── inventory/
│       ├── form_screen.dart
│       └── home_screen.dart
├── services/
│   └── api_services.dart
└── main.dart

---

## 🛠 Teknologi yang Digunakan

| Teknologi | Keterangan |
|----------|------------|
| Flutter | Framework UI |
| Dart 3.9.2+ | Bahasa pemrograman |
| HTTP Package | Akses REST API |
| Node.js / Express | Backend API |
| MySQL / PostgreSQL | Database |

---

## 🌟 Fitur Aplikasi

### 🔐 Autentikasi
- Register  
- Login  
- Logout  

### 📦 CRUD Inventaris
- Menampilkan daftar inventaris  
- Menambah data baru  
- Edit data inventaris  
- Hapus data  

### 🎨 Pengalaman Pengguna
- Snackbar notifikasi  
- Validasi Form  
- Loading Indicator  
- Date Picker  
- Format Harga Rupiah  

---

## 📝 Cara Menjalankan Aplikasi

### 1️⃣ Jalankan Backend
Pastikan backend berjalan pada:
http://localhost:5000
### 2️⃣ Jalankan Aplikasi
flutter pub get
flutter run
flutter build apk --release

- Perintah CLI Flutter untuk menjalankan aplikasi.
- flutter pub get → mengunduh dependency.
- flutter run → menjalankan aplikasi.
- flutter build apk → membuat file APK untuk di-install di Android.
---

## 📦 Dependencies (pubspec.yaml)

dependencies:
  flutter:
    sdk: flutter
  http: ^1.1.0

- Ditulis dalam format YAML (indentasi penting!).
- http digunakan untuk memanggil REST API.
- cupertino_icons digunakan untuk ikon tambahan.
---
## 🙌 Penutup
Aplikasi Inventaris Komputer ini dikembangkan oleh Yohana Des Ingrid Patricia Butarbutar sebagai bagian dari pembelajaran Flutter dan REST API dalam mata kuliah Pemrograman Mobile.
