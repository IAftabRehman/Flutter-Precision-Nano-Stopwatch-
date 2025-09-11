import 'package:flutter/material.dart';
import '../Configuration/AppColors.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isNightMode = false;
  bool get isNightMode => _isNightMode;

  /// Background Color
  LinearGradient get backgroundColor => _isNightMode
      ? AppColors.nightModeBackgroundColor
      : AppColors.dayModeBackgroundColor;

  /// Text Primary Color
  Color get primaryTextColor => _isNightMode
      ? AppColors.nightModePrimaryTextColor
      : AppColors.dayModePrimaryTextColor;

  /// Text Title Color
  Color get titleColor => _isNightMode
      ? AppColors.nightModeTitleColor
      : AppColors.dayModeTitleColor;


  void toggleTheme() {
    _isNightMode = !_isNightMode;
    notifyListeners();
  }

  void setTheme(bool isNight) {
    _isNightMode = isNight;
    notifyListeners();
  }
}
