import 'package:flutter/material.dart';

class Listviewbuilder extends StatelessWidget {
  final List<String> items = List. generate ( 50 , (index) => 'Item ${index + 1}' ); 

  @override 
  Widget build (BuildContext context) { 
    return  MaterialApp ( 
      home : Scaffold ( 
        appBar : AppBar ( title : Text ( 'ListView.builder' )), 
        body : ListView. builder ( 
          itemCount : items.length, // Total items 
          itemBuilder : (context, index) { 
            return  ListTile ( 
              title : Text (items[index]), 
            ); 
          }, 
        ), 
      ), 
    ); 
  } 
}