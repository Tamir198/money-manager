import 'package:flutter/material.dart';
import 'package:moneymanager/widgets/chart.dart';
import './models/transaction.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';

void main() => runApp(MaterialApp(
    title: "Money manager",
    theme: ThemeData(
    buttonTheme: ButtonThemeData(buttonColor: Colors.deepPurple,)
      //textTheme: Colors.purple, accentColor: Colors.amber,
    ),
    home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transaction> _transactionLIst = [
    // Transaction(id: "my id", title: "title", amount: 20.0, date: DateTime.now()),
    // Transaction(id: "my id", title: "title", amount: 20.0, date: DateTime.now())
  ];

  List<Transaction> get _recentTransactions {
    return _transactionLIst.where((transaction) {
      //only transaction that are maximum week old returned here
      return transaction.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }


  void _addNewTransaction(String title, double amount,DateTime chosenDate) {
    Transaction newTransaction = Transaction(
        title: title,
        amount: amount,
        date: chosenDate,
        id: DateTime.now().toString()
        );
    setState(() {
      _transactionLIst.add(newTransaction);
    });
  }

  void _deleteTransaction(String id){
    setState(() {
      _transactionLIst.retainWhere((transaction) => transaction.id == id);
    });

  }

  void startAddingNewTransaction(BuildContext buildContext) {
    showModalBottomSheet(
        context: context,
        //(_) this is context that i am getting but not using
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demooo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Money manager'),
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
                Chart(recentTransactions: _recentTransactions,),
                Container(
                  margin: EdgeInsets.all(10),
                  child: TransactionList(_transactionLIst,_deleteTransaction),
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
