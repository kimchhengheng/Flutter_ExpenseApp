import 'package:flutter/material.dart';
import '../Model/Transaction.dart';
import 'package:intl/intl.dart';
// just the blue print for display  transaction list, we dont handle the add and delete
class Transactionlist extends StatelessWidget {
  final List<Transaction> transactions= [
  Transaction(amount: 50, date: DateTime.now(), id: "1", title: "Grocerry"),
  Transaction(amount: 45, date: DateTime.now(), id: "1", title: "Utility")
    ];
  Transactionlist();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        ...transactions.map((tx) {
          return Card(child: Row(children: <Widget>[
            Container(
              child: Text("\$ ${tx.amount}"),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.purpleAccent, width: 2),
                  borderRadius: BorderRadius.circular(10)),
            ),
            Column(children: <Widget>[
              Container(
                  child: Text("${tx.title}"),
                  padding: EdgeInsets.all(2.5),
                  margin: EdgeInsets.all(2.5),
              ),
              Container(
                  child: Text(DateFormat.yMMMM().format(tx.date)),
                  padding: EdgeInsets.all(2.5),
                  margin: EdgeInsets.all(2.5),
              ),
            ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,)
                  ],)
          );
                  }
                ) //map
              ],

            ),


    );
  }
}
