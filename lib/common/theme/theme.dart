import 'package:flutter/material.dart';

// Reusable design components throughout the app

// SPACING
const smallHorizontalSpacing = SizedBox(width: 10);
const mediumHorizontalSpacing = SizedBox(width: 20);
const bigHorizontalSpacing = SizedBox(width: 40);

const smallVerticalSpacing = SizedBox(height: 10);
const mediumVerticalSpacing = SizedBox(height: 20);
const bigVerticalSpacing = SizedBox(height: 40);

// FONTS
const mediumFontSize = 16.0;
const labelFontSize = 12.0;

enum AppTextSize { medium, label, headline }

extension FontSize on AppTextSize {
  double getSize() {
    return switch (this) {
      AppTextSize.label => 12.0,
      AppTextSize.medium => 16.0,
      AppTextSize.headline => 16.0,
    };
  }
}

class AppText extends StatelessWidget {
  const AppText(
    this.text, {
    super.key,
    required this.size,
    this.overflow,
    this.weight,
    this.color,
  });

  final String text;
  final AppTextSize size;

  // Optional properties
  final TextOverflow? overflow;
  final FontWeight? weight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        fontWeight: size == AppTextSize.headline ? FontWeight.w600 : weight,
        fontSize: size.getSize(),
        color: color,
      ),
    );
  }
}

final Color customPrimaryColor = const Color(
  0xFF5C5EA6,
); // HEX for (92, 94, 166)

final MaterialColor customPrimarySwatch =
    MaterialColor(customPrimaryColor.value, <int, Color>{
      50: const Color(0xFFEDEEF6),
      100: const Color(0xFFD2D4E9),
      200: const Color(0xFFB4B7DB),
      300: const Color(0xFF969ACD),
      400: const Color(0xFF7E82BF),
      500: customPrimaryColor,
      600: const Color(0xFF54569E),
      700: const Color(0xFF4A4C93),
      800: const Color(0xFF414389),
      900: const Color(0xFF2F3278),
    });

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: customPrimarySwatch,
  scaffoldBackgroundColor: Colors.white,
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: customPrimarySwatch,
);
