import 'package:chat_flutter/src/base/base_stateful_widget.dart';
import 'package:flutter/material.dart';

import 'base_state.dart';

abstract class BaseStatefulScreen<B extends BaseStatefulWidget> extends BaseState<B> {
  
  @override
  Widget getLayout() {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: buildAppBar(),
        body: buildBody(),
        resizeToAvoidBottomPadding: true,
      ),
    );
  }

  /// should be overriden in extended widget
  Widget buildAppBar();

  /// should be overriden in extended widget
  Widget buildBody();
}