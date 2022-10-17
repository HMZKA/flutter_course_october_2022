import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercourse/animationtween.dart';
import 'package:fluttercourse/home_screen.dart';

import 'align_animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: AnimationScreen());
  }
}
