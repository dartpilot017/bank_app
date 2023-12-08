import 'package:bank_flutter/utilities/themeColors.dart';
import 'package:bank_flutter/utilities/themeStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../constants/global_size.dart';

class AccountsCardInPage extends StatefulWidget {
  final String accountOwner;
  final String accountType;
  final String accountBalance;
  final String accountNumber;
  const AccountsCardInPage({
    super.key,
    required this.accountOwner,
    required this.accountType,
    required this.accountBalance,
    required this.accountNumber,
  });

  @override
  State<AccountsCardInPage> createState() => _AccountsCardInPageState();
}

class _AccountsCardInPageState extends State<AccountsCardInPage> {
  static bool isNumbersVisible = false;

  String _formatAmount(num amount) {
    final formatter = NumberFormat("#,##0.00", "en_US");
    return formatter.format(amount);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenHeight * 0.016,
        bottom: screenHeight * 0.016,
      ),
      child: Container(
        height: screenHeight * 0.248,
        decoration: BoxDecoration(
          color: ThemeColors.black,
          borderRadius: BorderRadius.circular(screenWidth * 0.055),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: screenHeight * 0.02,
            bottom: screenHeight * 0.02,
            left: screenWidth * 0.06,
            right: screenWidth * 0.06,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text.rich(
                        textAlign: TextAlign.start,
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Account Number',
                              style: ThemeStyles.cardActive,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: screenWidth * 0.273,
                        height: screenHeight * 0.027,
                        decoration: BoxDecoration(
                          color: ThemeColors.lightGrey.withOpacity(0.3),
                          borderRadius:
                              BorderRadius.circular(screenWidth * 0.018),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: screenHeight * 0.002,
                          ),
                          child: Center(
                            child: Text(
                              widget.accountNumber,
                              style: ThemeStyles.cardAccountNumber,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: screenWidth * 0.014,
                        backgroundColor: Colors.greenAccent,
                      ),
                      SizedBox(
                        width: screenWidth * 0.008,
                      ),
                      Text(
                        'Active',
                        style: ThemeStyles.cardActive,
                      )
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Account Balance:',
                    style: ThemeStyles.cardActive,
                  ),
                  isNumbersVisible
                      ? Padding(
                          padding: EdgeInsets.only(top: screenHeight * 0.016),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset('assets/card-dots.svg'),
                              SizedBox(
                                width: screenWidth * 0.01,
                              ),
                              SvgPicture.asset('assets/card-dots.svg'),
                            ],
                          ),
                        )
                      : Text(
                          'NGN ${_formatAmount(double.parse(widget.accountBalance))}',
                          style: ThemeStyles.cardMoney,
                        ),
                  // Text(
                  //     widget.accountBalance,
                  //     style: ThemeStyles.cardMoney,
                  //   ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ledger Balance:',
                        style: ThemeStyles.cardActive,
                      ),
                      isNumbersVisible
                          ? Padding(
                              padding:
                                  EdgeInsets.only(top: screenHeight * 0.016),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset('assets/card-dots.svg'),
                                  SizedBox(
                                    width: screenWidth * 0.01,
                                  ),
                                  SvgPicture.asset('assets/card-dots.svg'),
                                ],
                              ),
                            )
                          : Text(
                              'NGN ${_formatAmount(double.parse(widget.accountBalance))}',
                              style: ThemeStyles.cardOwner,
                            ),
                    ],
                  ),
                  Transform.scale(
                    scale: screenWidth * 0.0018,
                    child: Switch(
                      value: isNumbersVisible,
                      activeColor: Colors
                          .greenAccent, // customize the color when switch is ON
                      inactiveThumbColor: Color(0xff66646d),
                      onChanged: (bool value) {
                        setState(() {
                          isNumbersVisible = value;
                        });
                      }, // customize the color when switch is OFF
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
