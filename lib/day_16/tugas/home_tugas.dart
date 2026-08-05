import 'package:flutter/material.dart';

class HomeTugas extends StatelessWidget {
  const HomeTugas({super.key, required this.email, this.password, required this.nama, required this.telepon, required this.kelas});

  final String kelas;
  final String telepon;
  final String nama;
  final String email;
  final String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home tugas"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(nama),
            Text(telepon),
            Text(kelas),
            Text(email),
            Text(password ?? "tidak ada pasword"),
          ],
        ),
      ),
    );
  }
}