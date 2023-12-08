import 'package:bank_flutter/account-screen.dart';
import 'package:bank_flutter/components/appbar.dart';
import 'package:bank_flutter/components/recentTransactions.dart';
import 'package:bank_flutter/constants/global_size.dart';
import 'package:bank_flutter/transaction-screen.dart';
import 'package:bank_flutter/user-transaction.dart';
import 'package:bank_flutter/widgets/accountCardInPage.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final Map<String, dynamic> user;
  const HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(
              // left: screenWidth * 0.03,
              // right: screenWidth * 0.03,
              // top: screenWidth * 0.03,
              bottom: screenWidth * 0.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.034,
                    right: screenWidth * 0.034,
                  ),
                  child: Column(
                    children: [
                      Appbar(
                        user: widget.user,
                      ),
                      AccountsCardInPage(
                          accountOwner: '${widget.user['phoneNumber']}',
                          accountType: 'Savings Account',
                          accountBalance: '${widget.user['balance']}',
                          accountNumber: '${widget.user['phoneNumber']}'),
                    ],
                  ),
                ),
                UserRecentTransaction(
                  showTexts: true,
                  numberOfTransactions: 6,
                  phoneNumber: widget.user['phoneNumber'],
                  transactions: [],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
