import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatepickerDrawer extends StatefulWidget {
  const DatepickerDrawer({super.key});

  @override
  State<DatepickerDrawer> createState() => DatepickerDrawerState();
}

class DatepickerDrawerState extends State<DatepickerDrawer> {

  DateTime ? _selectedDateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Date Picker", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Column(
          children: [
              ElevatedButton(onPressed: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                  );
                  if (picked != null) {
                    setState(() {
                      _selectedDateTime = picked;
                    });
                  }
              },
              child: Text("Pilih tanggal")),
              Text(
                _selectedDateTime == null 
                  ? "Anda belum pilih tanggal"
                  : DateFormat('dd-MM-yyyy', 'id_ID').format(_selectedDateTime ?? DateTime.now()),
            ),
          ],
        ),
      ),
    );
  }
}