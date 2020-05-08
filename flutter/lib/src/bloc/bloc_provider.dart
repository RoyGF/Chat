import 'package:chat_flutter/src/bloc/login_bloc.dart';
import 'package:flutter/material.dart';

class BlocProvider extends InheritedWidget {
  static BlocProvider _instance;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  // Constructor
  factory BlocProvider({Key key, Widget child}) {
    if (_instance == null) {
      _instance = new BlocProvider._internal(key: key, child: child);
    }
    return _instance;
  }

  BlocProvider._internal({Key key, Widget child})
      : super(key: key, child: child);

  /// bloc object which manages user login validators
  final loginBloc = LoginBloc();

  /// provides LoginBloc object
  static LoginBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BlocProvider>().loginBloc;
  }
}
