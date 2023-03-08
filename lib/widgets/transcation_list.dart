import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import "package:intl/intl.dart";

class TranscationList extends StatelessWidget {
  final List<Transaction> transactions;
  TranscationList(this.transactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((tx) {
        return Card(
            child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.purple,
                  width: 2,
                ),
              ),
              padding: EdgeInsets.all(10),
              child: Text(
                '\$${tx.amount}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.purple,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  tx.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  DateFormat().add_yMMMd().format(tx.date),
                  style: TextStyle(color: Colors.grey),
                )
              ],
            )
          ],
        ));
      }).toList(),
    );
  }
}
