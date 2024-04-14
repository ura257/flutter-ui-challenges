import 'package:flutter/material.dart';
import 'package:ui_004_covid_19_tracker/const/color.dart';

class AppTheme {
  static ThemeData getAppTheme() {
    return ThemeData(
      scaffoldBackgroundColor: AppColor.background,
      useMaterial3: true,

      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColor.primary,
      ),
      // Text
      textTheme: const TextTheme(
        titleLarge: AppTextStyles.title,
        bodyLarge: AppTextStyles.cardTitle,
        bodyMedium: AppTextStyles.cardBody,
      ),
    );
  }
}

class AppTextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 21.0,
    fontWeight: FontWeight.w400,
    color: AppColor.white,
  );
  static const TextStyle cardTitle = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w400,
    color: AppColor.white,
  );
  static const TextStyle cardBody = TextStyle(
    fontSize: 27.0,
    fontWeight: FontWeight.w400,
    color: AppColor.white,
  );
}