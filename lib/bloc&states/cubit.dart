import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coursee/bloc&states/states.dart';

import 'package:flutter_coursee/cache/cache.dart';
import 'package:flutter_coursee/dio%20service/dio.dart';

import 'package:flutter_coursee/screens/business_screen.dart';
import 'package:flutter_coursee/screens/other_screen.dart';
import 'package:flutter_coursee/screens/sport_screen.dart';

import '../models/businessmodel.dart';
import '../models/searchmodel.dart';
import '../models/sportmodel.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitState());
  AppCubit get(context) => BlocProvider.of(context);
  int index = 0;
  List screens = [BusinessScreen(), SportScreen(), OtherScreen()];

  changeNavBar(currentIndex) {
    index = currentIndex;
    emit(AppChangeNavBarState());
  }

  bool isDark = CacheHelper.getData('isDark') ?? false;
  changeTheme() {
    isDark = !isDark;
    CacheHelper.setData('isDark', isDark);
    emit(AppChangeThemeState());
  }

  NewsModel? newsModel;
  getBusiness() {
    emit(AppGetBusinessLoadingState());
    DioHelper.getData('top-headlines', {
      'country': 'us',
      'category': 'business',
      'apiKey': 'a269e4f1de864efc85f38b36f1bae318'
    }).then((value) {
      newsModel = NewsModel.fromJson(value?.data);
      print(newsModel?.articles[0].title);
      emit(AppGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AppGetBusinessErrorState());
    });
  }

  SportModel? sportModel;
  getSport() {
    emit(AppGetSportLoadingState());
    DioHelper.getData('top-headlines', {
      'country': 'us',
      'category': 'sport',
      'apiKey': 'a269e4f1de864efc85f38b36f1bae318'
    }).then((value) {
      sportModel = SportModel.fromJson(value?.data);
      print(sportModel?.articles[5].urlToImage);
      emit(AppGetSportSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AppGetSportErrorState());
    });
  }

  SearchModel? searchModel;
  getSearch(String value) {
    emit(AppGetSearchLoadingState());
    DioHelper.getData('everything', {
      'q': value,
      'apiKey': 'a269e4f1de864efc85f38b36f1bae318'
    }).then((value) {
      searchModel = SearchModel.fromJson(value?.data);
      emit(AppGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AppGetSearchErrorState());
    });
  }
}
