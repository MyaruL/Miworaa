import 'package:flutter/material.dart';

abstract class DetailPageBase extends StatefulWidget {
  final String nama;
  final String deskripsi;
  final String gambar;
  final double rating;

  const DetailPageBase({
    super.key,
    required this.nama,
    required this.deskripsi,
    required this.gambar,
    required this.rating,
  });

  String getKategori();
}
