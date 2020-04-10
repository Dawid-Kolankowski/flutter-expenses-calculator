import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_card.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;
  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'No Transactions added',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(height: 25),
                Container(
                  height: constraints.maxHeight*0.6,
                  child: Image.asset(
                    './assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return TransactionCard(
                amount: transactions[index].amount,
                date: transactions[index].date,
                title: transactions[index].title,
                id: transactions[index].id,
                deleteTransaction: deleteTransaction,
              );
            },
            itemCount: transactions.length,
          );
  }
}
