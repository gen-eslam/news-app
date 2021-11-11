import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/news_app/search/search.dart';
import 'package:todo_app/news_layout/cubit/states.dart';
import 'package:todo_app/shared/componants/conbonants.dart';

import 'cubit/cubit_.dart';


class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsAppStats>(
      listener:(context,state){} ,
      builder:(context,state)
      {
        var cubit =NewsCubit.get(context);
        return Scaffold(
          body: cubit.Screens[cubit.currentIndex],
          appBar: AppBar(

            title: Text(
              'News App',

            ),
            actions:
            [
              IconButton(onPressed:(){
                cubit.changeAppMode();


              }, icon:Icon(Icons.brightness_4_outlined) ),
              IconButton(onPressed:(){
                NewsCubit.get(context).search= [];
                navigateTo(context, SearchScreen(),);

               }, icon:Icon(Icons.search_rounded) ),

            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            items:cubit.bottomNavigationBarItem,
            onTap: (index)
            {
              cubit.onTabNavigationBar(index);
            },
          ),
        );
      }
    );
  }
}
