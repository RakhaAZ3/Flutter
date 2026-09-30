import 'package:flutter/material.dart';

class ContainerSatu extends StatelessWidget {
  const ContainerSatu({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      alignment: Alignment.bottomRight,
      decoration: BoxDecoration(
        color: Colors.blue[700],
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqgKiTfqpTzpE772yy8kNuTTFAEJEEsj6fm33HPOiPCw&s"
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Text("Lorem Ipsum sit Amet Dolor"),
    );
  }
}