import 'package:lottie/lottie.dart';

import 'package:flutter/material.dart';
import 'package:ppkd_b7/study/day_16/tugas/home_tugas.dart';
import 'package:ppkd_b7/extension/navigator.dart';

class TugasTextFormField extends StatefulWidget {
  const TugasTextFormField({super.key});

  @override
  State<TugasTextFormField> createState() => _TugasTextFormFieldState();
}

class _TugasTextFormFieldState extends State<TugasTextFormField> {

  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController kelasController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
            
                TextFormField(
                  controller: namaController,
                  decoration: InputDecoration(
                    labelText: 'Nama',
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Nama tidak boleh kosong";
                    }
                    final regex = RegExp(r'^[a-zA-Z]+$');
                    if (!regex.hasMatch(value)) {
                      return "Nama tidak valid";
                    } else if (value.length < 3) {
                      return "Maksimal 3 karakter";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 10),

                TextFormField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Nomor Telepon',
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Nomor telepon tidak boleh kosong";
                    }
                    final regex = RegExp(r'^[0-9]+$');
                    if (!regex.hasMatch(value)) {
                      return "Nomor telepon hanya boleh mengandung angka";
                    }
                    if (value.length < 10) {
                      return "Nomor telepon minimal 10 digit";
                    }
                    if (value.length > 15) {
                      return "Nomor telepon terlalu panjang";
                    }
                    return null;
                  },
                ),
            
                SizedBox(height: 10),
            
                TextFormField(
                  controller: kelasController,
                  decoration: InputDecoration(
                    labelText: 'Kelas kamu (contoh: AppDev)',
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Kelas tidak boleh kosong";
                    }
                    final regex = RegExp(r'^[a-zA-Z]+$');
                    if (!regex.hasMatch(value)) {
                      return "Kelas tidak valid";
                    }
                    return null;
                  },
                ),
            
                SizedBox(height: 10),
            
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                  ),
                  validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email tidak boleh kosong";
                      } else if (!value.contains("@")) {
                        return "Email tidak valid";
                      } else if (!value.contains("ppkd.com")) {
                        return "Bukan email ppkd";
                      }
                      return null;
                    },
                  ),
            
                SizedBox(height: 10),
            
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                  ),
                  validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password tidak boleh kosong";
                      } else if (value.length < 8) {
                        return "Password kurang dari 8 karakter";
                      }
                      return null;
                    },
                  ),
            
                SizedBox(height: 10),
            
                TextFormField(
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: 'Konfirmasi Password',
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                  ),
                  validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Konfirmasi password tidak boleh kosong";
                      } else if (value.length < 8) {
                        return "Konfirmasi password kurang dari 8 karakter";
                      } else if (value != passwordController.text) {
                        return "Password tdaik cocok";
                      }
                      return null;
                    },
                  ),
            
                SizedBox(height: 10),
            
                ElevatedButton(onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.push(HomeTugas(
                      nama: namaController.text,
                      telepon: phoneNumberController.text,
                      kelas: kelasController.text,
                      email: emailController.text,
                      password: passwordController.text,
            
                    ));
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: Colors.grey[100],
                        title: Text("Info", textAlign: TextAlign.center,),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Lottie.asset("assets/animations/Error_animation.json"),
                            Text("${emailController.text} Tidak valid"),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              context.pop();
                            },
                            child: Text("Baiklah")
                          ),
                        ],
                      )
                    );
                  }
                }, child: Text("Submit")),
              ],
            ),
          ),
        ),
    );
  }
}