import 'package:flutter/material.dart';
import 'detail.dart';
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

// Data produk memakai Map (tanpa kelas model)
final List<Map<String, dynamic>> semuaProduk = [
  {
    'nama': 'Laptop Zenbook 14',
    'kategori': 'Laptop',
    'harga': 12500000,
    'stok': 5,
    'asal': 'Diimpor dari Taiwan, 2025',
    'ikon': Icons.laptop_mac,
    'warna': 0xFFBFEDEA,
    'rating': 4.9,
    'ulasan': 320,
    'varian': ['8GB / 256GB', '16GB / 512GB', '16GB / 1TB'],
    'tambahan': [0, 2000000, 3500000],
    'deskripsi':
        'Laptop tipis dan ringan dengan layar OLED 14 inci, prosesor generasi terbaru, dan baterai tahan seharian. Cocok untuk kerja, kuliah, maupun hiburan.',
  },
  {
    'nama': 'Smartphone Nova X',
    'kategori': 'HP',
    'harga': 4999000,
    'stok': 8,
    'asal': 'Diimpor dari China, 2025',
    'ikon': Icons.smartphone,
    'warna': 0xFFD6C8F0,
    'rating': 4.7,
    'ulasan': 214,
    'varian': ['6GB / 128GB', '8GB / 256GB', '12GB / 512GB'],
    'tambahan': [0, 700000, 1500000],
    'deskripsi':
        'Smartphone dengan kamera 64MP, layar AMOLED 120Hz, dan pengisian daya cepat 67W. Performa lancar untuk game dan multitasking.',
  },
  {
    'nama': 'Headphone BassPro',
    'kategori': 'Audio',
    'harga': 899000,
    'stok': 12,
    'asal': 'Diimpor dari Jepang, 2024',
    'ikon': Icons.headphones,
    'warna': 0xFFFBF59A,
    'rating': 4.8,
    'ulasan': 158,
    'varian': ['Hitam', 'Putih', 'Biru'],
    'tambahan': [0, 0, 0],
    'deskripsi':
        'Headphone nirkabel dengan noise cancelling aktif, bass dalam, dan daya tahan baterai hingga 40 jam.',
  },
  {
    'nama': 'Smartwatch Fit S',
    'kategori': 'HP',
    'harga': 1350000,
    'stok': 7,
    'asal': 'Diimpor dari Korea, 2025',
    'ikon': Icons.watch,
    'warna': 0xFFBFD0FF,
    'rating': 4.6,
    'ulasan': 97,
    'varian': ['40mm', '44mm'],
    'tambahan': [0, 250000],
    'deskripsi':
        'Jam pintar dengan sensor detak jantung, GPS, dan lebih dari 100 mode olahraga. Tahan air hingga 50 meter.',
  },
  {
    'nama': 'Speaker Boom Mini',
    'kategori': 'Audio',
    'harga': 649000,
    'stok': 15,
    'asal': 'Diimpor dari Amerika, 2024',
    'ikon': Icons.speaker,
    'warna': 0xFFFFD6C2,
    'rating': 4.5,
    'ulasan': 76,
    'varian': ['Merah', 'Hitam'],
    'tambahan': [0, 0],
    'deskripsi':
        'Speaker bluetooth portabel tahan air dengan suara 360 derajat dan baterai 12 jam.',
  },
  {
    'nama': 'Laptop Gaming Rex',
    'kategori': 'Laptop',
    'harga': 18900000,
    'stok': 3,
    'asal': 'Diimpor dari Taiwan, 2025',
    'ikon': Icons.laptop_chromebook,
    'warna': 0xFFC8F2D2,
    'rating': 4.9,
    'ulasan': 189,
    'varian': ['16GB / 512GB', '32GB / 1TB'],
    'tambahan': [0, 4000000],
    'deskripsi':
        'Laptop gaming dengan GPU kelas atas, layar 165Hz, dan sistem pendingin ganda untuk performa maksimal.',
  },
];

// ===== Keranjang (state global sederhana, tanpa kelas model) =====
final ValueNotifier<List<Map<String, dynamic>>> keranjang =
    ValueNotifier<List<Map<String, dynamic>>>(<Map<String, dynamic>>[]);

Map<String, dynamic> buatItemKeranjang(
    Map<String, dynamic> p, int varianIndex, int jumlah) {
  final List varian = p['varian'] as List;
  final List tambahan = p['tambahan'] as List;
  return {
    'nama': p['nama'],
    'ikon': p['ikon'],
    'warna': p['warna'],
    'stok': p['stok'],
    'varian': varian[varianIndex],
    'hargaSatuan': (p['harga'] as int) + (tambahan[varianIndex] as int),
    'jumlah': jumlah,
    'dipilih': true,
  };
}

void tambahKeKeranjang(Map<String, dynamic> item) {
  final daftar = List<Map<String, dynamic>>.from(keranjang.value);
  final idx = daftar.indexWhere(
      (e) => e['nama'] == item['nama'] && e['varian'] == item['varian']);
  if (idx >= 0) {
    final int stok = daftar[idx]['stok'] as int;
    final int baru = (daftar[idx]['jumlah'] as int) + (item['jumlah'] as int);
    daftar[idx]['jumlah'] = baru > stok ? stok : baru;
  } else {
    daftar.add(item);
  }
  keranjang.value = daftar;
}

