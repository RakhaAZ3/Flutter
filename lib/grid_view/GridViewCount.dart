import 'package:flutter/material.dart';

class  GridViewCount  extends  StatelessWidget  { 
  const  GridViewCount ({Key? key}) : super ( key : key); 
  @override 
  Widget build (BuildContext context) { 
    return  MaterialApp ( 
      home : Scaffold ( 
        appBar : AppBar ( title : const  Text ( 'Contoh GridView.count' )), 
        body : GridView. count ( 
          crossAxisCount : 2 , // Jumlah kolom 
          crossAxisSpacing : 10 , // Jarak antar kolom 
          mainAxisSpacing : 10 , // Jarak antar baris 
          padding : const EdgeInsets. all ( 10 ), 
          children : List. generate ( 
            6 , 
            (index) => Container ( 
              color : Colors.blueAccent, 
              child : Center ( 
                child : Text ( 
                  'Item $index' , 
                  style : const  TextStyle ( color : Colors.white, fontSize : 20 ), 
                ) 
              , 
            ),         ) 
          , ),       ),     )
    );   
          } 
          }