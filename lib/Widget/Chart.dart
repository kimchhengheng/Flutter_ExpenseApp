

import 'package:flutter/cupertino.dart';

import '../Model/Transaction.dart';
import './Chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List <Transaction> recentTransaction;
  Chart(this.recentTransaction);
  List<Map<String, Object>> get groupedTransactionValues {
    // we can use for loop to create the list but it is easy with generate(lenght, funciton)
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
//      so we get today then iterated to 7 days before
      double totalamount = 0;
      for (var i = 0; i < recentTransaction.length; i++) {
//        we have to compare each component of the object cannot compare the whole object
        if (recentTransaction[i].date.day == weekday.day &&
            recentTransaction[i].date.month == weekday.month &&
            recentTransaction[i].date.year == weekday.year
        ) {
          totalamount += recentTransaction[i].amount;
        }
      }
//      print(DateFormat.E().format(weekday));
//      print(totalamount);
      return {
        "day": DateFormat.E().format(weekday).substring(0,1),
        "amount": totalamount
      };
//      DateFormat is the intl package to change the format of date time object

    }
    ).reversed.toList();
//  without tolist it return iterable object not a list
  }
  double get totalSpending {
    return groupedTransactionValues.fold(0.0 , (sum , item) {
      return sum + item['amount'];
    });
//    fold allow to change the list to another type with the logic of passing function
//  iterable.fold(0, (prev, element) => prev + element)
//    var value = initialValue;
//    for (E element in this) {
//      value = combine(value, element);
//    }
//    return value;
  }

  @override
  Widget build(BuildContext context) {

//    print(groupedTransactionValues);
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: groupedTransactionValues.map((data) {
            return Flexible(
//            flex: would be like the percent of this number compare to the total of each Flexible child
                fit: FlexFit.tight,
                child: ChartBar(
                    data['day'],
                    data['amount'],
                    totalSpending == 0? 0.0 : (data['amount'] as double)/totalSpending));
//          to avoid error when the transaction is empty so total spending is 0 then divide by it is undefine throw error
          }).toList(),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }
}
