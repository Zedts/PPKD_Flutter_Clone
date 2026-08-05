import 'package:flutter/material.dart';

class TugasListString extends StatelessWidget {
  TugasListString({super.key});

  List<String> kategori = [
    'Buah-buahan',
    'Sayuran',
    'Elektronik',
    'Pakaian Pria',
    'Pakaian Wanita',
    'Alat Tulis Kantor',
    'Buku & Majalah',
    'Peralatan Dapur',
    'Makanan Ringan',
    'Minuman',
    'Mainan Anak',
    'Peralatan Olahraga',
    'Produk Kesehatan',
    'Kosmetik',
    'Obat-obatan',
    'Aksesoris Mobil',
    'Perabot Rumah',
    'Sepatu & Sandal',
    'Barang Bekas',
    'Voucher & Tiket',
  ];

  List<String> kategoriSubtitle = [
    'Berisi berbagai jenis buah segar seperti apel, jeruk, pisang, mangga, dan buah tropis lainnya.',
    'Berisi sayuran segar seperti bayam, kangkung, wortel, tomat, dan sayuran organik.',
    'Berisi produk seperti HP, laptop, TV, kamera, dan perangkat elektronik rumah tangga.',
    'Berisi pakaian pria seperti kemeja, kaos, celana panjang, celana pendek, dan jaket.',
    'Berisi pakaian wanita seperti dress, blouse, rok, celana wanita, dan cardigan.',
    'Berisi pensil, pulpen, buku tulis, stapler, dan perlengkapan kantor lainnya.',
    'Berisi buku pelajaran, novel, komik, ensiklopedia, dan berbagai jenis majalah.',
    'Berisi wajan, panci, pisau, spatula, dan alat masak serta makan di dapur.',
    'Berisi keripik, cokelat, biskuit, kacang, dan berbagai camilan ringan.',
    'Berisi air mineral, teh, kopi, jus, susu, dan minuman bersoda.',
    'Berisi mainan edukatif, boneka, action figure, puzzle, dan permainan untuk anak-anak.',
    'Berisi bola, raket, matras yoga, dumbbell, dan perlengkapan olahraga lainnya.',
    'Berisi vitamin, suplemen, minyak ikan, dan produk pendukung kesehatan tubuh.',
    'Berisi lipstik, foundation, skincare, parfum, dan produk kecantikan lainnya.',
    'Berisi obat bebas, obat herbal, plester, dan produk farmasi non-resep.',
    'Berisi aksesoris mobil seperti sarung jok, parfum mobil, charger, dan hiasan interior.',
    'Berisi meja, kursi, lemari, rak buku, lampu, dan dekorasi perabot rumah.',
    'Berisi sepatu formal, sneakers, sandal jepit, boots, dan alas kaki lainnya.',
    'Berisi barang second hand seperti elektronik bekas, pakaian preloved, dan koleksi lama.',
    'Berisi voucher game, pulsa, tiket bioskop, tiket konser, dan e-voucher lainnya.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: kategori.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            tileColor: index%2==0?Colors.lightBlueAccent[200] : Colors.grey[200],
            title: Text(kategori[index]),
            subtitle: Text(kategoriSubtitle[index]),
            trailing: Icon(Icons.arrow_forward),
          );
        },
      ),
    );
  }
}