import 'package:flutter/material.dart';

class Latihan extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 80,
              color: Colors.blue[100],
              alignment: Alignment.center,
              child: Text("Pemasukan"),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 80,
              color: Colors.green[100],
              alignment: Alignment.center,
              child: Text("Pengeluaran"),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 80,
              color: const Color.fromARGB(255, 242, 248, 193),
              alignment: Alignment.center,
              child: Text("Saldo"),
            ),
          ),
        ]
      )
    );
  }
}