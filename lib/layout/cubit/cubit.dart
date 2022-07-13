import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newspaper/layout/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:newspaper/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsIntialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  int cuttentIndex = 0;

  List<BottomNavigationBarItem> navItems = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sport',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),
  ];

  void getIndex(int index) {
    cuttentIndex = index;
    if (index == 0) {
      getBuisness();
    } else {
      getBuisness();
    }

    emit(NewsBottomNavState());
  }

  List<Map<String, dynamic>> buisness = [];
  void getBuisness() {
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'ca',
      'category': 'business',
      'apiKey': 'd04ac1dd6f2d4e6e87ed18807d51f334',
    }).then((value) {
      buisness = value.data["articles"];
      emit(NewGetBusinessSuccessState());
    }).catchError((error) {
      emit(NewGetBusinessErrorState(error));
    });
  }
}
