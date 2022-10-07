import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('First Project'),
          titleSpacing: 50,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.phone)),
            IconButton(onPressed: () {}, icon: Icon(Icons.video_call))
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(50),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.black,
          ),
          height: double.infinity,
          width: double.infinity,
          child: Text(
            'Hello World',
            style: TextStyle(
                color: Colors.red,
                fontSize: 30,
                fontWeight: FontWeight.w700,
                backgroundColor: Colors.amber),
          ),
        ),
      ),
    );
  }
}
