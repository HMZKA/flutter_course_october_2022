import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coursee/business_screen.dart';
import 'package:flutter_coursee/dio.dart';
import 'package:flutter_coursee/model.dart';
import 'package:flutter_coursee/other_screen.dart';
import 'package:flutter_coursee/sport_screen.dart';
import 'package:flutter_coursee/states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitState());
  AppCubit get(context) => BlocProvider.of(context);
  int index = 0;
  List screens = [BusinessScreen(), SportScreen(), OtherScreen()];

  changeNavBar(currentIndex) {
    index = currentIndex;
    emit(AppChangeNavBarState());
  }

  NewsModel? newsModel;
  getBusiness() {
    DioHelper.getData('top-headlines', {
      'country': 'us',
      'category': 'business',
      'apiKey': 'a269e4f1de864efc85f38b36f1bae318'
    }).then((value) {
      newsModel = NewsModel.fromJson(value?.data);
      print(newsModel?.articles[0].title);
      emit(AppGetDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AppGetDataErrorState());
    });
  }
}
