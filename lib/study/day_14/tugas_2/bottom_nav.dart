import 'package:flutter/material.dart';
import 'package:ppkd_b7/study/day_14/tugas/drawer.dart';
import 'package:ppkd_b7/study/day_14/tugas_2/screen/about.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {

  int _selectedBottom = 0;

  void changeBottom(int index){
    _selectedBottom = index;
    setState(() {});
  }

  final List<Widget> _widgetOption = [
    Tugas7HomePage(),
    AboutNav(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tugas 8 Navigasi BottomNav"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          changeBottom(value);
        },
        currentIndex: _selectedBottom,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "About"),
        ],
      ),
      body: _widgetOption.elementAt(_selectedBottom)
    );
  }
}