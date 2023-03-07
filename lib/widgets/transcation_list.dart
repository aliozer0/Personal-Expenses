import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import "package:intl/intl.dart";

class TranscationList extends StatefulWidget {
  @override
  State<TranscationList> createState() => _TranscationListState();
}

class _TranscationListState extends State<TranscationList> {
  final List<Transaction> _userTranscation = [
    Transaction(
      id: "t1",
      title: "New Shoes",
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
        id: 't2',
        title: 'Weekly Groceries',
        amount: 16.53,
        date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _userTranscation.map((tx) {
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
