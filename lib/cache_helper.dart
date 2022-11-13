import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static setString(String key, String value) async {
    return await sharedPreferences?.setString(key, value);
  }

  static get(String key) {
    return sharedPreferences?.get(key);
  }
}
