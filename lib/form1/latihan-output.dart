import 'package:flutter/material.dart';

class OutputFormScreen extends StatelessWidget {
  final String nama;
  final String telepon;
  final String email;
  final String kelas;
  final List<String> eskul;
  final String tglDaftar;

  const OutputFormScreen({
    super.key,
    required this.nama,
    required this.telepon,
    required this.email,
    required this.kelas,
    required this.eskul,
    required this.tglDaftar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hasil Pendaftaran"),
        backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(color: Colors.black),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        "Data Pendaftaran Eskul",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    _textWidget("Nama Lengkap", nama),
                    _textWidget("No. Telepon", telepon),
                    _textWidget("Email", email),
                    _textWidget("Kelas", kelas),

                    _textWidget("Ekstrakurikuler", eskul.join(", ")),

                    _textWidget("Tanggal Daftar", tglDaftar),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _textWidget(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(": $value")),
        ],
      ),
    );
  }
}
