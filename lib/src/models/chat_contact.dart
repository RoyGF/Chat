import 'dart:convert';

ChatContact chatContactFromJson(String str) =>
    ChatContact.fromJson(json.decode(str));

String chatContactToJson(ChatContact data) => json.encode(data.toJson());

class ChatContact {
  String contactName;
  int chatId;
  String lastMessage;
  String imgRoute;

  ChatContact({
    this.contactName,
    this.chatId,
    this.lastMessage,
    this.imgRoute,
  });

  factory ChatContact.fromJson(Map<String, dynamic> json) => ChatContact(
        contactName: json["contact_name"],
        chatId: json["chat_id"],
        lastMessage: json["last_message"],
        imgRoute: json["img_route"],
      );

  Map<String, dynamic> toJson() => {
        "contact_name": contactName,
        "chat_id": chatId,
        "last_message": lastMessage,
        "img_route": imgRoute,
      };
}
