part of 'counter_bloc.dart';

abstract class CounterEvent {}

class CounterMinusEvent extends CounterEvent {}

class CounterPlusEvent extends CounterEvent {}
