import 'package:flutter/material.dart';

// this is the text field and button that we used for new transaction
//to get input from user we have two way of text field one call it onchange when every keyboard fired it is called another used controller

class NewTransaction extends StatelessWidget {
  final _inputtitle= TextEditingController();
  final _inputamount= TextEditingController();
  NewTransaction();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(child: TextField(
          decoration: InputDecoration(
              labelText: 'Title'
          ),
          controller: _inputtitle,
        )
        ),
        Card(child: TextField(
          decoration: InputDecoration(
              labelText: 'Amount'
          ),
          controller: _inputamount,
        )
        ),
        FlatButton(
          child: Text("Add Transaction"),
          onPressed: () {
            // on press pass the argument or create the transaction or get the pointer to change the Transaction_user
           print(_inputtitle.text);
            print(_inputamount.text);
            // we can replace the action before the clear
            _inputtitle.clear();
            _inputamount.clear();

                      },
        )
      ],
    );
  }
}
