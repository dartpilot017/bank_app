import 'package:bank_flutter/utilities/themeColors.dart';
import 'package:bank_flutter/utilities/themeStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/global_size.dart';

class AccountsCard extends StatefulWidget {
  final String accountOwner;
  final String accountType;
  final String accountBalance;
  final String accountNumber;
  const AccountsCard(
      {super.key,
      this.accountBalance = '',
      this.accountNumber = '',
      this.accountOwner = '',
      this.accountType = ''});

  @override
  State<AccountsCard> createState() => _AccountsCardState();
}

class _AccountsCardState extends State<AccountsCard> {
  static bool isNumbersVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenHeight * 0.016,
        bottom: screenHeight * 0.007,
        left: screenWidth * 0.04,
        right: screenWidth * 0.04,
      ),
      child: GestureDetector(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => AccountPage(
          //         accountOwner: widget.accountOwner,
          //         accountType: widget.accountType,
          //         accountBalance: widget.accountBalance,
          //         accountNumber: widget.accountNumber),
          //   ),
          // );
        },
        child: Container(
          height: screenHeight * 0.4,
          decoration: BoxDecoration(
            color: ThemeColors.black,
            borderRadius: BorderRadius.circular(screenWidth * 0.055),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.01,
              bottom: screenHeight * 0.0001,
              left: screenWidth * 0.034,
              right: screenWidth * 0.034,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.048,
                    vertical: screenHeight * 0.018,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.accountOwner,
                        style: ThemeStyles.cardOwner,
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
                            style: ThemeStyles.cardDetails,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.048,
                    vertical: screenHeight * 0.018,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.accountType,
                        style: ThemeStyles.cardDetails,
                      ),
                      isNumbersVisible
                          ? Padding(
                              padding:
                                  EdgeInsets.only(top: screenHeight * 0.018),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                              widget.accountBalance,
                              style: ThemeStyles.cardMoney,
                            ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.048,
                    bottom: screenHeight * 0.028,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: screenWidth * 0.27,
                        height: screenHeight * 0.027,
                        decoration: BoxDecoration(
                          color: ThemeColors.lightGrey.withOpacity(0.3),
                          borderRadius:
                              BorderRadius.circular(screenWidth * 0.018),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: screenWidth * 0.008,
                              top: screenHeight * 0.002),
                          child: Text(
                            widget.accountNumber,
                            style: ThemeStyles.cardAccountNumber,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Hide balance',
                            style: ThemeStyles.cardHideBalance,
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
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
