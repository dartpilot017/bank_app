
import 'package:bank_flutter/screens/login.dart';
import 'package:bank_flutter/screens/transaction-screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
    '/user_transaction_screen': (context) => TransactionScreen(),
  },
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
