import 'package:lottie/lottie.dart';

import 'package:flutter/material.dart';
import 'package:ppkd_b7/day_13/drawer.dart';
import 'package:ppkd_b7/day_16/home_abal_abal.dart';
import 'package:ppkd_b7/extension/navigator.dart';

class TextFormFieldDay16 extends StatefulWidget {
  const TextFormFieldDay16({super.key});

  @override
  State<TextFormFieldDay16> createState() => _TextFormFieldDay16State();
}

class _TextFormFieldDay16State extends State<TextFormFieldDay16> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [

            Text("TextField"),

            TextField(controller: emailController,
            onChanged: (value) {
              setState(() {});
            },),
            TextField(controller: passwordController,),
            TextField(controller: confirmPasswordController,),

            Text("TextFormField"),

            TextFormField(
              controller: emailController,
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

            TextFormField(
              controller: passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Password tidak boleh kosong";
                } else if (value.length < 8) {
                  return "Password kurang dari 8 karakter";
                }
                return null;
              },
            ),

            TextFormField(
              controller: confirmPasswordController,
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
            Text(
              emailController.text,
              style: TextStyle(
                color: Colors.red,
                fontSize: 24),
            ),
            ElevatedButton(onPressed: () {
              print(emailController.text);
              print(passwordController.text);
              print(confirmPasswordController.text);
              if (_formKey.currentState!.validate()) {
                // context.push(DrawerDay13());
                context.push(HomeAbalAbalDay16(
                  email: emailController.text,
                  password: passwordController.text,
                ));
              } else {
                print("Belum tervalidasi");
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.grey[100],
                    title: Text("Info", textAlign: TextAlign.center,),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Lottie.asset("assets/animations/Error_animation.json"),
                        Text("${emailController.text} tidak valid"),
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
            }, child: Text("Tekan ini")),
          ],
        ),
      ),
    );
  }
}