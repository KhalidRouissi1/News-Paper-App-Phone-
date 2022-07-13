import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newspaper/layout/cubit/state.dart';
import 'package:newspaper/shared/components/components.dart';
import 'cubit/cubit.dart';
import 'package:newspaper/modules/body.dart';

class NewsPaper extends StatelessWidget {
  const NewsPaper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBuisness(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'News Paper App',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                cubit.getIndex(index);
              },
              currentIndex: cubit.cuttentIndex,
              items: cubit.navItems,
            ),
            body: bodycontainer(),
          );
        },
      ),
    );
  }
}
