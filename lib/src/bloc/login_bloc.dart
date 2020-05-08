import 'dart:async';

import 'package:chat_flutter/src/managers/user_manager.dart';
import 'package:chat_flutter/src/models/user.dart';

import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class LoginBloc with _LoginValidators {
  final _nameController = BehaviorSubject<String>();

  Stream<String> get formValidName => _nameController.stream.transform(validateName);

  Function(String) get changeName => _nameController.sink.add;

  dispose() {
    _nameController.close();
  }
}

class _LoginValidators {
  final validateName =
      StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    if (name.length > 6) {
      sink.add(name);
    } else {
      sink.addError('Más de 6 caracteres por favor');
    }
  });
}
