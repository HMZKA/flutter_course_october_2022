part of 'locale_bloc.dart';

abstract class LocaleEvent {}

class LocalechangeEvent extends LocaleEvent {
  dynamic locale;
  LocalechangeEvent(this.locale);
}
