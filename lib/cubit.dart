import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttercourse/states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitState());
  AppCubit get(context) => BlocProvider.of(context);
  int count = 0;

  countMinus() {
    count--;
    emit(AppCountMinusState());
  }

  countPlus() {
    count++;
    emit(AppCountPlusState());
  }
}
