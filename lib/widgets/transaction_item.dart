import 'dart:math';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../widgets/trasaction_list.dart';

class Transactionitem extends StatefulWidget {
  const Transactionitem({
    Key key,
    @required this.transaction,
    @required this.deleteTX,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTX;

  @override
  State<Transactionitem> createState() => _TransactionitemState();
}

class _TransactionitemState extends State<Transactionitem> {
  Color _bgColor;

  @override
  void initState() {
    const availableColors = [
      Colors.red,
      Colors.black,
      Colors.blue,
      Colors.purple
    ];

    _bgColor = availableColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
              padding: EdgeInsets.all(6),
              child:
                  FittedBox(child: Text('\RS.${widget.transaction.amount}'))),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(DateFormat.yMMMd().format(widget.transaction.date)),
        trailing: MediaQuery.of(context).size.width > 460
            ? TextButton.icon(
                icon: Icon(Icons.delete),
                label: Text('Delete'),
                onPressed: () => widget.deleteTX(widget.transaction.id),
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed: () => widget.deleteTX(widget.transaction.id),
              ),
      ),
    );
  }
}
