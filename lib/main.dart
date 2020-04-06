import 'package:flutter/material.dart';
import 'file:///C:/Users/The%20Vegan/Desktop/FlutterGreat/money-manager/lib/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:moneymanager/widgets/new_transaction.dart';
import 'package:moneymanager/widgets/transaction_list.dart';
import 'package:moneymanager/widgets/user_transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
                   child: UserTransaction(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
