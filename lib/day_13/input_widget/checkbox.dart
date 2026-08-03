import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CheckBoxDay13 extends StatefulWidget {
  const CheckBoxDay13({super.key});

  @override
  State<CheckBoxDay13> createState() => _CheckBoxDay13State();
}

class _CheckBoxDay13State extends State<CheckBoxDay13> {
  bool _isChecked = false;
  bool _isOn = false;
  String ? _selected;
  DateTime ? _selectedDateTime;
  TimeOfDay ? _selectedTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          checkboxWidget(),
          Divider(),
          switchWidget(),
          Divider(),
          dropdownWidget(),
          Divider(),
          datePickerWidget(context),
          Divider(),
          timePickerWidget(context),
        ],
      ),
    );
  }

  Column timePickerWidget(BuildContext context) {
    return Column(
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
        );
  }

  Column datePickerWidget(BuildContext context) {
    return Column(
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
                : DateFormat('EEE, dd MMM yyyy', 'id_ID').format(_selectedDateTime ?? DateTime.now()),
            ),
          ],
        );
  }

  Column dropdownWidget() {
    return Column(
          children: [
            DropdownButton(
              dropdownColor: 
                  _selected == "Merah"
                  ? Colors.red
                  : _selected == "Kuning"
                  ? Colors.yellow
                  : _selected == "Hijau"
                  ? Colors.green
                  : Colors.white,
              value: _selected,
              items: ["Merah", "Kuning", "Hijau"].map((String val) {
                return DropdownMenuItem(value: val, child: Text(val));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selected = value;
                });
              },
            ),
            
            DropdownButtonFormField(
              decoration: InputDecoration(
                fillColor: 
                    _selected == "Merah"
                    ? Colors.red
                    : _selected == "Kuning"
                    ? Colors.yellow
                    : _selected == "Hijau"
                    ? Colors.green
                    : Colors.white,
                filled: true,
              ),
              dropdownColor:
                  _selected == "Merah"
                  ? Colors.red
                  : _selected == "Kuning"
                  ? Colors.yellow
                  : _selected == "Hijau"
                  ? Colors.green
                  : Colors.white,
              initialValue: _selected,
              items: ["Merah", "Kuning", "Hijau"].map((String val) {
                return DropdownMenuItem(value: val, child: Text(val));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selected = value;
                });
              },
            ),
            
            Text(_selected.toString()),
            Container(
              height: 50,
              width: 50,
              color:
                  _selected == "Merah"
                  ? Colors.red
                  : _selected == "Kuning"
                  ? Colors.yellow
                  : _selected == "Hijau"
                  ? Colors.green
                  : Colors.white,
            ),
          ],
        );
  }

  Column switchWidget() {
    return Column(
          children: [
            Switch(
              activeThumbColor: Colors.red,
              inactiveThumbColor: Colors.black,
              value: _isOn,
              onChanged: (value) {
                _isOn = value ?? false;
                setState(() {});
              }
            ),
            Text(_isOn
              ? "On"
              : "Off",
              style: TextStyle(color: _isOn ? Colors.red : Colors.black),
            ),
          ],
        );
  }

  Column checkboxWidget() {
    return Column(
          children: [
            Checkbox(
              value: _isChecked,
              onChanged: (value) {
                _isChecked = value ?? false;
                setState(() {});
              }
            ),
            Text(_isChecked
              ? "Sudah di ceklist"
              : "Belum di ceklist"
            ),
          ],
        );
  }
}