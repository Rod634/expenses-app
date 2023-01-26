import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction({required this.addNewTransaction});

  final titleController = TextEditingController();
  final ammountController = TextEditingController();
  final Function addNewTransaction;

  void submitTransaction(String val) {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(ammountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) return;

    addNewTransaction(
      enteredTitle,
      enteredAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
                onSubmitted: (_) => submitTransaction(_),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Ammount'),
                controller: ammountController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => submitTransaction(_),
              ),
              TextButton(
                onPressed: () {
                  submitTransaction("");
                },
                child: Text(
                  'Add Transaction',
                  style: TextStyle(
                    color: Colors.purple,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
