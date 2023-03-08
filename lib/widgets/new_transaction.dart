import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
          child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: titleController,
            // onChanged: (value) {

            // },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amountController,
            // onChanged: (value) {
            //   amountInput = value;
            // },
          ),
          TextButton(
            child: Text('Add Transcation'),
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.purple)),
            onPressed: () {
              addTx(titleController.text, double.parse(amountController.text));
            },
          )
        ],
      )),
    );
  }
}
