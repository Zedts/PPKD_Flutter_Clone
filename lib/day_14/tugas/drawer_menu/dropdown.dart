import 'package:flutter/material.dart';

class DropdownDrawer extends StatefulWidget {
  const DropdownDrawer({super.key});

  @override
  State<DropdownDrawer> createState() => DropdownDrawerState();
}

class DropdownDrawerState extends State<DropdownDrawer> {

  String ? _selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Column(
          children: [
              DropdownButton(
                dropdownColor: 
                    _selected == "Elektronik"
                    ? Colors.red
                    : _selected == "Pakaian"
                    ? Colors.yellow
                    : _selected == "Makanan"
                    ? Colors.green
                    : _selected == "Lainnya"
                    ? Colors.blue
                    : Colors.white,
                value: _selected,
                items: ["Elektronik", "Pakaian", "Makanan", "Lainnya"].map((String val) {
                  return DropdownMenuItem(value: val, child: Text(val));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selected = value;
                  });
                },
              ),
              Text("Anda memilih $_selected"),
            ],
        ),
      ),
    );
  }
}