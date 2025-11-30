📄 Laporan Tugas 10 (Pertemuan 11)
Implementasi CRUD TokoKita Web – Halaman Registrasi Flutter
📌 Deskripsi Singkat

Kode ini membangun sebuah halaman antarmuka (UI) di Flutter yang berfungsi untuk mendaftarkan pengguna baru. Halaman ini tidak hanya menampilkan form, tetapi juga memuat logika bisnis untuk:

Memvalidasi input pengguna

Mengirimkan data ke server (backend CodeIgniter 4) melalui API

Menampilkan respons kepada pengguna dalam bentuk dialog sukses/gagal

👨‍💻 Identitas Pengembang
Informasi	Data
Nama	Yohana Des Ingrid Patricia Butarbutar
NIM	H1D023031
Program Studi	Informatika
Universitas	Universitas Jenderal Soedirman
Shift Awal	A
Shift Baru	E

---
## ⭐ Fitur-Fitur Utama
A. Validasi Input (Form Validation)

Aplikasi memastikan bahwa pengguna tidak dapat mengirim data yang tidak valid.
Setiap kolom memiliki aturan:
- Nama: tidak boleh kosong, minimal 3 karakter

- Email: wajib diisi, harus sesuai format email (Regex)

- Password: minimal 6 karakter

- Konfirmasi Password: harus sama dengan password

B. Indikator Loading (User Experience)

Saat tombol “Registrasi” ditekan, tombol berubah menjadi CircularProgressIndicator untuk mencegah spamming dan memberi tahu pengguna bahwa proses sedang berjalan.

C. Integrasi API (Asynchronous Connection)

Aplikasi mengirim data ke server menggunakan RegistrasiBloc.
Proses dilakukan secara asynchronous, sehingga aplikasi tidak freeze atau macet.

D. Feedback Pengguna (Alert Dialog)
- Jika Registrasi Berhasil:Muncul dialog “Sukses”

- Setelah menekan OK → kembali otomatis ke halaman Login

- Jika Registrasi Gagal:
Muncul dialog “Gagal”

- Pengguna tetap di halaman registrasi untuk memperbaiki data

## 🔍 Penjelasan Rinci Kode
1. Persiapan Variabel (State)
final _formKey = GlobalKey<FormState>();
bool _isLoading = false;

final _namaTextboxController = TextEditingController();
final _emailTextboxController = TextEditingController();
final _passwordTextboxController = TextEditingController();
final _konfirmasiPasswordTextboxController = TextEditingController();

Penjelasan:

_formKey → digunakan untuk memvalidasi seluruh form

_isLoading → mengatur apakah tombol menampilkan teks atau loading

Controller → mengambil data dari masing-masing input field

2. Widget Input & Validator

Contoh validator pada input Email:

validator: (value) {
  if (value!.isEmpty) {
    return 'Email harus diisi';
  }

  String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$';
  RegExp regex = RegExp(pattern);

  if (!regex.hasMatch(value)) {
    return "Email tidak valid";
  }

  return null;
},


Fungsi ini memastikan email seperti:

❌ "yohana" → tidak valid

✔️ "yohana@gmail.com
" → valid

3. Logika Tombol Submit (_submit)
✔️ Validasi Form
if (!_formKey.currentState!.validate()) return;


Jika ada satu saja kolom error → proses dihentikan.

✔️ Mengaktifkan Loading
setState(() {
  _isLoading = true;
});


Tampilan tombol berubah menjadi loading.

✔️ Mengirim Data ke API (RegistrasiBloc)
RegistrasiBloc.registrasi(
  nama: _namaTextboxController.text,
  email: _emailTextboxController.text,
  password: _passwordTextboxController.text,
).then((value) {
  // jika sukses
}, onError: (error) {
  // jika error
});


then() → dijalankan jika server merespons sukses

onError() → dijalankan jika gagal (server error, internet putus, dll)

4. Penanganan Sukses
showDialog(
  context: context,
  builder: (BuildContext context) => AlertDialog(
    title: const Text("Sukses"),
    content: const Text("Registrasi berhasil, silahkan login"),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.pop(context); // Tutup dialog
          Navigator.pop(context); // Tutup halaman regis → kembali ke Login
        },
        child: const Text("OK"),
      ),
    ],
  ),
);


Terdapat dua pop():

Menutup alert dialog

Menutup halaman registrasi

5. Penanganan Gagal

Sama seperti sukses, tetapi hanya 1 pop():

❌ Tutup dialog

❌ Tetap di halaman registrasi

---

## 📸 Tampilan Aplikasi
Ini merupakan tampilan aplikasi web flutternya: 

- Tampilan saat Gagal Register
![alt text](image.png)

- Tampilan saat Login Gagal 
![alt text](image-1.png)

- Tampilan saat Registrasi Berhasil

- Tampilan saat Login Berhasil
![alt text](image-2.png)

- Tampilan List Produk
![alt text](image-5.png)

- Tampilan Form Produk
![alt text](image-3.png)

- Tampilan Detail Produk
![alt text](image-4.png)

---

## 🏁 Kesimpulan Alur Kerja

- User mengisi form

- Validasi dijalankan

- Tombol berubah menjadi loading

- Data dikirim ke server CodeIgniter

- Server membalas → dialog sukses/gagal

- Sukses → kembali ke halaman Login

- Gagal → tetap di halaman Registrasi
