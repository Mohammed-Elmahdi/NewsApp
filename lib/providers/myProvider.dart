import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier{
  Widget title=Text("News App",style: TextStyle(fontSize: 25),);
  String AppLanguage='en';

  // IconData iconData=Icons.search;
  void changeTitle(Widget newTitle){
    title=newTitle;
    notifyListeners();
  }
  // void changeIcon(IconData newIcon){
  //   iconData=newIcon;
  //   notifyListeners();
  // }


  void changeLanguage(String languageCode){
    AppLanguage=languageCode;
    notifyListeners(); //to rebuild all app
  }
}