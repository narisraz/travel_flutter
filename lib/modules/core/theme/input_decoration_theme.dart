import 'package:flutter/material.dart';
import 'package:travel_flutter/modules/core/theme/app_colors.dart';

class InputDecorationThemeData {
  static InputDecorationTheme get theme {
    return InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.borderFocused, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.borderError),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.borderError, width: 2),
      ),
      errorMaxLines: 2,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      fillColor: AppColors.inputBackground,
      filled: true,
    );
  }
}
