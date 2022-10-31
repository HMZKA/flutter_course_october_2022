import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coursee/cubit.dart';
import 'package:flutter_coursee/states.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var searchmodel = AppCubit().get(context).searchModel;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            title: Text('Search'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                TextFormField(
                  onChanged: (value) {
                    AppCubit().get(context).getSearch(value);
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'search'),
                ),
                SizedBox(
                  height: 5,
                ),
                if (state is AppGetSearchLoadingState)
                  LinearProgressIndicator(),
                if (state is AppGetSearchSuccessState)
                  Expanded(
                    child: SizedBox(
                      child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) =>
                              buildSearch(searchmodel.articles[index]),
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: searchmodel!.articles.length),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildSearch(model) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Image.network(
            '${model.urlToImage}',
            height: 150,
            width: 100,
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text(
              '${model.title}',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
