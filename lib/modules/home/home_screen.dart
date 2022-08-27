import 'package:flutter/material.dart';
import 'package:news_app/models/SourcesResponse.dart';
import 'package:news_app/modules/home/tabControllerItem.dart';
import 'package:news_app/shared/network/remote/api_manager.dart';
import 'package:news_app/shared/styles/my_theme.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName='home';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyThemeData.primaryColor,
        centerTitle: true,
        title: Text('News App'),
      ),
      body: Container(
        child: FutureBuilder<SourcesResponse>(
          future:ApiManager.getSources() ,
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

      ),
    );
  }
}
