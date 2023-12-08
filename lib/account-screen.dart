
import 'package:bank_flutter/widgets/accountsCard.dart';
import 'package:flutter/material.dart';

import '../constants/global_size.dart';

class AccountsList extends StatefulWidget {
  final Map<String, dynamic> user;
  const AccountsList({
    super.key,
    required this.user,
  });

  @override
  State<AccountsList> createState() => _AccountsListState();
}

class _AccountsListState extends State<AccountsList> {
  final PageController _pageController = PageController(initialPage: 0);
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              height: screenHeight * 0.297,
              child: Column(
                children: [
                  AccountsCard(
                    accountBalance: '${widget.user['balance']}',
                    accountNumber: '${widget.user['balance']}',
                    accountOwner: '${widget.user['balance']}',
                    accountType: 'Naira',
                  ),
                ],
              )),
        ],
      ),
    );
  }
}