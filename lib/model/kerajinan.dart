import 'kategori.dart';

class Kerajinan extends Kategori {
  String bahan;

  Kerajinan({
    required String nama,
    required String deskripsi,
    required this.bahan,
  }) : super(nama: nama, deskripsi: deskripsi, kategori: "Kerajinan");

  @override
  void showInfo() {
    print("🪵 Kerajinan: $nama | Bahan: $bahan | $deskripsi");
  }
}
