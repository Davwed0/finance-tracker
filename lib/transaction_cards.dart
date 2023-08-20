import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard(
      {super.key,
      required this.title,
      required this.amount,
      required this.category,
      required this.date,
      required this.currency,
      required this.onTap,
      required this.isExpense});

  final String title;
  final double amount;
  final String category;
  final DateTime date;
  final String currency;
  final VoidCallback? onTap;
  final bool isExpense;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            ListTile(
              horizontalTitleGap: 24.0,
              leading: Container(width: 40, height: 40, color: Colors.red),
              title: Text(title, style: Theme.of(context).textTheme.bodyLarge),
              subtitle:
                  Text(category, style: Theme.of(context).textTheme.bodySmall),
              trailing: Text(
                '${isExpense ? "" : "-"}\$$amount $currency',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Divider(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
              height: 1,
              thickness: 1.5,
              indent: 76,
              endIndent: 16,
            ),
          ],
        ),
      ),
    );
  }
}
