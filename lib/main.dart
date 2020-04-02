import 'package:flutter/material.dart';
import 'package:moneymanager/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<Transaction> transaction = [
    Transaction(
        id: "my id", title: "title", amount: 20.0, date: DateTime.now()),
    Transaction(id: "my id", title: "title", amount: 20.0, date: DateTime.now())
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demooo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Mony managment"),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(elevation: 8, child: Text("adas")),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: transaction.map((transaction) {
                  return Card(
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.cyan, width: 2,)
                          ),
                          padding: EdgeInsets.all(16),
                          child: Text(transaction.title,
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.cyan),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(transaction.amount.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),
                            ),
                            Text(transaction.date.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                  //return Card(child: Text(transaction.title + transaction.id + (transaction.amount).toString()));
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
