import 'kategori.dart';

class Aksesori extends Kategori {
  String material;

  Aksesori({
    required String nama,
    required String deskripsi,
    required this.material,
  }) : super(nama: nama, deskripsi: deskripsi, kategori: "Aksesori");

  @override
  void showInfo() {
    print("💍 Aksesori: $nama | Material: $material | $deskripsi");
  }
}
