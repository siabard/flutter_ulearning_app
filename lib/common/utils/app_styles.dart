import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';

class AppTheme {
  static ThemeData appThemeData = ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.primaryBackground,
      iconTheme: IconThemeData(
        color: AppColors.primaryText,
      ),
    ),
  );
}
