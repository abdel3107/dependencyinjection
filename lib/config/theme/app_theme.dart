import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    // fontFamily: 'Muli',
    appBarTheme: _appBarTheme(),
    dialogTheme: _dialogTheme(),
    useMaterial3: true,
    primaryColor: Colors.deepOrange,
    inputDecorationTheme: const InputDecorationTheme(
    ),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.deepOrange,

    ),
  );
}

DialogTheme _dialogTheme(){
  return const DialogTheme(
    // backgroundColor: Color.fromRGBO(255, 87, 34, 20),
    backgroundColor: Colors.white,
    contentTextStyle: TextStyle(
      color: Colors.white,
      decorationColor: Colors.white,
      backgroundColor: Colors.white
    ),

  );
}

AppBarTheme _appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 2,
    centerTitle: true,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 18
    ),

  );
}