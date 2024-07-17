import 'package:flutter/material.dart';

mixin ColorPallete {
  static const Color neroDark = Color(0xFF002765);
  static const Color neroLight = Color(0xFFD9E3F2);
  static const Color neroNearWhite = Color(0xFFE6ECF6);
  static const Color white = Color(0xFFFFFFFF);
  static const Color neroGrey = Color(0xFFA4AFBE);
}

final ThemeData myTheme = ThemeData(
  primaryColor: ColorPallete.neroDark,
  secondaryHeaderColor: ColorPallete.neroLight,
  hoverColor: ColorPallete.neroGrey,
  fontFamily: 'SpaceGrotesk',
  textTheme: const TextTheme(
    bodyText1:
        TextStyle(fontFamily: 'SpaceGrotesk', fontWeight: FontWeight.w400),
  ),
);

enum AppTextStyle {
  light,
  regular,
  medium,
  semiBold,
  bold,
}

enum AppTextSize { xs, small, mediumSize, large, xl }

enum AppTextColor {
  primary,
  secondary,
  nearWhite,
  grey,
  white,
}

extension TextStyleExtension on TextStyle {
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);

  TextStyle get xs => copyWith(fontSize: 10.0);
  TextStyle get small => copyWith(fontSize: 14.0);
  TextStyle get mediumSize => copyWith(fontSize: 16.0);
  TextStyle get large => copyWith(fontSize: 24.0);
  TextStyle get xl => copyWith(fontSize: 28.0);

  TextStyle myColor(AppTextColor textColor) {
    switch (textColor) {
      case AppTextColor.primary:
        return copyWith(color: ColorPallete.neroDark);
      case AppTextColor.secondary:
        return copyWith(color: ColorPallete.neroLight);
      case AppTextColor.nearWhite:
        return copyWith(color: ColorPallete.neroNearWhite);
      case AppTextColor.grey:
        return copyWith(color: ColorPallete.neroGrey);
      case AppTextColor.white:
        return copyWith(color: ColorPallete.white);
      default:
        return copyWith(color: ColorPallete.neroDark);
    }
  }
}
