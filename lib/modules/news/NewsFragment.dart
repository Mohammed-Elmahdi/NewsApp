import 'package:flutter/material.dart';
import 'package:news_app/modules/news/tabControllerItem.dart';
import 'package:news_app/models/CategoryModel.dart';
import 'package:provider/provider.dart';
import '../../models/SourcesResponse.dart';
import '../../shared/network/remote/api_manager.dart';
import '../../providers/myProvider.dart';

class NewsFragment extends StatelessWidget {
  Category category; //to open specify news depend on selected category
  NewsFragment(this.category);

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);
    return Container(
      child: FutureBuilder<SourcesResponse>(
        future:ApiManager.getSources(category.id,
            pro.AppLanguage=='ar'?'en':'en'
        ) ,//id for selected category
        builder: (context,snapshot){
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
          var sourcesList=snapshot.data?.sources??[];//SourcesResponse
          return TabControllerItem(sourcesList);
        },
      ),

    );
  }
}
