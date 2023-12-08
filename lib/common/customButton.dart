
import 'package:bank_flutter/utilities/themeColors.dart';
import 'package:flutter/material.dart';

import '../constants/global_size.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double height;
  final double width;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: screenWidth * width,
        height: screenHeight * height,
        decoration: BoxDecoration(
          // color: ThemeColors.lightGrey,
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ThemeColors.black,
              fontSize: screenSize.width * 0.04,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
