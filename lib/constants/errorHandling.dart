// import 'dart:convert';

// import 'package:bank_app/constants/utils.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;


// void httpErrorHandel({
//   required http.Response response,
//   required BuildContext context,
//   required VoidCallback onSuccess,
// }) {
//   switch (response.statusCode) {
//     case 200:
//       onSuccess();
//       break;
//     case 400:
//       showSnackBar(
//         context,
//         jsonDecode(response.body)["msg"],
//       );
//       break;
//     case 500:
//       showSnackBar(
//         context,
//         jsonDecode(response.body)["error"],
//       );
//       break;
//     default:
//       print("Unexpected status code: ${response.statusCode}");
//       showSnackBar(context, "Unexpected error occurred");
//   }
// }

