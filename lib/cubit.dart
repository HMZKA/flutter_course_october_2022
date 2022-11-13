import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coursee/cache_helper.dart';
import 'package:flutter_coursee/components.dart';
import 'package:flutter_coursee/dio_helper.dart';
import 'package:flutter_coursee/home_screen.dart';
import 'package:flutter_coursee/states.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitStates());

  AppCubit get(context) => BlocProvider.of(context);

  Future login(String email, String password, context) async {
    emit(AppLoginLoadingState());
    DioHelper.postData('login', {'email': email, 'password': password})
        .then((value) {
      print(value?.data);
      CacheHelper.setString('token', value?.data['data']['token']);
      if (value!.data['status']) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
            (route) => false);
      }
      toast(value.data["message"]);
      emit(AppLoginSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AppLoginErrorState());
    });
  }

  List images = [];
  getHome() {
    emit(AppHomeLoadingState());
    DioHelper.getData(
      'home',
    ).then((value) {
      value?.data['data']['banners'].forEach((element) {
        images.add(element['image']);
      });
      print(value?.data['data']['banners']);
      emit(AppHomeSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AppHomeErrorState());
    });
  }
}
