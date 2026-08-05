import 'package:flutter/material.dart';

class HomeAbalAbalDay16 extends StatelessWidget {
  const HomeAbalAbalDay16({super.key, required this.email, this.password});

  final String email;
  final String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home abal-abal"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(email),
            Text(password ?? "tidak ada pasword"),
          ],
        ),
      ),
    );
  }
}