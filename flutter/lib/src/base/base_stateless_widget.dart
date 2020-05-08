import 'package:flutter/material.dart';

/// every Stateless Widget should be inherited from this class
abstract class BaseStatelessWidget extends StatelessWidget {

  Widget getLayout(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return getLayout(context);
  }
}
