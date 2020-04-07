import 'package:flutter/material.dart';
import './models/transaction.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';

void main() => runApp(MaterialApp(
  title: "Money manager",
    theme: ThemeData(
      primarySwatch: Colors.cyan,
      accentColor: Colors.greenAccent
    ),
    home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transaction> _transactionLIst = [
    Transaction(
        id: "my id", title: "title", amount: 20.0, date: DateTime.now()),
    Transaction(id: "my id", title: "title", amount: 20.0, date: DateTime.now())
  ];

  void _addNewTransaction(String title, double amount) {
    Transaction newTransaction = Transaction(
        title: title,
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _transactionLIst.add(newTransaction);
    });
  }

  void startAddingNewTransaction(BuildContext buildContext) {
    showModalBottomSheet(
        context: context,
        //(_) this is context that i am getting but not using
        builder: (_) {
          return GestureDetector(
            onTap: (){},
            child:  NewTransaction(_addNewTransaction),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demooo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  startAddingNewTransaction(context);
                });
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Card(elevation: 8, child: Text("adas")),
                Container(
                  margin: EdgeInsets.all(10),
                  child: TransactionList(_transactionLIst),
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              startAddingNewTransaction(context);
            });
          },
          child: new Icon(Icons.add),
        ),
      ),
    );
  }
}
