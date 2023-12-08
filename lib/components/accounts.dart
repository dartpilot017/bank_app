
// import 'package:flutter/material.dart';

// import '../constants/global_size.dart';
// import '../utilities/themeColors.dart';
// import '../utilities/themeStyles.dart';
// import '../widgets/creditCard.dart';

// class AccountsList extends StatefulWidget {
//   const AccountsList({
//     super.key,
//   });

//   @override
//   State<AccountsList> createState() => _AccountsListState();
// }

// class _AccountsListState extends State<AccountsList> {
//   List<Map<String, dynamic>> accountsList = [
//     {
//       'accountOwner': '08189349465',
//       'accountType': 'Naira savings account',
//       'accountBalance': 'NGN 50,000,000.00',
//       'accountNumber': '12345687901',
//     },
//     {
//       'accountOwner': '09234561234',
//       'accountType': 'Dollar checking account',
//       'accountBalance': 'USD 750,000.00',
//       'accountNumber': '98765432100',
//     },
//     {
//       'accountOwner': '07123456789',
//       'accountType': 'Euro savings account',
//       'accountBalance': 'EUR 300,000.00',
//       'accountNumber': '56789012345',
//     },
//     {
//       'accountOwner': '01098765432',
//       'accountType': 'Pound sterling current account',
//       'accountBalance': 'GBP 1,200,000.00',
//       'accountNumber': '23456789012',
//     }
//   ];

//   int _currentCard = 0;

//   final PageController _pageController = PageController(initialPage: 0);
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     _pageController.dispose();
//     super.dispose();
//   }

//   _onPageChanged(int index) {
//     setState(() {
//       _currentCard = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           Container(
//             height: screenHeight * 0.297,
//             child: PageView.builder(
//               itemCount: accountsList.length,
//               scrollDirection: Axis.horizontal,
//               controller: _pageController,
//               onPageChanged: _onPageChanged,
//               itemBuilder: (context, index) {
//                 return AccountsCard(
//                   accountBalance: accountsList[index]['accountBalance'],
//                   accountNumber: accountsList[index]['accountNumber'],
//                   accountOwner: accountsList[index]['accountOwner'],
//                   accountType: accountsList[index]['accountType'],
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(top: screenHeight * 0.018),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 for (int i = 0; i < accountsList.length; i++)
//                   if (_currentCard == i)
//                     DotIndicator(true)
//                   else
//                     DotIndicator(false)
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class DotIndicator extends StatefulWidget {
//   final bool isActive;
//   DotIndicator(
//     this.isActive,
//   );
//   @override
//   _DotIndicatorState createState() => _DotIndicatorState();
// }

// class _DotIndicatorState extends State<DotIndicator> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
//       child: Container(
//         height: screenHeight * 0.01,
//         width: screenWidth * 0.02,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(screenWidth * 0.02),
//           color: widget.isActive ? ThemeColors.black : ThemeColors.grey,
//         ),
//       ),
//     );
//   }
// }
