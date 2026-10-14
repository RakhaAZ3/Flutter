import 'package:flutter/material.dart';

class formulir extends StatefulWidget {
  const formulir({super.key});

  @override
  State<formulir> createState() => _formulirState();
}

class _formulirState extends State<formulir> {
                  DateTime? selectedDate;
  final _formkey =GlobalKey<FormState>();
  final TextEditingController _formController = TextEditingController();
  var _outputName = '';

  @override
  void dispose() {
    _formController.dispose();
    super.dispose();
}

  void _submitForm(){
    setState(() {
    _outputName = _formController.text;
    });
    print("Nama Lengkap : ${_formController.text}");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Nama Lengkap : ${_formController.text}",))
      );

      _clearInput();
  }

  void _clearInput() {

    _formController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Form App')),
      body: Center(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _formController,
                  decoration: InputDecoration(
                    labelText: 'Enter your name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty) {
                      return "Nama Tidak boleh Kosong";
                    }
                    return null;
                  },

                ),
              ),
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
                    child: Text(
                      selectedDate != null
                          ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
                          : 'Pilih Tanggal',
                    ),
                  ),
              SizedBox(height: 10,),
              OutlinedButton(onPressed: (){
                if (_formkey.currentState!.validate()) {
                _submitForm();
                }
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.green,width: 1),
              ),
              child: Text('Simpan'),
              ),
              Text(
                'Nama = ${_outputName.isEmpty ? "-" : _outputName}',
              style: const TextStyle(fontSize: 16),
              )
            ],
          )),
      ),
    );
  }
}