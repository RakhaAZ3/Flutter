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
      )
    );
  }
}