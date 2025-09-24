import 'package:flutter/material.dart';
import 'home_page2.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscure = true;

  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _pwCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFFEDC2A), // 🔹 full background kuning
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),

                // Logo / gambar
                Image.asset("assets/images/miwora.png", height: 150),

                const SizedBox(height: 8),
                const Text(
                  "Halllow!!!",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    color: Colors.black87,
                  ),
                ),
                const Text(
                  "Miwora",
                  style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'MoreSugar',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C3E91),
                  ),
                ),

                const SizedBox(height: 24),

                // Container putih buat isi form
                Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    minHeight:
                        MediaQuery.of(context).size.height *
                        0.75, // ✅ fleksibel
                  ),
                  padding: const EdgeInsets.all(24),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Masuk",
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2C3E91),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Nama
                      TextField(
                        controller: _nameCtrl,
                        decoration: _inputStyle("Nama"),
                      ),
                      const SizedBox(height: 16),

                      // Email
                      TextField(
                        controller: _emailCtrl,
                        decoration: _inputStyle("Email"),
                      ),
                      const SizedBox(height: 16),

                      // Password
                      TextField(
                        controller: _pwCtrl,
                        obscureText: _obscure,
                        decoration: _inputStyle("Password").copyWith(
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscure = !_obscure;
                              });
                            },
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Tombol masuk
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            String name = _nameCtrl.text;
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage2(username: name),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2C3E91),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 12,
                            ),
                          ),
                          child: const Text("Masuk"),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Link daftar
                      Center(
                        child: InkWell(
                          onTap: () {
                            // pindah ke RegisterPage
                          },
                          child: const Text.rich(
                            TextSpan(
                              text: "Tidak punya akun? ",
                              style: TextStyle(
                                color: Colors.black87,
                                fontFamily: 'Poppins',
                              ),
                              children: [
                                TextSpan(
                                  text: "Daftar",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputStyle(String label) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: const Color(0xFFEFEFEF),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
    );
  }
}
