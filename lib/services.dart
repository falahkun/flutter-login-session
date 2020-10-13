// import 'dart:async';

// class Services {
//   static Future<String> getToken() async {
//     await Future.delayed(Duration(seconds: 1));
//     return "963ff4843e6043062fd84fc8c52321e8fd2fc0e91edbf66bc92a0da68a0fbff0";
//   }

// static Stream<String> get _token => Stream.fromFuture(getToken());

//   static StreamController<String> get token =>
//       StreamController.broadcast();
// }

import 'dart:async';

// import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Services {
  static SharedPreferences _sharedPreferences;

  static Future<String> getToken() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    String token = _sharedPreferences.getString('token3');
    _changeAuthState(token);
    return token;
  }

  // static Stream<String> get _tokenStreamFuture => Stream.fromFuture(getToken());

  static StreamController<String> get _tokenController =>
      StreamController.broadcast();

  static Future<void> setPref(String token) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    await _sharedPreferences.setString('token3', token);
    _changeAuthState(token);
  }

  static Future<void> removePref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    await _sharedPreferences.clear();
    _changeAuthState(null);
  }

  static Future<void> dispose() => _tokenController.close();

  static Future<void> _changeAuthState(String token) async {
    _tokenController.sink.add(token);
  }

  static Stream<String> get token => _tokenController.stream;
}
