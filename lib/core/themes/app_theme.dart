// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_task/core/themes/app_bar_theme.dart';
import 'package:flutter_task/core/themes/color_scheme.dart';
import 'package:flutter_task/core/themes/text_theme.dart';
import 'package:flutter_task/presentation/resources/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: colorScheme,
    appBarTheme: appBarTheme,
    textTheme: textTheme,
  );

  static ThemeData darkTheme = ThemeData.dark();
}