void _perbaruiKeranjang() {
  keranjang.value = List<Map<String, dynamic>>.from(keranjang.value);
}

void hapusDariKeranjang(List<Map<String, dynamic>> items) {
  keranjang.value = keranjang.value.where((e) => !items.contains(e)).toList();
}

Widget _tombolQty(IconData ikon, VoidCallback? onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: onTap == null ? const Color(0xFFEEEEEE) : _krem,
        border: Border.all(color: Colors.black12),
      ),
      child: Icon(ikon,
          size: 16, color: onTap == null ? Colors.black26 : _navy),
    ),
  );
}

Widget _barisKeranjang(Map<String, dynamic> it) {
  final int stok = it['stok'] as int;
  final int jumlah = it['jumlah'] as int;
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    padding: const EdgeInsets.fromLTRB(4, 10, 10, 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      border: Border.all(color: Colors.black12),
    ),
    child: Row(
      children: [
        Checkbox(
          value: it['dipilih'] == true,
          activeColor: _oranye,
          onChanged: (v) {
            it['dipilih'] = v ?? false;
            _perbaruiKeranjang();
          },
        ),
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: Color(it['warna'] as int),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(it['ikon'] as IconData, color: _navy),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(it['nama'] as String,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.w800, color: _navy)),
              Text(it['varian'] as String,
                  style: const TextStyle(fontSize: 11, color: Colors.black54)),
              const SizedBox(height: 2),
              Text(_rp(it['hargaSatuan'] as int),
                  style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF3B3A9E))),
            ],
          ),
        ),
        Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _tombolQty(
                    Icons.remove,
                    jumlah > 1
                        ? () {
                            it['jumlah'] = jumlah - 1;
                            _perbaruiKeranjang();
                          }
                        : null),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text('$jumlah',
                      style: const TextStyle(fontWeight: FontWeight.w700)),
                ),
                _tombolQty(
                    Icons.add,
                    jumlah < stok
                        ? () {
                            it['jumlah'] = jumlah + 1;
                            _perbaruiKeranjang();
                          }
                        : null),
              ],
            ),
            GestureDetector(
              onTap: () {
                keranjang.value =
                    keranjang.value.where((e) => !identical(e, it)).toList();
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 6),
                child: Icon(Icons.delete_outline, size: 20, color: Colors.red),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

void tampilKeranjang(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: _krem,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28))),
    builder: (ctx) {
      return ValueListenableBuilder<List<Map<String, dynamic>>>(
        valueListenable: keranjang,
        builder: (_, daftar, __) {
          final terpilih = daftar.where((e) => e['dipilih'] == true).toList();
          final int total = terpilih.fold<int>(
              0, (a, e) => a + (e['hargaSatuan'] as int) * (e['jumlah'] as int));
          final bool semua = daftar.isNotEmpty && terpilih.length == daftar.length;

          return SafeArea(
            child: Container(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(ctx).size.height * 0.8),
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(2)),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      const Expanded(
                        child: Text('Keranjang',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: _navy)),
                      ),
                      if (daftar.isNotEmpty) ...[
                        const Text('Pilih semua',
                            style: TextStyle(fontSize: 12, color: _navy)),
                        Checkbox(
                          value: semua,
                          activeColor: _oranye,
                          onChanged: (v) {
                            for (final e in daftar) {
                              e['dipilih'] = v ?? false;
                            }
                            _perbaruiKeranjang();
                          },
                        ),
                      ],
                    ],
                  ),
                  if (daftar.isEmpty)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 40),
                      child: Center(child: Text('Keranjang masih kosong')),
                    )
                  else
                    Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: daftar.length,
                        itemBuilder: (_, i) => _barisKeranjang(daftar[i]),
                      ),
                    ),
                  if (daftar.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total (${terpilih.length} item)',
                            style: const TextStyle(color: Colors.black54)),
                        Text(_rp(total),
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF3B3A9E))),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _navy,
                          foregroundColor: Colors.white,
                          disabledBackgroundColor: Colors.black26,
                          disabledForegroundColor: Colors.white70,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        onPressed: terpilih.isEmpty
                            ? null
                            : () {
                                Navigator.pop(ctx);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        PembayaranPage(items: terpilih),
                                  ),
                                );
                              },
                        child: Text(
                            terpilih.isEmpty
                                ? 'Pilih item dulu'
                                : 'Checkout (${terpilih.length} item)',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700)),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

class DaftarItemPage extends StatefulWidget {
  const DaftarItemPage({super.key});

  @override
  State<DaftarItemPage> createState() => _DaftarItemPageState();
}

class _DaftarItemPageState extends State<DaftarItemPage> {
  final List<Map<String, dynamic>> _kategori = [
    {'nama': 'Semua', 'ikon': Icons.apps},
    {'nama': 'Laptop', 'ikon': Icons.laptop_mac},
    {'nama': 'HP', 'ikon': Icons.smartphone},
    {'nama': 'Audio', 'ikon': Icons.headphones},
  ];

