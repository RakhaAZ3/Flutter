import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'daftar.dart';

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

class PembayaranPage extends StatefulWidget {
  // Daftar item yang dibayar (bisa lebih dari satu), berupa Map tanpa model
  final List<Map<String, dynamic>> items;

  const PembayaranPage({super.key, required this.items});

  @override
  State<PembayaranPage> createState() => _PembayaranPageState();
}

class _PembayaranPageState extends State<PembayaranPage> {
  final List<Map<String, dynamic>> _metode = [
    {
      'nama': 'QRIS',
      'ket': 'Scan kode QR dengan e-wallet atau m-banking',
      'ikon': Icons.qr_code_2
    },
    {
      'nama': 'Bayar Cash',
      'ket': 'Bayar tunai saat barang diterima',
      'ikon': Icons.payments_outlined
    },
  ];

  int _metodeDipilih = 0;
  final int _ongkir = 25000;
  final TextEditingController _uangCtrl = TextEditingController();
  int _uang = 0;

  @override
  void dispose() {
    _uangCtrl.dispose();
    super.dispose();
  }

  // QRIS selalu bisa; cash hanya bisa jika uang >= total
  bool _bisaBayar(int total) => _metodeDipilih == 0 || _uang >= total;

  @override
  Widget build(BuildContext context) {
    int subtotal = 0;
    int totalBarang = 0;
    for (final it in widget.items) {
      subtotal += (it['hargaSatuan'] as int) * (it['jumlah'] as int);
      totalBarang += it['jumlah'] as int;
    }
    final int total = subtotal + _ongkir;

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
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
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
                            child: const Icon(Icons.arrow_back_ios_new,
                                size: 18, color: _navy),
                          ),
                        ),
                        const SizedBox(width: 14),
                        const Text('Pembayaran',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                                color: _navy)),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Ringkasan produk
                    const Text('Pesanan Anda',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            color: _navy)),
                    const SizedBox(height: 12),
                    ...widget.items.map((it) {
                      final int h = it['hargaSatuan'] as int;
                      final int j = it['jumlah'] as int;
                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Color(it['warna'] as int),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Icon(it['ikon'] as IconData,
                                  size: 36, color: _navy),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(it['nama'] as String,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w800,
                                          color: _navy)),
                                  const SizedBox(height: 3),
                                  Text('Varian: ${it['varian']}',
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.black54)),
                                  const SizedBox(height: 3),
                                  Text('$j x ${_rp(h)}',
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF3B3A9E))),
                                ],
                              ),
                            ),
                            Text(_rp(h * j),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: _navy)),
                          ],
                        ),
                      );
                    }),
                    const SizedBox(height: 14),

                    // Alamat
                    const Text('Alamat Pengiriman',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            color: _navy)),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: Colors.black12),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.location_on, color: _oranye),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Alamat Rumah',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: _navy)),
                                SizedBox(height: 2),
                                Text('Jl. Contoh No. 12, Kota Anda',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black54)),
                              ],
                            ),
                          ),
                          Icon(Icons.chevron_right, color: Colors.black38),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Metode pembayaran
                    const Text('Metode Pembayaran',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            color: _navy)),
                    const SizedBox(height: 12),
                    ...List.generate(_metode.length, (i) {
                      final aktif = _metodeDipilih == i;
                      return GestureDetector(
                        onTap: () => setState(() => _metodeDipilih = i),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 14),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                                color: aktif ? _oranye : Colors.black12,
                                width: aktif ? 2 : 1),
                          ),
                          child: Row(
                            children: [
                              Icon(_metode[i]['ikon'] as IconData,
                                  color: _navy),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(_metode[i]['nama'] as String,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: _navy)),
                                    const SizedBox(height: 2),
                                    Text(_metode[i]['ket'] as String,
                                        style: const TextStyle(
                                            fontSize: 11,
                                            color: Colors.black54)),
                                  ],
                                ),
                              ),
                              Icon(
                                aktif
                                    ? Icons.radio_button_checked
                                    : Icons.radio_button_off,
                                color: aktif ? _oranye : Colors.black38,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                    if (_metodeDipilih == 0) ...[
                      const SizedBox(height: 6),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(color: Colors.black12),
                        ),
                        child: Column(
                          children: [
                            const Text('Scan untuk membayar',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: _navy)),
                            const SizedBox(height: 12),
                            // Placeholder QR. Ganti dengan QR asli dari
                            // payment gateway (mis. paket qr_flutter).
                            const Icon(Icons.qr_code_2, size: 170, color: _navy),
                            const SizedBox(height: 8),
                            Text(_rp(total),
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xFF3B3A9E))),
                          ],
                        ),
                      ),
                    ],
                    if (_metodeDipilih == 1) ...[
                      const SizedBox(height: 6),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(color: Colors.black12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Uang yang diberikan',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: _navy)),
                            const SizedBox(height: 10),
                            TextField(
                              controller: _uangCtrl,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(12),
                              ],
                              onChanged: (v) =>
                                  setState(() => _uang = int.tryParse(v) ?? 0),
                              decoration: InputDecoration(
                                prefixText: 'Rp ',
                                hintText: 'Masukkan nominal',
                                filled: true,
                                fillColor: _krem,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            ActionChip(
                              label: const Text('Uang Pas'),
                              onPressed: () {
                                _uangCtrl.text = total.toString();
                                setState(() => _uang = total);
                              },
                            ),
                            const SizedBox(height: 12),
                            if (_uang == 0)
                              const Text('Masukkan nominal uang terlebih dahulu',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black54))
                            else if (_uang < total)
                              Row(
                                children: [
                                  const Icon(Icons.error_outline,
                                      color: Colors.red, size: 18),
                                  const SizedBox(width: 6),
                                  Text('Uang kurang ${_rp(total - _uang)}',
                                      style: const TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w700)),
                                ],
                              )
                            else
                              Row(
                                children: [
                                  const Icon(Icons.check_circle,
                                      color: Color(0xFF2E9E5B), size: 18),
                                  const SizedBox(width: 6),
                                  Text('Kembalian ${_rp(_uang - total)}',
                                      style: const TextStyle(
                                          color: Color(0xFF2E9E5B),
                                          fontWeight: FontWeight.w800)),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ],
                    const SizedBox(height: 14),

                    // Rincian
                    const Text('Rincian Pembayaran',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            color: _navy)),
                    const SizedBox(height: 12),
                    _barisRincian('Subtotal ($totalBarang barang)', _rp(subtotal)),
                    _barisRincian('Ongkos kirim', _rp(_ongkir)),
                    const Divider(height: 24),
                    _barisRincian('Total', _rp(total), tebal: true),
                  ],
                ),
              ),
            ),

            // Tombol bayar
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _navy,
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: Colors.black26,
                    disabledForegroundColor: Colors.white70,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  icon: Icon(_metodeDipilih == 0
                      ? Icons.check_circle_outline
                      : Icons.shopping_bag_outlined),
                  label: Text(
                      _metodeDipilih == 0
                          ? 'Saya Sudah Bayar ${_rp(total)}'
                          : 'Buat Pesanan (Cash ${_rp(total)})',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w700)),
                  onPressed: _bisaBayar(total) ? () => _dialogSukses(total) : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _barisRincian(String label, String nilai, {bool tebal = false}) {
    final gaya = TextStyle(
      fontSize: tebal ? 17 : 14,
      fontWeight: tebal ? FontWeight.w800 : FontWeight.w500,
      color: tebal ? const Color(0xFF3B3A9E) : Colors.black54,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(label, style: gaya), Text(nilai, style: gaya)],
      ),
    );
  }

  void _dialogSukses(int total) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        backgroundColor: _krem,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            Container(
              width: 72,
              height: 72,
              decoration: const BoxDecoration(
                  color: _oranye, shape: BoxShape.circle),
              child: const Icon(Icons.check, color: Colors.white, size: 40),
            ),
            const SizedBox(height: 16),
            Text(
                _metodeDipilih == 0
                    ? 'Pembayaran Berhasil!'
                    : 'Pesanan Berhasil Dibuat!',
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w800, color: _navy)),
            const SizedBox(height: 8),
            Text(
                _metodeDipilih == 0
                    ? 'Pesanan Anda sedang diproses.'
                    : 'Uang diterima ${_rp(_uang)}\nKembalian ${_rp(_uang - total)}',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black54)),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _navy,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                ),
                onPressed: () {
                  Navigator.of(ctx).pop();
                  hapusDariKeranjang(widget.items);
                  Navigator.of(context).popUntil((r) => r.isFirst);
                },
                child: const Text('Kembali ke Beranda'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}