import 'package:finance_tracker/main.dart';
import 'package:finance_tracker/models/transaction_model.dart';
import 'package:finance_tracker/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> openBox() async {
  await Hive.openBox<Transaction>("transactions");
}

class Balance extends StatefulWidget {
  const Balance({
    super.key,
  });

  @override
  State<Balance> createState() => _BalanceState();
}

class _BalanceState extends State<Balance> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: Border(),
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ValueListenableBuilder(
            valueListenable: Hive.box<Transaction>("transactions").listenable(),
            builder: (context, box, _) {
              double balance = 0;
              for (int i = 0; i < box.values.length; i++) {
                final transaction = box.getAt(i) as Transaction;
                if (transaction.isExpense) {
                  balance -= transaction.amount;
                } else {
                  balance += transaction.amount;
                }
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(balance.toString())],
              );
            }),
      ),
    );
  }
}
