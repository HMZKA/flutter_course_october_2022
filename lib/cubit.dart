import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttercourse/states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitState());
  AppCubit get(context) => BlocProvider.of(context);
  bool isDark = false;
  changeTheme() {
    isDark = !isDark;
    emit(AppChangeThemeModeState());
  }
}
