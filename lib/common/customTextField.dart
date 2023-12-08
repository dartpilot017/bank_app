import 'package:bank_flutter/utilities/themeColors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String validatorText;
  final bool showSuffixIcon;
  final bool showPreffixIcon;
  final IconData? preffixIcon;
  final String? Function(String?)? customValidator;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.validatorText,
    this.showSuffixIcon = false,
    this.showPreffixIcon = false,
    this.preffixIcon,
    this.customValidator,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  String? formName;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.showSuffixIcon ? _obscureText : false,
      controller: widget.controller,
      style: TextStyle(color: ThemeColors.grey),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(color: ThemeColors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(
            width: 1.3,
            style: BorderStyle.solid,
            color: ThemeColors.lightGrey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(
            width: 1.3,
            style: BorderStyle.solid,
            color: ThemeColors.lightGrey,
          ),
        ),
        prefixIcon: widget.showPreffixIcon
            ? Icon(
                widget.preffixIcon,
              )
            : null,
        suffixIcon: widget.showSuffixIcon
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
      validator: (val) {
        if (widget.customValidator != null) {
          final customError = widget.customValidator!(val);
          if (customError != null) {
            return customError;
          }
        }

        if (val == null || val.isEmpty) {
          return '${widget.validatorText}';
        }

        // Additional custom validation
        final amount = double.tryParse(val);
        if (amount != null && amount < 10) {
          return 'Amount must be at least 10';
        }

        return null; // This is valid; it indicates no validation error
      },
    );
  }
}
