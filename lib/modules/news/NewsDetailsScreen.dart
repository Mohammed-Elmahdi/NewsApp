import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/NewsResponse.dart';

class NewsDetailsScreen extends StatelessWidget {

  static const String routeName='News_details';
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    var articles=ModalRoute.of(context)!.settings.arguments as Articles;
    return Scaffold(
      appBar: AppBar(),
      body:
      Stack(
        children: [
          Image.asset('assets/images/pattern.png',fit: BoxFit.cover,height: double.infinity),
          Container(
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
                Text((articles.publishedAt??""),style: Theme.of(context).textTheme.subtitle1,
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: size.height*.015,),
                Text(articles.content ?? ''),
                SizedBox(height: size.height*.015,),
                TextButton(
                    onPressed: (){
                      openUrl(articles.url);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('View full Articles',
                        style: TextStyle(color: Colors.black),
                        ),
                        Icon(Icons.arrow_forward_ios_rounded,
                        color: Colors.black,
                          size: 15,
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
  //to open url in browser
  openUrl(String? url)async{
    if(url==null){
      return;
    }
    var uri=Uri.parse(url);
    if(await canLaunchUrl(uri)){
      await launchUrl(uri);
    }

  }
}
