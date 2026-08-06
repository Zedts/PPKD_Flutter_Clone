import 'dart:developer';

import 'package:flutter/material.dart';

class TugasFlutter5 extends StatefulWidget {
  const TugasFlutter5({super.key});

  @override
  State<TugasFlutter5> createState() => _TugasFlutter5State();
}

class _TugasFlutter5State extends State<TugasFlutter5> {
  bool _showSecretText = false;
  bool _isFavorite = false;
  bool _showExtraDescription = false;
  String _inkWellMessage = '';
  int _counter = 10;
  String _gestureMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interaksi Flutter'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _counter--;
            _gestureMessage = 'Counter dikurangi dengan FAB';
          });
        },
        child: Icon(Icons.remove),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ElevatedButton
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _showSecretText = !_showSecretText;
                });
              },
              child: Text('Klik Saya!'),
            ),
            SizedBox(height: 8),
            if (_showSecretText)
              Text(
                'Halo, saya Developer!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),

            SizedBox(height: 16),

            // IconButton
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: _isFavorite ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isFavorite = !_isFavorite;
                    });
                  },
                ),
                SizedBox(width: 8),
                Text(
                  _isFavorite ? 'Tersimpan di Favorit' : 'Belum disukai',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),

            SizedBox(height: 16),

            // TextButton
            TextButton(
              onPressed: () {
                setState(() {
                  _showExtraDescription = !_showExtraDescription;
                });
              },
              child: Text('Deskripsi tambahan'),
            ),
            if (_showExtraDescription)
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  'Ini adalah paragraf deskripsi tambahan. '
                  'HALO HALO HALO',
                  style: TextStyle(fontSize: 14),
                ),
              ),

            SizedBox(height: 24),

            // InkWell
            InkWell(
              onTap: () {
                setState(() {
                  _inkWellMessage = 'Sentuhan terdeteksi pada kotak InkWell';
                });
                log('Sentuhan terdeteksi (InkWell)');
              },
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Kotak InkWell (Tap di sini)',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            if (_inkWellMessage.isNotEmpty)
              Text(
                _inkWellMessage,
                style: TextStyle(fontSize: 14),
              ),

            SizedBox(height: 24),

            // GestureDetector
            GestureDetector(
              onTap: () {
                setState(() {
                  _counter += 1;
                  _gestureMessage = 'Ditekan sekali';
                });
                log('Ditekan sekali');
              },
              onDoubleTap: () {
                setState(() {
                  _counter += 2;
                  _gestureMessage = 'Ditekan dua kali';
                });
                log('Ditekan dua kali');
              },
              onLongPress: () {
                setState(() {
                  _counter += 3;
                  _gestureMessage = 'Tahan lama';
                });
                log('Tahan lama');
              },
              child: Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Angka: $_counter',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            if (_gestureMessage.isNotEmpty)
              Text(
                'Aksi terakhir: $_gestureMessage',
                style: TextStyle(fontSize: 14),
              ),
          ],
        ),
      ),
    );
  }
}