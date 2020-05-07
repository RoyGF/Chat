import 'dart:async';

import 'package:chat_flutter/src/utils/regex_validations.dart';

import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class LoginBloc with _LoginValidators {
  final _passwordController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();

  Stream<String> get passwordStream =>
      _passwordController.transform(validatePassword);
  Stream<String> get emailStream =>
      _emailController.stream.transform(validateEmail);

  Stream<bool> get formValidStream => CombineLatestStream.combine2(
      passwordStream, emailStream, (password, email) => true);

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  dispose() {
    _passwordController?.close();
    _emailController?.close();
  }
}

class _LoginValidators {
  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length >= 6) {
      sink.add(password);
    } else {
      sink.addError('Más de 6 caracteres por favor'); //TODO localize this text
    }
  });

  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (RegexUtils.matchesEmail(email)) {
      sink.add(email);
    } else {
      sink.addError('Not a valid email'); // TODO localize this text
    }
  });
}
