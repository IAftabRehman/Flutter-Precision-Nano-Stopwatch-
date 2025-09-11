import 'package:flutter/material.dart';

class AppColors{

  /// Background Color with Night Mode (Gradient)
  static const LinearGradient dayModeBackgroundColor = LinearGradient(
    colors: [
      Color(0xFF00C9FF),
      Color(0xFF92FE9D),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Background Color with Day Mode (Gradient)
  static const LinearGradient nightModeBackgroundColor = LinearGradient(
    colors: [
      Color(0xFF0F2027),
      Color(0xFF203A43),
      Color(0xFF2C5364),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Primary Text Color with Day Mode
  static const Color dayModePrimaryTextColor = Colors.black87;

  /// Primary Text Color with Night Mode
  static const Color nightModePrimaryTextColor = Colors.white;

  /// Secondary Text Color with Day Mode
  static const Color dayModeTitleColor = Colors.red;

  /// Secondary Text Color with Night Mode
  static const Color nightModeTitleColor = Colors.green;
}