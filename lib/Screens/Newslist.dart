import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Screens/OnTap.dart';
import 'package:news_app/Views/networking.dart';
import 'package:news_app/main.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math';
class Newslist extends StatefulWidget {
String ?param;
Newslist({this.param});
  @override
  _NewslistState createState() => _NewslistState();
}

class _NewslistState extends State<Newslist>with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive=>true;
  @override
  Widget build(BuildContext context) {
    return Container(child: FutureBuilder(
        future: getData(widget.param.toString()),
        builder: (BuildContext context,AsyncSnapshot <dynamic> snapshot){

          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: JumpingDotsProgressIndicator(color: Colors.red,fontSize: 60.0,numberOfDots: 5,));
          }
           if(snapshot.hasError){
            Center(child: Text("ERROR 404"),);
          }
          else if(snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data.length,
                scrollDirection: Axis.vertical,itemBuilder: (context,index){
              return Column(
                children: [
                  SizedBox(height: 20.0,),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                            onTap: (){
                              setState(() {

                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                                  return OnTap(article: snapshot.data[index].urltoImage,
                                    content: snapshot.data[index].content,
                                    url: snapshot.data[index].url,
                                    title: snapshot.data[index].title,
                                    image: snapshot.data[index].urltoImage,
                                    author: snapshot.data[index].author,
                                  );
                                }));
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 80.0,
                                width: 20.0,
                                child: ClipRRect(

                                    borderRadius: BorderRadius.circular(18.0),
                                    child: Image.network(snapshot.data[index].urltoImage,fit: BoxFit.fill)),
                              ),
                            )),

                            ),

                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0,right: 16.0),
                          child: Column(
                            children: [
                              Text(snapshot.data[index].title,style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight:  FontWeight.w600),),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(CupertinoIcons.clock,color: Colors.grey,),
                                  SizedBox(width: 1.0,),
                                  Text(generateRandomNumber(12).toString()+' hours ago',style: TextStyle(color: Colors.grey),),
                                  SizedBox(width: 20.0,),

                                  Icon(CupertinoIcons.eye,color: Colors.grey,),
                                  SizedBox(width: 1.0,),
                                  Text( generateRandomNumber(500).toString()+" views",style: TextStyle(color: Colors.grey),),
                                ],
                              ),
                            ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            });
          }
          return Center(child: CircularProgressIndicator(color: Colors.red,));
        }));
  }
  void _urllauncher(String url)async{
    if(!await launch(url)); throw 'Error';
  }
  int  generateRandomNumber(int r) {

    var random = new Random();

    // Printing Random Number between 1 to 100 on Terminal Window.
    int a=random.nextInt(r);
    return a;
  }
}
