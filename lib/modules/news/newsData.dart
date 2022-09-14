import 'package:flutter/material.dart';
import 'package:news_app/models/SourcesResponse.dart';
import 'package:news_app/modules/news/newsItem.dart';
import 'package:news_app/shared/network/remote/api_manager.dart';
import 'package:provider/provider.dart';
import '../../../models/NewsResponse.dart';
import '../../providers/myProvider.dart';

class NewsData extends StatefulWidget {

Sources newsSource;
NewsData(this.newsSource);

  @override
  State<NewsData> createState() => _NewsDataState();
}

class _NewsDataState extends State<NewsData> {
  // int pageNumber=1;
  // final scrollController=ScrollController();
  // bool shouldLoadNextPage=false;//to call API to add next page
  // List<Articles>news=[];//************************
  // @override
  // void initState(){
  //   super.initState();
  //   scrollController.addListener(() {
  //     if(scrollController.position.atEdge){//check for position top or bottom
  //       bool isTop=scrollController.position.pixels==0;
  //       if(!isTop){
  //         shouldLoadNextPage=true;
  //         setState(() {});
  //       }
  //     }
  //   });
  // }
  // @override
  // void dispose(){
  //   scrollController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // if(shouldLoadNextPage){
    //   ApiManager.getNews(widget.newsSource,page:  ++pageNumber)
    //       .then((newsResponse){
    //         news.addAll(newsResponse.articles ?? [] );
    //         shouldLoadNextPage=false;
    //         setState(() {});
    //   });
    // }
    // print('news length => ${news.length}');
    // print('page number => ${pageNumber}');

    var pro=Provider.of<MyProvider>(context);
    return FutureBuilder<NewsResponse>(
      future: ApiManager.getNews( widget.newsSource,
      pro.AppLanguage=='ar'?'en':'en'
      ),//for search
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

          // var data=snapshot.data;
          // var newsList=data?.articles??[];
          //
          // if(snapshot.hasData){
          //   if(news.isEmpty){
          //     news=data?.articles?? [];
          //   }
          //   if(data?.articles?[0].title!=news[0].title){
          //     scrollController.jumpTo(0);
          //     news=data?.articles ?? [];
          //   }
          // }

          var newsList=snapshot.data?.articles??[];
          return ListView.builder(
            itemCount:newsList.length ,
              // controller: scrollController,
              itemBuilder: (_,index){
              return NewsItem(newsList[index]);
              });

        },
    );
  }
}
