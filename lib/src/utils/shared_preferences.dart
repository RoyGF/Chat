import 'package:shared_preferences/shared_preferences.dart';

class LocalPrefs {
  SharedPreferences _prefs;

  static final String _userKey = "user_prefs";

  Future<void> _init() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> setUserString(String user) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString(_userKey, user);
  }

  Future<String> getUserString() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getString(_userKey) ?? '';
  }

  Future<void> deleteUser() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
   await _prefs.remove(_userKey);
  }
}
