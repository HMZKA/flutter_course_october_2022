import 'package:flutter/material.dart';
import 'package:webviewx/webviewx.dart';

class WebViewScreen extends StatelessWidget {
  WebViewScreen(this.url);
  String url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebViewX(
        height: double.infinity,
        width: double.infinity,
        initialContent: url,
      ),
    );
  }
}
