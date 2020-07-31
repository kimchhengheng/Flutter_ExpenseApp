import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  const ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FittedBox(child: Text("\$ ${spendingAmount.toStringAsFixed(2)}")),
        SizedBox(height: 4,),
        // just space like padding margin
        Container(
          height: 60,
          width: 10,
          child: Stack(children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                color: Color.fromRGBO(200, 200, 200, 1),
                borderRadius: BorderRadius.circular(10)
              ),
            ),
//            each bar chart represent the tatal amount of spend so it would be perentage of the bar which is the height ex M 50 T 50 so M height would be 30
            FractionallySizedBox(
              heightFactor: spendingPctOfTotal,
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.circular(10)
                ),
              ),
            )
          ],),
//          use stack for overlapping element
        ),
        SizedBox(height: 4,),
        Text("\$ $label"),
    ],
    );
  }
}
