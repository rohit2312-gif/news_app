import 'dart:convert';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as Http;
import 'package:news_app/Model/articles.dart';
import "package:news_app/Model/newsdata.dart";

final String apikey="apiKey=9538f2dea85f483db003cfde1b6baebb";
//String url="https://newsapi.org/v2/everything?q=${parameter}&apiKey=9538f2dea85f483db003cfde1b6baebb";

Future getData(String keyword)async{
  String url="https://newsapi.org/v2/everything?q=${keyword}&"+apikey;

  Http.Response response=await Http.get(Uri.parse(url));
  print(response.statusCode);
  if(response.statusCode==200){
var data=json.decode(response.body);
Newsdata newsdata=new Newsdata.fromJson(data);
List<Articles> a=[];

print(newsdata.articles?.length);
  newsdata.articles?.forEach((e) => a.add(e),);

return a;
  }
  else{
    print(response.statusCode);
  }

}