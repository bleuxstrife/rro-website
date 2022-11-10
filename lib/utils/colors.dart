import 'package:flutter/material.dart';

class AppColors {
  const AppColors(); // this basically makes it so you can instantiate this class

  static const int _primaryPrimaryValue = 0xff052158;
  static const Map<int, Color> primaryColorList = <int, Color>{
    0: Color(0xffffffff),
    50: Color(0xffe5e8f1),
    100: Color(0xffbec6dc),
    200: Color(0xff94a2c5),
    300: Color(0xff6c7fad),
    400: Color(0xff4c649d),
    500: Color(0xff2a4a8f),
    600: Color(0xff234386),
    700: Color(0xff1a3a7b),
    800: Color(0xff12316f),
    900: Color(_primaryPrimaryValue)
  };

  static const int _accentPrimaryValue = 0xfff3f3f5;
  static const Map<int, Color> accentColorList = <int, Color>{
    50: Color(0xfff9f9fb),
    100: Color(0xfff3f3f5),
    200: Color(0xffebebed),
    300: Color(0xffdcdcde),
    400: Color(0xffb8b8ba),
    500: Color(0xff99999a),
    600: Color(0xff707072),
    700: Color(0xff5c5c5e),
    800: Color(0xff3e3e3f),
    900: Color(0xff1d1d1e)
  };

  static const MaterialColor primary = MaterialColor(
    _primaryPrimaryValue,
    primaryColorList,
  );

  static const MaterialColor accent = MaterialColor(
    _accentPrimaryValue,
    accentColorList,
  );
}

Color systemPrimaryColor = AppColors.primary[900]!;
Color systemDarkPrimaryColor = AppColors.primary[900]!;
Color systemAccentColor = AppColors.accent[100]!;
Color systemBackgroudColor = AppColors.primary[100]!; Color systemWhiteColor = AppColors.primary[50]!;
const Color systemRedColor = Color(0xffd81920);