  String _kategoriAktif = 'Semua';
  String _query = '';

  List<Map<String, dynamic>> get _hasil {
    return semuaProduk.where((p) {
      final cocokKategori =
          _kategoriAktif == 'Semua' || p['kategori'] == _kategoriAktif;
      final cocokNama =
          (p['nama'] as String).toLowerCase().contains(_query.toLowerCase());
      return cocokKategori && cocokNama;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final hasil = _hasil;

    return Scaffold(
      backgroundColor: _krem,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
              children: [
                _header(),
                const SizedBox(height: 24),
                _pencarian(),
                const SizedBox(height: 20),
                _chipKategori(),
                const SizedBox(height: 28),
                const Text('Produk Populer',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: _navy)),
                const SizedBox(height: 16),
                if (hasil.isEmpty)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    child: Center(child: Text('Produk tidak ditemukan')),
                  )
                else
                  SizedBox(
                    height: 290,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: hasil.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 14),
                      itemBuilder: (_, i) => _kartuProduk(hasil[i]),
                    ),
                  ),
                const SizedBox(height: 28),
                const Text('Pilih Kategori',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: _navy)),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _kartuKategori('Produk\nTerlaris',
                          const Color(0xFFFBF59A), Icons.local_fire_department),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: _kartuKategori('Produk\nDiskon',
                          const Color(0xFFBFD0FF), Icons.local_offer),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4))
            ],
          ),
          child: const Icon(Icons.grid_view_rounded, color: _navy, size: 22),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Kirim ke',
                  style: TextStyle(fontSize: 12, color: Colors.black54)),
              Text('Alamat Rumah',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: _navy)),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => tampilKeranjang(context),
          child: ValueListenableBuilder<List<Map<String, dynamic>>>(
            valueListenable: keranjang,
            builder: (_, daftar, __) {
              final int banyak =
                  daftar.fold<int>(0, (a, e) => a + (e['jumlah'] as int));
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4))
                      ],
                    ),
                    child: const Icon(Icons.shopping_bag_outlined,
                        color: _navy),
                  ),
                  if (banyak > 0)
                    Positioned(
                      right: -2,
                      top: -2,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text('$banyak',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w800)),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _pencarian() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 54,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black12),
            ),
            child: TextField(
              onChanged: (v) => setState(() => _query = v),
              decoration: const InputDecoration(
                hintText: 'Cari produk',
                prefixIcon: Icon(Icons.search, color: _navy),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _chipKategori() {
    return SizedBox(
      height: 52,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _kategori.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (_, i) {
          final k = _kategori[i];
          final aktif = _kategoriAktif == k['nama'];
          return GestureDetector(
            onTap: () => setState(() => _kategoriAktif = k['nama'] as String),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(
                color: aktif ? _oranye : Colors.white,
                borderRadius: BorderRadius.circular(26),
                border: Border.all(color: aktif ? _oranye : Colors.black12),
                boxShadow: aktif
                    ? [
                        BoxShadow(
                            color: _oranye.withOpacity(0.4),
                            blurRadius: 12,
                            offset: const Offset(0, 6))
                      ]
                    : null,
              ),
              child: Row(
                children: [
                  Icon(k['ikon'] as IconData,
                      size: 20, color: aktif ? Colors.white : _navy),
                  const SizedBox(width: 8),
                  Text(
                    k['nama'] as String,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: aktif ? Colors.white : _navy),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _kartuProduk(Map<String, dynamic> p) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => DetailItemPage(produk: p)),
        );
      },
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Color(p['warna'] as int),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  tambahKeKeranjang(buatItemKeranjang(p, 0, 1));
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('${p['nama']} ditambahkan ke keranjang'),
                    duration: const Duration(seconds: 2),
                  ));
                },
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: const Icon(Icons.add_shopping_cart,
                      size: 16, color: _navy),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Hero(
                  tag: 'ikon-${p['nama']}',
                  child: Icon(p['ikon'] as IconData, size: 90, color: _navy),
                ),
              ),
            ),
            Text(p['nama'] as String,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w800, color: _navy)),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Mulai ${_rp(p['harga'] as int)}',
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF3B3A9E))),
                Text('${p['stok']} stok',
                    style:
                        const TextStyle(fontSize: 11, color: Colors.black54)),
              ],
            ),
            const SizedBox(height: 6),
            Text(p['asal'] as String,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 10, color: Colors.black54)),
          ],
        ),
      ),
    );
  }

  Widget _kartuKategori(String judul, Color warna, IconData ikon) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: warna,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            bottom: 0,
            child: Icon(ikon, size: 64, color: _navy.withOpacity(0.25)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(judul,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: _navy)),
              const Spacer(),
              const Row(
                children: [
                  Text('Lihat',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF3B3A9E))),
                  SizedBox(width: 4),
                  Icon(Icons.arrow_forward,
                      size: 14, color: Color(0xFF3B3A9E)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}