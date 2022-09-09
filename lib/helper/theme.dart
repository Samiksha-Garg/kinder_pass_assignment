import 'constants.dart';
import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    primaryTextTheme: textTheme(),
    backgroundColor: kPrimaryColor,
    accentColor: kSecondaryColor,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Poppins",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: kTextColor, // This is a custom color variable
      ),
    ),
    // visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: const BorderSide(color: kTextColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

TextTheme textTheme() {
  return const TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
  ).apply(
    bodyColor: kTextColor,
    displayColor: kTextColor,
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: kSecondaryColor,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: kTextColor),
    titleTextStyle: TextStyle(
        color: kTextColor,
        fontSize: 20,
        fontFamily: "Poppins",
        fontWeight: FontWeight.bold),
  );
}
