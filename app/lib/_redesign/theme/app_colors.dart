import 'package:flutter/material.dart';

enum AppColorTheme {
  defaults(
    label: 'Default',
    storageValue: 'default',
    lightPrimary: Color(0xFF6366F1),
    lightSecondary: Color(0xFF3B82F6),
    lightTertiary: Color(0xFFEEF2FF),
    lightBg: Color(0xFFF8FAFC),
    lightSurface: Color(0xFFFFFFFF),
    darkPrimary: Color(0xFF4F46E5),
    darkSecondary: Color(0xFF6366F1),
    darkTertiary: Color(0xFF2A3040),
    darkBg: Color(0xFF161A26),
    darkSurface: Color(0xFF1E2230),
  ),
  theme1(
    label: 'Theme #1',
    storageValue: 'theme1',
    lightPrimary: Color(0xFFAD1312),
    lightSecondary: Color(0xFFDF5620),
    lightTertiary: Color(0xFFF59332),
    lightBg: Color(0xFFDCE6CE),
    lightSurface: Color(0xFFFFF5EE),
    darkPrimary: Color(0xFFCF1A1A),
    darkSecondary: Color(0xFFDF5620),
    darkTertiary: Color(0xFFF59332),
    darkBg: Color(0xFF1A0F10),
    darkSurface: Color(0xFF302529),
  ),
  theme2(
    label: 'Theme #2',
    storageValue: 'theme2',
    lightPrimary: Color(0xFF1B2D45),
    lightSecondary: Color(0xFF336E7F),
    lightTertiary: Color(0xFFA79FA3),
    lightBg: Color(0xFFF0F7FA),
    lightSurface: Color(0xFFFFFFFF),
    darkPrimary: Color(0xFF2C4A6E),
    darkSecondary: Color(0xFF88EBFF),
    darkTertiary: Color(0xFFA79FA3),
    darkBg: Color(0xFF0D1B2A),
    darkSurface: Color(0xFF1B2D45),
  ),
  emerald(
    label: 'Emerald',
    storageValue: 'emerald',
    lightPrimary: Color(0xFF059669),
    lightSecondary: Color(0xFF10B981),
    lightTertiary: Color(0xFFD1FAE5),
    lightBg: Color(0xFFF0FDF4),
    lightSurface: Color(0xFFFFFFFF),
    darkPrimary: Color(0xFF34D399),
    darkSecondary: Color(0xFF10B981),
    darkTertiary: Color(0xFF064E3B),
    darkBg: Color(0xFF022C22),
    darkSurface: Color(0xFF064E3B),
  ),
  sunset(
    label: 'Sunset',
    storageValue: 'sunset',
    lightPrimary: Color(0xFFD97706),
    lightSecondary: Color(0xFFF59E0B),
    lightTertiary: Color(0xFFFEF3C7),
    lightBg: Color(0xFFFFFBEB),
    lightSurface: Color(0xFFFFFFFF),
    darkPrimary: Color(0xFFFBBF24),
    darkSecondary: Color(0xFFF59E0B),
    darkTertiary: Color(0xFF451A03),
    darkBg: Color(0xFF1C0A00),
    darkSurface: Color(0xFF2D1500),
  ),
  ocean(
    label: 'Ocean',
    storageValue: 'ocean',
    lightPrimary: Color(0xFF0891B2),
    lightSecondary: Color(0xFF06B6D4),
    lightTertiary: Color(0xFFCFFAFE),
    lightBg: Color(0xFFECFEFF),
    lightSurface: Color(0xFFFFFFFF),
    darkPrimary: Color(0xFF22D3EE),
    darkSecondary: Color(0xFF06B6D4),
    darkTertiary: Color(0xFF164E63),
    darkBg: Color(0xFF083344),
    darkSurface: Color(0xFF164E63),
  ),
  rose(
    label: 'Rose',
    storageValue: 'rose',
    lightPrimary: Color(0xFFE11D48),
    lightSecondary: Color(0xFFFB7185),
    lightTertiary: Color(0xFFFFE4E6),
    lightBg: Color(0xFFFFF1F2),
    lightSurface: Color(0xFFFFFFFF),
    darkPrimary: Color(0xFFFB7185),
    darkSecondary: Color(0xFFFDA4AF),
    darkTertiary: Color(0xFF4C0519),
    darkBg: Color(0xFF1A0000),
    darkSurface: Color(0xFF2D0000),
  ),
  lavender(
    label: 'Lavender',
    storageValue: 'lavender',
    lightPrimary: Color(0xFF7C3AED),
    lightSecondary: Color(0xFFA78BFA),
    lightTertiary: Color(0xFFEDE9FE),
    lightBg: Color(0xFFF5F3FF),
    lightSurface: Color(0xFFFFFFFF),
    darkPrimary: Color(0xFFA78BFA),
    darkSecondary: Color(0xFFC4B5FD),
    darkTertiary: Color(0xFF2E1065),
    darkBg: Color(0xFF1E0040),
    darkSurface: Color(0xFF2E1065),
  );

  const AppColorTheme({
    required this.label,
    required this.storageValue,
    required this.lightPrimary,
    required this.lightSecondary,
    required this.lightTertiary,
    required this.lightBg,
    required this.lightSurface,
    required this.darkPrimary,
    required this.darkSecondary,
    required this.darkTertiary,
    required this.darkBg,
    required this.darkSurface,
  });

  final String label;
  final String storageValue;
  final Color lightPrimary;
  final Color lightSecondary;
  final Color lightTertiary;
  final Color lightBg;
  final Color lightSurface;
  final Color darkPrimary;
  final Color darkSecondary;
  final Color darkTertiary;
  final Color darkBg;
  final Color darkSurface;

  static AppColorTheme fromStorage(String? value) {
    for (final theme in AppColorTheme.values) {
      if (theme.storageValue == value) return theme;
    }
    return AppColorTheme.defaults;
  }
}

class AppColors {
  AppColors._();

  static const Color red = Color(0xFFEF4444);
  static const Color incomeSuccess = Color(0xFF10B981);
  static const Color amber = Color(0xFFF59E0B);
  static const Color blue = Color(0xFF3B82F6);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static const Color slate200 = Color(0xFFE2E8F0);
  static const Color slate400 = Color(0xFF94A3B8);
  static const Color slate500 = Color(0xFF64748B);
  static const Color slate600 = Color(0xFF475569);
  static const Color slate700 = Color(0xFF334155);
  static const Color slate800 = Color(0xFF1E293B);
  static const Color slate900 = Color(0xFF0F172A);

  static const Color darkCard = Color(0xFF1E2230);
  static const Color darkBorder = Color(0xFF34384A);
  static const Color darkMuted = Color(0xFF2A3040);

  static bool isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  static Color background(BuildContext context) =>
      Theme.of(context).scaffoldBackgroundColor;

  static Color cardColor(BuildContext context) =>
      Theme.of(context).cardTheme.color ?? white;

  static Color textPrimary(BuildContext context) =>
      isDark(context) ? white : slate900;

  static Color textSecondary(BuildContext context) =>
      isDark(context) ? slate400 : slate500;

  static Color textTertiary(BuildContext context) =>
      isDark(context) ? slate500 : slate400;

  static Color borderColor(BuildContext context) =>
      isDark(context) ? darkBorder : const Color(0xFFE2E8F0);

  static Color surfaceColor(BuildContext context) =>
      Theme.of(context).colorScheme.surface;

  static Color mutedFill(BuildContext context) =>
      isDark(context) ? darkMuted : slate200;

  static const Color primaryLight = Color(0xFF6366F1);
  static const Color primaryDark = Color(0xFF4F46E5);
}
