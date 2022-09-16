import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:news_app/Views/networking.dart';
import 'package:url_launcher/url_launcher.dart';

class OnTap extends StatelessWidget {
  String? article;
  String? content;
  String? url;
  String? title;
  String? image;
  String? author;
  OnTap(
      {this.article,
      this.content,
      this.url,
      this.title,
      this.image,
      this.author});

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            //height: double.infinity,
            child: Container(
                //height:
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.6,
                child: Image.network(
                  image.toString(),
                  fit: BoxFit.fitHeight,
                )),
          ),
          Container(
            //height: double.infinity,
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.5),
            child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  shadowColor: Colors.black,
                  //borderOnForeground: true,
                  elevation: 20.0,
                  child: Container(
                    // height: double.infinity,
                    //  margin: EdgeInsets.only(top: 50.0),
                    decoration: BoxDecoration(
                      //boxShadow: ,
                      borderRadius: BorderRadius.circular(10.0),
                      // color: Colors.red,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            //Container(),
                            //Container(),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Container(
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        author.toString() == 'null'
                                            ? 'Rohit'
                                            : author.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13.0),
                                      ),
                                    ),
                                  ),
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40.0),
                                      color: CupertinoColors.black),
                                ),
                              ),
                            ),

                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Container(
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          CupertinoIcons.clock,
                                          color: Colors.grey,
                                        ),
                                        Text(
                                          '2h',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(40.0),
                                      color: Colors.grey.withOpacity(0.2)),
                                ),
                              ),
                            ),

                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Container(
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          CupertinoIcons.eye,
                                          color: Colors.grey,
                                        ),
                                        Text(
                                          '245',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(40.0),
                                      color: Colors.grey.withOpacity(0.2)),
                                ),
                              ),
                            ),
                          ],
                        ),

                        Padding(
                          padding:
                              const EdgeInsets.only(left: 13.0, right: 13.0),
                          child: Text(
                            content.toString(),
                            style: TextStyle(fontSize: 20.0),
                            softWrap: true,
                          ),
                        ),
                        // SizedBox(height: .0,),
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 8.0, top: 50.0),
                          child: GestureDetector(
                            child: Text(
                              'click here to read more',
                              style: TextStyle(fontSize: 15.0),
                            ),
                            onTap: () {
                              _urllauncher(url.toString());
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _urllauncher(String url) async {
    try {
      !await launch(url);
    } catch (e) {
      throw 'Error';
    }
  }
}
