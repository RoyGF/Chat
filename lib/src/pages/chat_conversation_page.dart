import 'package:chat_flutter/src/base/base_stateful_screen.dart';
import 'package:chat_flutter/src/base/base_stateful_widget.dart';
import 'package:chat_flutter/src/models/chat_contact.dart';
import 'package:chat_flutter/src/models/chat_message.dart';
import 'package:chat_flutter/src/models/user.dart';
import 'package:chat_flutter/src/socket/chat_socket.dart';
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
  ChatSocket chatSocket;
  List<ChatMessage> _chatMessages = List<ChatMessage>();
  var _senderId;

  @override
  void initState() {
    super.initState();
    _senderId = "sender1";
    _chatContact = widget.contact;
    _textController = TextEditingController();
    chatSocket = new ChatSocket(
      channel: _chatContact.chatId.toString(),
      onMessageReceived: (message) => _onMessageReceived(message),
    );
    connectSocket();
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
        Expanded(child: _buildMessageList()),
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
      onPressed: _sendMessage,
    );
  }

  Widget _buildSingleMessage(ChatMessage message) {
    return message.author.id == _senderId
        ? _buildSenderMessage(message)
        : _buildReceiverMessage(message);
  }

  Widget _buildSenderMessage(ChatMessage message) {
    return Container(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.only(bottom: 20.0, left: 20.0),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 1.0, color: Colors.deepPurple),
            left: BorderSide(width: 1.0, color: Colors.deepPurple),
            right: BorderSide(width: 1.0, color: Colors.deepPurple),
            bottom: BorderSide(width: 1.0, color: Colors.deepPurple),
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          message.body,
          style: TextStyle(color: Colors.black, fontSize: 15.0),
        ),
      ),
    );
  }

  Widget _buildReceiverMessage(ChatMessage message) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.only(bottom: 20.0, right: 20.0),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          message.body,
          style: TextStyle(color: Colors.white, fontSize: 15.0),
        ),
      ),
    );
  }

  Widget _buildMessageList() {
    return Container(
      width: width,
      child: ListView.builder(
        itemCount: _chatMessages.length,
        itemBuilder: (context, index) => _buildSingleMessage(
          _chatMessages[index],
        ),
      ),
    );
  }

  Future<void> connectSocket() async {
    await chatSocket.connect();
  }

  void _sendMessage() {
    if (_textController.text.isEmpty) return;
    User user = User(
      id: "ioioio",
      name: 'Roy',
    );
    ChatMessage message = ChatMessage(
      chatId: widget.contact.chatId.toString(),
      body: _textController.text,
      author: user,
    );
    chatSocket.sendMessage(message);
    _textController.text = "";
  }

  void _onMessageReceived(ChatMessage message) {
    print('Callback Success!!!');
    print(message.body);
    _chatMessages.add(message);
    setState(() {});
  }
}
