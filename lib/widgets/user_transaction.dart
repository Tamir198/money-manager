import 'package:flutter/cupertino.dart';
import 'package:moneymanager/models/transaction.dart';
import 'package:moneymanager/widgets/transaction_list.dart';

import 'new_transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {


  final List<Transaction> _transaction = [
    Transaction(id: "my id", title: "title", amount: 20.0, date: DateTime.now()),
    Transaction(id: "my id", title: "title", amount: 20.0, date: DateTime.now())
  ];

  void _addNewTransaction(String title, double amount) {
    Transaction newTransaction = Transaction(
        title: title,
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _transaction.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //_addNewTransaction without () is to pass the pointer to the function and not trigger it immediately)
        NewTransaction(_addNewTransaction),
        TransactionList(_transaction)
      ],
    );
  }
}
