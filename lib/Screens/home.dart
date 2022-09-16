//import 'package:news_app/Screens/Covid-19.dart';
//import 'package:news_app/Screens/SportsNews.dart';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:news_app/Model/articles.dart';
import 'package:news_app/Model/newsdata.dart';
import 'package:news_app/Views/networking.dart';
import '../Views/provider.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Screens/Newslist.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  TabController? _tabController;
  TextEditingController? search;
  late String params;
  @override
  void initState() {
    params = "latest";
//textEditingController=TextEditingController();
    search = TextEditingController();
    _tabController = TabController(length: tabs.length, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  List<Text> tabs = [
    Text(
      'Coronavirus',
      style: TextStyle(
          color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w700),
    ),
    Text(
      'Sports',
      style: TextStyle(
          color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w700),
    ),
    Text(
      'India',
      style: TextStyle(
          color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w700),
    ),
    Text(
      'Cryptocurrency',
      style: TextStyle(
          color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w700),
    ),
    Text(
      'Hollywood',
      style: TextStyle(
          color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w700),
    ),
    Text(
      'Business and Finance',
      style: TextStyle(
          color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w700),
    ),
    Text(
      'Technology',
      style: TextStyle(
          color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w700),
    ),
  ];
  List<Newslist> news = [
    //Center(child: Icon(Icons.arrow_back),),
    //Center(child: Icon(Icons.print),),
    Newslist(param: "coronavirus"),
    Newslist(param: "sports"),
    Newslist(param: "India"),
    Newslist(param: "crypto"),
    Newslist(param: "hollywood"),
    Newslist(param: "finance"),
    Newslist(
      param: "Technology",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,

        //  drawer: Container(),
        appBar: AppBar(
          elevation: 0,
          leading: Icon(
            Icons.list,
            color: Colors.black,
          ),
          backgroundColor: CupertinoColors.white,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //SizedBox(height: 40.0,),
            Container(
                color: Colors.white,
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 35.0,
                    ),
                    Text(
                      'Discover',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 28.0),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      'News from all over the world',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 15.0),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return Newslist(
                                    param: search!.text,
                                  );
                                });
                          },
                          child: Container(
                            child: Icon(Icons.search),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: TextField(
                            controller: search,

                            // print(search!=null?search.toString():"null");
                            decoration: InputDecoration(
                                hintText: 'Search',
                                suffixIcon: Icon(CupertinoIcons.list_dash),
                                //  prefixIcon: Icon(CupertinoIcons.search),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                )),
                            //  initialValue: 'Search',
                          ),
                        ),
                      ],
                    ),
                  ],
                )),

            //  SizedBox(height: MediaQuery.of(context).size.height*0.2,),
            SizedBox(
              height: 50.0,
              child: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                bottom: TabBar(
                    labelColor: Colors.grey,
                    indicatorColor: Colors.black,
                    //labelPadding: EdgeInsets.only(left: 10.0,right: 10.0),
                    padding: EdgeInsets.only(left: 10.0),
                    isScrollable: true,
                    physics:
                        ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                    controller: _tabController,
                    tabs: tabs),
              ),
            ),
            Expanded(
              child: TabBarView(controller: _tabController, children: news),
            ),
          ],
        ),
      ),
    );
  }
}
