import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTransaction;

  final TextEditingController amountController = TextEditingController();
  final TextEditingController titleController = TextEditingController();

  NewTransaction(this.addTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: "Title"),
            controller: titleController,
          ),
          TextField(
            decoration: InputDecoration(labelText: "amount"),
            controller: amountController,
          ),
          FlatButton(
            onPressed: () {
              addTransaction(titleController.text,
                  double.parse(amountController.text));
            },
            child: Text("Add transaction"),
            textColor: Colors.cyan,
          )
        ],
      ),
    );
  }
}
