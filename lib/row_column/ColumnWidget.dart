import 'package:flutter/material.dart';

class ColumnWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("Isi Column 1"),
        Text("Isi Column 2"),
        Text("Isi Column 3"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Isi Row 1"),
            Text("Isi Row 2"),
          ]
        )
      ]

    );
  }
}