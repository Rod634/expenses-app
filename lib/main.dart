import 'package:flutter/material.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<Transaction> transactions = [
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Expenses planner"),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              child: Card(
                elevation: 5,
                color: Colors.blue,
                child: Text('Chart'),
              ),
            ),
            Column(
                children: transactions.map((tx) {
              return Card(
                child: Text(tx.title),
              );
            }).toList())
          ],
        ),
      ),
    );
  }
}
