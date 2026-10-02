import 'package:flutter/material.dart';

class Listviewhorizontal extends StatelessWidget {
  final List<String> items = [ 'A' , 'B' , 'C' , 'D' , 'E' ]; 

  @override 
  Widget build (BuildContext context) { 
    return  MaterialApp ( 
      home : Scaffold ( 
        appBar : AppBar ( title : Text ( 'Horizontal ListView' )), 
        body : ListView. builder ( 
          scrollDirection : Axis.horizontal, // Horizontal scrolling 
          itemCount : items.length, 
          itemBuilder : (context, index) { 
            return  Container ( 
              width : 100 , 
              margin : EdgeInsets. all ( 8.0 ), 
              color : Colors.blue, 
              child : Center ( 
                child : Text ( 
                  items[index], 
                  style : TextStyle ( color : Colors.white, fontSize : 24 ), 
                ), 
              ), 
            ); 
          }, 
        ), 
      ), 
    ); 
  } 
}