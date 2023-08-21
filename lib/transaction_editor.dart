import 'package:flutter/material.dart';
import 'package:finance_tracker/models/transaction_model.dart';
import 'package:hive/hive.dart';

class TransactionEditor extends StatefulWidget {
  const TransactionEditor({super.key});

  @override
  State<TransactionEditor> createState() => _TransactionEditorState();
}

class _TransactionEditorState extends State<TransactionEditor> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  bool isExpense = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              controller: amountController,
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
            ),
            TextField(
              controller: categoryController,
              decoration: const InputDecoration(
                labelText: 'Category',
              ),
            ),
            DropdownButtonFormField(
              items: [
                DropdownMenuItem(
                  child: Text("Income"),
                  value: false,
                ),
                DropdownMenuItem(
                  child: Text("Expense"),
                  value: true,
                ),
              ],
              onChanged: (value) {
                setState(() {
                  isExpense = value as bool;
                });
              },
              value: isExpense,
              decoration: const InputDecoration(labelText: 'Transaction Type'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Hive.box<Transaction>("transactions").add(Transaction(
                      title: titleController.text,
                      amount: double.parse(amountController.text),
                      category: categoryController.text,
                      date: DateTime.now(),
                      currency: 'HKD',
                      isExpense: false,
                    ));
                    Navigator.pop(context);
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
