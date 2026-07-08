import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum AppFontOption {
  appDefault(
    storageValue: 'default',
    label: 'Default',
  ),
  sfProDisplay(
    storageValue: 'sf_pro_display',
    label: 'SF Pro Display',
  ),
  matterhorn(
    storageValue: 'matterhorn',
    label: 'Matterhorn',
  ),
  california(
    storageValue: 'california',
    label: 'California',
  );

  const AppFontOption({
    required this.storageValue,
    required this.label,
  });

  final String storageValue;
  final String label;

  String get fontFamily {
    switch (this) {
      case AppFontOption.appDefault:
        return 'Space Grotesk';
      case AppFontOption.sfProDisplay:
        return 'SF Pro Display';
      case AppFontOption.matterhorn:
        return 'Matterhorn';
      case AppFontOption.california:
        return 'California';
    }
  }

  static AppFontOption fromStorage(String? value) {
    for (final option in AppFontOption.values) {
      if (option.storageValue == value) {
        return option;
      }
    }
    return AppFontOption.appDefault;
  }
}

class AppFontTheme {
  AppFontTheme._();

  static ThemeData applyLegacy(ThemeData base, AppFontOption option) {
    return _applyFont(base, option);
  }

  static ThemeData applyRedesign(ThemeData base, AppFontOption option) {
    return _applyFont(base, option);
  }

  static TextStyle? previewTextStyle(
    TextStyle? base,
    AppFontOption option, {
    required bool redesign,
  }) {
    if (base == null) return null;
    return TextStyle(
      fontFamily: option.fontFamily,
      color: base.color,
      fontSize: base.fontSize,
      fontWeight: base.fontWeight,
      letterSpacing: base.letterSpacing,
      height: base.height,
    );
  }

  static ThemeData _applyFont(ThemeData base, AppFontOption option) {
    switch (option) {
      case AppFontOption.appDefault:
        return base.copyWith(
          textTheme: GoogleFonts.spaceGroteskTextTheme(base.textTheme),
          primaryTextTheme:
              GoogleFonts.spaceGroteskTextTheme(base.primaryTextTheme),
        );
      case AppFontOption.sfProDisplay:
      case AppFontOption.matterhorn:
      case AppFontOption.california:
        return base.copyWith(
          textTheme: base.textTheme.apply(fontFamily: option.fontFamily),
          primaryTextTheme:
              base.primaryTextTheme.apply(fontFamily: option.fontFamily),
        );
    }
  }
}
