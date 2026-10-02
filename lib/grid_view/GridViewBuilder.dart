import 'package:flutter/material.dart';

class  GridViewBuilder  extends  StatelessWidget  { 
  const  GridViewBuilder ({Key? key}) : super ( key : key); 
  @override 
  Widget build (BuildContext context) { 
    return  MaterialApp ( 
      home : Scaffold ( 
        appBar : AppBar ( title : const  Text ( 'Contoh GridView.builder' )), 
        body : GridView. builder ( 
          gridDelegate : const  SliverGridDelegateWithFixedCrossAxisCount ( 
            crossAxisCount : 3 , // Jumlah kolom 
            crossAxisSpacing : 8 , // Jarak antar kolom 
            mainAxisSpacing : 8 , // Jarak antar baris 
          ), 
          itemCount : 9 , // Total elemen 
          itemBuilder : (context, index) { 
            return  Container ( 
              color : Colors.greenAccent, 
              child : Center ( 
                child : Text ( 
                  'Item $index' , 
                  style : const  TextStyle ( color : Colors.black, fontSize : 18 ), 
                ), 
              ), 
            ); 
          }, 
        ), 
      ), 
    ); 
  } 
}