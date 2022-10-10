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
          title: Text('PhotoGallery'),
        ),
        body: Center(
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(40)),
                child: Image(
                    width: 300,
                    height: 300,
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://www.gardendesign.com/pictures/images/675x529Max/site_3/helianthus-yellow-flower-pixabay_11863.jpg')),
              ),
              Text(
                'Flower',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    backgroundColor: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
