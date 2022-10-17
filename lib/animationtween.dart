import 'dart:async';

import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  AnimationScreen({Key? key}) : super(key: key);

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  var color = Colors.black;
  var r = 0.0;
  changeColor() {
    return color = Colors.red;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 5), (timer) {
      changeColor();
      r = 50;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 50, end: 200),
          duration: Duration(seconds: 5),
          builder: (context, value, child) => AnimatedContainer(
            curve: Curves.bounceOut,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(r)),
            width: value as double,
            height: value as double,
            duration: Duration(seconds: 5),
          ),
        ),
      ),
    );
  }
}
