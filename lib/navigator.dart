import 'package:belajar_flutter/list_view/ListViewSimple.dart';
import 'package:flutter/material.dart';

class NavigatorWidget extends StatelessWidget {
  const NavigatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context){
                  return Listviewsederhana();
              }
              )
            );
          },
          child: Text("List View"),
          )
      ]
    );
  }
}