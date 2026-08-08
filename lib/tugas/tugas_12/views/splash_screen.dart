import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ppkd_b7/tugas/tugas_12/views/login_day_18.dart';
import 'package:ppkd_b7/tugas/tugas_12/services/preferenceHandler.dart';
import 'package:ppkd_b7/extension/navigator.dart';
import 'package:ppkd_b7/tugas/tugas_12/views/bottom_navigation.dart';

class SplashScreenTugas extends StatefulWidget {
  const SplashScreenTugas({super.key});

  @override
  State<SplashScreenTugas> createState() => _SplashScreenTugasState();
}

class _SplashScreenTugasState extends State<SplashScreenTugas> {
  @override
  void initState() {
    super.initState();
    goToLogin();
  }

  void goToLogin() async {
    await Future.delayed(const Duration(seconds: 3));

    if (PreferenceHandler.isLogin == true) {
      context.push(BottomTugas12());
    } else {
      context.push(LoginTugas12());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/animations/cat_splash_screen.json"),
      ),
    );
  }
}
