import 'package:flutter/material.dart';
import './Transaction_new.dart';
import './TransactionlList.dart';
import '../Model/Transaction.dart';

// this is change of the transaction when is add or delete
class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> transactions= [
  Transaction(amount: 50, date: DateTime.now(), id: "1", title: "Grocerry"),
  Transaction(amount: 45, date: DateTime.now(), id: "1", title: "Utility")
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(),
        Transactionlist(),
      ],
    );
  }
}


//NewTransaction(),
//Transactionlist(),