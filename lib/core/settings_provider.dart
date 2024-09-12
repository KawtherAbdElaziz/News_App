import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  String _currentLanguage = "en";
  ThemeMode _currentThemeMode = ThemeMode.light;

  SettingsProvider() {
    _loadPreferences();
  }

  String get currentLanguage => _currentLanguage;

  ThemeMode get currentThemeMode => _currentThemeMode;

  void _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    _currentLanguage = prefs.getString('language') ?? 'en';
    _currentThemeMode = ThemeMode.values[prefs.getInt('themeMode') ?? 0];
    notifyListeners();
  }

  void _savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', _currentLanguage);
    await prefs.setInt('themeMode', _currentThemeMode.index);
  }

  void changeCurrentLanguage(String newLanguage) {
    if (_currentLanguage == newLanguage) return;
    _currentLanguage = newLanguage;
    _savePreferences();
    notifyListeners();
  }

  void changeCurrentTheme(ThemeMode newTheme) {
    if (_currentThemeMode == newTheme) return;
    _currentThemeMode = newTheme;
    _savePreferences();
    notifyListeners();
  }

  String getSplashScreenImage() {
    return currentThemeMode == ThemeMode.dark
        ? "assets/images/splashlight.png"
        : "assets/images/splashlight.png";
  }

  bool isDark() {
    return (_currentThemeMode == ThemeMode.dark);
  }
}
