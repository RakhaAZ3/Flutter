import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:belajar_flutter/form1/latihan-output.dart';
import 'package:intl/intl.dart';

class latihan_input extends StatefulWidget {
  const latihan_input({super.key});

  @override
  State<latihan_input> createState() => _latihan_InputState();
}

class _latihan_InputState extends State<latihan_input> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController namaController = TextEditingController();
  final TextEditingController teleponController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController tglDaftarController = TextEditingController();

  String? _pilihKelas;
  List<String> _pilihEskul = [];

  final List<String> kelas = ["Kelas XII Rpl 1", "Kelas XII Rpl 2", "Kelas XII Rpl 3", "Kelas XII Tkro 1", "Kelas XII Tkro 2"];

  final List<String> eskul = [
    "Pramuka",
    "Paskibra",
    "Futsal",
    "Voli",
    "Karawitan",
    "Seni Tari",
    "English Club",
    "Jurnalistik",
    "Sains Club",
  ];

  @override
  void dispose() {
    namaController.dispose();
    teleponController.dispose();
    emailController.dispose();
    tglDaftarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: Colors.blueGrey,
          child: Center(
            child: SingleChildScrollView(
              child: Card(
                elevation: 4,
                margin: const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          "Formulir Pendaftaran Eskul",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 18),

                        TextFormField(
                          controller: namaController,
                          decoration: const InputDecoration(
                            hintText: "Nama Lengkap",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Input Nama Lengkap';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 18),

                        TextFormField(
                          controller: teleponController,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: const InputDecoration(
                            hintText: "No. Telepon",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Input No. Telepon';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 18),

                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: "Email",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Input Email';
                            }

                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Format Email tidak valid';
                            }

                            return null;
                          },
                        ),

                        const SizedBox(height: 18),

                        DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: "Pilih Kelas",
                            border: OutlineInputBorder(),
                          ),
                          items: kelas.map((item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _pilihKelas = value;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Pilih Kelas';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 18),

                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Pilih Ekstrakurikuler (Maks. 2)",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        const SizedBox(height: 8),

                        ...eskul.map((item) {
                          final isSelected = _pilihEskul.contains(item);

                          return CheckboxListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(item),
                            value: isSelected,
                            controlAffinity: ListTileControlAffinity.leading,
                            onChanged: (value) {
                              setState(() {
                                if (value == true) {
                                  if (_pilihEskul.length < 2) {
                                    _pilihEskul.add(item);
                                  }
                                } else {
                                  _pilihEskul.remove(item);
                                }
                              });
                            },
                          );
                        }),

                        if (_pilihEskul.isEmpty)
                          const Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text(
                              "Pilih minimal 1 ekstrakurikuler",
                              style: TextStyle(color: Colors.red, fontSize: 12),
                            ),
                          ),

                        const SizedBox(height: 18),

                        TextFormField(
                          controller: tglDaftarController,
                          readOnly: true,
                          decoration: const InputDecoration(
                            hintText: "Tanggal Pendaftaran",
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.calendar_month),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Pilih Tanggal Pendaftaran';
                            }
                            return null;
                          },
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2100),
                            );

                            if (pickedDate != null) {
                              setState(() {
                                tglDaftarController.text = DateFormat(
                                  'yyyy-MM-dd',
                                ).format(pickedDate);
                              });
                            }
                          },
                        ),

                        const SizedBox(height: 24),

                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                                side: const BorderSide(color: Colors.black),
                              ),
                            ),
                            onPressed: _submit,
                            child: const Text(
                              "Simpan",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    final isValid = _formKey.currentState!.validate();

    if (_pilihEskul.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Pilih minimal 1 ekstrakurikuler")),
      );
    }

    if (!isValid || _pilihEskul.isEmpty) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OutputFormScreen(
          nama: namaController.text,
          telepon: teleponController.text,
          email: emailController.text,
          kelas: _pilihKelas!,
          eskul: _pilihEskul,
          tglDaftar: tglDaftarController.text,
        ),
      ),
    );
  }
}
