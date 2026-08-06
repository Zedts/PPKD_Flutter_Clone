import 'package:flutter/material.dart';

class TugasListMap extends StatelessWidget {
  TugasListMap({super.key});

  List<Map<String, dynamic>> kategori = [
    {"nama": "Buah-buahan", "icon": Icons.local_grocery_store},
    {"nama": "Sayuran", "icon": Icons.grass},
    {"nama": "Elektronik", "icon": Icons.monitor},
    {"nama": "Pakaian Pria", "icon": Icons.man},
    {"nama": "Pakaian Wanita", "icon": Icons.woman},
    {"nama": "Alat Tulis Kantor", "icon": Icons.edit},
    {"nama": "Buku & Majalah", "icon": Icons.menu_book},
    {"nama": "Peralatan Dapur", "icon": Icons.kitchen},
    {"nama": "Makanan Ringan", "icon": Icons.fastfood},
    {"nama": "Minuman", "icon": Icons.local_drink},
    {"nama": "Mainan Anak", "icon": Icons.toys},
    {"nama": "Peralatan Olahraga", "icon": Icons.sports_soccer},
    {"nama": "Produk Kesehatan", "icon": Icons.health_and_safety},
    {"nama": "Kosmetik", "icon": Icons.brush},
    {"nama": "Obat-obatan", "icon": Icons.medication},
    {"nama": "Aksesoris Mobil", "icon": Icons.directions_car},
    {"nama": "Perabot Rumah", "icon": Icons.chair},
    {"nama": "Sepatu & Sandal", "icon": Icons.directions_walk},
    {"nama": "Barang Bekas", "icon": Icons.recycling},
    {"nama": "Voucher & Tiket", "icon": Icons.confirmation_number},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: kategori.length,
        itemBuilder: (BuildContext context, int index) {
          final item = kategori[index];
          return ListTile(
            title: Text(item["nama"]),
            leading: Icon(item["icon"]),
            trailing: Icon(Icons.arrow_forward),
          );
        },
      ),
    );
  }
}