import 'dart:convert';
import 'package:bank_flutter/common/customButton.dart';
import 'package:bank_flutter/common/customTextField.dart';
import 'package:bank_flutter/constants/global_size.dart';
import 'package:bank_flutter/services/transaction-service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DepositScreen extends StatefulWidget {
  const DepositScreen({Key? key}) : super(key: key);

  @override
  State<DepositScreen> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TransactionService transactionService = TransactionService();

  @override
  void dispose() {
    super.dispose();
    phoneNumberController.dispose();
    amountController.dispose();
  }

  void makeTransfer() {
    transactionService.makeTransfer(
      context,
      phoneNumberController.text,
      amountController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deposit'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  controller: phoneNumberController,
                  hintText: 'Enter registered phone number',
                  validatorText: 'Please eneter a registered phone number',
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: amountController,
                  hintText: 'Enter amount',
                  validatorText: 'Please eneter amount not less then 10',
                  customValidator: (val) {
                    final amount = double.tryParse(val ?? '');
                    if (amount != null && amount < 10) {
                      return 'Amount must be at least 10';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                CustomButton(
                  text: 'Deposit',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      makeTransfer();
                    }
                  },
                  height: 0.08,
                  width: 0.8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
