class Articles{




  String? author;
  String?title;
  String?description;
  String? url;
  String? urltoImage;
  String? publishedAt;
  String? content;

  Articles({this.author,this.title,this.description,this.url,this.urltoImage,this.publishedAt,this.content});
  factory Articles.fromJson(Map<String,dynamic> json){

    return Articles(author: json["author"],title: json["title"] ,urltoImage: json["urlToImage"] ,
        publishedAt: json["publishedAt"] ,content: json["content"],url: json["url"],description: json["description"] );
  }
  // Map<String,dynamic> toJson(){
  //  final Map<String,dynamic> data=new Map<String,dynamic>();
  // data[""];
  //  return data;
  // }
}