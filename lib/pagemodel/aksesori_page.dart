import 'package:flutter/material.dart';

class AksesoriPage extends StatelessWidget {
  const AksesoriPage({super.key});

  final List<Map<String, dynamic>> seniList = const [
    {
      "nama": "Lukisan Sunset",
      "deskripsi": "Lukisan pemandangan matahari terbenam dengan cat minyak.",
      "gambar": "assets/images/seni1.png",
      "rating": 4.9,
    },
    {
      "nama": "Sketsa Wajah",
      "deskripsi": "Sketsa wajah realis dengan pensil hitam putih.",
      "gambar": "assets/images/seni2.png",
      "rating": 4.7,
    },
    {
      "nama": "Ilustrasi Digital",
      "deskripsi": "Ilustrasi full color untuk poster & merchandise.",
      "gambar": "assets/images/seni3.png",
      "rating": 4.8,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C3E91),
        title: const Text(
          "Aksesori",
          style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: _buildList(seniList),
    );
  }
}

Widget _buildList(List<Map<String, dynamic>> data) {
  return ListView.builder(
    padding: const EdgeInsets.all(16),
    itemCount: data.length,
    itemBuilder: (context, index) {
      final item = data[index];
      return _buildCard(item);
    },
  );
}

Widget _buildCard(Map<String, dynamic> item) {
  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // 🔹 Gambar kecil kotak
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            item["gambar"],
            width: 60, // kecil
            height: 60, // kecil
            fit: BoxFit.cover,
          ),
        ),

        const SizedBox(width: 8),

        // 🔹 Isi konten
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Judul + rating
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        item["nama"],
                        style: const TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.yellow[700],
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.star, color: Colors.white, size: 10),
                          const SizedBox(width: 2),
                          Text(
                            item["rating"].toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 4),

                // Deskripsi
                Text(
                  item["deskripsi"],
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 11,
                    color: Colors.black54,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 4),

                // Tombol lihat kecil
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    height: 22,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFEDC2A),
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Lihat",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
