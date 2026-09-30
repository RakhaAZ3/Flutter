import 'package:flutter/material.dart';

class LatihanDua extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.only(top: 155, bottom: 155, left: 70, right: 70),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 60, 249, 69),
        border: Border.all(
          color:  const Color.fromARGB(255, 5, 110, 8),
          width: 5,
        ),
        borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Nama : Rakha"),
              Text("Nis : 123456789"),
              Text("Kelas : XII RPL 1"),
            ]
          ),
          Container(
            width: 100,
            height: 155,
            decoration: BoxDecoration(
              image: DecorationImage(
              image: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqgKiTfqpTzpE772yy8kNuTTFAEJEEsj6fm33HPOiPCw&s"
              ),
              fit: BoxFit.cover,
            ),
            ),
          ),
        ]
      )
    );
  }
}