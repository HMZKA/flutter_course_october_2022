import 'package:flutter/material.dart';

Widget buildNewsItem(model) {
  return InkWell(
    onTap: () {},
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
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    ),
  );
}
