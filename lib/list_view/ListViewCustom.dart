import 'package:flutter/material.dart';

class Listviewkustom extends StatelessWidget {
  final List<String> images = [ 
    'https://via.placeholder.com/150' , 
    'https://via.placeholder.com/150' , 
    'https://via.placeholder.com/150' , 
  ]; 

  @override 
  Widget build (BuildContext context) { 
    return  MaterialApp ( 
      home : Scaffold ( 
        appBar : AppBar ( title : Text ( 'Custom ListView' )), 
        body : ListView. builder ( 
          itemCount : images.length, 
          itemBuilder : (context, index) { 
            return  Card ( 
              margin : EdgeInsets. all ( 8.0 ), 
              child : Column ( 
                children : [ 
                  Image. network (images[index]), 
                  Padding ( 
                    padding : const EdgeInsets. all ( 8.0 ), 
                    child : Text ( 'Image ${index + 1}' ), 
                  ), 
                ], 
              ), 
            ); 
          }, 
        ), 
      ), 
    ); 
  } 
}