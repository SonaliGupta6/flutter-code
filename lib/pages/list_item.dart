import 'package:flutter/material.dart';
import 'package:mtimes/entity/news.dart';

class ListItem extends StatelessWidget {
  final Article article;

  ListItem(this.article);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: <Widget>[
          Container(
            height: 80,
            width: 100,
            child: Image.network(article.urlToImage),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(article.title,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    Text(
                      article.description,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 10),
                    ),
                    /*GestureDetector(
                    onTap: (){
                      print('news taped');
                    },
                  )*/
                  ]),
            ),
          )
        ],
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SecondRoute(
                      article: article,
                    )));
        /*Scaffold
              .of(context)
              .showSnackBar(SnackBar(content: Text(article.description)));*/
      },
    );
  }
}

class SecondRoute extends StatelessWidget {
  final Article article;

  SecondRoute({Key key, @required this.article}) : super(key: key);

  final double _minimumPadding = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            article.title,
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
        body: Form(
            child: Padding(
                padding: EdgeInsets.all(_minimumPadding * 2),
                child: ListView(
                  children: <Widget>[
                    Container(
                      height: 200,
                      width: 300,
                      child: Image.network(article.urlToImage),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: _minimumPadding, bottom: _minimumPadding),
                      child: Text(
                        article.title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: _minimumPadding, bottom: _minimumPadding),
                      child: Text(article.description),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: _minimumPadding),
                      child: Text(article.content),
                    )
                  ],
                ))));
  }
}
