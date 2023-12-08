
// import 'package:flutter/material.dart';

// class CardsList extends StatefulWidget {
//   @override
//   _CardsListState createState() => _CardsListState();
// }

// class _CardsListState extends State<CardsList> {
//   List cardList = [
//     CreditCard(),
//     CreditCard(),
//     CreditCard(),
//     CreditCard(),
//     CreditCard(),
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
//           Padding(
//             padding: EdgeInsets.only(
//                 top: screenHeight * 0.036, left: screenWidth * 0.043, right: screenWidth * 0.038, bottom: screenHeight * 0.02),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('Cards', style: ThemeStyles.primaryTitle),
//                 Text('See All', style: ThemeStyles.seeAll),
//               ],
//             ),
//           ),
//           Container(
//             height: screenHeight * 0.314,
//             child: PageView.builder(
//               itemCount: cardList.length,
//               scrollDirection: Axis.horizontal,
//               controller: _pageController,
//               onPageChanged: _onPageChanged,
//               itemBuilder: (context, index) => CreditCard(),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(top: screenHeight * 0.018),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 for (int i = 0; i < cardList.length; i++)
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
//   DotIndicator(this.isActive);
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
