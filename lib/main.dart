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
            width: double.infinity,
            color: Colors.amber,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: Colors.black,
                  child: Text(
                    'First Text',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.red,
                    ),
                  ),
                ),
                Container(
                  color: Colors.grey,
                  child: Text(
                    'Second Text',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.yellow,
                    ),
                  ),
                ),
                Container(
                  color: Colors.black,
                  child: Text(
                    'Third Text',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.pink,
                    ),
                  ),
                ),
                Container(
                  color: Colors.red,
                  child: Text(
                    'Fourth Text',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
