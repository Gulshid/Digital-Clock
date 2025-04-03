import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SwitchProvider  with ChangeNotifier{
  
  bool _isSwitch = true;
  bool get IsSwitch => _isSwitch;

  void toggle_Switch(bool val) {
    _isSwitch = val;
    notifyListeners();
  }


  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  ThemeMode get themeMode => _isDarkMode ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      textTheme: TextTheme(bodyLarge: TextStyle(color: Colors.black)),
      iconTheme: IconThemeData(color: Colors.black),
    );
  }

  ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey[900],
        foregroundColor: Colors.white,
      ),
      textTheme: TextTheme(bodyLarge: TextStyle(color: Colors.white)),
      iconTheme: IconThemeData(color: Colors.white),
    );
  }
}