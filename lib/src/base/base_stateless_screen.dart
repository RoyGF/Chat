import 'package:chat_flutter/src/base/base_stateless_widget.dart';
import 'package:flutter/material.dart';

abstract class BaseStatelessScreen extends BaseStatelessWidget {
  
  @override
  Widget getLayout(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context),
        body: buildBody(context),
      ),
    );
  }

  /// should be overriden in extended widget
  Widget buildAppBar(BuildContext context);

  /// should be overriden in extended widget
  Widget buildBody(BuildContext context);
}