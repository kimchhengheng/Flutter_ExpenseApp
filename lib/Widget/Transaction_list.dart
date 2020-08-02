import 'package:flutter/material.dart';
import '../Model/Transaction.dart';
import 'package:intl/intl.dart';
// just the blue print for display  transaction list, we dont handle the add and delete
class Transactionlist extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deletetx;
  const Transactionlist( this.transactions, this.deletetx) ;

// column and row is not scrol able so we could at single child scrolable
//  we can also implement by ListView instead of row or column
//  list view have infinite height it is scrollable
//  if we dont have container of child list view flutter does not the height since the height is infinite, if we add container one of the child is is define it affect the parent list view
//  ListView(children [] ) like single child scroll view , bad memory , load all even not display on the screen
//  vs ListView.builder() only load what visible, good for memory show the visible the part not on the screen would be not render,
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w =  MediaQuery.of(context).size.width;

    // we can make scrollable by wrap the column with SingleChildScrollView and specify the height of the screen
//        we can also use the ListView wrape the column but need container outside because flutter cannot define the height if not container
    return ListView.builder(
    //        the size of the screen is dynamic so we calculate it dynamic MediaQuery automatically call build when it change the value, but we need app bar so i call it in the main
      // without height flutter canot diplay
        itemBuilder: (ctx,index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                    padding: EdgeInsets.all(5),
                    child: FittedBox(child: Text("\$ ${transactions[index].amount.toStringAsFixed(2)}" ))) ,
              ),
              title:  Text("${transactions[index].title}" ,),
              subtitle: Text(DateFormat.yMMMd().format(transactions[index].date)),
              trailing: Row(
                  mainAxisSize: MainAxisSize.min, // without it row take the all the available spaace
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(icon: Icon(Icons.delete_outline, color: Theme.of(context).primaryColorDark,), onPressed: () {deletetx(transactions[index].id);} , ),
                  h>w? Text("") : Text("Delete", style: TextStyle(color: Theme.of(context).primaryColorDark),)
              ],)
            ),
          );
        },
        itemCount: transactions.length,// how many item will be build so it is the lenght of transactions
          );
// flutter will call this function and passing the context and index of the item that we render

//        this item builder : flutter gonna call this function automatically depend on the number itemcount that we tell iteration by the index can return the widget
//        so we can used as the loop to generate the list which is scrollable for our transaction list
//          return Card(child: Row(children: <Widget>[
//
//                Container(
//                  child: Text("\$ ${transactions[index].amount.toStringAsFixed(2)}" ),
////                  style: Theme.of(context).textTheme.bodyText1, i dont know why when define one the other child cannot find the default which i include alredy
//                  // instead of using textstyle every where we make theme so it easy to change , in the textThemee we access like a key title
//                  margin: EdgeInsets.all(10),
//                  padding: EdgeInsets.all(10),
//                  decoration: BoxDecoration(
//                      border: Border.all(color: Theme.of(context).primaryColorDark, width: 2),
//                      borderRadius: BorderRadius.circular(10)),
//                ),
//                Column(children: <Widget>[
//                  Container(
//                    child: Text("${transactions[index].title}" ,),
//                    padding: EdgeInsets.all(2.5),
//                    margin: EdgeInsets.all(2.5),
//                  ),
//                  Container(
//                    child: Text(DateFormat.yMMMd().format(transactions[index].date)),
//                    padding: EdgeInsets.all(2.5),
//                    margin: EdgeInsets.all(2.5),
//                  ),
//                ],
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  crossAxisAlignment: CrossAxisAlignment.start,)
//              ])
//              );





    }
}
