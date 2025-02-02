import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData darkTheme() {
  const primaryColor = Color(0xFF4C79D3);
  const secondaryColor = Color(0xFF4E0070);
  const bgColor = Color(0xFF313336);
  const lineColor = Colors.white;
  return ThemeData(
    brightness: Brightness.light,
    primarySwatch: getMaterialColor(primaryColor),
    scaffoldBackgroundColor: bgColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor.withOpacity(.65)),
    tabBarTheme: const TabBarTheme(
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 5,
            color: secondaryColor,
          ),
        ),
      ),
    ),
    checkboxTheme: const CheckboxThemeData(
      fillColor: MaterialStatePropertyAll(primaryColor),
    ),
    dividerColor: lineColor,
    extensions: const [
      AppColors(
        primaryColor: primaryColor,
        secondaryColor: secondaryColor,
        bgColor: bgColor,
        lineColor: lineColor,
      ),
    ],
  );
}

ThemeData lightTheme() {
  const primaryColor = Color(0xFF4E0070);
  const secondaryColor = Color(0xFF4C79D3);
  const bgColor = Colors.white;
  const lineColor = Colors.grey;
  return ThemeData(
    brightness: Brightness.light,
    primarySwatch: getMaterialColor(primaryColor),
    scaffoldBackgroundColor: bgColor,
    tabBarTheme: const TabBarTheme(
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 5,
            color: secondaryColor,
          ),
        ),
      ),
    ),
    dividerColor: lineColor,
    extensions: const [
      AppColors(
        primaryColor: primaryColor,
        secondaryColor: secondaryColor,
        bgColor: bgColor,
        lineColor: lineColor,
      ),
    ],
  );
}

MaterialColor getMaterialColor(Color color) {
  final int red = color.red;
  final int green = color.green;
  final int blue = color.blue;

  final Map<int, Color> shades = {
    50: Color.fromRGBO(red, green, blue, .1),
    100: Color.fromRGBO(red, green, blue, .2),
    200: Color.fromRGBO(red, green, blue, .3),
    300: Color.fromRGBO(red, green, blue, .4),
    400: Color.fromRGBO(red, green, blue, .5),
    500: Color.fromRGBO(red, green, blue, .6),
    600: Color.fromRGBO(red, green, blue, .7),
    700: Color.fromRGBO(red, green, blue, .8),
    800: Color.fromRGBO(red, green, blue, .9),
    900: Color.fromRGBO(red, green, blue, 1),
  };
  return MaterialColor(color.value, shades);
}
