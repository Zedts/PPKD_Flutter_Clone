import 'dart:developer';

import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(counter.toString(), style: TextStyle(fontSize: 100),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {
                log(counter.toString());
                setState(() {});
                counter--;
              },
              child: Text("Kurang")),

              ElevatedButton(onPressed: () {
                counter = 0;
                setState(() {});
              },
              child: Text("Back to Zero")),

              ElevatedButton(onPressed: () {
                log(counter.toString());
                setState(() {});
                counter++;
              },
              child: Text("Tambah")),
            ],
          ),
        ],
      ),
    );
  }
}