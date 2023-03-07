import 'package:flutter/material.dart';

import './widgets/transcation_list.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final titleController = TextEditingController();
  final amounController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text("CHART!"),
                elevation: 5,
              ),
            ),
            Card(
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
                    controller: amounController,
                    // onChanged: (value) {
                    //   amountInput = value;
                    // },
                  ),
                  TextButton(
                    child: Text('Add Transcation'),
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.purple)),
                    onPressed: () {
                      print(titleController.text);
                    },
                  )
                ],
              )),
            ),
            TranscationList()
          ],
        ));
  }
}
