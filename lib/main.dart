import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttercourse/cubit.dart';

import 'package:fluttercourse/messenger_screen.dart';
import 'package:fluttercourse/states.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
            debugShowCheckedModeBanner: false,
            home: MessengerScreen(),
            theme: ThemeData(
                primarySwatch: Colors.amber,
                appBarTheme: AppBarTheme(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                )),
            darkTheme: ThemeData(
                scaffoldBackgroundColor: Colors.grey[800],
                primarySwatch: Colors.blueGrey,
                appBarTheme: AppBarTheme(backgroundColor: Colors.grey[700]),
                textTheme: TextTheme(
                    bodyText1: TextStyle(fontSize: 18, color: Colors.white),
                    bodyText2: TextStyle(color: Colors.white),
                    subtitle1: TextStyle(color: Colors.grey))),
            themeMode: AppCubit().get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light),
      ),
    );
  }
}
