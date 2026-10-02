import 'package:flutter/material.dart';

class GridViewCustom extends StatelessWidget {
  const GridViewCustom({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('GridView with Images')),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Jumlah kolom
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://source.unsplash.com/random?sig=$index',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}