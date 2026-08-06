import 'package:flutter/material.dart';

class TugasFlutter4 extends StatelessWidget {
  const TugasFlutter4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laporan Kunjungan', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            'Formulir Kunjungan Showroom',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),

          TextField(
            decoration: InputDecoration(
              labelText: 'Nama Lengkap',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
          ),
          SizedBox(height: 12),

          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email),
            ),
          ),
          SizedBox(height: 12),

          TextField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: 'No. HP',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.phone),
            ),
          ),
          SizedBox(height: 12),

          TextField(
            maxLines: 2,
            decoration: InputDecoration(
              labelText: 'Alasan ingin ke showroom',
              alignLabelWithHint: true,
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.description),
            ),
          ),
          SizedBox(height: 24),

          Text(
            'MY SHOWROOM',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12),

          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.brown,
              child: Icon(
                color: Colors.white,
                Icons.directions_car
                ),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            title: Text('BMW M4'),
            subtitle: Text('Mobil pertama saya'),
          ),
          Divider(),

          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(
                color: Colors.white,
                Icons.directions_car
                ),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            title: Text('BMW M3'),
            subtitle: Text('Mobil kedua saya'),
          ),
          Divider(),

          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.orangeAccent,
              child: Icon(
                color: Colors.white,
                Icons.directions_car
                ),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            title: Text('BMW M8'),
            subtitle: Text('Mobil ketiga saya'),
          ),
          Divider(),

          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blueAccent,
              child: Icon(
                color: Colors.white,
                Icons.directions_car
                ),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            title: Text('Porsche 911'),
            subtitle: Text('Mobil keempat saya'),
          ),
          Divider(),

          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.redAccent,
              child: Icon(
                color: Colors.white,
                Icons.directions_car
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            title: Text('Mercedes'),
            subtitle: Text('Mobil kelima saya'),
          ),
        ],
      ),
    );
  }
}