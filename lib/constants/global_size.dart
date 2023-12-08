// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' show MediaQueryData, WidgetsBinding;





double screenHeight =
    MediaQueryData.fromView(WidgetsBinding.instance.window).size.height;
double screenWidth =
    MediaQueryData.fromView(WidgetsBinding.instance.window).size.width;