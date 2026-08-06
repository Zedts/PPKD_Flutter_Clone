import 'package:flutter/material.dart';

class SwitchDrawer extends StatefulWidget {
  const SwitchDrawer({super.key});

  @override
  State<SwitchDrawer> createState() => _SwitchDrawerState();
}

class _SwitchDrawerState extends State<SwitchDrawer> {
  bool _isOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isOn ? Colors.white : Colors.black,
      appBar: AppBar(
        title: Text("Ganti Mode Gelap / Terang", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Column(
          children: [
            Switch(
                activeThumbColor: Colors.black,
                inactiveThumbColor: Colors.white,
                value: _isOn,
                onChanged: (value) {
                  _isOn = value;
                  setState(() {});
                }
              ),
              Text(_isOn
                ? "Nonaktifkan Mode Gelap"
                : "Aktifkan mode gelap",
                style: TextStyle(color: _isOn ? Colors.black : Colors.white),
              ),
          ],
        ),
      ),
    );
  }
}