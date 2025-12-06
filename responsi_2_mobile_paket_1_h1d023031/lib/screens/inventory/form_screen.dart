import 'package:flutter/material.dart';
import 'package:responsi_2_mobile_paket_1_h1d023031/constants/app_constants.dart';
import 'package:responsi_2_mobile_paket_1_h1d023031/models/inventaris_model.dart';
import 'package:responsi_2_mobile_paket_1_h1d023031/services/api_services.dart';
import 'package:intl/intl.dart';

class FormScreen extends StatefulWidget {
  final Inventaris? inventaris; // Null = Create, Not Null = Update
  const FormScreen({super.key, this.inventaris});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final ApiService _apiService = ApiService();
  final _namaController = TextEditingController();
  final _hargaController = TextEditingController();
  final _jumlahController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.inventaris != null) {
      _namaController.text = widget.inventaris!.nama;
      _hargaController.text = widget.inventaris!.harga.toString();
      _jumlahController.text = widget.inventaris!.jumlah.toString();
      _selectedDate = widget.inventaris!.tanggalMasuk;
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(primary: PRIMARY_GREY, onPrimary: Colors.white),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _submitForm() async {
    if (!_formKey.currentState!.validate()) return;
    
    setState(() => _isLoading = true);

    final isUpdate = widget.inventaris != null;
    final item = Inventaris(
      id: isUpdate ? widget.inventaris!.id : '',
      nama: _namaController.text,
      harga: int.parse(_hargaController.text),
      jumlah: int.parse(_jumlahController.text),
      tanggalMasuk: _selectedDate,
    );

    try {
      if (isUpdate) {
        await _apiService.updateInventaris(item);
      } else {
        await _apiService.createInventaris(item);
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Inventaris berhasil ${isUpdate ? 'diubah' : 'ditambahkan'}!'))
        );
        Navigator.of(context).pop(true); 
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal ${isUpdate ? 'mengubah' : 'menambah'} data: $e'))
        );
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isUpdate = widget.inventaris != null;
    final title = '${isUpdate ? 'Ubah' : 'Tambah'} Inventaris Komputer ${APP_BAR_NAME}';

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              // Input Nama (String)
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(labelText: 'Nama Barang', border: OutlineInputBorder()),
                validator: (v) => v!.isEmpty ? 'Nama tidak boleh kosong' : null,
              ),
              const SizedBox(height: 15),
              // Input Harga (Int)
              TextFormField(
                controller: _hargaController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Harga (Rp)', border: OutlineInputBorder()),
                validator: (v) => v!.isEmpty || int.tryParse(v) == null ? 'Masukkan harga yang valid' : null,
              ),
              const SizedBox(height: 15),
              // Input Jumlah (Int)
              TextFormField(
                controller: _jumlahController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Jumlah Stok', border: OutlineInputBorder()),
                validator: (v) => v!.isEmpty || int.tryParse(v) == null ? 'Masukkan jumlah yang valid' : null,
              ),
              const SizedBox(height: 15),
              // Input Tanggal Masuk (String/Date)
              ListTile(
                title: Text('Tanggal Masuk: ${DateFormat('dd MMMM yyyy').format(_selectedDate)}'),
                trailing: const Icon(Icons.calendar_today, color: PRIMARY_GREY),
                onTap: () =>_selectDate(context),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              const SizedBox(height: 30),
              // Tombol Submit
              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: _submitForm,
                      child: Text(isUpdate ? 'SIMPAN PERUBAHAN' : 'TAMBAH INVENTARIS'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}