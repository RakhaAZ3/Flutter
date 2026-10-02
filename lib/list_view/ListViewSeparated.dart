import 'package:flutter/material.dart';

class Listviewterpisah extends StatelessWidget {
  final List<String> items = List. generate ( 10 , (index) => 'Item ${index + 1}' ); 

  @override 
  Widget build (BuildContext context) { 
    return  MaterialApp ( 
      home : Scaffold ( 
        appBar : AppBar ( title : Text ( 'ListView.separated' )), 
        body : ListView. separated ( 
          itemCount : items.length, 
          itemBuilder : (context, index) { 
            return  ListTile ( title : Text (items[index])); 
          }, 
          separatorBuilder : (context, index) { 
            return  Divider ( color : Colors.grey); // Pemisah kustom 
          }, 
        ), 
      ), 
    ); 
  } 
}