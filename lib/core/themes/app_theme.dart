import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static Color lightBackgroundColor = const Color(0xfff9f7fb);
  static Color lightPrimaryColor = const Color(0xffb69a63);
  static Color lightAccentColor = Colors.blueGrey.shade200;

  static Color darkColor = Colors.black;
  static Color darkAccentColor = const Color(0xff1F2029);
  static Color darkerAccentColor = const Color(0xff2f2f2f);
  static Color darkPrimaryColor = const Color(0xffb69a63);
  static Color darkSecondaryColor = Colors.white;
  static Color darkBackgroundColor = Colors.black;
  static Color bottomNavBarColor = const Color(0xff1F2029);

  static Color errorColor = Colors.redAccent;
  static Color disabledColor = const Color(0xffe0e0e0);

  const AppTheme._();

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: lightPrimaryColor,
    primaryColorDark: darkAccentColor,
    backgroundColor: lightBackgroundColor,
    scaffoldBackgroundColor: lightBackgroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: lightAccentColor),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: darkPrimaryColor,
    primaryColorDark: darkColor,
    highlightColor: darkAccentColor,
    shadowColor: darkerAccentColor,
    errorColor: errorColor,
    disabledColor: disabledColor,
    secondaryHeaderColor: darkSecondaryColor,
    backgroundColor: darkAccentColor,
    scaffoldBackgroundColor: darkBackgroundColor,
    bottomAppBarColor: bottomNavBarColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static Brightness get currentSystemBrightness =>
      SchedulerBinding.instance!.window.platformBrightness;

  static setStatusBarAndNavigationBarColors(ThemeMode themeMode) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
        systemNavigationBarIconBrightness:
            themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
        systemNavigationBarColor: themeMode == ThemeMode.light
            ? lightBackgroundColor
            : darkBackgroundColor,
        systemNavigationBarDividerColor: Colors.transparent));
  }
}
