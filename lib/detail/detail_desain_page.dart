import 'package:belajarff/detail/detail_page.dart';
import 'package:flutter/material.dart';

class DetailDesainPage extends DetailPageBase {
  const DetailDesainPage({
    super.key,
    required super.nama,
    required super.deskripsi,
    required super.gambar,
    required super.rating,
  });

  @override
  String getKategori() => "Seni";

  @override
  State<DetailDesainPage> createState() => _DetailDesainPageState();
}

class _DetailDesainPageState extends State<DetailDesainPage> {
  late String _nama;
  late String _deskripsi;
  late String _gambar;
  late double _rating;

  String get nama => _nama;
  set nama(String value) => setState(() => _nama = value);

  String get deskripsi => _deskripsi;
  set deskripsi(String value) => setState(() => _deskripsi = value);

  String get gambar => _gambar;
  set gambar(String value) => setState(() => _gambar = value);

  double get rating => _rating;
  set rating(double value) => setState(() => _rating = value);

  @override
  void initState() {
    super.initState();
    _nama = widget.nama;
    _deskripsi = widget.deskripsi;
    _gambar = widget.gambar;
    _rating = widget.rating;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Product Details",
          style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: const [
          Icon(Icons.favorite_border, color: Colors.red),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar besar full atas dengan shadow
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  _gambar,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nama Produk
                  Text(
                    _nama,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Rating
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        _rating.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Product Detail
                  const Text(
                    "Deskripsi",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _deskripsi,
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Informasi Tambahan
                  const Text(
                    "Informasi Tambahan",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Aplikasi ini dirancang sebagai referensi untuk menghasilkan karya desain.\n"
                    "\nSetiap desain ini bisa jadi referensi untuk mengasah kreativitasmu. Tapi kalau kamu ingin langsung menikmati karyanya tanpa harus membuat sendiri, kamu bisa mendapatkannya lewat fitur Chat Sekarang.",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom "Ingin Beli" + "Chat Sekarang"
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Ingin Beli?",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: "Poppins",
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Menghubungi penjual...")),
                );
              },
              child: const Text(
                "Chat Sekarang",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
