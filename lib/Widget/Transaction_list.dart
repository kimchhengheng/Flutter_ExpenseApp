import 'package:flutter/material.dart';
import '../Model/Transaction.dart';
import 'package:intl/intl.dart';
// just the blue print for display  transaction list, we dont handle the add and delete
class Transactionlist extends StatelessWidget {
  final List<Transaction> transactions;

  const Transactionlist( this.transactions) ;

// column and row is not scrol able so we could at single child scrolable
//  we can also implement by ListView instead of row or column
//  list view have infinite height it is scrollable
//  if we dont have container of child list view flutter does not the height since the height is infinite, if we add container one of the child is is define it affect the parent list view
//  ListView(children [] ) like single child scroll view , bad memory , load all even not display on the screen
//  vs ListView.builder() only load what visible, good for memory show the visible the part not on the screen would be not render,
  @override
  Widget build(BuildContext context) {
    // we can make scrollable by wrap the column with SingleChildScrollView and specify the height of the screen
//        we can also use the ListView wrape the column but need container outside because flutter cannot define the height if not container
    return Container(
      height: 400,// without height flutter canot diplay
      child: ListView.builder(
        itemBuilder: (ctx,index) {
//        this item builder : flutter gonna call this function automatically depend on the number itemcount that we tell iteration by the index can return the widget
//        so we can used as the loop to generate the list which is scrollable for our transaction list
          return Card(child: Row(children: <Widget>[
                Container(
                  child: Text("\$ ${transactions[index].amount.toStringAsFixed(2)}"),
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColorDark, width: 2),
                      borderRadius: BorderRadius.circular(10)),
                ),
                Column(children: <Widget>[
                  Container(
                    child: Text("${transactions[index].title}"),
                    padding: EdgeInsets.all(2.5),
                    margin: EdgeInsets.all(2.5),
                  ),
                  Container(
                    child: Text(DateFormat.yMMMM().format(transactions[index].date)),
                    padding: EdgeInsets.all(2.5),
                    margin: EdgeInsets.all(2.5),
                  ),
                ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,)
              ])
              );
            },

          // flutter will call this function and passing the context and index of the item that we render
        itemCount: transactions.length,// how many item will be build so it is the lenght of transactions

      )
      );
    }
}
