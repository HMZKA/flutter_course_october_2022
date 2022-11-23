part of 'locale_bloc.dart';

class LocaleState extends Equatable {
  Locale locale;
  LocaleState({required this.locale});

  @override
  List<Object> get props => [locale];
}

class LocaleInitial extends LocaleState {
  LocaleInitial() : super(locale: Locale('en'));
}
