import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTx(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

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
            onSubmitted: (_) => submitData(),
            // onChanged: (value) {

            // },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitData(),
            // onChanged: (value) {
            //   amountInput = value;
            // },
          ),
          TextButton(
            child: Text('Add Transcation'),
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.purple)),
            onPressed: submitData,
          )
        ],
      )),
    );
  }
}
