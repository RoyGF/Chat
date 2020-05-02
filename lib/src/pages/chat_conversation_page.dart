import 'package:chat_flutter/src/base/base_stateful_screen.dart';
import 'package:chat_flutter/src/base/base_stateful_widget.dart';
import 'package:chat_flutter/src/models/chat_contact.dart';
import 'package:flutter/material.dart';

class ChatConversationPage extends BaseStatefulWidget {
  static final String pageRoute = 'chat_conversation_page_route';

  final ChatContact contact;
  ChatConversationPage({Key key, @required this.contact}) : super(key: key);

  @override
  _ChatConversationPageState createState() => _ChatConversationPageState();
}

class _ChatConversationPageState
    extends BaseStatefulScreen<ChatConversationPage> {
  ChatContact _chatContact;
  double height, width;
  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _chatContact = widget.contact;
    setState(() {});
  }

  @override
  Widget buildAppBar() {
    return AppBar(
      title: Text(_chatContact.contactName),
      actions: <Widget>[
        FlatButton(
          child: Icon(Icons.videocam, color: Colors.white),
          onPressed: () {},
        )
      ],
    );
  }

  @override
  Widget buildBody() {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        Expanded(child: Container()),
        Divider(),
        _buildInputArea(),
        SizedBox(height: 5)
      ],
    );
  }

  Widget _buildInputArea() {
    return Container(
        width: width,
        height: height * 0.07,
        child: Row(
          children: <Widget>[
            _buildChatInput(),
            _buildSendButton(),
          ],
        ));
  }

  Widget _buildChatInput() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(2.0),
        margin: const EdgeInsets.only(left: 20.9),
        child: TextField(
          decoration: InputDecoration.collapsed(hintText: 'Send a message'),
          controller: _textController,
        ),
      ),
    );
  }

  Widget _buildSendButton() {
    return FloatingActionButton(
      backgroundColor: Colors.deepPurple,
      child: Icon(Icons.send),
      onPressed: () {},
    );
  }
}
