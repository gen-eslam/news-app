import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/news_layout/cubit/cubit_.dart';
import 'package:todo_app/news_layout/cubit/states.dart';
import 'package:todo_app/shared/componants/conbonants.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsAppStats>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsCubit.get(context).search;
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: defaultTextField(
                    controller: searchController,
                    type: TextInputType.text,
                    onChange: (value)
                    {
                      NewsCubit.get(context).getSearch(value);
                    },
                    onValidate: (value) {
                      if (value!.isEmpty) {
                        return 'Search Must Not Be Empty';
                      }
                    },
                    label: 'search',
                    prefix: Icons.search_rounded,
                  ),
                ),
                Expanded(child: buildArcticle(context, list:list,isSearch:true ),),
              ],
            ),
          );
        }
    );
  }
}
