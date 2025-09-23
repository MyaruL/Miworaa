import 'kategori.dart';

class Seni extends Kategori {
  String jenisSeni;

  Seni({
    required String nama,
    required String deskripsi,
    required this.jenisSeni,
  }) : super(nama: nama, deskripsi: deskripsi, kategori: "Seni");

  @override
  void showInfo() {
    print("🎨 Seni: $nama | Jenis: $jenisSeni | $deskripsi");
  }
}
