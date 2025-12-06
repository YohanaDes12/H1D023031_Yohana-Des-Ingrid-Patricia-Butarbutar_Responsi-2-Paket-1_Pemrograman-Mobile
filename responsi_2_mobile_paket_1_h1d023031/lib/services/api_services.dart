import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:responsi_2_mobile_paket_1_h1d023031/constants/app_constants.dart';
import 'package:responsi_2_mobile_paket_1_h1d023031/models/inventaris_model.dart';

class ApiService {
  // Pastikan API_BASE_URL di app_constants.dart berakhiran '/api'
  // Contoh: http://10.0.2.2/yohanamart_api/public/api
  final String _inventarisUrl = '${API_BASE_URL}/inventaris';
  final String _authUrl = '${API_BASE_URL}/auth';

  // --- Helper Token ---
  Future<Map<String, String>> _getAuthHeaders({bool requireAuth = true}) async {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json', // Tambahan: Agar server merespon dengan JSON jika error
    };
    
    if (requireAuth) {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('authToken');
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }
    }
    return headers;
  }

  // --- Auth: Login & Register ---
  
  // REVISI: Menggunakan 'email' bukan 'username'
  Future<String?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$_authUrl/login'),
      headers: await _getAuthHeaders(requireAuth: false),
      body: jsonEncode({
        'email': email, 
        'password': password
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // Pastikan key token sesuai respon server (bisa 'token', 'access_token', dll)
      final token = data['token']; // atau data['data']['token'] tergantung struktur API
      
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('authToken', token);
      return token;
    }
    return null;
  }
  
  // REVISI: Menambahkan parameter name & email, serta password_confirmation
  Future<bool> register(String name, String email, String password) async {
    final response = await http.post(
      Uri.parse('$_authUrl/register'),
      headers: await _getAuthHeaders(requireAuth: false),
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': password, // Penting: Disamakan agar validasi server lolos
      }),
    );

    // Sukses biasanya 201 (Created) atau 200 (OK)
    return response.statusCode == 201 || response.statusCode == 200;
  }
  
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('authToken');
    
    // Opsional: Hit endpoint logout ke server jika ada
    // await http.post(Uri.parse('$_authUrl/logout'), headers: await _getAuthHeaders());
  }

  // --- CRUD Inventaris ---
  // (Bagian ini sepertinya sudah standar, tapi pastikan URL backend benar)

  // R: READ (GET All)
  Future<List<Inventaris>> fetchAllInventaris() async {
    final response = await http.get(
      Uri.parse(_inventarisUrl),
      headers: await _getAuthHeaders(),
    );

    if (response.statusCode == 200) {
      // Pastikan respon server berupa List langsung atau dibungkus dalam key 'data'
      // Jika server response: { "data": [...] }, gunakan: jsonDecode(response.body)['data']
      final List<dynamic> jsonList = jsonDecode(response.body)['data'] ?? jsonDecode(response.body);
      return jsonList.map((json) => Inventaris.fromJson(json)).toList();
    } else if (response.statusCode == 401) {
      await logout();
      throw Exception('Sesi habis. Silakan login kembali.');
    } else {
      throw Exception('Gagal memuat inventaris: ${response.statusCode}');
    }
  }

  // C: CREATE (POST)
  Future<Inventaris> createInventaris(Inventaris item) async {
    final response = await http.post(
      Uri.parse(_inventarisUrl),
      headers: await _getAuthHeaders(),
      body: jsonEncode(item.toJson()),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      // Sesuaikan parsing dengan format respon server
      final dynamic data = jsonDecode(response.body)['data'] ?? jsonDecode(response.body);
      return Inventaris.fromJson(data);
    }
    throw Exception('Gagal menambah inventaris: ${response.body}');
  }

  // U: UPDATE (PUT)
  Future<Inventaris> updateInventaris(Inventaris item) async {
    final response = await http.put(
      Uri.parse('$_inventarisUrl/${item.id}'),
      headers: await _getAuthHeaders(),
      body: jsonEncode(item.toJson()),
    );

    if (response.statusCode == 200) {
      final dynamic data = jsonDecode(response.body)['data'] ?? jsonDecode(response.body);
      return Inventaris.fromJson(data);
    }
    throw Exception('Gagal mengubah inventaris: ${response.body}');
  }

  // D: DELETE (DELETE)
  Future<void> deleteInventaris(String id) async { // Pastikan tipe data ID string/int sesuai model
    final response = await http.delete(
      Uri.parse('$_inventarisUrl/$id'),
      headers: await _getAuthHeaders(),
    );

    if (response.statusCode != 200) {
      throw Exception('Gagal menghapus inventaris.');
    }
  }
}