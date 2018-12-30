import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ibus2/Entites/bus_info.dart' as BI;
import 'package:ibus2/LinesPage/LinesPage.dart';
import 'package:ibus2/Redux/State.dart';
import 'package:ibus2/mainPage/MainPage.dart';
import 'package:redux/redux.dart';

class StationLinePage extends StatefulWidget {
  Store<IBusState> store;
  StationLinePage(this.store);
  StationLinePageState createState() => new StationLinePageState(store);
}

class StationLinePageState extends State {
  Store<IBusState> store;
  StationLinePageState(this.store);

  void navigateToLinesPage(String str) {
    Navigator.push(context, new MaterialPageRoute(
        builder: (context) {
          return new LinesPage(str);
        }
    ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new StoreProvider<IBusState>(
      store: store,
      child: new GestureDetector(
          onHorizontalDragEnd: (d) {
            if (d.primaryVelocity > 0) Navigator.pop(context);
          },
          child: new Scaffold(
            backgroundColor: new Color(0xFF111111),
            body: new Container(
              child: new Column(
                children: <Widget>[
                  // Head bar
                  new Container(
                      margin: new EdgeInsets.only(top: 40),
                      padding: new EdgeInsets.only(left: 12, right: 12),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                            "Line",
                            style: new TextStyle(
                                fontSize: 48, color: Colors.white),
                          ),
                          new StoreConnector<IBusState, String>(
                              builder: (context, stationName) {
                                return new Text(
                                  stationName,
                                  style: new TextStyle(
                                      fontSize: 20, color: Colors.grey),
                                );
                              },
                              converter: (store) => store.state.stationName)
                        ],
                      )),
                  new Container(
                    margin: new EdgeInsets.only(top: 10.0),
                    padding: new EdgeInsets.only(left: 10, right: 10),
                    width: 304,
                    height: 50,
                    decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(50),
                        color: Colors.black),
                    child: new TextField(
                      onSubmitted: (str) {
                        navigateToLinesPage(str);
                      },
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
                  new Row(
                    children: <Widget>[
                      new Container(
                        margin:
                            new EdgeInsets.only(top: 20, bottom: 20, left: 12),
                        child: new Text(
                          "List",
                          style: new TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                  new Expanded(
                    flex: 1,
                    child: new StoreConnector<IBusState, List<BI.Data>>(
                        builder: (context, dataList) {
                          return new ListView.builder(
                              itemCount: dataList.length,
                              itemBuilder: (context, index) {
                                return new GestureDetector(
                                  onTap: () {
                                    navigateToLinesPage(dataList[index].busName);
                                  },
                                  child: new Container(
                                    margin: new EdgeInsets.only(left: 36, right: 36, bottom: 25),
                                    child: new Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        new Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            new Container(
                                              width: 100,
                                              child: new Text(
                                                dataList[index].busName,
                                                maxLines: 1,
                                                style: new TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 28,
                                                    fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            new Text(
                                              dataList[index].terminal,
                                              style: new TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        new Text(
                                          dataList[index].status == "实时数据失联" ? "停运": dataList[index].status,
                                          style: new TextStyle(
                                              fontSize: 28,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        converter: (store) => store.state.busInfo.data),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
