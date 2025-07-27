import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.lightBlue,
    colorScheme: ColorScheme.light(
      primary: Colors.lightBlue, // 👈 لتأثيره على textfield, progress, إلخ
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.lightBlue,
        iconTheme: IconThemeData(color: Colors.white),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.lightBlue,
          statusBarIconBrightness: Brightness.light,
        ),
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20, fontWeight: FontWeight.bold)),
    drawerTheme: DrawerThemeData(
      backgroundColor: Colors.white,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) return Colors.lightBlue;
        return Colors.black;
      }),
      trackColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) return Colors.lightBlue.withOpacity(0.5);
        return Colors.grey;
      }),
    ),

    textTheme: TextTheme(
    bodyLarge: TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.black,
        ),
    bodyMedium: TextStyle(fontSize: 12, color: Colors.black),
    bodySmall: TextStyle(fontSize: 12, color:  Colors.red[900]),
    titleMedium: TextStyle(fontSize: 14, color: Colors.black),
    ),

  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Colors.lightBlue,
    colorScheme: ColorScheme.light(
      primary: Colors.lightBlue,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    appBarTheme: AppBarTheme(
    backgroundColor: Colors.lightBlue,
    iconTheme: IconThemeData(color: Colors.white),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.lightBlue,
      statusBarIconBrightness: Brightness.dark,
    ),
    titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20, fontWeight: FontWeight.bold)),
    drawerTheme: DrawerThemeData(
      backgroundColor: Color(0xFF121212),

    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) return Colors.lightBlue;
        return Colors.white;
      }),
      trackColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) return Colors.lightBlue.withOpacity(0.5);
        return Colors.grey;
      }),
    ),

    textTheme: TextTheme(
    bodyLarge: const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(fontSize: 12, color: Colors.grey[200]),
    bodySmall: TextStyle(fontSize: 12, color:  Colors.red[900]),
    titleMedium: TextStyle(fontSize: 14, color: Colors.black),
    ),
  );
}