import 'package:flutter/material.dart';
import 'package:travel_flutter/modules/core/theme/app_colors.dart';
import 'package:travel_flutter/modules/core/theme/input_decoration_theme.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.light,
      ),
      useMaterial3: true,
      inputDecorationTheme: InputDecorationThemeData.theme,

      // Configuration des couleurs du thème
      scaffoldBackgroundColor: AppColors.background,
      cardColor: AppColors.surface,

      // Configuration des couleurs de texte
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppColors.onSurface),
        bodyMedium: TextStyle(color: AppColors.onSurface),
        labelLarge: TextStyle(color: AppColors.onSurface),
      ),
    );
  }
}
