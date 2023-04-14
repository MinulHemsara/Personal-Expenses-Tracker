import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../widgets/transaction_item.dart';

class TrasnsactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTX;

  TrasnsactionList(this.transaction, this.deleteTX);

  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'No transaction added yet',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 20),
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            );
          })
        : ListView(
            children: transaction
                .map((tx) => Transactionitem(
                      key: ValueKey(tx.id),
                      transaction: tx,
                      deleteTX: deleteTX,
                    ))
                .toList(),
          );
  }
}
