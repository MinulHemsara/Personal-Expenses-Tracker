import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTX;

  NewTransaction(this.addTX);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  DateTime selectedDate;
  final amountController = TextEditingController();

 _NewTransactionState(){
   print("New transaction State");
 }

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didUpdateWidget(covariant NewTransaction oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void submitData() {
    if (amountController.text.isEmpty) {
      return;
    }
    final enterdTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enterdTitle.isEmpty || enteredAmount <= 0 || selectedDate == null) {
      return;
    }

    widget.addTX(enterdTitle, enteredAmount, selectedDate);

    Navigator.of(context).pop();
  }

  void presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2023),
            lastDate: DateTime.now())
        .then((pickDate) {
      if (pickDate == null) {
        return;
      }

      setState(() {
        selectedDate = pickDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
                // onChanged: (val) {
                onSubmitted: (_) => submitData(),
                // },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
                // onChanged: (vals) => amountInput = vals,
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Text(selectedDate == null
                        ? 'No Data Chosen!'
                        : 'Picked Date : ${DateFormat.yMd().format(selectedDate)}'),
                    TextButton(
                      child: Text(
                        'Chosen Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: presentDatePicker,
                    )
                  ],
                ),
              ),
              ElevatedButton(
                  child: Text('Add Transaction'),
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    textStyle: Theme.of(context).textTheme.titleLarge,
                  ),
                  onPressed: submitData)
            ],
          ),
        ),
      ),
    );
    Card(
      color: Colors.red,
      child: Text('LIST OF'),
    );
  }
}
