import 'package:flutter/material.dart';

class DetailPage2 extends StatelessWidget {
  final String title;
  final String description;
  final List<String> features;
  final List<String>? items; // <-- tambahin ini
  final Color color;

  const DetailPage2({
    super.key,
    required this.title,
    required this.description,
    required this.features,
    required this.color,
    this.items, // <-- tambahin ini
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), backgroundColor: color),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          // biar bisa scroll kalau banyak list
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Deskripsi ---
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  description,
                  style: const TextStyle(fontFamily: "Poppins", fontSize: 14),
                ),
              ),

              const SizedBox(height: 20),

              // --- List item tambahan (opsional) ---
              if (items != null && items!.isNotEmpty) ...[
                const Text(
                  "Daftar:",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 12),
                ...items!.map(
                  (i) => ListTile(
                    leading: const Icon(Icons.star, color: Colors.orange),
                    title: Text(
                      i,
                      style: const TextStyle(fontFamily: "Poppins"),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],

              // --- Fitur Utama ---
              const Text(
                "Fitur Utama:",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 12),
              ...features.map(
                (f) => ListTile(
                  leading: const Icon(Icons.check_circle, color: Colors.green),
                  title: Text(f, style: const TextStyle(fontFamily: "Poppins")),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
