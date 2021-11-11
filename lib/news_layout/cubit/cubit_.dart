import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/network/local/cache%20helper.dart';
import 'package:todo_app/network/remote/dio_helper.dart';
import 'package:todo_app/news_app/busniss/businuss_screen.dart';
import 'package:todo_app/news_app/scince/scince_screen.dart';

import 'package:todo_app/news_app/sports/sports_screen.dart';

import 'states.dart';

class NewsCubit extends Cubit<NewsAppStats>
{
  NewsCubit() : super(NewsInitialStates());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex =0 ;
  List<BottomNavigationBarItem> bottomNavigationBarItem=
  [
    BottomNavigationBarItem(
      icon:Icon(
        Icons.business_center),
      label:'business' ,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports_baseball),
      label: 'sport',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'science',
    ),

  ];
  List <Widget> Screens=
  [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),

  ];
  List<dynamic> business=[];
  List<dynamic> sports =[];
  List<dynamic> science =[];
  List<dynamic> search =[];
  ThemeMode appTheme = ThemeMode.dark ;

void onTabNavigationBar(int index)
{

  currentIndex= index;
  if(currentIndex==1)
  {
    getSportsData();
  }else if(currentIndex==2)
  {
    getScienceData();
  }else if(currentIndex==0){getBusinessData();}
  emit(OnTabNavigationBarStates());
}
void getBusinessData()
{
  emit(NewsGetBusinessLoadingState());
  DioHelper.getData(
      url: 'v2/top-headlines',
      query:
      {
        'country':'eg',
        'category':'business',
        'apiKey':'cea57e1530004d2e89dc26934aaf21f2',
      },).then((value){
        business =value.data['articles'];
        print(business[0]['title']);
        emit(GetBusinessDataSuccessState());
  } ).catchError((error){
    print(error.toString());
    emit(GetBusinessDataErrorState(error.toString()));
  });

}
  void getSportsData()
  {
    emit(NewsGetSportsLoadingState());
    if(sports.length==0)
    {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country':'eg',
          'category':'sports',
          'apiKey':'cea57e1530004d2e89dc26934aaf21f2',
        },).then((value){
        sports =value.data['articles'];
        print(sports[0]['title']);
        emit(GetSportsDataSuccessState());
      } ).catchError((error){
        print(error.toString());
        emit(GetSportsDataErrorState(error.toString()));
      });
    }else
      {
        emit(GetSportsDataSuccessState());

      }


  }
  void getScienceData()
  {
    if(science.length==0)
    {
      emit(NewsGetScienceLoadingState());
      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country':'eg',
          'category':'science',
          'apiKey':'cea57e1530004d2e89dc26934aaf21f2',
        },).then((value){
        science =value.data['articles'];
        print(science[0]['title']);
        emit(GetScienceDataSuccessState());
      } ).catchError((error){
        print(error.toString());
        emit(GetScienceDataErrorState(error.toString()));
      });
    }else
      {
        emit(GetScienceDataSuccessState());
      }


  }
  void getSearch(String value)
  {

    emit(NewsGetSearchLoadingState());

    DioHelper.getData(
      url: 'v2/everything',
      query:
      {
        'q':'$value',
        'apiKey':'cea57e1530004d2e89dc26934aaf21f2',
      },).then((value){
      search =value.data['articles'];
      print(search[0]['title']);
      emit(GetSearchDataSuccessState());
    } ).catchError((error){
      print(error.toString());
      emit(GetSearchDataErrorState(error.toString()));
    });

  }
  bool isDark =false;
  void changeAppMode({bool? fromShared})
  {
    if(fromShared != null)

      isDark= fromShared;
    else
      {
        isDark= ! isDark;
        CacheHelper.putBool(key: 'isDark', value: isDark).then((value){emit(ChangeAppModeState());
        });
      }


  }



}