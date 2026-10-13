import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/about');
            },
            child: Text('Masuk Profile'),
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/list-basic');
            },
            child: Text('Masuk List'),
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/containersatu');
            },
            child: Text('Container Satu'),
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/containerlatihan');
            },
            child: Text('Container Latihan'),
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/gridviewbuilder');
            },
            child: Text('Grid Builder'),
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/gridviewcount');
            },
            child: Text('Grid Count'),
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/gridviewcustom');
            },
            child: Text('Grid Custom'),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}