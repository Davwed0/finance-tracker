import 'package:hive/hive.dart';

part 'transaction_model.g.dart';

@HiveType(typeId: 0)
class Transaction extends HiveObject {
  Transaction({
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
    required this.currency,
    required this.isExpense,
  });

  @HiveField(0)
  final String title;

  @HiveField(1)
  final double amount;

  @HiveField(2)
  final String category;

  @HiveField(3)
  final DateTime date;

  @HiveField(4)
  final String currency;

  @HiveField(5)
  final bool isExpense;
}
