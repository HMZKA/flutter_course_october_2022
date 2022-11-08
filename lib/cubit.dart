import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coursee/components.dart';
import 'package:flutter_coursee/dio_helper.dart';
import 'package:flutter_coursee/states.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitStates());

  AppCubit get(context) => BlocProvider.of(context);

  Future login(String email, String password) async {
    emit(AppLoginLoadingState());
    DioHelper.postData('login', {'email': email, 'password': password})
        .then((value) {
      print(value?.data);
      toast(value?.data["message"]);
      emit(AppLoginSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AppLoginErrorState());
    });
  }
}
