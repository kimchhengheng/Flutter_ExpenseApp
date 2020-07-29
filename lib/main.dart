
import 'package:flutter/material.dart';
import './Widget/Transaction_User.dart';
void main() {
  runApp(MyApp());
}
// final store the pointer so we can not assign the new value ot it
//
class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
              title: Text("Daily Expense")),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("chart "),
              UserTransaction(),
            ],
          )

    )
    );
  }
}

