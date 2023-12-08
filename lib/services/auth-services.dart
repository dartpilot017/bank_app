import 'dart:convert';

import 'package:bank_flutter/screens/home-widget.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Map<String, dynamic> userData = {};

class AuthService {
  Future<void> signup(
      BuildContext context, String phoneNumber, String password) async {
    bool isConnectivitySupported =
        await Connectivity().checkConnectivity() != null;

    if (isConnectivitySupported) {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        // No internet connection
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('No internet connection'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text('Connectivity package is not supported on this platform.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    final String apiUrl = 'https://bankapi.veegil.com/auth/signup';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'phoneNumber': phoneNumber,
          'password': password,
        },
      );

      final responseData = json.decode(response.body);

      if (response.statusCode == 200 && responseData['status'] == 'success') {
        // Signup successful
        final phoneNumber = responseData['data']['phoneNumber'];
        final created = responseData['data']['created'];

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'Signup successful for $phoneNumber, login with the same credentials'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        // Signup unsuccessful
        final errorMessage = responseData['message'];

        // Handle error, e.g., show an error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Signup failed: $errorMessage'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      // Handle network or other errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error during signup: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> login(
      BuildContext context, String phoneNumber, String password) async {
    bool isConnectivitySupported =
        await Connectivity().checkConnectivity() != null;

    if (isConnectivitySupported) {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        // No internet connection
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('No internet connection'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text('Connectivity package is not supported on this platform.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final String apiUrl = 'https://bankapi.veegil.com/auth/login';

    final Map<String, String> data = {
      'phoneNumber': phoneNumber,
      'password': password,
    };

    final http.Response response = await http.post(
      Uri.parse(apiUrl),
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    final Map<String, dynamic> responseData = json.decode(response.body);

    if (response.statusCode == 200 && responseData['status'] == 'success') {
      String token = responseData['data']['token'];

      await fetchUserData(context, token, phoneNumber);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text('Login successful. Welcome, ${userData['phoneNumber']}!'),
          backgroundColor: Colors.green,
        ),
      );

      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => HomeWidget(user: userData),
        ),
      );
    } else {
      String errorMessage = responseData['message'];
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login failed. Error: $errorMessage'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> fetchUserData(
      BuildContext context, String token, String loggedInPhoneNumber) async {
    final http.Response userResponse = await http.get(
      Uri.parse('https://bankapi.veegil.com/accounts/list'),
      headers: {'Authorization': 'Bearer $token'},
    );

    final dynamic userResponseData = json.decode(userResponse.body);

    if (userResponse.statusCode == 200 &&
        userResponseData['status'] == 'success') {
      if (userResponseData['data'] is List) {
        var users = userResponseData['data'] as List;
        var matchingUser = users.firstWhere(
          (user) => user['phoneNumber'] == loggedInPhoneNumber,
          orElse: () => null,
        );

        if (matchingUser != null) {
          userData = matchingUser;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content:
                  Text('User not found for phone number: $loggedInPhoneNumber'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else if (userResponseData['data'] is Map<String, dynamic>) {
        // The response contains a single user
        userData = userResponseData['data'];
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Unexpected user data format.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text('Error fetching user data: ${userResponseData['message']}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
