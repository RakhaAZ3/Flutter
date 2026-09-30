import 'package:flutter/material.dart';

class Latihansatu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.all(125),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 60, 249, 69),
        border: Border.all(
          color:  const Color.fromARGB(255, 5, 110, 8),
          width: 5,
        ),
        borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
              image: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqgKiTfqpTzpE772yy8kNuTTFAEJEEsj6fm33HPOiPCw&s"
              ),
              fit: BoxFit.cover,
            ),
            ),
          ),
          Column(
            children: [
              Text("Nama : Rakha"),
              Text("Nis : 123456789"),
              Text("Kelas : XII RPL 1"),
            ]
          )
        ]
      )
    );
  }
}