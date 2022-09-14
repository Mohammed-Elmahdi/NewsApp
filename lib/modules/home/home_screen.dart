import 'package:flutter/material.dart';
import 'package:news_app/modules/news/NewsFragment.dart';
import 'package:news_app/modules/category/categoriesFragment.dart';
import 'package:news_app/modules/drawer/homeDrawer.dart';
import 'package:news_app/models/CategoryModel.dart';
import 'package:provider/provider.dart';
import '../../models/NewsResponse.dart';
import '../../providers/myProvider.dart';
import '../../shared/network/remote/api_manager.dart';
import '../news/newsItem.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName='home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight:Radius.circular(40),
              bottomLeft: Radius.circular(40),

          )
        ),
        toolbarHeight: MediaQuery.of(context).size.height*.13,
        centerTitle: true,
        title:provider.title,
        // Text(provider.title,
        //   style:TextStyle(
        //     fontSize: 28
        //   ) ,),
        actions: [
          IconButton(
              onPressed: (){
                showSearch(
                    context: context,
                    delegate: NewsSearch());
              },
              icon: Icon(Icons.search,size: 30),),
          SizedBox(width: 8,),
        ],
      ),

      drawer:HomeDrawer(onMenuItemClicked),

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
class NewsSearch extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
   return [
     IconButton(
      onPressed: (){
        showResults(context);
      },
      icon: Icon(Icons.search,size: 25),)];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      Navigator.pop(context);
    },
        icon: Icon(Icons.clear)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder<NewsResponse>(
        future: ApiManager.getNewsSearch( query),//for search
        builder: (buildContext,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          if(snapshot.hasError){
            return Column(
              children: [
                Text('Somthing Wrong'),
                ElevatedButton(onPressed: (){}, child: Text('Try again'),
                ),
              ],
            );
          }
          if("ok"!=snapshot.data?.status){
            return Column(
              children: [
                Text('Somthing Wrong'),
                ElevatedButton(onPressed: (){}, child: Text('Try again'),
                ),
              ],
            );
          }

          var newsList=snapshot.data?.articles??[];
          return ListView.builder(
              itemCount:newsList.length ,
              itemBuilder: (_,index){
                return NewsItem(newsList[index]);
              });

        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
     return Center(child: Text('Suggestions'));
  }

}