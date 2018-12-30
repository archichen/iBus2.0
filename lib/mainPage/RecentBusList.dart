import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ibus2/Entites/bus_info.dart';
import 'package:ibus2/Redux/State.dart';
import 'package:redux/redux.dart';

class RecentBusList extends StatelessWidget {
  Store<IBusState> store;

  RecentBusList(this.store);

  String replaceText(str) {
    switch(str) {
      case "实时数据失联":
        return "停运";
      case "尚未驶离首发站":
        return "未发车";
    }
    return str;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new StoreProvider<IBusState> (
        store: store,
        child: new StoreConnector<IBusState, List<Data>>(
        builder: (context, source) {
          return new ListView.builder(
                  itemCount: source.length >= 3 ? 3: source.length,
                  itemBuilder: (context, index)
                  {
                    return new Container(
                      margin: new EdgeInsets.only(bottom: 20.0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text(source[index].busName, style: new TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),),
                              new Text(source[index].terminal, style: new TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),)
                            ],
                          ),
                          new Column(
                            children: <Widget>[
                              new Text(replaceText(source[index].status), style: new TextStyle(fontSize: 18, color: Colors.white),)
                            ],
                          )
                        ],
                      ),
                    );
                  }
              );
        },
        converter: (store) => store.state.busInfo.data
    )
    );
  }

}