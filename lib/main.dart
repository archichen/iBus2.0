import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ibus2/Entites/bus_info.dart';
import 'package:ibus2/Redux/State.dart';
import 'package:ibus2/mainPage/Background.dart';
import 'package:ibus2/mainPage/MainPage.dart';
import 'package:ibus2/startPage/StartPage.dart';
import 'package:redux/redux.dart';
import 'package:ibus2/Redux/Reducers.dart';

void main() {
  // Create your store as a final variable in a base Widget. This works better
  // with Hot Reload than creating it directly in the `build` function.
  final store = new Store<IBusState>(appReducer, initialState: new IBusState(
      stationName: "测试站点",
    busInfo: new BusInfo([new Data("测试路线", "还有1站", "下一站幸福")])
  ));

  runApp(
      new IBusApp(
        title: 'IBus',
        store: store,
        routes: <String, WidgetBuilder> {
          '/mainPage': (BuildContext context) => new MainPage()
        },
      )
  );
}

class IBusApp extends StatelessWidget {
  final Store<IBusState> store;
  final String title;
  final Map<String, WidgetBuilder> routes;

  IBusApp({Key key, this.store, this.title, this.routes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // The StoreProvider should wrap your MaterialApp or WidgetsApp. This will
    // ensure all routes have access to the store.
    return new StoreProvider<IBusState>(
      // Pass the store to the StoreProvider. Any ancestor `StoreConnector`
      // Widgets will find and use this value as the `Store`.
      store: store,
      child: new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        home: new StartPage(
          store: store,
        ),
        routes: routes,
      ),
    );
  }
}
