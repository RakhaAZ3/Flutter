import 'package:flutter/material.dart';

class  GridViewExtent  extends  StatelessWidget  { 
  const  GridViewExtent ({Key? key}) : super ( key : key); 
  @override 
  Widget build (BuildContext context) { 
    return  MaterialApp ( 
      home : Scaffold ( 
        appBar : AppBar ( title : const  Text ( 'GridView.extent Example' )), 
        body : GridView. extent ( 
          maxCrossAxisExtent : 100 , // Lebar maksimum setiap elemen 
          crossAxisSpacing : 10 , 
          mainAxisSpacing : 10 , 
          padding : const EdgeInsets. all ( 10 ), 
          children : List. generate ( 
            8 , 
            (index) => Container ( 
              color : Colors.orangeAccent, 
              child : Center ( 
                child : Text ( 
                  'Item $index' , 
                  style : const  TextStyle ( color : Colors.white, fontSize : 16 ), 
                ) 
              , 
            ), 
          ), 
        ), 
      ), 
    )
    ); 
  } 
}