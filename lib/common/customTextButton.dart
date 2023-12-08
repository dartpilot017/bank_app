
import 'package:bank_flutter/utilities/themeStyles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final TapGestureRecognizer? recognizer;
  final Color? color;
  final double? size;
  final FontWeight? fontWidth;

  const CustomTextButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.recognizer,
    this.color = Colors.black,
    this.size = 16,
    this.fontWidth = FontWeight.w400,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: InkWell(
        onTap: onTap,
        child: Text.rich(
          TextSpan(
            text: ' $text',
            style: ThemeStyles.authTextIn,
            recognizer: recognizer ?? TapGestureRecognizer()
              ..onTap = onTap,
          ),
        ),
      ),
    );
  }
}
