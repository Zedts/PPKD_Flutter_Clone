import 'package:flutter/material.dart';
import 'package:ppkd_b7/extension/navigator.dart';
import 'package:ppkd_b7/tugas/tugas_13/database/db_helper.dart';
import 'package:ppkd_b7/tugas/tugas_13/models/data_user_model.dart';
import 'package:ppkd_b7/tugas/tugas_13/views/bottom_navigation.dart';

class LoginTugas12 extends StatefulWidget {
  const LoginTugas12({super.key});

  @override
  State<LoginTugas12> createState() => _LoginTugas12State();
}

class _LoginTugas12State extends State<LoginTugas12> {
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();
  final TextEditingController namaC = TextEditingController();
  final TextEditingController noHpC = TextEditingController();
  final TextEditingController asalKotaC = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isLoginMode = true;

  void register() async {
    final nama = namaC.text.trim();
    final user = emailC.text.trim();
    final pass = passwordC.text;
    final noHp = noHpC.text.trim();
    final asalKota = asalKotaC.text.trim();

    if (nama.isEmpty || user.isEmpty || pass.isEmpty || noHp.isEmpty || asalKota.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Isi semua field!')),
      );
      return;
    }

    final pengguna = UserModelSQL(
      nama: nama,
      email: user,
      password: pass,
      nomorHp: noHp,
      asalKota: asalKota,
    );

    bool success = await DBHelper().registerUser(pengguna);

    if (!mounted) return;

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Akun berhasil dibuat')),
      );
      setState(() {
        isLoginMode = true;
      });
      emailC.clear();
      passwordC.clear();
      namaC.clear();
      noHpC.clear();
      asalKotaC.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Email sudah terdaftar!')),
      );
    }
  }

  void login() async {
    final user = emailC.text.trim();
    final pass = passwordC.text;

    if (user.isEmpty || pass.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Isi semua field!')),
      );
      return;
    }

    final pengguna = await DBHelper().loginUser(user, pass);

    if (!mounted) return;

    if (pengguna != null) {
      context.pushAndRemoveAll(BottomTugas12());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login gagal! email atau Password salah.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const primaryBgColor = Color(0xFF00224D);
    const socialBtnColor = Color(0xFF0A2E5C);

    return Scaffold(
      backgroundColor: primaryBgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 20,
          ),
          onPressed: () {},
        ),
        title: Text(
          isLoginMode ? 'Login' : 'Register',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),

                Text(
                  isLoginMode ? 'Hello Welcome Back' : 'Create Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  isLoginMode
                      ? 'Welcome Back Please Sign in Again'
                      : 'Please fill in your information',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),

                SizedBox(height: 40),

                if (!isLoginMode) ...[
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Nama tidak boleh kosong";
                      }
                      if (value.trim().length < 3) {
                        return "Nama minimal 3 karakter";
                      }
                      return null;
                    },
                    controller: namaC,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: Colors.white70,
                      ),
                      hintText: 'Nama',
                      hintStyle: TextStyle(color: Colors.white54),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white24),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],

                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email tidak boleh kosong";
                    } else if (!value.contains('@')) {
                      return "Email tidak valid";
                    }
                    return null;
                  },
                  controller: emailC,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.white70,
                    ),
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.white54),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white24),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                if (!isLoginMode) ...[
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Nomor HP tidak boleh kosong";
                      }
                      if (value.length < 10) {
                        return "Nomor HP minimal 10 digit";
                      }
                      return null;
                    },
                    controller: noHpC,
                    keyboardType: TextInputType.phone,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.phone_outlined,
                        color: Colors.white70,
                      ),
                      hintText: 'Nomor HP',
                      hintStyle: TextStyle(color: Colors.white54),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white24),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],

                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password tidak boleh kosong";
                    } else if (value.length < 6) {
                      return "Password minimal 6 karakter";
                    }
                    return null;
                  },
                  controller: passwordC,
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline, color: Colors.white70),
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.white54),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white24),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),

                if (!isLoginMode) ...[
                  SizedBox(height: 20),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Asal kota tidak boleh kosong";
                      }
                      return null;
                    },
                    controller: asalKotaC,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.location_city,
                        color: Colors.white70,
                      ),
                      hintText: 'Asal Kota',
                      hintStyle: TextStyle(color: Colors.white54),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white24),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ],

                SizedBox(height: 40),

                tombolLoginRegister(
                  primaryBgColor,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (isLoginMode) {
                        login();
                      } else {
                        register();
                      }
                    }
                  },
                  teks: isLoginMode ? "Login" : "Register",
                ),
                SizedBox(height: 14),

                tombolLoginRegister(
                  primaryBgColor,
                  onPressed: () {
                    setState(() {
                      isLoginMode = !isLoginMode;
                    });
                    emailC.clear();
                    passwordC.clear();
                    namaC.clear();
                    noHpC.clear();
                    asalKotaC.clear();
                  },
                  teks: isLoginMode ? "Register" : "Login",
                ),

                SizedBox(height: 30),

                Row(
                  children: [
                    Expanded(
                      child: Divider(color: Colors.white24, thickness: 1),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        'Or',
                        style: TextStyle(color: Colors.white54, fontSize: 12),
                      ),
                    ),
                    Expanded(
                      child: Divider(color: Colors.white24, thickness: 1),
                    ),
                  ],
                ),

                SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    label: Text(
                      'Facebook',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: socialBtnColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 0,
                    ),
                  ),
                ),

                SizedBox(height: 16),

                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    label: Text(
                      'Gmail',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: socialBtnColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 0,
                    ),
                  ),
                ),

                SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isLoginMode
                          ? 'Don\'t Have An Account ? '
                          : 'Already Have An Account ? ',
                      style: TextStyle(color: Colors.white54, fontSize: 13),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isLoginMode = !isLoginMode;
                        });
                        emailC.clear();
                        passwordC.clear();
                        namaC.clear();
                        noHpC.clear();
                        asalKotaC.clear();
                      },
                      child: Text(
                        isLoginMode ? 'Sign Up' : 'Sign In',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox tombolLoginRegister(
    Color primaryBgColor, {
    required void Function()? onPressed,
    required String teks,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: primaryBgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 0,
        ),
        child: Text(
          teks,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailC.dispose();
    passwordC.dispose();
    namaC.dispose();
    noHpC.dispose();
    asalKotaC.dispose();
    super.dispose();
  }
}