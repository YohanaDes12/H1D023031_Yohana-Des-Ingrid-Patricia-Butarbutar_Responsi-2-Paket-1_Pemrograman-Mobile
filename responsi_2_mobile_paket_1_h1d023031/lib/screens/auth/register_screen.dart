import 'package:flutter/material.dart';
import 'package:responsi_2_mobile_paket_1_h1d023031/constants/app_constants.dart';
import 'package:responsi_2_mobile_paket_1_h1d023031/services/api_services.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // REVISI: Menyesuaikan controller dengan kebutuhan API (Name, Email, Password)
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  
  final ApiService _apiService = ApiService();
  bool _isLoading = false;

  void _handleRegister() async {
    // 1. Validasi Input: Pastikan semua kolom terisi
    if (_nameController.text.isEmpty || 
        _emailController.text.isEmpty || 
        _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Semua kolom (Nama, Email, Password) wajib diisi.'))
      );
      return;
    }

    setState(() => _isLoading = true);
    
    // 2. Panggil API Registrasi dengan parameter yang sesuai
    final success = await _apiService.register(
      _nameController.text, 
      _emailController.text, 
      _passwordController.text
    );
    
    setState(() => _isLoading = false);

    // 3. Penanganan Hasil
    if (success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registrasi Berhasil! Silakan Login.'),
          backgroundColor: Colors.green,
        )
      );
      // Navigasi kembali ke halaman Login setelah berhasil
      Navigator.of(context).pop(); 
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registrasi Gagal. Email mungkin sudah terdaftar.'),
          backgroundColor: Colors.red,
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrasi ${APP_BAR_NAME}'), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView( // Tambahkan scroll agar aman di layar kecil
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'BUAT AKUN BARU',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              
              // Input 1: Nama Lengkap
              TextField(
                controller: _nameController, 
                decoration: const InputDecoration(
                  labelText: 'Nama Lengkap',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 15),

              // Input 2: Email
              TextField(
                controller: _emailController, 
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 15),

              // Input 3: Password
              TextField(
                controller: _passwordController, 
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ), 
                obscureText: true
              ),
              const SizedBox(height: 30),

              // Tombol Register
              SizedBox( // Bungkus dengan SizedBox agar tombol lebar
                width: double.infinity,
                height: 50,
                child: _isLoading
                  ? const Center(child: CircularProgressIndicator(color: PRIMARY_GREY))
                  : ElevatedButton(
                      onPressed: _handleRegister,
                      child: const Text('REGISTRASI'), 
                    ),
              ),
              
              const SizedBox(height: 15),
              
              // Tombol Login (Text Button)
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); 
                }, 
                child: const Text('Sudah punya akun? Login di sini')
              )
            ],
          ),
        ),
      ),
    );
  }
}