import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moneymanager/models/transaction.dart';

//This is Stateless because the state of the wid
class TransactionList extends StatelessWidget {
  final List <Transaction> transaction;

  TransactionList(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: transaction.map((transaction) {
        return Card(
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.cyan,
                  width: 2,
                )),
                padding: EdgeInsets.all(16),
                child: Text(
                  transaction.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.cyan),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "${transaction.amount}\$",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  Text(
                    DateFormat("dd/MM/yyyy").format(transaction.date),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        );
        //return Card(child: Text(transaction.title + transaction.id + (transaction.amount).toString()));
      }).toList(),
    );
  }
}