// import 'package:banking_app/utilities/themeColors.dart';
// import 'package:banking_app/utilities/themeStyles.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// import '../constants/global_size.dart';

// class CreditCard extends StatefulWidget {
//   @override
//   _CreditCardState createState() => _CreditCardState();
// }

// class _CreditCardState extends State<CreditCard> {
//   bool isNumbersVisible = false;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(
//         top: screenHeight * 0.016,
//         bottom: screenHeight * 0.016,
//         left: screenWidth * 0.04,
//         right: screenWidth * 0.04,
//       ),
//       child: Container(
//         height: screenHeight * 0.314,
//         decoration: BoxDecoration(
//           color: ThemeColors.black,
//           borderRadius: BorderRadius.circular(screenWidth * 0.055),
//         ),
//         child: Padding(
//           padding: EdgeInsets.only(
//             top: screenHeight * 0.01,
//             bottom: screenHeight * 0.01,
//             left: screenWidth * 0.034,
//             right: screenWidth * 0.034,
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: screenWidth * 0.048,
//                   vertical: screenHeight * 0.018,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text('5.720,30 €', style: ThemeStyles.cardMoney),
//                     GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           isNumbersVisible = !isNumbersVisible;
//                         });
//                       },
//                       child: Icon(
//                         isNumbersVisible
//                             ? Icons.visibility
//                             : Icons.visibility_off,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(
//                   left: screenWidth * 0.048,
//                   bottom: screenHeight * 0.028,
//                 ),
//                 child: Row(
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('Magent Black', style: ThemeStyles.cardDetails),
//                         Row(
//                           children: [
//                             Padding(
//                               padding:
//                                   EdgeInsets.only(right: screenWidth * 0.014),
//                               child:
//                                   Text('4756', style: ThemeStyles.cardDetails),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: screenWidth * 0.014),
//                               child: isNumbersVisible
//                                   ? Text('3456', style: ThemeStyles.cardDetails)
//                                   : SvgPicture.asset('assets/card-dots.svg'),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: screenWidth * 0.014),
//                               child: isNumbersVisible
//                                   ? Text('7823', style: ThemeStyles.cardDetails)
//                                   : SvgPicture.asset('assets/card-dots.svg'),
//                             ),
//                             Padding(
//                               padding:
//                                   EdgeInsets.only(left: screenWidth * 0.014),
//                               child:
//                                   Text('9018', style: ThemeStyles.cardDetails),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Text(
//                           'VALID \n THRU',
//                           style: ThemeStyles.otherDetailsSecondary,
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
