import 'package:flutter/material.dart';
import 'package:ibus2/Entites/line_list.dart';
import 'package:ibus2/LineInfoPage/LineInfoPage.dart';
import 'package:ibus2/configuration.dart';

class LinesPage extends StatefulWidget {
  String keyWord;
  LinesPage(String keyWord) : keyWord = keyWord;
  LinesPageState createState() => new LinesPageState(keyWord);
}

class LinesPageState extends State {
  String keyWord;
  LinesPageState(String keyWord) : keyWord = keyWord;
  LineList lineList = new LineList([]);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init(keyWord);
  }

  void init(String keyword) async {
    LineList l = await Configuration.get_linelist(keyword);
    setState(() {
      lineList = l;
    });
  }

  void navigateToLineInfoPage(String lineID) {
    Navigator.push(context, new MaterialPageRoute(
        builder: (context) {
          return new LineInfoPage(lineID);
        }
    ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: new Color(0xFF111111),
      body: new Stack(
        children: <Widget>[
          new Positioned(
            top: 30,
             left: 5,
              child: new IconButton(icon: new Icon(Icons.arrow_back_ios, color: Colors.white,), 
                  onPressed: () => Navigator.pop(context))
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    margin: new EdgeInsets.only(top: 30.0),
                    padding: new EdgeInsets.only(left: 10, right: 10),
                    width: 304,
                    height: 50,
                    decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(50),
                        color: Colors.black),
                    child: new TextField(
                      onSubmitted: (str) => init(str),
                      cursorColor: Colors.transparent,
                      textAlign: TextAlign.center,
                      style: new TextStyle(color: Colors.white, fontSize: 20),
                      decoration: new InputDecoration(
                        hintText: "线路番号",
                        hintStyle: new TextStyle(
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    margin:
                    new EdgeInsets.only(top: 20, bottom: 20, left: 12),
                    child: new Text(
                      "Lines",
                      style: new TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  )
                ],
              ),
              new Expanded(
                  child: new Container(
                    child: new ListView.builder(
                      itemCount: lineList.data.length,
                        itemBuilder: (context, index) {
                          return new GestureDetector(
                            onTap: () {
                              this.navigateToLineInfoPage(this.lineList.data[index].lineID);
                            },
                            child: new Container(
                              margin: new EdgeInsets.only(bottom: 30),
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Column(
                                    children: <Widget>[
                                      new Text(this.lineList.data[index].lineName
                                        ,style: new TextStyle(
                                            color: Colors.white,
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold
                                        ),),
                                      new Text(this.lineList.data[index].lineDire ,style: new TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold
                                      ),)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                    ),
                  )
              )
            ],
          ),
        ],
      )
    );
  }
}
