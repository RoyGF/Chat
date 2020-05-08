import 'package:chat_flutter/src/models/user.dart';

import 'dart:convert';

ChatMessage chatMessageFromJson(String str) =>
    ChatMessage.fromJson(json.decode(str));

String chatMessageToJson(ChatMessage data) => json.encode(data.toJson());

class ChatMessage {
  String id;
  String chatId;
  User author;
  String body;

  ChatMessage({
    this.id,
    this.chatId,
    this.author,
    this.body,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
        id: json["id"],
        chatId: json["chat_id"],
        author: User.fromJson(json["author"]),
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "chat_id": chatId,
        "author": author.toJson(),
        "body": body,
      };
}
