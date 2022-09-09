import 'package:flutter/material.dart';
import 'package:news_app/modules/home/home_screen.dart';
import 'package:news_app/modules/news/NewsDetailsScreen.dart';
import 'package:news_app/shared/styles/my_theme.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:{
        HomeScreen.routeName:(context)=>HomeScreen(),
        NewsDetailsScreen.routeName:(_)=>NewsDetailsScreen(),
      } ,
      initialRoute: HomeScreen.routeName,
      theme: MyThemeData.lightTheme,


    );
  }
}

