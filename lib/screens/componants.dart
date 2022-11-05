import 'package:flutter/material.dart';
import 'package:flutter_coursee/screens/webview_screen.dart';

Widget buildNewsItem(model, context) {
  return InkWell(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => WebViewScreen(model.url),
      ));
    },
    child: Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Column(
        children: [
          Image.network(
            '${model.urlToImage}',
            errorBuilder: (context, error, stackTrace) =>
                Image.asset('images/R.jpg'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              '${model.title}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          )
        ],
      ),
    ),
  );
}
