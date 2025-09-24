import 'dart:async';
import 'package:flutter/material.dart';
import 'login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFCF7), // warna krem
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/miwora3.png", // ganti sesuai nama file
              width: 180,
            ),
            const SizedBox(height: 20),
            const Text(
              "Miwora",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: "MoreSugar",
                color: Color(0xFF2E64A1),
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "Turn Ideas Into Art",
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Color(0xFF2E64A1),
              ),
            ),
            const SizedBox(height: 30),
            const CircularProgressIndicator(
              strokeWidth: 3,
              color: Color(0xFF2E64A1),
            ),
            const SizedBox(height: 60),
            const Text(
              "by. MIyaw",
              style: TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
                color: Color(0xFF2E64A1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
