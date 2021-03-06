import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moneymanager/models/transaction.dart';
import 'package:moneymanager/widgets/no_content.dart';

//This is Stateless because the state of the wid
class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTransaction;

  TransactionList(this.transaction, this.deleteTransaction);

  bool isEmpty() {
    return transaction.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      height: mediaQuery.size.height * 0.6,
      child: isEmpty()
          ? NoContent()
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                              child: Text("\$${transaction[index].amount}"))),
                    ),
                    title: Text(
                      transaction[index].title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Theme.of(context).accentColor),
                    ),
                    subtitle: Text(
                      DateFormat("dd/MM/yyyy").format(transaction[index].date),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Theme.of(context).accentColor),
                    ),
                    trailing: mediaQuery.size.width > 400
                        ? FlatButton.icon(
                            label: Text("Delete"),
                            icon: Icon(Icons.delete),
                            textColor: Theme.of(context).errorColor,
                            onPressed: () => deleteTransaction(transaction[index].id))
                        : IconButton(
                            icon: Icon(Icons.delete),
                            color: Theme.of(context).errorColor,
                            onPressed: () =>
                                deleteTransaction(transaction[index].id),
                          ),
                  ),
                );
                /*Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).accentColor,
                            width: 2,
                          )),
                      padding: EdgeInsets.all(16),
                      child: Text(
                        transaction[index].title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Theme.of(context).accentColor),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "${transaction[index].amount.toStringAsFixed(2)}\$",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Theme.of(context).accentColor),
                        ),
                        Text(
                          DateFormat("dd/MM/yyyy").format(transaction[index].date),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Theme.of(context).accentColor),
                        ),
                      ],
                    ),
                  ],
                ),
              );*/
                //return Card(child: Text(transaction.title + transaction.id + (transaction.amount).toString()));
              },
              itemCount: transaction.length,
            ),
    );
  }
}
