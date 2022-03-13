import 'articles.dart';

class Newsdata{

  String? status;
  int? totalresults;
 List<Articles>? articles;

  Newsdata({this.status,this.articles,this.totalresults});

factory Newsdata.fromJson(Map<String,dynamic> parsedJson){
  var article_list=parsedJson["articles"] as List;
  List<Articles>article=article_list.map((list) => Articles.fromJson(list)).toList();
  print(article_list.runtimeType);

  return Newsdata(totalresults: parsedJson["totalResults"],status: parsedJson["status"],articles: article);



}

}