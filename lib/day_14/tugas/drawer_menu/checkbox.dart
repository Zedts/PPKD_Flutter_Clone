import 'package:flutter/material.dart';

class CheckboxDrawer extends StatefulWidget {
  const CheckboxDrawer({super.key});

  @override
  State<CheckboxDrawer> createState() => _CheckboxDrawerState();
}

class _CheckboxDrawerState extends State<CheckboxDrawer> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Syarat & Ketentuan", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Dengan mengunduh atau menggunakan aplikasi “TaskFlow” yang dikembangkan oleh PT Nusantara Digital Solusi (berkedudukan di Jakarta, Indonesia), Anda dianggap telah membaca dan menyetujui seluruh Syarat dan Ketentuan ini sebagai perjanjian hukum antara Anda (“Pengguna”) dan kami. TaskFlow disediakan sebagai layanan manajemen tugas berbasis cloud dengan lisensi terbatas untuk keperluan pribadi dan non-komersial; Anda tidak boleh menyalin, memodifikasi, merekayasa balik, atau mendistribusikan Aplikasi tanpa izin tertulis. Anda bertanggung jawab atas keamanan akun dan perangkat, serta dilarang menggunakan TaskFlow untuk aktivitas ilegal, melanggar hak pihak lain, atau menyalahgunakan fitur; kami berhak membatasi akses jika Anda melanggar. Seluruh hak kekayaan intelektual atas TaskFlow adalah milik PT Nusantara Digital Solusi, sementara konten yang Anda unggah tetap milik Anda dengan lisensi non-eksklusif kepada kami untuk menyediakan layanan. Data pribadi Anda dikelola sesuai Kebijakan Privasi di https://taskflow.id/privacy, yang disusun sesuai UU ITE dan UU Perlindungan Data Pribadi. Aplikasi disediakan “seadanya” tanpa jaminan, dan kami tidak bertanggung jawab atas kerugian yang timbul dari penggunaan atau ketidakmampuan menggunakan TaskFlow, kecuali ditentukan lain oleh hukum. Kami berhak mengubah Syarat dan Ketentuan ini kapan saja; perubahan berlaku sejak dipublikasikan di Aplikasi atau https://taskflow.id/terms. Syarat ini diatur oleh hukum Indonesia, dan perselisihan akan diselesaikan melalui musyawarah atau pengadilan yang berwenang di Jakarta Pusat. Pertanyaan dapat dikirim ke support@taskflow.id."),
            ),
            Row(
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (value) {
                    _isChecked = value ?? false;
                    setState(() {});
                  }
                ),
                Text(_isChecked ? "Saya menyetujui persyaratan" : "Saya tidak menyetujui persyaratan"),
              ],
            ),
        ],
      ),
    );
  }
}