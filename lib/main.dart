import 'package:flutter/material.dart';
import 'package:news_app/modules/home/home_screen.dart';
import 'package:news_app/modules/news/NewsDetailsScreen.dart';
import 'package:news_app/providers/myProvider.dart';
import 'package:news_app/shared/styles/my_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'modules/setting/settings.dart';


void main() {
  runApp( ChangeNotifierProvider(
      create: (context){
        return MyProvider();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English, no country code
        Locale('ar'), // Spanish, no country code
      ],
      locale: Locale(provider.AppLanguage),
      debugShowCheckedModeBanner: false,
      routes:{
        HomeScreen.routeName:(context)=>HomeScreen(),
        NewsDetailsScreen.routeName:(_)=>NewsDetailsScreen(),
        SettingsScreen.routeName:(_)=>SettingsScreen(),
      } ,
      initialRoute: HomeScreen.routeName,
      theme: MyThemeData.lightTheme,


    );
  }
}

