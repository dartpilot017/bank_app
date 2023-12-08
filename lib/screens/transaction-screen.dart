import 'package:bank_flutter/components/recentTransactions.dart';
import 'package:bank_flutter/models/transaction-model.dart';
import 'package:bank_flutter/services/transaction-service.dart';
import 'package:flutter/material.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  late List<Transaction> transactions = [];

  @override
  void initState() {
    super.initState();
    _fetchTransactions();
  }

  Future<void> _fetchTransactions() async {
    try {
      transactions = await TransactionService.fetchTransactions();
      setState(() {});
    } catch (e) {
      print('Error fetching transactions: $e');
      // Handle the error as needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body: RecentTransactions(transactions: transactions),
    );
  }
}