import 'package:flutter/material.dart';

/// every bloc file should be inherited from this class.
class BaseBlocProvider extends InheritedWidget {
  static BaseBlocProvider _instance;

  factory BaseBlocProvider({Key key, Widget child}) {
    if (_instance == null) {
      _instance = new BaseBlocProvider._internal(key: key, child: child);
    }
    return _instance;
  }

  BaseBlocProvider._internal({Key key, Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}

/// functions for handling global exceptions in base class
/// exceptions like: no internet, socket timeout, etc.
abstract class BaseContract {
  void onError(Object obj);
  void onShowProgress();
  void onHideProgress();
}
