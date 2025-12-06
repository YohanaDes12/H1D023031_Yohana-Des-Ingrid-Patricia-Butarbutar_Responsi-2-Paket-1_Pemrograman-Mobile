class Inventaris {
  final String id;
  final String nama;
  final int harga;
  final int jumlah;
  final DateTime tanggalMasuk;

  Inventaris({
    required this.id,
    required this.nama,
    required this.harga,
    required this.jumlah,
    required this.tanggalMasuk,
  });

  factory Inventaris.fromJson(Map<String, dynamic> json) {
    return Inventaris(
      id: json['_id'] ?? json['id'],
      nama: json['nama'],
      harga: json['harga'],
      jumlah: json['jumlah'],
      // Pastikan API mengembalikan format tanggal yang bisa diparse
      tanggalMasuk: DateTime.parse(json['tanggalMasuk']), 
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // ID tidak dikirim saat Create
      if (id.isNotEmpty) '_id': id, 
      'nama': nama,
      'harga': harga,
      'jumlah': jumlah,
      // Format tanggal ke ISO 8601 (String)
      'tanggalMasuk': tanggalMasuk.toIso8601String(), 
    };
  }
}