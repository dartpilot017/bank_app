import 'package:bank_flutter/constants/global_size.dart';
import 'package:bank_flutter/models/transaction-model.dart';
import 'package:bank_flutter/transaction-service.dart';
import 'package:flutter/material.dart';

import '../utilities/themeStyles.dart';
import '../widgets/transactionCard.dart';

class UserRecentTransactionPage extends StatefulWidget {
  final bool showTexts;
  final bool showAppBar;
  final ScrollPhysics scroll;
  final int numberOfTransactions;
  final double top;
  final double bottom;
  final double left;
  final double right;
  final String? phoneNumber;
  final List<Transaction> transactions;

  const UserRecentTransactionPage({
    super.key,
    this.showTexts = false,
    this.showAppBar = false,
    this.numberOfTransactions = 0,
    this.scroll = const AlwaysScrollableScrollPhysics(),
    this.top = 0,
    this.bottom = 0,
    this.left = 0,
    this.right = 0,
    this.phoneNumber = '',
    required this.transactions,
  });

  @override
  State<UserRecentTransactionPage> createState() =>
      _UserRecentTransactionPageState();
}

class _UserRecentTransactionPageState extends State<UserRecentTransactionPage> {
  late List<Transaction> transactions = [];

  @override
  void initState() {
    super.initState();
    _fetchTransactions();
  }

  Future<void> _fetchTransactions() async {
    try {
      final fetchedTransactions =
          await TransactionService.fetchUserTransaction(widget.phoneNumber!);
      setState(() {
        transactions = fetchedTransactions;
      });
    } catch (e) {
      print('Error fetching transactions: $e');
      // Handle the error as needed
    }
  }

  @override
  Widget build(BuildContext context) {
    int itemCount = widget.numberOfTransactions == 0
        ? transactions.length
        : widget.numberOfTransactions;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // centerTitle: true,
          title: Text(
            'Recent transactions for ${widget.phoneNumber} ',
            style: ThemeStyles.otherDetailsPrimary,
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: widget.scroll,
                  itemCount: itemCount,
                  itemBuilder: (context, index) {
                    if (index < transactions.length) {
                      return TransactionCard(
                        transaction: transactions[index],
                      );
                    } else {
                      return Center(
                        child: Text('Failed to load transaction list'),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
