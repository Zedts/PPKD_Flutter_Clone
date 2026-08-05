import 'package:flutter/material.dart';
import 'package:ppkd_b7/day_15/tugas/models/product.dart';

class TugasListModel extends StatelessWidget {
  TugasListModel({super.key});

  List<KategoriModel> dataKategori = [
    KategoriModel(imageUrl: "https://admin.melindahospital.com/storage/images/articles/1707980245677.webp", nama: "Buah-buahan"),
    KategoriModel(imageUrl: "https://img.magnific.com/psd-gratis/panen-sayuran-yang-semarak-koleksi-warna-warni-hasil-bumi-segar_191095-79960.jpg?semt=ais_test_b&w=740&q=80", nama: "Sayuran"),
    KategoriModel(imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPdhoedRU13AC9hG1o0XF4Zmgp7cWV6mstYZN5b1rcTYziI7K8l0l8rtg&s=10", nama: "Elektronik"),
    KategoriModel(imageUrl: "https://img.lazcdn.com/g/p/50e50c41964168ebe79aaca4cc3458da.jpg_720x720q80.jpg", nama: "Pakaian Pria"),
    KategoriModel(imageUrl: "https://image.made-in-china.com/365f3j00hOyVHjSFKAzs/Pakaian-Musim-Dingin-Wanita-Pakaian-Rajut-Wanita-Sweater-Rajut-Wanita-Pakaian-Santai-Wanita-Pakaian-Rajut-Fashion-Musim-Dingin-Pakaian-Wanita-Celana-Musim-Dingin-Celana-Crewneck-2PC-Set.webp", nama: "Pakaian Wanita"),
    KategoriModel(imageUrl: "https://w7.pngwing.com/pngs/1007/931/png-transparent-paper-office-supplies-stationery-business-material-retail-people-office-thumbnail.png", nama: "Alat Tulis Kantor"),
    KategoriModel(imageUrl: "https://cms-assets.tutsplus.com/uploads/users/23/posts/26455/image/modern-magazine-template-print-design.jpg", nama: "Buku & Majalah"),
    KategoriModel(imageUrl: "https://www.pastisania.com/storage/app/media/posts/Alat-Alat-Dapur-Wajib-Untuk-Pemula-1024x682.webp", nama: "Peralatan Dapur"),
    KategoriModel(imageUrl: "https://m.media-amazon.com/images/I/71D2sSnUidL.jpg", nama: "Makanan Ringan"),
    KategoriModel(imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4CmSa953Zzg9PJ2wecxLuQ8U-Em1BCDQkC2_KwZXFSgnN5NpBQJNt0uo&s=10", nama: "Minuman"),
    KategoriModel(imageUrl: "https://www.prenagen.com/images/uploads/1650890742-mainan-bayi-3-bulan-yang-menstimulasi-otak-si-kecil-pasti-suka.jpg", nama: "Mainan Anak"),
    KategoriModel(imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTh_J9gVyCDGgydXAG6dGjRffG7buf-u5_kRYFAtvf-zA&s=10", nama: "Peralatan Olahraga"),
    KategoriModel(imageUrl: "https://kalbeconsumerhealth-web.s3.ap-southeast-1.amazonaws.com/assets/media/1638934756397-512662552-all-brand-banner-mobile.jpg", nama: "Produk Kesehatan"),
    KategoriModel(imageUrl: "https://www.yesdok.com/visual/slideshow/5c687c4f-95f3-4125-9abf-183b334dbea1-article-1669434228.jpeg?w=1200", nama: "Kosmetik"),
    KategoriModel(imageUrl: "https://img-cdn.medkomtek.com/SawYQzryFfZu2WG7S3P0A4kNPP0=/0x0/smart/filters:quality(100):format(webp)/article/pzkuZOE31lz0qYo0gB8Av/original/091979100_1497664347-Inilah-Obat-obatan-yang-Harus-Ada-di-Kotak-P3k.jpg", nama: "Obat-obatan"),
    KategoriModel(imageUrl: "https://image.made-in-china.com/202f0j00ObniHkMCiFgA/Car-M4-Bumpers-for-BMW-E90-Front-Bumper-Kit-PP-Material-2005-2012-Body-Kit-for-BMW-E90.webp", nama: "Aksesoris Mobil"),
    KategoriModel(imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFFJlOgEeSs1PZRYxQm6pHQL2cbI4ZVkinaP7ZpbI3Z6CX0gnsMXAJdQo&s=10", nama: "Perabot Rumah"),
    KategoriModel(imageUrl: "https://down-id.img.susercontent.com/file/359d1e4fd44cf004843d5bfcf80783b5", nama: "Sepatu & Sandal"),
    KategoriModel(imageUrl: "https://asset.kompas.com/crops/UrD48cusZqHAUokzX8DzorBqovE=/2x0:970x645/1200x800/data/photo/2020/11/23/5fbb7d6064f42.jpg", nama: "Barang Bekas"),
    KategoriModel(imageUrl: "https://img.magnific.com/free-vector/discount-ticket-template-design_23-2151023553.jpg?semt=ais_hybrid&w=740&q=80", nama: "Voucher & Tiket"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(height: 8,);
        },
        itemCount: dataKategori.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: index%2==0?Colors.grey[200] : Colors.white,
              leading: Image.network(dataKategori[index].imageUrl, height: 50, width: 50,),
              title: Text(dataKategori[index].nama),
              trailing: Icon(Icons.arrow_forward),
            ),
          );
        },
      ),
    );
  }
}