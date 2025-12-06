import 'package:flutter/material.dart';
import 'package:responsi_2_mobile_paket_1_h1d023031/constants/app_constants.dart';
import 'package:responsi_2_mobile_paket_1_h1d023031/models/inventaris_model.dart';
import 'package:responsi_2_mobile_paket_1_h1d023031/services/api_services.dart';
import 'package:responsi_2_mobile_paket_1_h1d023031/screens/auth/login_screen.dart';
import 'package:responsi_2_mobile_paket_1_h1d023031/screens/inventory/form_screen.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService();
  late Future<List<Inventaris>> _futureInventaris;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() {
    setState(() {
      _futureInventaris = _apiService.fetchAllInventaris();
    });
  }

  void _handleLogout() async {
    await _apiService.logout();
    if (mounted) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (Route<dynamic> route) => false,
      );
    }
  }
  
  void _handleDelete(String id) async {
    try {
      await _apiService.deleteInventaris(id);
      _fetchData();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Data berhasil dihapus!'))
        );
      }
    } catch (e) {
       if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal menghapus: $e'))
        );
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventaris Komputer ${APP_BAR_NAME}'),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _fetchData),
          IconButton(icon: const Icon(Icons.logout), onPressed: _handleLogout),
        ],
      ),
      body: FutureBuilder<List<Inventaris>>(
        future: _futureInventaris,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}', textAlign: TextAlign.center));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Data inventaris kosong.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final item = snapshot.data![index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    title: Text(item.nama, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Harga: Rp${NumberFormat('#,##0', 'id_ID').format(item.harga)}'),
                        Text('Jumlah: ${item.jumlah} unit'),
                        Text('Tanggal Masuk: ${DateFormat('dd MMMM yyyy').format(item.tanggalMasuk)}'),
                      ],
                    ),
                    isThreeLine: true,
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Edit (Update)
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.orange),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => FormScreen(inventaris: item),
                            )).then((_) => _fetchData());
                          },
                        ),
                        // Hapus (Delete)
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _handleDelete(item.id),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigasi ke FormScreen (Create)
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const FormScreen(),
          )).then((_) => _fetchData());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}