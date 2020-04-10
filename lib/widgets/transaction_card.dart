import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final String title;
  final DateTime date;
  final double amount;
  final String id;
  final Function deleteTransaction;

  TransactionCard(
      {this.title, this.date, this.amount, this.id, this.deleteTransaction});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      elevation: 5,
      child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: Padding(
              padding: EdgeInsets.all(6),
              child: FittedBox(
                child: Text(
                  amount.toStringAsFixed(2),
                ),
              ),
            ),
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.title,
          ),
          subtitle: Text(
            DateFormat.yMMMd().format(date),
          ),
          trailing: MediaQuery.of(context).size.width > 700
              ? FlatButton.icon(
                textColor: Theme.of(context).errorColor,
               
                  onPressed: () => deleteTransaction(id),
                  icon: Icon(Icons.delete),
                  label: Text('Delete'),
                )
              : IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => deleteTransaction(id),
                  color: Theme.of(context).errorColor,
                )),
    );

    // return Card(
    //   child: Row(
    //     children: <Widget>[
    //       Container(
    //         margin: EdgeInsets.symmetric(
    //           vertical: 10,
    //           horizontal: 15,
    //         ),
    //         decoration: BoxDecoration(
    //           border: Border.all(
    //             color: Theme.of(context).primaryColor,
    //             width: 2,
    //           ),
    //         ),
    //         padding: EdgeInsets.all(10),
    //         child: Text(
    //           amount.toStringAsFixed(2),
    //           style: TextStyle(
    //             fontWeight: FontWeight.bold,
    //             fontSize: 20,
    //           ),
    //         ),
    //       ),
    //       Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: <Widget>[
    //           Text(
    //             title,
    //             style: Theme.of(context).textTheme.title,
    //           ),
    //           Text(
    //             DateFormat.yMMMd().format(date),
    //             style: TextStyle(color: Colors.grey),
    //           )
    //         ],
    //       )
    //     ],
    //   ),
    // );
  }
}
