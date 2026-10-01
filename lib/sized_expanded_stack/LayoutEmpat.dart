import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 140,
              color: Colors.amber,
            ),
            Positioned(
              bottom: -30,
              left: 20,
              child: SizedBox(
                width: 100,
                height: 100,
                child: CircleAvatar(
                  backgroundColor: Colors.blue,radius: 36
                ),
              ),
            )
          ]
        ),
        SizedBox(height: 40),
        Padding(padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nama User"),
                  Text("XII RPL"),
                ],
              ),
            )
          ],
        )
        
        ),
        ElevatedButton(onPressed: () {}, child: Text("Follow"))
      ]
    );
  }
}