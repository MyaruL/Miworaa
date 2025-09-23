import 'kategori.dart';

class Desain extends Kategori {
  String software;

  Desain({
    required String nama,
    required String deskripsi,
    required this.software,
  }) : super(nama: nama, deskripsi: deskripsi, kategori: "Desain");

  @override
  void showInfo() {
    print("🖌️ Desain: $nama | Software: $software | $deskripsi");
  }
}
