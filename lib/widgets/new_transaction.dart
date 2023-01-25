import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction({required this.addNewTransaction});

  final titleController = TextEditingController();
  final ammountController = TextEditingController();
  final Function addNewTransaction;

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
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Ammount'),
                controller: ammountController,
              ),
              TextButton(
                onPressed: () => addNewTransaction(
                  titleController.text,
                  double.parse(ammountController.text),
                ),
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
