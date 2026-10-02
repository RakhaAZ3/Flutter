import 'package:belajar_flutter/Latihan/ig.dart';
import 'package:belajar_flutter/container/ContainerLatihan.dart';
import 'package:belajar_flutter/container/ContainerSatu.dart';
import 'package:belajar_flutter/grid_view/GridViewBuilder.dart';
import 'package:belajar_flutter/grid_view/GridViewCount.dart';
import 'package:belajar_flutter/grid_view/GridViewExtent.dart';
import 'package:belajar_flutter/list_view/ListViewBuilder.dart';
import 'package:belajar_flutter/list_view/ListViewHorizontal.dart';
import 'package:belajar_flutter/list_view/ListViewCustom.dart';
import 'package:belajar_flutter/list_view/ListViewSimple.dart';
import 'package:belajar_flutter/list_view/ListViewSeparated.dart';
import 'package:belajar_flutter/row_column/ColumnWidget.dart';
import 'package:belajar_flutter/row_column/LatihanDua.dart';
import 'package:belajar_flutter/row_column/LatihanSatu.dart';
import 'package:belajar_flutter/row_column/RowColumnWidget.dart';
import 'package:belajar_flutter/sized_expanded_stack/ExpandedWidget.dart';
import 'package:belajar_flutter/sized_expanded_stack/LatihanEmpat.dart';
import 'package:belajar_flutter/sized_expanded_stack/LatihanSatu.dart';
import 'package:belajar_flutter/sized_expanded_stack/LayoutDua.dart';
import 'package:belajar_flutter/sized_expanded_stack/LayoutEmpat.dart';
import 'package:belajar_flutter/sized_expanded_stack/LayoutSatu.dart';
import 'package:belajar_flutter/sized_expanded_stack/SizedBoxWidget.dart';
import 'package:belajar_flutter/sized_expanded_stack/StackWidget.dart';
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
        // appBar: AppBar(
        //   title: Text("Flutter App"),
        //   backgroundColor: Colors.amber,
        //   centerTitle: true,
        // ),
        body: latihan(),
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

