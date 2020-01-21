import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './Constants.dart';
import './list_item.dart';
import 'package:mtimes/entity/news.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return NoteListState();
  }
}

class NoteListState extends State<HomePage> with SingleTickerProviderStateMixin {
  List<Article> _newsList = new List();

  void getData() async {
    http.Response response = await http.get(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=821a22ad51e240fb9c131c4b00009630");
    setState(() {
      _newsList = News.fromJson(json.decode(response.body)).articles;
    });
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle().copyWith(statusBarColor: Colors.grey));

    // TODO: implement build
    return DefaultTabController(
        length: 5,
        child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: RichText(text: TextSpan(
              style: Theme.of(context).textTheme.body1.copyWith(fontSize: 30, fontFamily: 'Alice'),
                children: [
                  TextSpan(
                    text: 'Mexico ',
                  ),
                  TextSpan(
                      text: 'Ti',
                      style: TextStyle(
                          color: Colors.orange
                      )
                  ),
                  TextSpan(
                    text: 'mes',
                  ),
                ]
            ))
          ),
          iconTheme: new IconThemeData(color: Colors.black),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: choiceAction,
              itemBuilder: (BuildContext context){
                return Constants.choices.map((String choice){
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice, style: TextStyle(fontWeight: FontWeight.bold),),
                  );
                }).toList();
              },
            ),
          ],
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: Colors.black,
              indicatorWeight: 6.0,
              tabs: <Widget>[
                Tab(
                  child: Container(
                    child: Text(
                      'Top Stories',
                      style: TextStyle(color: Colors.black, fontSize: 16.0, fontFamily: ''),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      'For You',
                      style: TextStyle(color: Colors.black, fontSize: 16.0, fontFamily: ''),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      'Most Popular',
                      style: TextStyle(color: Colors.black, fontSize: 16.0, fontFamily: ''),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      'Politics',
                      style: TextStyle(color: Colors.black, fontSize: 16.0, fontFamily: ''),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      'Sports',
                      style: TextStyle(color: Colors.black, fontSize: 16.0, fontFamily: ''),
                    ),
                  ),
                ),
              ],
            ),
        ),


        drawer: SizedBox(width: 300,
            child: ListView(children: <Widget>[
              Container(
                decoration: BoxDecoration(color: Colors.white),
                child: ListTile(
                  trailing: Icon(Icons.search),
                  leading: Icon(Icons.settings),
                ),
              ),
              Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: ListTile(
                    leading: Icon(
                      Icons.person_pin,
                      size: 60,
                    ),
                  )
              ),
              Container(
                decoration: BoxDecoration(color: Colors.white),
                child: ListTile(
                  title: Text(
                    '''Sonali Gupta
 sonali.gupta@decimal.co.in''',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.white),
                child: ListTile(
                  title: Text(
                    "Zoom In",
                    style: TextStyle(fontSize: 15),
                  ),
                  leading: Icon(Icons.zoom_out_map),
                ),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.white),
                child: ListTile(
                  title: Text(
                    "Trending",
                    style: TextStyle(fontSize: 15),
                  ),
                  leading: Icon(Icons.trending_flat),
                ),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.white),
                child: ListTile(
                  title: Text(
                    "Sun",
                    style: TextStyle(fontSize:15),
                  ),
                  leading: Icon(Icons.wb_sunny),
                ),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.white),
                child: ListTile(
                  title: Text(
                    "Wifi",
                    style: TextStyle(fontSize: 15),
                  ),
                  leading: Icon(Icons.wifi),
                ),
              ),
              Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: ListTile()
              ),
              Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: ListTile()
              ),
              Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: ListTile()
              ),
              Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: ListTile()
              ),
              Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: ListTile()
              )
            ])),
        body: TabBarView(
          children: <Widget>[
            Container(
                child: ListView.builder(
                  itemCount: _newsList.length,
                  itemBuilder: (context, index) => ListItem(_newsList[index]),

                )),
            Container(
                child: ListView.builder(
                  itemCount: _newsList.length,
                  itemBuilder: (context, index) => ListItem(_newsList[index]),
                )),
            Container(
                child: ListView.builder(
                  itemCount: _newsList.length,
                  itemBuilder: (context, index) => ListItem(_newsList[index]),
                )),
            Container(
                child: ListView.builder(
                  itemCount: _newsList.length,
                  itemBuilder: (context, index) => ListItem(_newsList[index]),
                )),
            Container(
                child: ListView.builder(
                  itemCount: _newsList.length,
                  itemBuilder: (context, index) => ListItem(_newsList[index]),
                ))//2196f3 //4CAF50
          ],
        ),

        ));
  }

  void choiceAction(String choice) {
    if (choice == Constants.Settings) {
      print('Settings');
    } else if (choice == Constants.Notification) {
      print('Subscribe');
    } else if (choice == Constants.SignOut) {
      print('SignOut');
    }
    else if (choice == Constants.sendAppFeedback) {
      print('sendAppFeedback');
    }
    else if (choice == Constants.Text_Size) {
      print('Text_Size');
    }
    else if (choice == Constants.language) {
      print('language');
    }
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('assets/appimages/a.png');
    Image image = Image(
      image: assetImage,
      width: 200.0,
      height: 100.0,
    );

    return Container(
      child: image,
      margin: EdgeInsets.all(10),
    );
  }
}
