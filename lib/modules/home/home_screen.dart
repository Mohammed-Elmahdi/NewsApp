import 'package:flutter/material.dart';
import 'package:news_app/modules/news/NewsFragment.dart';
import 'package:news_app/modules/category/categoriesFragment.dart';
import 'package:news_app/modules/drawer/homeDrawer.dart';
import 'package:news_app/shared/styles/my_theme.dart';
import 'package:news_app/models/CategoryModel.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName='home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('News App'),
      ),
      drawer:HomeDrawer(onMenuItemClicked) ,
      body:selectedCategory==null?
      CategoriesFragment(onCategoryClicked)
      :NewsFragment(selectedCategory!)
    );
  }
  //search in everything endpoint(q)

  Category? selectedCategory;

  void onCategoryClicked(Category category){
    //to change Ui body
    selectedCategory=category;
    setState((){});
  }
  void onMenuItemClicked(){
    Navigator.pop(context);
    selectedCategory=null;
    setState(() {

    });
  }
}
