import 'package:flutter/material.dart';
import 'package:news_app/models/SourcesResponse.dart';
import 'package:news_app/shared/network/remote/api_manager.dart';

import '../../../models/NewsResponse.dart';

class NewsData extends StatelessWidget {

Sources newsSource;
NewsData(this.newsSource);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future: ApiManager.getNews(newsSource),
        builder: (_,snapshot){
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
              return Text(newsList[index].title??"");
              });

        },
    );
  }
}
