import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coursee/cubit.dart';
import 'package:flutter_coursee/states.dart';

import 'componants.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      builder: (context, state) {
        var newsmodel = AppCubit().get(context).newsModel;
        return BuildCondition(
          condition: newsmodel != null,
          // state is AppGetDataSuccessState,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(4.5),
            child: ListView.separated(
                itemBuilder: (context, index) =>
                    buildNewsItem(newsmodel.articles[index]),
                separatorBuilder: (context, index) => SizedBox(
                      height: 7,
                    ),
                itemCount: newsmodel!.articles.length),
          ),
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
