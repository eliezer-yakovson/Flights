import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/Flight.dart';

class LocalStore {
  

  void AddFlight(String key, Flight value) async {
    final prefs = await SharedPreferences.getInstance();
    final cocktailJson = jsonEncode(value.toJson());
    await prefs.setString(key, cocktailJson);
  }

  void removeFlight(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }


  Future<List<Flight>> getAllStrings() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final allKeys = prefs?.getKeys();
     final List<Flight> result =[];
      if (allKeys != null) {
        for (final key in allKeys) {
          final value = prefs.getString(key);
          if (value != null) {
            final Map<String, dynamic> FlightMap = jsonDecode(value);
            final temp = Flight.fromJson(FlightMap);
            result.add(temp);
          }
        }
      }
      return result;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return List.empty();
  }

  // void clearAllData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.clear();

  // }
}
