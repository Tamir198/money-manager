import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTransaction;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();


  NewTransaction(this.addTransaction);

  void submitListItem(){

    final String enteredTitle = titleController.text;
    final double enteredAmount =  double.parse(amountController.text);
    //some input is empty - stop function here
    if(enteredTitle.isEmpty || enteredAmount <= 0 ){
      return;
    }
    addTransaction(enteredTitle,enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: "Title"),
            controller: titleController,
            onSubmitted: (_) => submitListItem(),
          ),
          TextField(
            //keyboardType: TextInputType.number is shorter but will not 100% work on ios
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(labelText: "amount"),
            controller: amountController,
            //"(_)" Is here because I must accept argument (flutter works that way) but i don`t use it
            onSubmitted: (_) => submitListItem(),
          ),
          FlatButton(
            onPressed:submitListItem,
            child: Text("Add transaction"),
            textColor: Colors.cyan,
          )
        ],
      ),
    );
  }
}
