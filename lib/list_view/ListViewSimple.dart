import 'package:flutter/material.dart';

class Listviewsederhana extends StatelessWidget {
  const Listviewsederhana({super.key});

  @override
  Widget build (BuildContext context) { 
    return  MaterialApp ( 
      home : Scaffold ( 
        appBar : AppBar ( title : Text ( 'Simple ListView' )), 
        body : ListView ( 
          children : [ 
            ListTile ( title : Text ( 'Item 1' )), 
            ListTile ( title : Text ( 'Item 2' )), 
            ListTile ( title : Text ( 'Item 3' )), 
          ], 
        ), 
      ), 
    ); 
  } 
}