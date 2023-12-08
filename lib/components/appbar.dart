import 'package:bank_flutter/constants/global_size.dart';
import 'package:flutter/material.dart';

class Appbar extends StatefulWidget {
  final Map<String, dynamic> user;

  const Appbar({super.key, required this.user});
  @override
  _AppbarState createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: screenHeight * 0.02,
          left: screenWidth * 0.03,
          right: screenWidth * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text.rich(
              textAlign: TextAlign.center,
              TextSpan(children: [
                TextSpan(
                  text: 'Welcome back ',
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: '${widget.user['phoneNumber']}',
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ])),
          Row(
            children: [
              // IconButton(
              //   icon: SvgPicture.asset('assets/analytics-icon.svg'),
              //   onPressed: null,
              // ),
              // IconButton(
              //   icon: SvgPicture.asset('assets/more-icon.svg'),
              //   onPressed: null,
              // )
            ],
          )
        ],
      ),
    );
  }
}
