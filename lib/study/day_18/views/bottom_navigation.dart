import 'package:flutter/material.dart';
import 'package:ppkd_b7/study/day_18/views/data_user.dart';
import 'package:ppkd_b7/study/day_18/views/login_day_18.dart';
import 'package:ppkd_b7/study/day_18/services/preferenceHandler.dart';
import 'package:ppkd_b7/extension/navigator.dart';
import 'package:ppkd_b7/study/day_18/views/home.dart';

class BottomTugas extends StatefulWidget {
  const BottomTugas({super.key});

  @override
  State<BottomTugas> createState() => _BottomTugasState();
}

class _BottomTugasState extends State<BottomTugas> {

  int _selectedBottom = 0;

  void changeBottom(int index){
    _selectedBottom = index;
    setState(() {});
  }

  final List<Widget> _widgetOption = [
    TugasHome(),
    DataUserDay18(),
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
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "User"),
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
      onTap: () async {
        await PreferenceHandler.logOut();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('berhasil logout'), duration: Duration(seconds: 1),),
        );
        if (!context.mounted) return;
        context.pushAndRemoveAll(const LoginDay18SQFLITE());
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Pencet tombol ini", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,)),
          Center(
            child: Icon(Icons.logout, size: 48),
          ),
        ],
      ),
    );
  }
}
