import 'package:flutter/material.dart';
import 'transaction_cards.dart';
import 'theme.dart';
import 'dart:math';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance Tracker',
      theme: ThemeData(
        colorScheme: colorScheme,
        fontFamily: "IBM_Plex_Mono",
        useMaterial3: true,
        textTheme: textTheme,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> transactions = List.generate(
    20,
    (index) => {
      'title': 'TRANSACTION $index',
      'amount': (Random().nextDouble() * 100).round(),
      'category': 'CATEGORY $index',
      'currency': 'HKD',
      'date': DateTime.now(),
      'isExpense': Random().nextBool() ? true : false,
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: Card(
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
                      child: ListView.builder(
                        itemCount: transactions.length,
                        itemBuilder: (context, index) {
                          final transaction = transactions[index];
                          return TransactionCard(
                            title: transaction['title'],
                            amount: transaction['amount'],
                            category: transaction['category'],
                            currency: transaction['currency'],
                            date: transaction['date'],
                            isExpense: transaction['isExpense'],
                            onTap: () {},
                          );
                        },
                      ),
                    )
                  ],
                ),
              ))),
    );
  }
}
