import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyTheme with ChangeNotifier {

  static bool _isDark = true;

  static bool _wasLoaded = false;

  MyTheme() {
    loadTheme();
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('currentTheme')) {
      _isDark = prefs.getBool('currentTheme')!;
    } else {
      prefs.setBool('currentTheme', _isDark);
    }
    _wasLoaded = true;
  }

  bool isDark() {
    return _isDark;
  }

  ThemeMode currentTheme() {
    if (!_wasLoaded) {
      loadTheme().then((_) => notifyListeners());
    }
    return _isDark ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> switchTheme() async {
    final prefs = await SharedPreferences.getInstance();
    _isDark = !_isDark;
    prefs.setBool('currentTheme', _isDark);
    notifyListeners();
  }
}