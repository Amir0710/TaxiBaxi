import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  ThemeData get themeData {
    final darkThemePrimarySurfaceColor = Colors.grey.shade900;
    final darkThemeSecondarySurfaceColor = Colors.deepOrangeAccent.shade200;
    final darkIconBackground = Colors.deepOrange.shade700;
    final darkButtonColor = Colors.orange.shade200;
    final darkShadowColor = Colors.yellow.shade200;
    final darkThemeTextColor = Colors.grey.shade100;
    final lightThemePrimarySurfaceColor = Colors.blue.shade100;
    final lightThemeSecondarySurfaceColor = Colors.cyanAccent.shade200;
    final lightIconBackground = Colors.cyan.shade500;
    final lightShadowColor = Colors.blue.shade200;
    final lightButtonColor = Colors.lightBlueAccent.shade200;
    final lightThemeTextColor = Colors.grey.shade800;

    final shadowColor = _isDarkTheme ? darkShadowColor : lightShadowColor;
    final buttonColor = _isDarkTheme ? darkButtonColor : lightButtonColor;
    final iconBackground = _isDarkTheme ? darkIconBackground : lightIconBackground;
    final primarySurface = _isDarkTheme ? darkThemePrimarySurfaceColor : lightThemePrimarySurfaceColor;
    final secondarySurface = _isDarkTheme ? darkThemeSecondarySurfaceColor : lightThemeSecondarySurfaceColor;
    final textColor = _isDarkTheme ? darkThemeTextColor : lightThemeTextColor;

    return ThemeData(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      scaffoldBackgroundColor: primarySurface,
      appBarTheme: AppBarTheme(
        toolbarHeight: 70,
        color: secondarySurface,
        shape: const OutlineInputBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
          borderSide: BorderSide.none,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.grey.shade200,
        hintStyle: TextStyle(color: textColor, fontFamily: 'Abeezee'),
        labelStyle: TextStyle(
          color: secondarySurface,
          fontFamily: 'Abeezee',
          fontWeight: FontWeight.w900,
          fontSize: 18,
        ),
        counterStyle: TextStyle(
          color: textColor,
          fontFamily: 'Abeezee',
          fontWeight: FontWeight.w900,
          fontSize: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: secondarySurface,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontFamily: 'Pacifico',
          fontSize: 34,
          fontWeight: FontWeight.w400,
          color: textColor,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'Abeezee',
          fontSize: 26,
          fontWeight: FontWeight.w800,
          color: textColor,
        ),
        headlineSmall: TextStyle(
          fontFamily: 'Abeezee',
          fontSize: 16,
          fontWeight: FontWeight.w800,
          color: textColor,
        ),
        bodySmall: TextStyle(
          fontFamily: 'Abeezee',
          fontSize: 16,
          fontWeight: FontWeight.w800,
          color: lightThemeTextColor,
        ),
        displayLarge: TextStyle(color: iconBackground),
        displayMedium: TextStyle(color: buttonColor),
        displaySmall: TextStyle(color: shadowColor),
      ),
      useMaterial3: true,
    );
  }
}
