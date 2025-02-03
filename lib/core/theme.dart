import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightMode = ThemeData(
      brightness: Brightness.light,
      textTheme: TextTheme(
        bodyLarge: TextStyle(
            inherit: true,
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.w600),
        bodyMedium: TextStyle(
            inherit: true,
            color: Colors.black,
            fontSize: 14.0,
            fontWeight: FontWeight.w500),
        // ...other text styles...
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[300], // Light background color
          foregroundColor: Colors.black, // Dark text/icon color
          disabledForegroundColor: Colors.grey,
          disabledBackgroundColor: Colors.grey[300],
          shadowColor: Colors.black,
          surfaceTintColor: Colors.blue[100],
          iconColor: Colors.black,
          disabledIconColor: Colors.grey,
          overlayColor: Colors.blue.withOpacity(0.1),
          elevation: 5,
          textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        
          side: BorderSide(color: Colors.blue, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledMouseCursor: SystemMouseCursors.click,
          disabledMouseCursor: SystemMouseCursors.forbidden,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          animationDuration: Duration(milliseconds: 200),
          enableFeedback: true,
          alignment: Alignment.center,
          splashFactory: InkRipple.splashFactory,
        ),
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w800,
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          overlayColor: WidgetStateProperty.all(Colors.amber.withAlpha(102)),

          splashFactory:
              InkRipple.splashFactory, 
        ),
        
      ));

  static ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    textTheme: TextTheme(
      bodyLarge: TextStyle(
          inherit: true,
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.w600),
      bodyMedium: TextStyle(
          inherit: true,
          color: Colors.white,
          fontSize: 14.0,
          fontWeight: FontWeight.w500),
      // ...other text styles...
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[700], // Dark background color
        foregroundColor: Colors.white, // Light text/icon color
        disabledForegroundColor: Colors.grey,
        disabledBackgroundColor: Colors.grey[700],
        shadowColor: Colors.white,
        surfaceTintColor: Colors.blue[900],
        iconColor: Colors.white,
        disabledIconColor: Colors.grey,
        overlayColor: Colors.blue.withOpacity(0.1),
        elevation: 5,
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        minimumSize: Size(100, 50),
        fixedSize: Size(150, 50),
        maximumSize: Size(200, 50),
        side: BorderSide(color: Colors.blue, width: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledMouseCursor: SystemMouseCursors.click,
        disabledMouseCursor: SystemMouseCursors.forbidden,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        animationDuration: Duration(milliseconds: 200),
        enableFeedback: true,
        alignment: Alignment.center,
        splashFactory: InkRipple.splashFactory,
      ),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.white,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w800,
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),
  );
}
