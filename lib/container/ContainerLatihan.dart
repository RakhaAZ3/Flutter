import 'package:flutter/material.dart';

class ContainerLatihan extends StatelessWidget {
  const ContainerLatihan({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 300,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 60, 249, 69),
        border: Border.all(
          color:  const Color.fromARGB(255, 5, 110, 8),
          width: 5,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
          alignment: Alignment.center,
      // child: Text(
      //   "SMK ASSALAAM BANDUNG",
      //   style: TextStyle(
      //     fontSize: 20,
      //     fontWeight: FontWeight.bold,
      //   ),
      // ),
      child: Container(
        height: 60,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
        "XII RPL 1",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
      ),
      )
    );
  }
}