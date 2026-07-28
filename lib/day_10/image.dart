import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class Image10 extends StatefulWidget {
  const Image10({super.key});

  @override
  State<Image10> createState() => _Image10State();
}

class _Image10State extends State<Image10> {
  bool showImage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image'),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [

          showImage 
            ? Image.asset("assets/images/Dragon_Ball.jpg", height: 200,)
            : Text("Gambar ga muncul"),

          showImage
            ? Image.network("https://imgcdnblog.carmudi.com.ph/wp-content/uploads/2021/11/12115417/M4-KITH-at-GIIAS-2021.jpeg", height: 200,)
            : Container(color: Colors.blue, height: 200, width: 200,),

          showImage
            ? Image.network("https://imgcdnblog.carmudi.com.ph/wp-content/uploads/2021/11/12115417/M4-KITH-at-GIIAS-2021.jpeg", height: 200,)
            : Shimmer(
              child: Container(
                color: Colors.grey,
                height: 200,
                width: 200,)),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: showImage 
              ? Colors.blue 
              : Colors.red,
            ),
            onPressed: () {
              setState(() {});
              showImage = !showImage;

              // Notif type like
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: Duration(milliseconds: 100),
                  content: Text(
                    showImage
                    ? "Sembunyikan"
                    : "Tampilkan"
                  )
                )
              );

            },
          child: Text(showImage 
          ? "Sembunyikan" 
          : "Tampilkan", 
          style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}