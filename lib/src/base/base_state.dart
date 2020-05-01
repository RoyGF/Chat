import 'dart:io';

import 'package:chat_flutter/src/base/base_bloc.dart';
import 'package:chat_flutter/src/base/base_stateful_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class BaseState<B extends BaseStatefulWidget> extends State<B>
    implements BaseContract {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final formKey = new GlobalKey<FormState>();
  BuildContext context;
  bool _isLoading = false;

  /// show progress bar
  void showProgress() {
    setState(() {
      _isLoading = true;
    });
  }

  /// hide progress bar
  void hideProgress() {
    setState(() {
      _isLoading = true;
    });
  }

  /// shows alert dialog using iOS style
  void _showIOSDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        content: Text(message),
        actions: <Widget>[
          CupertinoDialogAction(
            child: new Text('ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  /// shows alert dialog using android style
  void _showAndroidDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: Text(message),
        actions: <Widget>[
          CupertinoDialogAction(
            child: new Text('ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  /// show message: toast on android or alert dialog on ios
  void showMessage(String message) {
    if (message == null || message.isEmpty) {
      return;
    }
    Platform.isIOS ? _showIOSDialog(message) : _showAndroidDialog(message);
  }

  /// hide keyboard
  void hideKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  /// should be overriden in extended widget
  Widget getLayout();
  
  /// shows a progress indicator
  Widget getProgress(){
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    if (_isLoading) {
      return Stack(
        children: <Widget>[
          getLayout(), getProgress(),]
      );
    } 
    return getLayout();
  }

  /// error handler
  @override
  void onError(Object err, {StackTrace stackTrace}) {
    hideProgress();
    if (stackTrace != null) print(stackTrace);
    if (err is SocketException) {
       // TODO manage socket exception 
    } 
    // TODO manage wrong file exception
  }

  @override
  void onHideProgress() {
    hideProgress();
  }

  @override
  void onShowProgress() {
    showProgress();
  }
}