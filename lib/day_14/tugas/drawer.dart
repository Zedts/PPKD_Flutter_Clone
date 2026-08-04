import 'package:flutter/material.dart';
import 'package:ppkd_b7/day_14/tugas/drawer_menu/checkbox.dart';
import 'package:ppkd_b7/day_14/tugas/drawer_menu/datepicker.dart';
import 'package:ppkd_b7/day_14/tugas/drawer_menu/dropdown.dart';
import 'package:ppkd_b7/day_14/tugas/drawer_menu/switch.dart';
import 'package:ppkd_b7/day_15/list.dart';
import 'package:ppkd_b7/day_15/list_model.dart';
import 'package:ppkd_b7/day_15/list_of_map.dart';
import 'package:ppkd_b7/extension/navigator.dart';

class Tugas7HomePage extends StatefulWidget {
  const Tugas7HomePage({super.key});

  @override
  State<Tugas7HomePage> createState() => _Tugas7HomePageState();
}

class _Tugas7HomePageState extends State<Tugas7HomePage> {

  int _selectedBottom = 0;

  void changeBottom(int index){
    _selectedBottom = index;
    setState(() {});
    context.pop();
  }

  final List<Widget> _widgetOption = [
    CheckboxDrawer(),
    SwitchDrawer(),
    DropdownDrawer(),
    DatepickerDrawer(),
    ListDataDay15(),
    ListOfMapDay15(),
    ListModel15(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tugas 7 Navigasi drawer & form input interaktif"),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.question_mark),
              title: Text("Syarat & Ketentuan"),
              onTap: () {
                changeBottom(0);
              },
            ),
            ListTile(
              leading: Icon(Icons.display_settings),
              title: Text("Tampilan"),
              onTap: () {
                changeBottom(1);
              },
            ),
            ListTile(
              leading: Icon(Icons.category),
              title: Text("Kategori"),
              onTap: () {
                changeBottom(2);
              },
            ),
            ListTile(
              leading: Icon(Icons.date_range),
              title: Text("Pilih Tanggal"),
              onTap: () {
                changeBottom(3);
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("List"),
              onTap: () {
                changeBottom(4);
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("List of map"),
              onTap: () {
                changeBottom(5);
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("List model"),
              onTap: () {
                changeBottom(6);
              },
            ),
          ],
        ),
      ),
      body: _widgetOption.elementAt(_selectedBottom),
    );
  }
}