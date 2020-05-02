import 'package:chat_flutter/src/base/base_bloc_provider.dart';
import 'package:chat_flutter/src/bloc/chat_conversation_bloc.dart';
import 'package:flutter/material.dart';

mixin BlocProvider implements BaseBlocProvider {

  final chatConversationBloc = ChatConversationBloc();

  static ChatConversationBloc of (BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BlocProvider>().chatConversationBloc;
  }
}
