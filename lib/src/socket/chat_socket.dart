import 'package:chat_flutter/src/models/chat_message.dart';
import 'package:socket_io_client/socket_io_client.dart' as socketIO;
import 'package:chat_flutter/src/base/base_socket.dart';
import 'package:meta/meta.dart';

const CHAT_MESSAGE_EVENT = 'chat-message-event';
const SOCKET_URL = "http://155.138.215.86:3000";

typedef MessageCallback(ChatMessage message);

class ChatSocket extends BaseSocket {
  String _streamChannel;
  MessageCallback _onMessageReceived;

  ChatSocket({@required String channel, MessageCallback onMessageReceived}) {
    this._streamChannel = '$CHAT_MESSAGE_EVENT-$channel';
    this._onMessageReceived = onMessageReceived;
  }

  @override
  Future<void> connect() async {
    try {
      print('connecting to ${SOCKET_URL}');
      socket = socketIO.io(SOCKET_URL, <String, dynamic>{
        'transports': ['websocket'],
      });

      socket.on('connect', (_) {
        print('connected');
        print('listening to $_streamChannel');
      });

      socket.on(_streamChannel, (data) {
        onReceive(_streamChannel, data);
      });
    } catch (e) {
      onError('disconnect, error: ${e.toString()}');
      closeSocket();
    }
  }

  @override
  Future<void> onReceive(event, data) async {
    ChatMessage message = chatMessageFromJson(data);
    addChatMessage(message);
  }

  void sendMessage(ChatMessage data) {
    socket.emit(CHAT_MESSAGE_EVENT, chatMessageToJson(data));
  }

  void onError(Object error) {
    print(error.toString());
  }

  void addChatMessage(ChatMessage message) {
    _onMessageReceived(message);
  }
}
