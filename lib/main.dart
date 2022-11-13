import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coursee/cache_helper.dart';
import 'package:flutter_coursee/cubit.dart';
import 'package:flutter_coursee/dio_helper.dart';
import 'package:flutter_coursee/home_screen.dart';
import 'package:flutter_coursee/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  var token = CacheHelper.get('token') ?? '';
  Widget widget = LoginScreen();
  if (token == '') {
    widget = LoginScreen();
  } else {
    widget = HomeScreen();
  }
  DioHelper.init();
  runApp(MyApp(widget));
}

class MyApp extends StatelessWidget {
  MyApp(this.widget);
  dynamic widget;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getHome(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: widget,
      ),
    );
  }
}
