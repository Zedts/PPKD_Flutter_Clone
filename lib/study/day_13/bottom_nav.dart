import 'package:flutter/material.dart';
import 'package:ppkd_b7/study/day_13/drawer.dart';
import 'package:ppkd_b7/study/day_17/service/preference_handler.dart';
import 'package:ppkd_b7/study/day_17/views/login_day_17.dart';
import 'package:ppkd_b7/study/day_6/expanded.dart'; 
import 'package:ppkd_b7/study/day_8/stack.dart';
import 'package:ppkd_b7/extension/navigator.dart';

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
    const LogoutScreen(),
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
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: "Logout"),
        ],
      ),
      body: _widgetOption.elementAt(_selectedBottom)
    );
  }
}

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // 1. Menghapus session status login di SharedPreferences lokal.
        PreferenceHandler.logOut();

        // 2. Mengarahkan pengguna kembali ke halaman LoginDay17 serta menghapus seluruh tumpukan navigasi sebelumnya (pushAndRemoveAll).
        context.pushAndRemoveAll(const LoginDay17());
      },
      child: const Center(
        child: Icon(Icons.logout, size: 48),
      ),
    );
  }
}
