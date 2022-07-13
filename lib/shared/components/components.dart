import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newspaper/layout/cubit/cubit.dart';
import 'package:newspaper/layout/cubit/state.dart';
import 'package:newspaper/shared/network/remote/dio_helper.dart';

Widget MyDivider() => Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        color: Colors.deepOrange,
      ),
    );
Widget newsArticalBuilder(article) => Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 120,
        child: Row(children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('${article['urlToImage']}'),
                )),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '${article['title']}',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                '${article['publishedAt']}',
                style: TextStyle(color: Colors.grey),
              )
            ],
          )
        ]),
      ),
    );

Widget articalBuilder(list) => BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: list.length > 0,
          builder: (context) => ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => newsArticalBuilder(list[index]),
              separatorBuilder: (context, index) => MyDivider(),
              itemCount: 10),
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
