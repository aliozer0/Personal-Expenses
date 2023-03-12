import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:personel_expenses/models/transaction.dart';
import 'package:intl/intl.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransacitons;

  Chart(this.recentTransacitons);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;
      for (var i = 0; i < recentTransacitons.length; i++) {
        if (recentTransacitons[i].date.day == weekDay.day &&
            recentTransacitons[i].date.month == weekDay.month &&
            recentTransacitons[i].date.year == weekDay.year) {
          totalSum += recentTransacitons[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    });
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransactionValues.map((data) {
          return ChartBar(
            data['day'] as String,
            data['amount'] as double,
            totalSpending == 0.0
                ? 0.0
                : (data['amount'] as double) / totalSpending,
          );
        }).toList(),
      ),
    );
  }
}
