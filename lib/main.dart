import 'package:chat_flutter/src/bloc/bloc_provider.dart';
import 'package:chat_flutter/src/pages/chat_contacts_page.dart';
import 'package:chat_flutter/src/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chat Application',
        initialRoute: LoginPage.pageRoute,
        routes: {
          ChatContactsPage.pageRoute: (BuildContext context) =>
              ChatContactsPage(),
          LoginPage.pageRoute: (BuildContext context) => LoginPage(),
        },
        theme: ThemeData(primaryColor: Colors.deepPurple),
      ),
    );
  }
}
