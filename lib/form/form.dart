import 'package:flutter/material.dart';

class formulir extends StatefulWidget {
  const formulir({super.key});

  @override
  State<formulir> createState() => _FormulirState();
}

class _FormulirState extends State<formulir> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _formAlamatController = TextEditingController();
  final TextEditingController _formNamaController = TextEditingController();
  
  DateTime? selectedDate;
  String? _pilihanKelamin = 'Laki-laki';
  String _pilihAgama = "";

  String _outputNama = '';
  DateTime? _outputTanggal;
  String _outputGender = '';
  String _outputAlamat = '';
  String _outputAgama = ''; 

  final List<String> agama = [
    "Islam",
    "Protestan",
    "Katholik",
    "Budha",
    "Atheis",
  ];

  @override
  void dispose() {
    _formAlamatController.dispose();
    _formNamaController.dispose();
    super.dispose();
  }

  void _submitForm() {
    setState(() {
      _outputNama = _formNamaController.text;
      _outputTanggal = selectedDate;
      _outputGender = _pilihanKelamin ?? '-';
      _outputAlamat = _formAlamatController.text;
      _outputAgama = _pilihAgama; 
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Data berhasil disimpan!')),
    );
    _clearInput();
  }

  void _clearInput() {
    _formNamaController.clear();
    _formAlamatController.clear();
    
    setState(() {
      selectedDate = null;
      _pilihanKelamin = 'Laki-laki';
      _pilihAgama = '';
    });
  }

  void _handleRadioValueChange(String? value) {
    setState(() {
      _pilihanKelamin = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('formulir Biodata')),
      body: SingleChildScrollView( 
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _formNamaController,
                  decoration: const InputDecoration(
                    labelText: 'Nama Lengkap',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama Lengkap tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2030),
                        );
                        if (date != null) {
                          setState(() {
                            selectedDate = date;
                          });
                        }
                      },
                      child: const Text('Pilih Tanggal'),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      selectedDate == null
                          ? 'Belum memilih tanggal'
                          : '${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}',
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Text('Jenis Kelamin:', style: TextStyle(fontWeight: FontWeight.bold)),
                RadioListTile<String>(
                  title: const Text('Laki-laki'),
                  value: 'Laki-laki',
                  groupValue: _pilihanKelamin,
                  onChanged: _handleRadioValueChange,
                ),
                RadioListTile<String>(
                  title: const Text('Perempuan'),
                  value: 'Perempuan',
                  groupValue: _pilihanKelamin,
                  onChanged: _handleRadioValueChange,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _formAlamatController,
                  maxLines: 3, 
                  minLines: 3,
                  // keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    labelText: 'Alamat',
                    hintText: 'Masukkan alamat rumah...',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Alamat tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: "Pilih Agama",
                    border: OutlineInputBorder(),
                  ),
                  items: agama
                      .map(
                        (item) => DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _pilihAgama = value ?? '';
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Pilih agama';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _submitForm();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Simpan'),
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(thickness: 2),
                const Text(
                  "Biodata Terhitung:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  'Nama Lengkap : ${_outputNama.isEmpty ? '-' : _outputNama}',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  'Tanggal Lahir : ${_outputTanggal == null ? '-' : "${_outputTanggal!.day}-${_outputTanggal!.month}-${_outputTanggal!.year}"}',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  'Kelamin : ${_outputGender.isEmpty ? '-' : _outputGender}',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  'Alamat : ${_outputAlamat.isEmpty ? '-' : _outputAlamat}',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  'Agama : ${_outputAgama.isEmpty ? '-' : _outputAgama}', 
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}