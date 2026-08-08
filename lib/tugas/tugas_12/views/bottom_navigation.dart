import 'package:flutter/material.dart';
import 'package:ppkd_b7/tugas/tugas_12/views/data_user.dart';
import 'package:ppkd_b7/tugas/tugas_12/views/login_day_18.dart';
import 'package:ppkd_b7/tugas/tugas_12/services/preferenceHandler.dart';
import 'package:ppkd_b7/extension/navigator.dart';
import 'package:ppkd_b7/tugas/tugas_12/views/home.dart';

class BottomTugas12 extends StatefulWidget {
  const BottomTugas12({super.key});

  @override
  State<BottomTugas12> createState() => _BottomTugas12State();
}

class _BottomTugas12State extends State<BottomTugas12> {

  int _selectedBottom = 0;

  void changeBottom(int index){
    _selectedBottom = index;
    setState(() {});
  }

  final List<Widget> _widgetOption = [
    HomeTugas12(),
    DataUserTugas12(),
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
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Data"),
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
        context.pushAndRemoveAll(LoginTugas12());
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
