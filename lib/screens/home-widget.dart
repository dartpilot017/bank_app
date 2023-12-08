
import 'package:bank_flutter/screens/deposit-screen.dart';
import 'package:bank_flutter/screens/home-screen.dart';
import 'package:bank_flutter/screens/transaction-screen.dart';
import 'package:bank_flutter/screens/withdraw-screen.dart';
import 'package:bank_flutter/utilities/themeColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeWidget extends StatefulWidget {
  final Map<String, dynamic> user;
  const HomeWidget({super.key, required this.user});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int selectedIndex = 0;
  late List<Widget> widgetOptions;

  @override
  void initState() {
    super.initState();
    widgetOptions = [
      HomeScreen(user: widget.user),
      TransactionScreen(),
      DepositScreen(),
      WithdrawScreen()
      // Add other screens as needed
    ];
  }

  void onNavTapped(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.lightGrey,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: ThemeColors.black,
          statusBarIconBrightness: Brightness.light,
        ),
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: onNavTapped,
        elevation: 0,
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.arrow_right_arrow_left_square_fill),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.arrow_left_square_fill),
            label: 'Deposit',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.arrow_right_square_fill),
            label: 'Withdraw',
          ),
        ],
      ),
    );
  }
}
