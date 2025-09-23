class Kategori {
  String nama;
  String deskripsi;
  String kategori; // <<-- tambahin ini

  Kategori({
    required this.nama,
    required this.deskripsi,
    required this.kategori,
  });

  void showInfo() {
    print("Kategori: $kategori | $nama | $deskripsi");
  }
}
