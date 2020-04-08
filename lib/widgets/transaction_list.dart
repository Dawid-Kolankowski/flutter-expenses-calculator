import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_card.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return TransactionCard(
            amount: transactions[index].amount,
            date: transactions[index].date,
            title: transactions[index].title,
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
