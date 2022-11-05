import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_coursee/screens/searchscreen.dart';

import '../bloc&states/cubit.dart';
import '../bloc&states/states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit().get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('NewsApp'),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SearchScreen(),
                      ));
                      cubit.searchModel = null;
                    },
                    icon: Icon(Icons.search)),
                IconButton(
                    onPressed: () {
                      cubit.changeTheme();
                    },
                    icon: Icon(Icons.brightness_4_outlined))
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.index,
                onTap: (value) {
                  cubit.changeNavBar(value);
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.business), label: 'Business'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.sports), label: 'Sport'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.science), label: 'Other')
                ]),
            body: cubit.screens[cubit.index],
          );
        });
  }
}
