import 'package:flutter/material.dart';
import 'package:ppkd_b7/day_15/tugas/screen/tugas_list.dart';
import 'package:ppkd_b7/day_15/tugas/screen/tugas_list_map.dart';
import 'package:ppkd_b7/day_15/tugas/screen/tugas_list_model.dart';
import 'package:ppkd_b7/day_16/text_form_field.dart';
import 'package:ppkd_b7/day_16/tugas/text_form_field_tugas.dart';
import 'package:ppkd_b7/extension/navigator.dart';

class DrawerTugasList extends StatefulWidget {
  const DrawerTugasList({super.key});

  @override
  State<DrawerTugasList> createState() => _DrawerTugasListState();
}

class _DrawerTugasListState extends State<DrawerTugasList> {

  int _selectedBottom = 0;

  void changeBottom(int index){
    _selectedBottom = index;
    setState(() {});
    context.pop();
  }

  final List<Widget> _widgetOption = [
    TugasListString(),
    TugasListMap(),
    TugasListModel(),
    TextFormFieldDay16(),
    TugasTextFormField()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tugas List"),
        backgroundColor: Colors.greenAccent,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.list),
              title: Text("List string"),
              onTap: () {
                changeBottom(0);
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("List map"),
              onTap: () {
                changeBottom(1);
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("List model"),
              onTap: () {
                changeBottom(2);
              },
            ),

            Divider(),

            ListTile(
              leading: Icon(Icons.text_fields),
              title: Text("Text Form Field"),
              onTap: () {
                changeBottom(3);
              },
            ),
            ListTile(
              leading: Icon(Icons.text_fields),
              title: Text("Tugas Text Form Field"),
              onTap: () {
                changeBottom(4);
              },
            ),
          ],
        ),
      ),
      body: _widgetOption.elementAt(_selectedBottom),
    );
  }
}