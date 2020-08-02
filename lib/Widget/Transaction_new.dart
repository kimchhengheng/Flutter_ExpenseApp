
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// this is the text field and button that we used for new transaction
//to get input from user we have two way of text field one call it onchange when every keyboard fired it is called another used controller

// if we make newTransaction the problem when we type the text then click the amount it alwasy delete
//the way flutter deal with state and widget is different

// when you declare without initialize the var is null, which is consider false too in boolean of null
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
  DateTime date;



  void _submitData(){
//    we have to handle the empty the textfield
    final enterTitle= _inputtitle.text;
    final enteramount = (_inputamount.text).isEmpty?null:double.parse(_inputamount.text);
//    if we dont put number of parse it throuw an exception
    if (enterTitle.isEmpty || enteramount == null || enteramount<=0 || date == null ){
      return;
    }
    widget.addtx(enterTitle,enteramount, date);
    // we can access the addtx from widget in state class
//    _inputtitle.clear();
//    _inputamount.clear();
//    date = null ;
    Navigator.of(context).pop();
//  pop take out so take the screen out which is modalsheet

  }
  void _chooseDate() {
// show Date picker is buid it widget that will pop the sheet of the date picker we can used async/await or then to handle the answer from the pick
//  then((passing the pick date)) {function we want to do with it}) then only occure when they press so the value can be null if they press cancel or date time object if the choose and press ok

    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime.now())
        .then(
            (pickdate)
            {
              if(pickdate != null){
                setState(() {
                  date = pickdate;
                });
              }

            });
      }






  @override
  Widget build(BuildContext context) {
    return
      SingleChildScrollView(
      // this make the scroable of the child of this but still hide behind the keybard in landscape
//        without the this single child the height of bottom sheet with scrollable outside make it too hight
      child: Container(
        padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom:( MediaQuery.of(context).viewInsets.bottom ) +10 // this make the padding move by the keyboard bottom but still some overflow of container so make it Single child
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
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

            Row(
              children: <Widget>[
                Expanded(child: date == null? Text("No Chosen date"): Text("Chosen Date: ${DateFormat.yMMMd().format(date)}")),
                FlatButton(
                  child: Text("Choose a date: "),
                  onPressed: () {_chooseDate();},
                  textColor: Theme.of(context).primaryColor,
                )
              ],
            ),
            FlatButton(
              child: Text("Add Transaction"),
              textColor: Theme.of(context).primaryColor,
              // annonymous (){} or () => only one body
              onPressed: () {_submitData();}
                // on press pass the argument or create the transaction or get the pointer to change the Transaction_user
                // we can replace the action before the clear



            )
          ],
        ),
      ),
    );
  }
}
