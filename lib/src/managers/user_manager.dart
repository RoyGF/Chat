import 'package:chat_flutter/src/models/user.dart';
import 'package:chat_flutter/src/utils/shared_preferences.dart';

class UserManager {
  LocalPrefs _localPrefs;

  UserManager() {
    _localPrefs = LocalPrefs();
  }

  void saveUser(String userName) {
    User user = User(name: userName);
    _localPrefs.setUserString(userToJson(user));
  }

  Future<User> getUser() async {
    String userString = await _localPrefs.getUserString();
    User user = userFromJson(userString);
    return user;
  }
}
