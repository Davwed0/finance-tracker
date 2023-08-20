import 'package:finance_tracker/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'home_page.dart';
import 'theme.dart';

late Box box;
void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter<Transaction>(TransactionAdapter());
  box = await Hive.openBox<Transaction>('transactions');
  box.add(Transaction(
    title: 'Salary',
    amount: 10000,
    category: 'Income',
    date: DateTime.now(),
    currency: 'HKD',
    isExpense: false,
  ));

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance Tracker',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: "IBM_Plex_Mono",
        colorScheme: colorScheme,
        textTheme: textTheme,
      ),
      home: const HomePage(),
    );
  }
}
