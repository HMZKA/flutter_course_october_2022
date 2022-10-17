import 'package:flutter/material.dart';

class AnimateAlign extends StatefulWidget {
  AnimateAlign({Key? key}) : super(key: key);

  @override
  State<AnimateAlign> createState() => _AnimateAlignState();
}

class _AnimateAlignState extends State<AnimateAlign> {
  bool align = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: InkWell(
        onTap: () {
          setState(() {
            align ? align = false : align = true;
          });
        },
        child: AnimatedAlign(
          alignment: align ? Alignment.topLeft : Alignment.bottomRight,
          duration: Duration(seconds: 5),
          child: FlutterLogo(
            size: 30,
          ),
        ),
      ),
    );
  }
}
