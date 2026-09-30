import 'package:belajar_flutter/container/ContainerLatihan.dart';
import 'package:belajar_flutter/container/ContainerSatu.dart';
import 'package:belajar_flutter/row_column/ColumnWidget.dart';
import 'package:belajar_flutter/row_column/LatihanDua.dart';
import 'package:belajar_flutter/row_column/LatihanSatu.dart';
import 'package:belajar_flutter/row_column/RowColumnWidget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
          backgroundColor: Colors.amber,
          centerTitle: true,
        ),
        body: ContainerLatihan(),
      ),
    );
  }
}

class HelloWidget extends StatelessWidget {
  const HelloWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Hello Flutter", style: TextStyle(
        fontSize: 30, 
        fontWeight: FontWeight.bold, 
        color: Colors.cyan
        ),),
    );
  }
}

