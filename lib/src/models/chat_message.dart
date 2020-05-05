import 'dart:convert';

ChatMessage chatMessageFromJson(String str) =>
    ChatMessage.fromJson(json.decode(str));

String chatMessageToJson(ChatMessage data) => json.encode(data.toJson());

class ChatMessage {
  String id;
  String chatId;
  String senderId;
  String messageBody;
  String imgRoute;

  ChatMessage({
    this.id,
    this.chatId,
    this.senderId,
    this.messageBody,
    this.imgRoute,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
        id: json["id"],
        chatId: json["chat_id"],
        senderId: json["sender_id"],
        messageBody: json["message_body"],
        imgRoute: json["img_route"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "chat_id": chatId,
        "sender_id": senderId,
        "message_body": messageBody,
        "img_route": imgRoute,
      };
}
