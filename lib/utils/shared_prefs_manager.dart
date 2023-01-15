import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefManager {

  // get the theme mode from shared preferences
  Future<ThemeMode> getThemeMode() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int? themeModeIndex = sharedPreferences.getInt('app_theme_mode');
    return ThemeMode.values[themeModeIndex ?? ThemeMode.values.first.index];
  }

  // set the theme mode to shared preferences
  Future<void> setThemeMode(ThemeMode themeMode) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setInt('app_theme_mode', themeMode.index);
  }

}