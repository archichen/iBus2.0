import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ibus2/Redux/State.dart';
import 'package:ibus2/mainPage/Background.dart';
import 'package:ibus2/startPage/StartPage.dart';
import 'package:redux/redux.dart';
import 'package:ibus2/Redux/Reducers.dart';

void main() {
  // Create your store as a final variable in a base Widget. This works better
  // with Hot Reload than creating it directly in the `build` function.
  final store = new Store<IBusState>(appReducer, initialState: new IBusState());

  runApp(
      new IBusApp(
        title: 'IBus',
        store: store,
      )
  );
}

class IBusApp extends StatelessWidget {
  final Store<IBusState> store;
  final String title;

  IBusApp({Key key, this.store, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // The StoreProvider should wrap your MaterialApp or WidgetsApp. This will
    // ensure all routes have access to the store.
    return new StoreProvider<IBusState>(
      // Pass the store to the StoreProvider. Any ancestor `StoreConnector`
      // Widgets will find and use this value as the `Store`.
      store: store,
      child: new MaterialApp(
        title: title,
        home: new StartPage()
      ),
    );
  }
}
