

import 'package:flutter/material.dart';
import './Widget/Transaction_new.dart';
import './Widget/Transaction_list.dart';
import './Widget/Chart.dart';
import './Model/Transaction.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.pink,
        fontFamily: 'PatrickHand',  // by default font family
//        textTheme: ThemeData.light().textTheme.copyWith(
//            headline6 : TextStyle(fontFamily: 'PatrickHand', fontSize:18),
////          title after the version 2014 is deprecated
////        we use headline6 instead of title
//          ),
        appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(fontFamily: 'Shadows', fontSize:20),),


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
  _MyAppState createState() {
    print("create state");
    return _MyAppState();}
}

class _MyAppState extends State<MyApp> {

  final List<Transaction> transactions= [
    Transaction(amount: 100000000.0, date: DateTime.now(),id: DateTime.now().toString(),title: "Grocerry" ),
    Transaction(amount: 50.0, date: DateTime.now(),id: DateTime.now().toString(),title: "hydro" ),
    Transaction(amount: 50.0, date: DateTime.now(),id: DateTime.now().toString(),title: "phone" ),

  ];
  void _deleteTransaction(String id){
    setState(() {
      transactions.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }
  void _addTransaction(String title, double amount,DateTime date ){
    setState(() {
      transactions.add(Transaction(amount: amount, date: date, id: DateTime.now().toString(),title: title ));
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
  List<Transaction> get recentTransaction {
    // we use where to make a new list which some condition , run function to each element in the list if true add to new list false none
//    Iterable<E> where(bool test(E element)) => WhereIterable<E>(this, test); so each iteration they check the element and test if it pass it will be in the return iterable
    return transactions.where((tx) {
//      where accept the function which is condition to accept in the new list
//      date have function after so if is happend after passing date argument
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
//      so we want to get the only the 7 day so subtract duration 7 days
    }
    ).toList();
    // iterable not a list
//    iteralbe is sequential but acess with getter setter
//  list can access by the index
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
                Chart(recentTransaction),
                transactions.length == 0 ? Container(
                  height: 400,
                  width: 300,
                  margin: EdgeInsets.only(top: 10.0),
                  padding: EdgeInsets.only(top: 10.0),
                  child: Column(
                    children: <Widget>[

                      Text("There is no transaction"),
                      SizedBox(height: 10,),
                      Image.asset("assets/image/1.png"),
//                      we can make fit: BoxFit to manipulate the size of the image but make semetime we need to wrap with container because only image does not have the height and weight for the fit
                    ],
                  )

                ) 
                    : Transactionlist(transactions, _deleteTransaction),
//we can check the empty transaction and chart bar
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

