import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
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
              color: Colors.amber,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                      children: [
                        Icon(Icons.ac_unit, size: 100),
                        Icon(Icons.access_alarm, size: 100),
                        Icon(Icons.access_alarm_rounded, size: 100),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center

                      // mainAxisSize: MainAxisSize.min,
                      ),
                  Row(
                      children: [
                        Icon(Icons.ac_unit, size: 100),
                        Icon(Icons.access_alarm, size: 100),
                        Icon(Icons.access_alarm_rounded, size: 100),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center

                      // mainAxisSize: MainAxisSize.min,
                      ),
                  Row(
                      children: [
                        Icon(Icons.ac_unit, size: 100),
                        Icon(Icons.access_alarm, size: 100),
                        Icon(Icons.access_alarm_rounded, size: 100),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center

                      // mainAxisSize: MainAxisSize.min,
                      )
                ],
              )),
        ));
  }
}
