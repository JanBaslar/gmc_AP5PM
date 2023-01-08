import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsHolder with ChangeNotifier {
  static bool _filter = false;
  static bool _arePositive = true;
  static bool _filterControversial = true;

  SettingsHolder() {
    loadSettings();
  }

  Future<void> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('filter')) {
      _filter = prefs.getBool('filter')!;
    } else {
      prefs.setBool('filter', _filter);
    }

    if (prefs.containsKey('arePositive')) {
      _arePositive = prefs.getBool('arePositive')!;
    } else {
      prefs.setBool('arePositive', _arePositive);
    }

    if (prefs.containsKey('filterControversial')) {
      _filterControversial = prefs.getBool('filterControversial')!;
    } else {
      prefs.setBool('filterControversial', _filterControversial);
    }
  }

  bool getFilter() {
    return _filter;
  }

  bool getArePositive() {
    return _arePositive;
  }

  bool getFilterControversial() {
    return _filterControversial;
  }

  String getModeValue() {
    if (!_filter) {
      return 'mixed';
    } else if (_arePositive) {
      return 'positive';
    } else {
      return 'negative';
    }
  }

  Future<void> changeModeSettings(String mode) async {
    final prefs = await SharedPreferences.getInstance();

    switch (mode) {
      case 'mixed':
        _filter = false;
        break;
      case 'positive':
        _filter = true;
        _arePositive = true;
        break;
      case 'negative':
        _filter = true;
        _arePositive = false;
    }

    prefs.setBool('filter', _filter);
    prefs.setBool('arePositive', _arePositive);
  }

  Future<void> switchFilterControversial() async {
    final prefs = await SharedPreferences.getInstance();
    _filterControversial = !_filterControversial;
    prefs.setBool('filterControversial', _filterControversial);
  }
}
