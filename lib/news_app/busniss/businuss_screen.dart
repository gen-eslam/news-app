import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todo_app/news_layout/cubit/cubit_.dart';
import 'package:todo_app/news_layout/cubit/states.dart';
import 'package:todo_app/shared/componants/conbonants.dart';

class BusinessScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsAppStats>(
        listener:(context,state){},
        builder: (context, state) {
          var list = NewsCubit.get(context).business;
          return buildArcticle(context,list: list);
        }
    );
  }
}
