import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => CounterBloc(),
        child: BlocConsumer<CounterBloc, CounterState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(CounterMinusEvent());
                      },
                      child: Text(
                        'Minus',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      )),
                  Text(
                    '${state.counter}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  TextButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(CounterPlusEvent());
                      },
                      child: Text(
                        'Plus',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      )),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
