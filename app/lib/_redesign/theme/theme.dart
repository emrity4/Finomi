import 'package:flutter/material.dart';
import 'package:finomi/_redesign/theme/app_colors.dart';
import 'package:finomi/theme/app_font_option.dart';

class RedesignTheme {
  RedesignTheme._();

  static ThemeData light({
    AppFontOption fontOption = AppFontOption.appDefault,
    AppColorTheme colorTheme = AppColorTheme.defaults,
  }) {
    final colorScheme = ColorScheme.light(
      primary: colorTheme.lightPrimary,
      secondary: colorTheme.lightSecondary,
      tertiary: colorTheme.lightTertiary,
      surface: colorTheme.lightSurface,
      background: colorTheme.lightBg,
      error: AppColors.red,
      onPrimary: _onColor(colorTheme.lightPrimary),
      onSecondary: _onColor(colorTheme.lightSecondary),
      onTertiary: AppColors.white,
      onSurface: AppColors.slate900,
      onBackground: AppColors.slate900,
      onError: AppColors.white,
      surfaceVariant: colorTheme.lightSurface,
      onSurfaceVariant: AppColors.slate600,
      outline: const Color(0xFFE2E8F0),
    );

    final base = ThemeData(
      useMaterial3: true,
      fontFamily: fontOption.fontFamily,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorTheme.lightBg,
      snackBarTheme: _snackBarTheme(),
      dividerColor: const Color(0xFFE2E8F0),
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: colorTheme.lightBg,
        foregroundColor: AppColors.slate900,
      ),
      cardTheme: CardThemeData(
        color: colorTheme.lightSurface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: const Color(0xFFE2E8F0),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorTheme.lightSurface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              BorderSide(color: colorTheme.lightPrimary, width: 1.5),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorTheme.lightPrimary,
          foregroundColor: _onColor(colorTheme.lightPrimary),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorTheme.lightPrimary,
        foregroundColor: _onColor(colorTheme.lightPrimary),
      ),
    );
    return AppFontTheme.applyRedesign(base, fontOption);
  }

  static ThemeData dark({
    AppFontOption fontOption = AppFontOption.appDefault,
    AppColorTheme colorTheme = AppColorTheme.defaults,
  }) {
    final colorScheme = ColorScheme.dark(
      primary: colorTheme.darkPrimary,
      secondary: colorTheme.darkSecondary,
      tertiary: colorTheme.darkTertiary,
      surface: colorTheme.darkSurface,
      background: colorTheme.darkBg,
      error: AppColors.red,
      onPrimary: _onColor(colorTheme.darkPrimary),
      onSecondary: _onColor(colorTheme.darkSecondary),
      onTertiary: AppColors.white,
      onSurface: AppColors.white,
      onBackground: AppColors.white,
      onError: AppColors.white,
      surfaceVariant: colorTheme.darkSurface,
      onSurfaceVariant: AppColors.slate400,
      outline: const Color(0xFF34384A),
    );

    final base = ThemeData(
      useMaterial3: true,
      fontFamily: fontOption.fontFamily,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorTheme.darkBg,
      snackBarTheme: _snackBarTheme(),
      dividerColor: const Color(0xFF34384A),
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: colorTheme.darkBg,
        foregroundColor: AppColors.white,
      ),
      cardTheme: CardThemeData(
        color: colorTheme.darkSurface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: const Color(0xFF34384A)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorTheme.darkSurface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: const Color(0xFF34384A)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: const Color(0xFF34384A)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              BorderSide(color: colorTheme.darkPrimary, width: 1.5),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorTheme.darkPrimary,
          foregroundColor: _onColor(colorTheme.darkPrimary),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorTheme.darkPrimary,
        foregroundColor: _onColor(colorTheme.darkPrimary),
      ),
    );
    return AppFontTheme.applyRedesign(base, fontOption);
  }

  static Color _onColor(Color bg) {
    final lum = bg.computeLuminance();
    return lum > 0.5 ? AppColors.black : AppColors.white;
  }

  static SnackBarThemeData _snackBarTheme() {
    return SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColors.slate700,
      contentTextStyle: const TextStyle(
        color: AppColors.white,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      insetPadding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
      elevation: 0,
    );
  }
}
