import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttercourse/cubit.dart';
import 'package:fluttercourse/states.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AppCubit().get(context);
            return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          cubit.countMinus();
                        },
                        child: Text('Minus')),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        '${cubit.count}',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          cubit.countPlus();
                        },
                        child: Text('Plus')),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
