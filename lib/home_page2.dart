import 'package:belajarff/detail/detail_trending_page.dart';
import 'package:belajarff/detail_page2.dart';
import 'package:belajarff/model/trending_item.dart';
import 'package:belajarff/pagemodel/aksesori_page.dart';
import 'package:belajarff/pagemodel/desain_page.dart';
import 'package:belajarff/pagemodel/kerajinan_page.dart';
import 'package:belajarff/pagemodel/seni_page.dart';
import 'package:flutter/material.dart';
import 'model/aksesori.dart';
import 'model/desain.dart';
import 'model/kerajinan.dart';
import 'model/seni.dart';

class HomePage2 extends StatelessWidget {
  final String username;
  HomePage2({super.key, required this.username});

  final List<dynamic> kategoriList = [
    Seni(
      nama: "Warna Jiwa",
      deskripsi:
          "Tempat coretan random bisa jadi masterpiece. Dari doodle receh sampe lukisan deep vibes",
      jenisSeni: "Lukisan",
    ),
    Desain(
      nama: "Ruang Visual",
      deskripsi:
          "Bukan sekadar edit-edit, tapi gimana ide itu keliatan estetik. Logo, poster, feed? Semuanya bisa",
      software: "Photoshop",
    ),
    Kerajinan(
      nama: "Kreasi Tangan",
      deskripsi:
          "DIY yang bikin tangan gatel pengen coba yang hasilnya always unik",
      bahan: "Rotan",
    ),
    Aksesori(
      nama: "Hiasan Kyut",
      deskripsi:
          "Hal kecil tapi bikin gaya stand out. Gelang, kalung, gantungan, semua handmade with love",
      material: "Kayu & Manik",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C3E91),
        elevation: 0,
        title: const Text(
          "Home",
          style: TextStyle(
            fontFamily: "Poppins",
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.person, color: Colors.blue[900]),
          ),
          const SizedBox(width: 16),
        ],
      ),

      // --- Body ---
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Greeting box ---
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFEDC2A),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hallo, $username 👋",
                            style: const TextStyle(
                              fontSize: 24,
                              fontFamily: "MoreSugar",
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Apa yang mau kita lakukan hari ini?",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Poppins",
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset("assets/images/miwora1.png", height: 100),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // --- Search bar ---
              TextField(
                decoration: InputDecoration(
                  hintText: "Cari sesuatu...",
                  hintStyle: const TextStyle(fontFamily: "Poppins"),
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // --- List Miw ---
              const Text(
                "List Miw",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),

              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: kategoriList.map((item) {
                  return _buildCategoryCard(context, item);
                }).toList(),
              ),

              const SizedBox(height: 24),

              // --- Top Trending ---
              const Text(
                "Top Trending",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),

              SizedBox(
                height: 240, // tinggi card trending
                child: ListView.builder(
                  scrollDirection: Axis.horizontal, // geser samping
                  itemCount: trendingList.length,
                  itemBuilder: (context, index) {
                    final trending = trendingList[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailTrendingPage(
                              nama: trending.nama,
                              deskripsi: trending.deskripsi,
                              gambar: trending.gambar,
                              kategori: trending.kategori,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: 200,
                        margin: const EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Stack(
                            children: [
                              // Gambar full background
                              Image.asset(
                                trending.gambar,
                                width: 200,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),

                              // Overlay gradient biar teks kebaca
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.black.withOpacity(0.6),
                                      Colors.transparent,
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                              ),

                              // Teks judul & deskripsi
                              Positioned(
                                bottom: 12,
                                left: 12,
                                right: 12,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      trending.nama,
                                      style: const TextStyle(
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      trending.deskripsi,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 12,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      // --- Bottom Navigation ---
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF2C3E91),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.build), label: "DIY"),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: "Market"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
    );
  }
}

// --- Card kategori ---
Widget _buildCategoryCard(BuildContext context, dynamic item) {
  return InkWell(
    onTap: () {
      if (item is Seni) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SeniPage()),
        );
      } else if (item is Desain) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DesainPage()),
        );
      } else if (item is Kerajinan) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const KerajinanPage()),
        );
      } else if (item is Aksesori) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AksesoriPage()),
        );
      }
    },
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.category, color: Colors.blue[900], size: 20),
              const SizedBox(width: 6),
              Text(
                item.runtimeType.toString(),
                style: const TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            item.nama,
            style: const TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          Text(
            item.deskripsi,
            style: const TextStyle(
              fontFamily: "Poppins",
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    ),
  );
}

final List<TrendingItem> trendingList = [
  TrendingItem(
    nama: "Fanart K-Pop Idol",
    deskripsi: "Gambar bias K-Pop ala aesthetic sketch, favorit stan",
    gambar: "assets/images/artkpop.jpeg",
    kategori: "Seni",
  ),
  TrendingItem(
    nama: "Clay Custom",
    deskripsi: "Bebek lucu dari clay",
    gambar: "assets/images/bebek.jpeg",
    kategori: "Kerajinan",
  ),
  TrendingItem(
    nama: "Keychain",
    deskripsi: "Gantungan kunci karakter gemas",
    gambar: "assets/images/keyc.jpeg",
    kategori: "Aksesori",
  ),
  TrendingItem(
    nama: "Portofolio",
    deskripsi: "Desain portofolio custom buat syarat",
    gambar: "assets/images/porto.jpeg",
    kategori: "Desain",
  ),
];
