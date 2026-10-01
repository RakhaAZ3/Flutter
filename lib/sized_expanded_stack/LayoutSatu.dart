import 'package:flutter/material.dart';

class KartuProfil extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 72,
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 201, 230, 244),
          borderRadius: BorderRadius.circular(8),
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
                    backgroundColor: Colors.amber,
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
                        "Rakha",
                      ),
                      SizedBox(height: 4),
                      Text(
                        "XII RPL",
                      ),
                    ],
                  ),
                )
              ]
            )
        ),
    );
  }
}