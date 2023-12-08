import 'package:bank_flutter/constants/global_size.dart';
import 'package:bank_flutter/models/transaction-model.dart';
import 'package:bank_flutter/screens/transacationPage.dart';
import 'package:bank_flutter/utilities/themeColors.dart';
import 'package:bank_flutter/utilities/themeStyles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatefulWidget {
  final Transaction transaction;
  TransactionCard({
    required this.transaction,
  });
  @override
  _TransactionCardState createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  String _formatAmount(num amount) {
    final formatter = NumberFormat("#,##0.00", "en_US");
    return formatter.format(amount);
  }

  Color getColor() {
    return widget.transaction.type == 'debit' ? Colors.red : Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return widget.transaction == null
        ? Center(
            child: CircularProgressIndicator(
                color: ThemeColors.black,
                ),
          )
        : Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 16.0, vertical: screenHeight * 0.007),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TransactionPage(
                      title: '${widget.transaction.phoneNumber}',
                      // subTitle: widget.subTitle,
                      // price: widget.price,
                      transaction: widget.transaction,
                    ),
                  ),
                );
              },
              child: Container(
                height: screenHeight * 0.08,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 16.0),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.transaction.phoneNumber,
                                    style: ThemeStyles.otherDetailsPrimary),
                                Text('Created: ${widget.transaction.created}',
                                    style: ThemeStyles.otherDetailsSecondary),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'NGN ${_formatAmount(widget.transaction.amount as num? ?? 0)}',
                              style: TextStyle(color: getColor()),
                            ),
                            SizedBox(width: 4.0),
                            Icon(Icons.keyboard_arrow_right),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.0025,
                    ),
                    Divider(
                      color: Colors.grey.withOpacity(0.5),
                      thickness: 0.5,
                      endIndent: 16.0,
                      indent: 16.0,
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
