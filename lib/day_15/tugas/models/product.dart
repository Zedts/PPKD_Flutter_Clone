import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class KategoriModel {
  final String imageUrl;
  final String nama;
  KategoriModel({
    required this.imageUrl,
    required this.nama,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imageUrl': imageUrl,
      'nama': nama,
    };
  }

  factory KategoriModel.fromMap(Map<String, dynamic> map) {
    return KategoriModel(
      imageUrl: map['imageUrl'] as String,
      nama: map['nama'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory KategoriModel.fromJson(String source) => KategoriModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
