import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}
class _NewTransactionState extends State<NewTransaction> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitListItem(){
    final String enteredTitle = _titleController.text;
    final double enteredAmount =  double.parse(_amountController.text);
    //some input is empty - stop function here
    if(enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null){
      return;
    }
    widget.addTransaction(enteredTitle,enteredAmount,_selectedDate);
    //close bottom sheet after adding new transaction
    Navigator.of(context).pop();
  }

  void _popDatePicker(){
    showDatePicker(
        context: context,
        initialDate: DateTime.now().add(Duration(hours: 1)),
        firstDate: DateTime(2019),
        lastDate: DateTime(2500)).then((pickedDate){
          if (pickedDate == null) return;
          setState(() {
            _selectedDate = pickedDate;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: "Title"),
            controller: _titleController,
            onSubmitted: (_) => _submitListItem(),
          ),
          TextField(
            //keyboardType: TextInputType.number is shorter but will not 100% work on ios
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(labelText: "amount"),
            controller: _amountController,
            //"(_)" Is here because I must accept argument (flutter works that way) but i don`t use it
            onSubmitted: (_) => _submitListItem(),
          ),
          Container(
            height: 70,
            child: Row(children: <Widget>[
              
              Expanded(child: Text(_selectedDate == null ? 'No date chosen!' : "Picked date  " + DateFormat.yMd().format(_selectedDate))),
              FlatButton(
                onPressed: _popDatePicker,
                textColor: Theme.of(context).primaryColor,
                  child: Text('Choose date',style: TextStyle(fontWeight: FontWeight.bold,),
                  ),
              )
            ],),
          ),
          RaisedButton(
            onPressed:_submitListItem,
            child: Text("Add transaction"),
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
          )
        ],
      ),
    );
  }
}
