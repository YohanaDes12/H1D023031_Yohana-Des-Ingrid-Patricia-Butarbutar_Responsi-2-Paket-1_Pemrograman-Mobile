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
{
"nama": "string",
"email": "string",
"password": "string"
}

#### Login
POST /auth/login
{
"email": "string",
"password": "string"
}


---

### **Inventaris Endpoints**

#### Get All
GET /inventaris

#### Create
POST /inventaris

#### Update
PUT /inventaris/{id}

#### Delete
DELETE /inventaris/{id}

---

## 🧩 Struktur Folder


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
### 2️⃣ Install Dependencies
flutter pub get

shell
Salin kode

### 3️⃣ Jalankan Aplikasi
flutter run

shell
Salin kode

### 4️⃣ Build APK Release
flutter build apk --release

yaml
Salin kode

---

## 📦 Dependencies (pubspec.yaml)

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.1.0
  cupertino_icons: ^1.0.8

dev_dependencies:
  flutter_lints: ^5.0.0
🙌 Penutup
Aplikasi Inventaris Komputer ini dikembangkan oleh Yohana Des Ingrid Patricia Butarbutar sebagai bagian dari pembelajaran Flutter dan REST API dalam mata kuliah Pemrograman Mobile.


