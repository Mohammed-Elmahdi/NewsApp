import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/shared/components/constant.dart';

import '../../../models/NewsResponse.dart';
import '../../../models/SourcesResponse.dart';
//uri: uniform resource identifier
class ApiManager{
  static Future<SourcesResponse>getSources()async{
    var uri=Uri.https(BASEURL, '/v2/top-headlines/sources',
                      {"apikey":APIKEY});

    var response=await http.get(uri);
    try {
      var bodyString=response.body;
      var json = jsonDecode(bodyString);
      var sourcesResponse = SourcesResponse.fromJson(json);
      return sourcesResponse;
    }catch(e){
      throw e;
    }
    
  }

  static Future<NewsResponse>getNews(Sources source)async{
    var uri=Uri.https(BASEURL, '/v2/everything',{"apikey":APIKEY,"sources":source.id});
    var response=await http.get(uri);
    try {
      var json = jsonDecode(response.body);
      var newsResponse = NewsResponse.fromJson(json);
      return newsResponse;
    }catch(e){
      throw e;
    }

  }
}