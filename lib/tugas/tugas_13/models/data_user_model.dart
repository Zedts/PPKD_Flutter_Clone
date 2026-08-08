import 'dart:convert';

class UserModelSQL {
  final int? id;
  final String nama;
  final String email;
  final String nomorHp;
  final String password;
  final String asalKota;

  UserModelSQL({
    this.id,
    required this.nama,
    required this.email,
    required this.nomorHp,
    required this.password,
    required this.asalKota,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nama': nama,
      'email': email,
      'nomor_hp': nomorHp,
      'password': password,
      'asal_kota': asalKota,
    };
  }

  factory UserModelSQL.fromMap(Map<String, dynamic> map) {
    return UserModelSQL(
      id: map['id'] != null ? map['id'] as int : null,
      nama: map['nama'] as String,
      email: map['email'] as String,
      nomorHp: map['nomor_hp'] as String,
      password: map['password'] as String,
      asalKota: map['asal_kota'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModelSQL.fromJson(String source) =>
      UserModelSQL.fromMap(json.decode(source) as Map<String, dynamic>);
}