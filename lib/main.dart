import 'package:flutter/material.dart';

import 'model/transaction.dart';
import '/widgets/new_transaction.dart';
import 'widgets/transaction_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transaction> _transactions = [
    Transaction(
      id: 't1',
      title: 'Nike air jordan',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Umbrella',
      amount: 49.99,
      date: DateTime.now(),
    )
  ];

  void _addNewTransaction(String title, double amount) {
    var transaction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(transaction);
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(addNewTransaction: _addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Expenses planner"),
          actions: [
            Builder(builder: (context) {
              return IconButton(
                onPressed: () {
                  _startAddNewTransaction(context);
                },
                icon: Icon(Icons.add),
              );
            })
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                child: Card(
                  elevation: 5,
                  color: Colors.blue,
                  child: Text('Chart'),
                ),
              ),
              NewTransaction(addNewTransaction: _addNewTransaction),
              TransactionList(transactions: _transactions),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              _startAddNewTransaction(context);
            },
          );
        }),
      ),
    );
  }
}
