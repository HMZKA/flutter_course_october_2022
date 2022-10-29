import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coursee/cubit.dart';
import 'package:flutter_coursee/states.dart';

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
          builder: (context) => ListView.separated(
              itemBuilder: (context, index) =>
                  buildNewsItem(newsmodel.articles[index]),
              separatorBuilder: (context, index) => SizedBox(
                    height: 7,
                  ),
              itemCount: newsmodel!.articles.length),
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
      listener: (context, state) {},
    );
  }

  Widget buildNewsItem(model) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Column(
        children: [
          Image.network(
            '${model.urlToImage}',
            errorBuilder: (context, error, stackTrace) =>
                Image.asset('images/R.jpg'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, bottom: 12),
            child: Text(
              '${model.title}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
