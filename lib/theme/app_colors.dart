import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color primaryColor;
  final Color secondaryColor;
  final Color bgColor;
  final Color lineColor;

  const AppColors({
    required this.primaryColor,
    required this.secondaryColor,
    required this.bgColor,
    required this.lineColor,
  });

  @override
  AppColors copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? bgColor,
    Color? lineColor,
  }) {
    return AppColors(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      bgColor: bgColor ?? this.bgColor,
      lineColor: lineColor ?? this.lineColor,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t)!,
      bgColor: Color.lerp(bgColor, other.bgColor, t)!,
      lineColor: Color.lerp(lineColor, other.lineColor, t)!,
    );
  }
}
