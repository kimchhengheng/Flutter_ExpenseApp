

import 'package:flutter/material.dart';
import './Widget/Transaction_new.dart';
import './Widget/Transaction_list.dart';
import './Model/Transaction.dart';
void main() {
  runApp(MaterialApp(
    home: MyApp(),
    theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.pink,
        fontFamily: 'PatrickHand',
        appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(fontFamily: 'Shadows', fontSize:20))
                // assign new text them then base on default text them then copy it with some new overite
        )
        // swatch is shade of color avaible when color only color
      // the advantage of theme is when every we change the other depend on theme would change
    ),
  ));
}
// final store the pointer so we can not assign the new value ot it
//context is object which have a lot the meta data and tree reference to a lot such as theme
class MyApp extends StatefulWidget {
  // not add but start to show the process
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final List<Transaction> transactions= [
    Transaction( "Grocery",50.0),
    Transaction( "Utility",40.0),
    Transaction( "Hydro",50.0),
//    Transaction( "Internet",40.0),
//    Transaction( "Phone",50.0),
//    Transaction( "Book",25.0),
  ];
  void _addTransaction(String title, double amount){
    setState(() {
      transactions.add(Transaction(title, amount));
    });
  }
  void _startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(
        context: ctx,
        builder: (bctx) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addTransaction),
            behavior: HitTestBehavior.opaque,
          );
    });
// if we have materialApp the context will try to get it from material app error
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
              title: Text("Daily Expense"),
              actions: <Widget>[
                IconButton(icon: Icon(Icons.add_circle_outline),
                onPressed: () { _startAddNewTransaction(context);},

                )
              ],
          ),
          body: Column(
            // we have to add singlechildscrollview to the outside that cover every thing
            // if add at column of transaction list
//          // another way to add the width available to the screen of the container Transaction list to avoid the over widget of the screen


              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("chart "),
                Transactionlist(transactions),

              ],
            ),
          backgroundColor: Theme.of(context).primaryColorLight,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            child : Icon(Icons.add),
            onPressed: () { _startAddNewTransaction(context);},
          ) ,
    );
  }
}

