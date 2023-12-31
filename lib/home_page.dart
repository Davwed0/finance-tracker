import 'package:flutter/material.dart';
import 'transaction_editor.dart';
import 'transaction_list.dart';
import 'balance.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TransactionEditor()));
          },
          child: const Icon(Icons.add)),
      body: SafeArea(child: ListView(children: [Balance(), TransactionList()])),
    );
  }
}
