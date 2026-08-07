import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TugasHome extends StatefulWidget {
  const TugasHome({super.key});

  @override
  State<TugasHome> createState() => _TugasHomeState();
}

class _TugasHomeState extends State<TugasHome> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hello", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),),
            Lottie.asset("assets/animations/cat_welcome.json")
          ],
        ),
      )
    );
  }
}