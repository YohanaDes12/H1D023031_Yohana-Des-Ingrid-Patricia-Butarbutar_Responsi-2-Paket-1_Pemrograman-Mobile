import 'package:flutter/material.dart';
import 'package:responsi_2_mobile_paket_1_h1d023031/constants/app_constants.dart';
import 'package:responsi_2_mobile_paket_1_h1d023031/screens/auth/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsi 2 Mobile Paket 1 (H1D023031)',
      theme: ThemeData(
        // Wajib menggunakan warna abu-abu sebagai warna utama
        primarySwatch: PRIMARY_GREY, 
        appBarTheme: const AppBarTheme(
          color: APPBAR_COLOR,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: PRIMARY_GREY,
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: PRIMARY_GREY,
            foregroundColor: Colors.white,
          ),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}