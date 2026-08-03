import 'package:flutter/material.dart';
import 'package:ppkd_b7/day_13/drawer.dart';
import 'package:ppkd_b7/day_6/expanded.dart'; 
import 'package:ppkd_b7/day_8/stack.dart';

class BottomNavDay13 extends StatefulWidget {
  const BottomNavDay13({super.key});

  @override
  State<BottomNavDay13> createState() => _BottomNavDay13State();
}

class _BottomNavDay13State extends State<BottomNavDay13> {

  int _selectedBottom = 0;

  void changeBottom(int index){
    _selectedBottom = index;
    print("Ini adalah value dari $_selectedBottom");
    setState(() {});
  }

  final List<Widget> _widgetOption = [
    ExpandedDay6(),
    StackDay8(),
    DrawerDay13(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          changeBottom(value);
        },
        currentIndex: _selectedBottom,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "School"),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: "Business"),
        ],
      ),
      body: _widgetOption.elementAt(_selectedBottom)
    );
  }
}