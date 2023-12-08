// transaction_service.dart

import 'dart:convert';
import 'package:bank_flutter/models/transaction-model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TransactionService {
  List<Map<String, dynamic>> userList = [];
  static Future<List<Transaction>> fetchTransactions() async {
    final response =
        await http.get(Uri.parse('https://bankapi.veegil.com/transactions'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<dynamic> data = jsonData['data'];
      return data
          .map((item) => Transaction(
                type: item['type'],
                amount: item['amount'],
                phoneNumber: item['phoneNumber'],
                created: DateTime.parse(item['created']),
                balance: item['balance'],
              ))
          .toList();
    } else {
      throw Exception('Failed to load transactions');
    }
  }

  Future<void> fetchUsers() async {
    final response =
        await http.get(Uri.parse('https://bankapi.veegil.com/accounts/list'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      userList = List<Map<String, dynamic>>.from(data['data']);
    } else {
      // Handle error
      print('Error fetching users: ${response.statusCode}');
    }
  }

  static Future<List<Transaction>> fetchUserTransaction(
      String phoneNumber) async {
    try {
      final response =
          await http.get(Uri.parse('https://bankapi.veegil.com/transactions'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List<dynamic> datas = jsonData['data'];

        final personalTransactions = datas
            .where((data) => data['phoneNumber'] == phoneNumber)
            .map((item) => Transaction(
                  type: item['type'],
                  amount: item['amount'],
                  phoneNumber: item['phoneNumber'],
                  created: DateTime.parse(item['created']),
                  balance: item['balance'],
                ))
            .toList();

        return personalTransactions;
      } else {
        throw Exception('Error fetching data: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching data: $error');
      throw error; // Rethrow the error to be caught by the calling function
    }
  }

  Future<void> makeTransfer(
      BuildContext context, String phoneNumber, String amount) async {
    final String apiUrl = 'https://bankapi.veegil.com/accounts/transfer';

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'phoneNumber': phoneNumber,
        'amount': amount,
      }),
    );

    if (response.statusCode == 200) {
      // Successful transfer
      final Map<String, dynamic> responseData = json.decode(response.body);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Transfer Successful'),
          content: Text('Amount Sent: ${responseData['data']['sent']}'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else if (response.statusCode == 404) {
      // User not found
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('User Not Found'),
          content: Text('Please check the phone number and try again.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {
      // Handle other errors
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('An error occurred. Please try again later.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  Future<void> makeWithdrawal(
      BuildContext context, String phoneNumber, String amount) async {
    final String apiUrl = 'https://bankapi.veegil.com/accounts/withdraw';

    final Map<String, dynamic> requestData = {
      'phoneNumber': phoneNumber,
      'amount': amount,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestData),
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200 && responseData['status'] == 'success') {
        final withdrawnAmount = responseData['data']['withdrawal'];
        _showSuccessDialog(context, withdrawnAmount);
      } else if (response.statusCode == 404) {
        _showErrorDialog(context, 'User Not Found',
            'Please check the phone number and try again.');
      } else {
        _showErrorDialog(
            context, 'Error', 'An error occurred. Please try again later.');
      }
    } catch (_) {
      _showErrorDialog(context, 'Error',
          'An error occurred. Please check your network and try again.');
    }
  }

  void _showSuccessDialog(BuildContext context, dynamic withdrawnAmount) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Withdrawal Successful'),
        content: Text('Amount Withdrawn: $withdrawnAmount'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
