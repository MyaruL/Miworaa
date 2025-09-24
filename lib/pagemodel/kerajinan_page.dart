import 'package:flutter/material.dart';

import '../detail/detail_kerajinan_page.dart';

class KerajinanPage extends StatelessWidget {
  const KerajinanPage({super.key});

  final List<Map<String, dynamic>> kerajinanList = const [
    {
      "nama": "Mini Clay Sushi",
      "deskripsi": "Clay charm bentuk makanan mini lucu.",
      "gambar": "assets/images/k1.jpeg",
      "rating": 4.9,
    },
    {
      "nama": "Resin Glitter Keychain",
      "deskripsi": "Gantungan resin isi glitter + bunga kering.",
      "gambar": "assets/images/k2.jpeg",
      "rating": 4.7,
    },
    {
      "nama": "Handpaint Totebag",
      "deskripsi": "Totebag dilukis manual ala ala.",
      "gambar": "assets/images/k3.jpeg",
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
          "Kerajinan",
          style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: _buildList(context, kerajinanList),
    );
  }
}

Widget _buildList(BuildContext context, List<Map<String, dynamic>> data) {
  return ListView.builder(
    padding: const EdgeInsets.all(16),
    itemCount: data.length,
    itemBuilder: (context, index) {
      final item = data[index];
      return _buildCard(context, item);
    },
  );
}

Widget _buildCard(BuildContext context, Map<String, dynamic> item) {
  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          ),
          child: Image.asset(
            item["gambar"],
            width: 90,
            height: 90,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        item["nama"],
                        style: const TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.yellow[700],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
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
                Text(
                  item["deskripsi"],
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFEDC2A),
                      foregroundColor: Colors.black,
                      minimumSize: const Size(50, 24),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailKerajinanPage(
                            nama: item["nama"],
                            deskripsi: item["deskripsi"],
                            gambar: item["gambar"],
                            rating: item["rating"],
                          ),
                        ),
                      );
                    },
                    child: const Text("Lihat", style: TextStyle(fontSize: 10)),
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
