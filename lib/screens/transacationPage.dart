import 'package:bank_flutter/constants/global_size.dart';
import 'package:bank_flutter/models/transaction-model.dart';
import 'package:bank_flutter/utilities/themeColors.dart';
import 'package:bank_flutter/utilities/themeStyles.dart';
import 'package:bank_flutter/widgets/otherDetailsDivider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class TransactionPage extends StatefulWidget {
  final String? title;
  final String? subTitle;
  final String? price;
  final String? letter;
  final Color? color;
  final Transaction transaction;
  TransactionPage({
    this.color,
    this.letter,
    this.price,
    this.subTitle,
    this.title,
    required this.transaction,
  });
  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  late String formattedTime;

  @override
  void initState() {
    super.initState();
    formattedTime = DateFormat('h:mm:ss a').format(widget.transaction.created);
  }

  String _formatAmount(num amount) {
    final formatter = NumberFormat("#,##0.00", "en_US");
    return formatter.format(amount);
  }

  String getType() {
    return widget.transaction.type == 'debit' ? 'Withdraw' : 'Deposit';
  }

  Color getColor() {
    return widget.transaction.type == 'debit' ? Colors.red : Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '${widget.transaction.phoneNumber}',
          // style: ThemeStyles.cardAccountNumber,
        ),
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, top: 32.0, bottom: 8.0),
                  child: Row(
                    children: [
                      Text('Transaction Details',
                          style: ThemeStyles.primaryTitle),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 5.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: SvgPicture.asset('assets/bankTransfer-icon.svg'),
                      ),
                      Text(
                        getType(),
                        style: TextStyle(
                          fontSize: screenWidth * 0.043,
                          color: getColor(),
                        ),
                      ),
                    ],
                  ),
                ),
                OtherDetailsDivider(),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 5.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                        child: Container(
                          height: 32.0,
                          width: 74.0,
                          decoration: BoxDecoration(
                            color: ThemeColors.lightGrey,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                              child:
                                  Text('#finance', style: ThemeStyles.tagText)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                        child: Container(
                          height: 32.0,
                          width: 74.0,
                          decoration: BoxDecoration(
                            color: ThemeColors.lightGrey,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                              child:
                                  Text('#fintory', style: ThemeStyles.tagText)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                        child: Container(
                          height: 32.0,
                          width: 74.0,
                          decoration: BoxDecoration(
                            color: ThemeColors.lightGrey,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                              child:
                                  Text('#design', style: ThemeStyles.tagText)),
                        ),
                      ),
                      SvgPicture.asset('assets/edit-icon.svg'),
                    ],
                  ),
                ),
                OtherDetailsDivider(),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Amount ${getType()}ed',
                          style: ThemeStyles.otherDetailsSecondary),
                      SizedBox(height: 5.0),
                      Text(
                        'NGN ${_formatAmount(widget.transaction.amount as num)}',
                        style: ThemeStyles.otherDetailsPrimary,
                      )
                    ],
                  ),
                ),
                OtherDetailsDivider(),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('IBAN', style: ThemeStyles.otherDetailsSecondary),
                      SizedBox(height: 5.0),
                      Text('DE56 3902 0000 1203 2339 39',
                          style: ThemeStyles.otherDetailsPrimary),
                    ],
                  ),
                ),
                OtherDetailsDivider(),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('BIC', style: ThemeStyles.otherDetailsSecondary),
                      SizedBox(height: 5.0),
                      Text('DUISDE33XX',
                          style: ThemeStyles.otherDetailsPrimary),
                    ],
                  ),
                ),
                OtherDetailsDivider(),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Posting Key',
                          style: ThemeStyles.otherDetailsSecondary),
                      SizedBox(height: 5.0),
                      Text('153', style: ThemeStyles.otherDetailsPrimary),
                    ],
                  ),
                ),
                OtherDetailsDivider(),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Posting Text',
                          style: ThemeStyles.otherDetailsSecondary),
                      SizedBox(height: 5.0),
                      Text('Landing Page',
                          style: ThemeStyles.otherDetailsPrimary),
                    ],
                  ),
                ),
                OtherDetailsDivider(),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Purpose Code',
                          style: ThemeStyles.otherDetailsSecondary),
                      SizedBox(height: 5.0),
                      Text('OLOA', style: ThemeStyles.otherDetailsPrimary),
                    ],
                  ),
                ),
                OtherDetailsDivider(),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Transaction date',
                          style: ThemeStyles.otherDetailsSecondary),
                      SizedBox(height: 5.0),
                      Text(
                          'Date: ${widget.transaction.created.day}/${widget.transaction.created.month}/${widget.transaction.created.year}',
                          style: ThemeStyles.otherDetailsPrimary),
                      SizedBox(height: 5.0),
                      Text('Time: $formattedTime',
                          style: ThemeStyles.otherDetailsPrimary),
                    ],
                  ),
                ),
                OtherDetailsDivider(),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('SEPA Reference',
                          style: ThemeStyles.otherDetailsSecondary),
                      SizedBox(height: 5.0),
                      Text('DE56 3902 0000 1203 2339 39',
                          style: ThemeStyles.otherDetailsPrimary),
                    ],
                  ),
                ),
                OtherDetailsDivider(),
              ],
            ),
            // AddNote(),
          ],
        ),
      ),
    );
  }
}
