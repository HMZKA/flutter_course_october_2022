import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coursee/cache/cache.dart';

import 'package:flutter_coursee/dio%20service/dio.dart';

import 'package:flutter_coursee/bloc&states/observer.dart';
import 'package:flutter_coursee/screens/mainscreen.dart';

import 'bloc&states/cubit.dart';
import 'bloc&states/states.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()
        ..getBusiness()
        ..getSport(),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AppCubit().get(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: HomeScreen(),
              theme: ThemeData(
                  primarySwatch: Colors.deepOrange,
                  scaffoldBackgroundColor: Colors.grey[300],
                  appBarTheme: AppBarTheme(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black),
                  textTheme: TextTheme(
                      bodyText1: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black)),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      backgroundColor: Colors.white)),
              darkTheme: ThemeData(
                  scaffoldBackgroundColor: Colors.blueGrey[700],
                  primarySwatch: Colors.deepOrange,
                  appBarTheme: AppBarTheme(
                      backgroundColor: Colors.blueGrey[700],
                      foregroundColor: Colors.white),
                  textTheme: TextTheme(
                      bodyText1: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white)),
                  cardColor: Colors.blueGrey,
                  cardTheme: CardTheme(elevation: 12),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      backgroundColor: Colors.blueGrey[600])),
              themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            );
          }),
    );
  }
}
