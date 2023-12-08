
import 'package:bank_flutter/constants/global_size.dart';
import 'package:bank_flutter/utilities/themeColors.dart';
import 'package:flutter/material.dart';

class ThemeStyles {
  static TextStyle authText = TextStyle(
    fontSize: screenWidth * 0.043,
    color: ThemeColors.lightGrey,
  );
  static TextStyle authTextIn = TextStyle(
    fontSize: screenWidth * 0.043,
    fontWeight: FontWeight.w700,
    color: ThemeColors.lightGrey,
  );
  static TextStyle primaryTitle = TextStyle(
    fontSize: screenWidth * 0.055,
    fontWeight: FontWeight.w600,
    color: ThemeColors.black,
  );
  static TextStyle seeAll = TextStyle(
    fontSize: screenWidth * 0.043,
    color: ThemeColors.black,
  );
  static TextStyle cardDetails = TextStyle(
    fontSize: screenWidth * 0.043,
    color: Color(0xff66646d),
    fontWeight: FontWeight.w600,
  );
  static TextStyle cardActive = TextStyle(
    fontSize: screenWidth * 0.035,
    color: Color(0xff66646d),
    fontWeight: FontWeight.w600,
  );
  static TextStyle cardMoney = TextStyle(
    color: Colors.white,
    fontSize: screenWidth * 0.05,
    fontWeight: FontWeight.w700,
  );
  static TextStyle cardAccountNumber = TextStyle(
    color: Colors.white,
    fontSize: screenWidth * 0.034,
    fontWeight: FontWeight.w700,
  );
  static TextStyle cardHideBalance = TextStyle(
    color: Color(0xff66646d),
    fontSize: screenWidth * 0.029,
    fontWeight: FontWeight.w700,
  );
  static TextStyle cardOwner = TextStyle(
    color: Colors.white,
    fontSize: screenWidth * 0.045,
    fontWeight: FontWeight.w700,
  );
  static TextStyle accountCredit = TextStyle(
    fontSize: screenWidth * 0.035,
    color: Colors.greenAccent,
    fontWeight: FontWeight.w500,
  );
  static TextStyle accountDebit = TextStyle(
    fontSize: screenWidth * 0.035,
    color: Colors.red,
    fontWeight: FontWeight.w500,
  );
  static TextStyle tagText = TextStyle(
    fontStyle: FontStyle.italic,
    color: ThemeColors.black,
    fontWeight: FontWeight.w500,
  );
  static TextStyle otherDetailsPrimary = TextStyle(
    fontSize: screenWidth * 0.043,
    color: ThemeColors.black,
  );
  static TextStyle otherDetailsSecondary = TextStyle(
    fontSize: screenWidth * 0.03,
    color: Colors.grey,
  );
}
