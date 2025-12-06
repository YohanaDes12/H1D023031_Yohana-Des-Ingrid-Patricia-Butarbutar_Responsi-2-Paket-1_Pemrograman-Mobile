import 'package:flutter/material.dart';
import 'package:responsi_2_mobile_paket_1_h1d023031/constants/app_constants.dart';
import 'package:responsi_2_mobile_paket_1_h1d023031/services/api_services.dart';
import 'package:responsi_2_mobile_paket_1_h1d023031/screens/auth/register_screen.dart';
import 'package:responsi_2_mobile_paket_1_h1d023031/screens/inventory/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final ApiService _apiService = ApiService();
  bool _isLoading = false;

  void _handleLogin() async {
    setState(() => _isLoading = true);
    final token = await _apiService.login(
      _usernameController.text, 
      _passwordController.text
    );
    setState(() => _isLoading = false);

    if (token != null && mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen())
      );
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login Gagal. Cek kredensial Anda.'))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Inventaris Komputer ${APP_BAR_NAME}'), 
        backgroundColor: APPBAR_COLOR,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ... Form input username/password
            TextField(controller: _usernameController, decoration: const InputDecoration(labelText: 'Username')),
            const SizedBox(height: 10),
            TextField(controller: _passwordController, decoration: const InputDecoration(labelText: 'Password'), obscureText: true),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator(color: PRIMARY_GREY)
                : ElevatedButton(
                    onPressed: _handleLogin,
                    // Style sudah diatur di main.dart, tapi bisa di override
                    child: const Text('LOGIN'), 
                  ),
            TextButton(
              onPressed: () {
               // [Ganti bagian ini]
              Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const RegisterScreen())
              );
            },
            child: Text('Belum punya akun? Registrasi', style: TextStyle    (color:      PRIMARY_GREY))
            )
          ],
        ),
      ),
    );
  }
}