import 'package:flutter/material.dart';

class Latihanempat extends StatelessWidget {
  const Latihanempat({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 72,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 6,)],
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 80,
                  height: 80,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    // backgroundImage: NetworkImage(
                    //   "https://avatars.githubusercontent.com/u/113905168?v=4",
                    // ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rakha Alfarizqi Zahir",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      // SizedBox(height: 0),
                      Text(
                        "XII RPL",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.notifications, color: Colors.white),
              ]
            )
        ),
    );
  }
}