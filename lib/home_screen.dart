import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coursee/cubit.dart';
import 'package:flutter_coursee/states.dart';

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
            title: Text('BigMall'),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                CarouselSlider(
                    items: cubit.images
                        .map((e) => Image.network(
                              '${e}',
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ))
                        .toList(),
                    options:
                        CarouselOptions(viewportFraction: 1, autoPlay: true)),
                SizedBox(
                  height: 20,
                ),
                GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: List.generate(
                      cubit.images.length,
                      (index) => Image.network(
                            cubit.images[index],
                          )),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
