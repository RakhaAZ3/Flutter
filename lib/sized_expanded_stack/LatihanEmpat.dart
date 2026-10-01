import 'package:flutter/material.dart';

class Latihanempat extends StatelessWidget {
  const Latihanempat({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
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
        SizedBox(height: 12),
        Container(
          height: 200,
          width: double.infinity,
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(
              color:  const Color.fromARGB(255, 5, 68, 110),
              width: 5,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                    height: 25,
                    width: 75,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 116, 115, 111),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
        ],
      ),
    );
  }
}