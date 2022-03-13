import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';
import 'package:kalkulator/app_state.dart';

import 'home_page.dart';

late Store<AppState> store;
void main() {
  store = Store<AppState>(initialState: AppState());
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Hello World Demo Application',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
