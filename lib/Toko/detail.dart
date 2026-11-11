import 'package:flutter/material.dart';
import 'daftar.dart';
import 'pembayaran.dart';

const Color _krem = Color(0xFFFFFDF0);
const Color _navy = Color(0xFF2B2A5C);
const Color _oranye = Color(0xFFFF8A3D);

String _rp(int v) {
  final s = v.toString();
  final b = StringBuffer();
  for (int i = 0; i < s.length; i++) {
    if (i > 0 && (s.length - i) % 3 == 0) b.write('.');
    b.write(s[i]);
  }
  return 'Rp$b';
}

class DetailItemPage extends StatefulWidget {
  // Data produk diterima sebagai Map (tanpa kelas model)
  final Map<String, dynamic> produk;

  const DetailItemPage({super.key, required this.produk});

  @override
  State<DetailItemPage> createState() => _DetailItemPageState();
}

class _DetailItemPageState extends State<DetailItemPage> {
  int _varianIndex = 0;
  int _jumlah = 1;

  @override
  Widget build(BuildContext context) {
    final p = widget.produk;
    final List varian = p['varian'] as List;
    final List tambahan = p['tambahan'] as List;
    // Harga satuan = harga dasar + tambahan sesuai RAM/penyimpanan
    final int harga = (p['harga'] as int) + (tambahan[_varianIndex] as int);
    final int stok = p['stok'] as int;

    return Scaffold(
      backgroundColor: _krem,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Bar atas
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _tombolBulat(Icons.arrow_back_ios_new,
                            () => Navigator.pop(context)),
                        _tombolBulat(Icons.shopping_bag_outlined,
                            () => tampilKeranjang(context)),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Gambar produk
                    Container(
                      height: 280,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(p['warna'] as int),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Stack(
                        children: [
                          Center(
                            child: Hero(
                              tag: 'ikon-${p['nama']}',
                              child: Icon(p['ikon'] as IconData,
                                  size: 150, color: _navy),
                            ),
                          ),
                          Positioned(
                            right: 14,
                            top: 14,
                            child: Column(
                              children: List.generate(3, (i) {
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  width: 44,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(10),
                                    border: i == 0
                                        ? Border.all(color: _navy, width: 1.5)
                                        : null,
                                  ),
                                  child: Icon(p['ikon'] as IconData,
                                      size: 24, color: _navy),
                                );
                              }),
                            ),
                          ),
                          Positioned(
                            bottom: 14,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: _navy,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Text('360°',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Rating
                    Row(
                      children: [
                        const Icon(Icons.star, color: _oranye, size: 18),
                        const SizedBox(width: 4),
                        Text('${p['rating']} / 5',
                            style: const TextStyle(
                                fontWeight: FontWeight.w700, color: _navy)),
                        const SizedBox(width: 6),
                        Text('(${p['ulasan']} ulasan)',
                            style: const TextStyle(
                                fontSize: 12, color: Colors.black54)),
                      ],
                    ),
                    const SizedBox(height: 6),

                    // Nama + stok
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(p['nama'] as String,
                              style: const TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w800,
                                  color: _navy)),
                        ),
                        Text('$stok stok',
                            style: const TextStyle(
                                fontSize: 12, color: Colors.black54)),
                      ],
                    ),
                    const SizedBox(height: 18),

                    // Pilihan varian
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(varian.length, (i) {
                          final aktif = _varianIndex == i;
                          return GestureDetector(
                            onTap: () => setState(() => _varianIndex = i),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              margin: const EdgeInsets.only(right: 12),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 14),
                              decoration: BoxDecoration(
                                color: aktif ? _oranye : Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                    color: aktif ? _oranye : Colors.black12),
                                boxShadow: aktif
                                    ? [
                                        BoxShadow(
                                            color: _oranye.withOpacity(0.4),
                                            blurRadius: 12,
                                            offset: const Offset(0, 6))
                                      ]
                                    : null,
                              ),
                              child: Column(
                                children: [
                                  Text(varian[i] as String,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          color: aktif ? Colors.white : _navy)),
                                  if ((tambahan[i] as int) > 0)
                                    Text('+${_rp(tambahan[i] as int)}',
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: aktif
                                                ? Colors.white70
                                                : Colors.black54)),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    const SizedBox(height: 22),

                    // Harga + jumlah
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(_rp(harga),
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF3B3A9E))),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.black12),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove, size: 18),
                                onPressed: _jumlah > 1
                                    ? () => setState(() => _jumlah--)
                                    : null,
                              ),
                              Text('$_jumlah',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700)),
                              IconButton(
                                icon: const Icon(Icons.add, size: 18),
                                onPressed: _jumlah < stok
                                    ? () => setState(() => _jumlah++)
                                    : null,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Deskripsi
                    const Text('Detail Produk:',
                        style: TextStyle(
                            fontWeight: FontWeight.w800, color: _navy)),
                    const SizedBox(height: 8),
                    Text(p['deskripsi'] as String,
                        style: const TextStyle(
                            height: 1.5, color: Colors.black54, fontSize: 13)),
                  ],
                ),
              ),
            ),

            // Tombol bawah
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: 56,
                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: _navy,
                          side: const BorderSide(color: _navy, width: 1.5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        icon: const Icon(Icons.add_shopping_cart, size: 20),
                        label: const Text('Keranjang',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700)),
                        onPressed: () {
                          tambahKeKeranjang(
                              buatItemKeranjang(p, _varianIndex, _jumlah));
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                '${p['nama']} (${varian[_varianIndex]}) ditambahkan ke keranjang'),
                            duration: const Duration(seconds: 2),
                          ));
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 56,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _navy,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        icon: const Icon(Icons.shopping_bag_outlined),
                        label: const Text('Beli Sekarang',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => PembayaranPage(
                                items: [
                                  buatItemKeranjang(p, _varianIndex, _jumlah)
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tombolBulat(IconData ikon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 10,
                offset: const Offset(0, 4))
          ],
        ),
        child: Icon(ikon, size: 18, color: _navy),
      ),
    );
  }
}