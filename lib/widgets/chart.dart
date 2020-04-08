import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moneymanager/models/transaction.dart';
import 'package:moneymanager/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart({this.recentTransactions});

  List<Map<String, Object>> get allTransactions {
    return List.generate(7, (index) {
      //subtract index times day from current day
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totalSum = 0.0;
      for (int i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      //return map to the generate method
      return {'day': DateFormat.E().format(weekDay).substring(0,1),
        'amount': totalSum};
    }).reversed.toList();
  }

  //in flutter you can change list to int or double for example
  double get getTotalWeekSpending{
    return allTransactions.fold(0.0,(sum,item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all((10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: allTransactions.map((data){
            return  Flexible(
              fit: FlexFit.tight,
              child: ChartBar(data['day'],
                  data['amount'],
                  getTotalWeekSpending == 0.0 ? 0.0 :(data['amount'] as double) /getTotalWeekSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
