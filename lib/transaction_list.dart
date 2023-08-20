import 'package:finance_tracker/models/transaction_model.dart';
import 'package:finance_tracker/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> openBox() async {
  await Hive.openBox<Transaction>("transactions");
}

class TransactionList extends StatelessWidget {
  const TransactionList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: Border(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
              leading: Text(
                'TRANSACTION HISTORY',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.left,
              ),
              trailing: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              )),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable:
                  Hive.box<Transaction>("transactions").listenable(),
              builder: (context, box, _) {
                return ListView.builder(
                    itemCount: box.values.length,
                    itemBuilder: (context, index) {
                      final transaction = box.getAt(index) as Transaction;
                      return TransactionCard(
                        title: transaction.title,
                        amount: transaction.amount,
                        category: transaction.category,
                        currency: transaction.currency,
                        date: transaction.date,
                        isExpense: transaction.isExpense,
                        onTap: () {},
                      );
                    });
              },
            ),
          )
        ],
      ),
    );
  }
}
