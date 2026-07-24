import 'package:flutter/material.dart';

class TugasDart3 extends StatefulWidget {
  const TugasDart3({super.key});

// =========================AI Help======================
  @override
  State<TugasDart3> createState() => _TugasDart3State();
}

class _TugasDart3State extends State<TugasDart3> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
// ======================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrasi Katalog Super Car'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Form Registrasi Pengguna',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),

            // Nama Lengkap
            TextField(
              decoration: InputDecoration(
                labelText: 'Nama Lengkap',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 12),

            // Email
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 12),

            // No. HP
            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'No. HP',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            SizedBox(height: 12),

            // Password (AI Help)
            TextField(
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword 
                      ? Icons.visibility_off 
                      : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 12),

            // Konfirmasi Password (AI Help)
            TextField(
              obscureText: _obscureConfirmPassword,
              decoration: InputDecoration(
                labelText: 'Konfirmasi Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureConfirmPassword
                      ? Icons.visibility_off
                      : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 12),

            // Deskripsi
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Deskripsi',
                alignLabelWithHint: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: Icon(Icons.description),
              ),
            ),
            SizedBox(height: 24),

            Text(
              'Galeri Konten',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),

            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                _GridItem(
                  imageUrl:
                      'https://i.pinimg.com/736x/fe/d1/b3/fed1b3844d38e8b87fd8958f406fff70.jpg',
                  label: 'M4',
                ),
                _GridItem(
                  imageUrl:
                      'https://i.pinimg.com/736x/6e/15/de/6e15de22858b50708a069fcbf72ace1d.jpg',
                  label: 'M3',
                ),
                _GridItem(
                  imageUrl:
                      'https://i.pinimg.com/1200x/25/38/65/253865a820946afe4c94a1740e664157.jpg',
                  label: 'M8',
                ),
                _GridItem(
                  imageUrl:
                      'https://i.pinimg.com/1200x/a6/e5/3f/a6e53f8a11faa93b46d29e186d950d42.jpg',
                  label: '911',
                ),
                _GridItem(
                  imageUrl:
                      'https://i.pinimg.com/736x/8e/18/9d/8e189d485e364c84f0e33e3bd9c37233.jpg',
                  label: 'MK4',
                ),
                _GridItem(
                  imageUrl:
                      'https://i.pinimg.com/1200x/45/94/08/45940842b391ad0dee2198cea5ea522c.jpg',
                  label: 'Mercedes',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _GridItem extends StatelessWidget {
  final String imageUrl;
  final String label;

  const _GridItem({
    required this.imageUrl,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.6),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(12),
              ),
            ),
            child: Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}