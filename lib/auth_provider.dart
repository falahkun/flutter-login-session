import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider {
  static SharedPreferences _sharedPref;

  static Future<void> login(String token) async {
    _saveSession(token);
  }

  static Future<void> signOut() async {
    _removeSession();
  }

  static Future<String> getCurrentSession() async {
    return await _currentAccessToken();
  }

  static Future<void> _saveSession(String token) async {
    print(token);
    _sharedPref = await SharedPreferences.getInstance();
    await _sharedPref.setString("token", token);
  }

  static Future<void> _removeSession() async {
    _sharedPref = await SharedPreferences.getInstance();
    await _sharedPref.clear();
  }

  static Future<String> _currentAccessToken() async {
    _sharedPref = await SharedPreferences.getInstance();
    return _sharedPref.getString("token");
  }
}
