import 'package:chat_flutter/src/pages/chat_contacts_page.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat Application',
      initialRoute: ChatContactsPage.pageRoute,
      routes: {
        ChatContactsPage.pageRoute : (BuildContext context) => ChatContactsPage(),
      },
      theme: ThemeData(primaryColor: Colors.deepPurple),
    );
  }
}