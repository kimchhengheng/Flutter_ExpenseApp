import 'package:flutter/material.dart';

// this is the text field and button that we used for new transaction
//to get input from user we have two way of text field one call it onchange when every keyboard fired it is called another used controller

// if we make newTransaction the problem when we type the text then click the amount it alwasy delete
//the way flutter deal with state and widget is different
class NewTransaction extends StatefulWidget {
  // this is the widget
  final Function addtx;

  NewTransaction(this.addtx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  // this is the state
  final _inputtitle= TextEditingController();

  final _inputamount= TextEditingController();



  void _submitData(){
//    we have to handle the empty the textfield
    final enterTitle= _inputtitle.text;
    final enteramount = (_inputamount.text).isEmpty?null:double.parse(_inputamount.text);
//    if we dont put number of parse it throuw an exception
    if (enterTitle.isEmpty || enteramount == null || enteramount<=0){
      return;
    }
    widget.addtx(enterTitle,enteramount);

    // we can access the addtx from widget in state class
    _inputtitle.clear();
    _inputamount.clear();
    Navigator.of(context).pop();
//  pop take out so take the screen out which is modalsheet

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(child: TextField(
          decoration: InputDecoration(
              labelText: 'Title'
          ),
          controller: _inputtitle,
          onSubmitted: (_) {_submitData();},
        )
        ),
        Card(child: TextField(
          decoration: InputDecoration(
              labelText: 'Amount'
          ),
          controller: _inputamount,
          keyboardType: TextInputType.number,
          onSubmitted: (_) =>_submitData(),
//          onSubmitted need the function(String) so we use _ as we dont use it
        )
        ),
        FlatButton(
          child: Text("Add Transaction"),
          // annonymous (){} or () => only one body
          onPressed: () {_submitData();}
            // on press pass the argument or create the transaction or get the pointer to change the Transaction_user
            // we can replace the action before the clear



        )
      ],
    );
  }
}
