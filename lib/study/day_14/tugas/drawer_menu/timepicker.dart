import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimePickerDrawer extends StatefulWidget {
  const TimePickerDrawer({super.key});

  @override
  State<TimePickerDrawer> createState() => TimePickerDrawerState();
}

class TimePickerDrawerState extends State<TimePickerDrawer> {

  TimeOfDay ? _selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time Picker", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Column(
          children: [
              ElevatedButton(onPressed: () async {
                final TimeOfDay? picked = await showTimePicker(
                  context: context,
                  // firstDate: DateTime.now(),
                  // lastDate: DateTime(2100),
                  initialTime: TimeOfDay.now(),
                  );
                    if (picked != null) {
                      setState(() {
                        _selectedTime = picked;
                        });
                    }
              },
              child: Text("Pilih jam")),
              Text(
                  _selectedTime == null 
                    ? "Anda belum pilih jam"
                    : DateFormat('HH:mm a').format(DateTime(0,0,0, _selectedTime!.hour, _selectedTime!.minute,)),
              ),
            ],
        ),
      ),
    );
  }
}