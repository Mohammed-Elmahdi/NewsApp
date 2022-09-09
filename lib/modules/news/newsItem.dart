import 'package:flutter/material.dart';
import 'package:news_app/models/NewsResponse.dart';
import 'package:news_app/modules/news/NewsDetailsScreen.dart';

class NewsItem extends StatelessWidget {
Articles articles;//from NewsResponse
NewsItem (this.articles);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Navigator.of(context).
      pushNamed(NewsDetailsScreen.routeName,
      arguments: articles
      ),
      child: Container(
        clipBehavior: Clip.antiAlias,
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 15,),
            Image.network(articles.urlToImage??"",
              height: MediaQuery.of(context).size.height*.28,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10,),
            Text(articles.author??"",style: Theme.of(context).textTheme.subtitle1),
            SizedBox(height: 5,),
            Text(articles.title??"",style: Theme.of(context).textTheme.headline1),
            SizedBox(height: 5,),
            Text(articles.publishedAt??"",style: Theme.of(context).textTheme.subtitle1,
            textAlign: TextAlign.right,
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
