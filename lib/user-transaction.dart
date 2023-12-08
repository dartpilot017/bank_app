import 'package:bank_flutter/components/recentTransactions.dart';
import 'package:bank_flutter/constants/global_size.dart';
import 'package:bank_flutter/models/transaction-model.dart';
import 'package:bank_flutter/transaction-screen.dart';
import 'package:bank_flutter/transaction-service.dart';
import 'package:bank_flutter/user-transaction-page.dart';
import 'package:flutter/material.dart';

import '../utilities/themeStyles.dart';
import '../widgets/transactionCard.dart';

class UserRecentTransaction extends StatefulWidget {
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

  const UserRecentTransaction({
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
  State<UserRecentTransaction> createState() => _UserRecentTransactionState();
}

class _UserRecentTransactionState extends State<UserRecentTransaction> {
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

    return Expanded(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: screenWidth * 0.048,
              right: screenWidth * 0.048,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: widget.showTexts,
                  child: Text('Recent Transactions',
                      style: ThemeStyles.primaryTitle),
                ),
                Visibility(
                  visible: widget.showAppBar,
                  child: Center(
                    child: Text(
                      'All recent transactions',
                      style: ThemeStyles.primaryTitle,
                    ),
                  ),
                ),
                Visibility(
                  visible: widget.showTexts,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserRecentTransactionPage(
                            showAppBar: true,
                            showTexts: false,
                            transactions: [],
                            phoneNumber: '${widget.phoneNumber}',
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'See All',
                      style: ThemeStyles.seeAll,
                    ),
                  ),
                ),
              ],
            ),
          ),
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
    );
  }
}
