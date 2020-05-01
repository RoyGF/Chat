import 'package:chat_flutter/src/base/base_stateless_screen.dart';
import 'package:chat_flutter/src/localization/localization.dart';
import 'package:chat_flutter/src/models/chat_contact.dart';
import 'package:flutter/material.dart';

class ChatContactsPage extends BaseStatelessScreen {
  static final String pageRoute = 'chat_contacts_page';

  @override
  Widget buildAppBar(BuildContext context) {
    Localization strings = Localization(Locale('es', ''));
    return AppBar(title: Text(strings.getValue('contact_page_title')));
  }

  @override
  Widget buildBody(BuildContext context) {
    List<ChatContact> contacts = ChatContactMockData.contacts;
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) => _getContactCard(contacts[index]),
    );
  }

  Widget _getContactCard(ChatContact contact) {
    return Container(
      child: ListTile(
        title: Text(contact.contactName),
        subtitle: Text(contact.lastMessage),
        trailing: Icon(Icons.arrow_right),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(contact.imgRoute),
          radius: 20,
        ),
        onTap: () {},
      ),
    );
  }
}

class ChatContactMockData {
  static List<ChatContact> contacts = [
    ChatContact(
        contactName: 'Batman',
        chatId: 3477,
        lastMessage: 'Te veo al rato',
        imgRoute:
            'https://dam.smashmexico.com.mx/wp-content/uploads/2019/09/batman-portada.jpg'),
    ChatContact(
        contactName: 'Robin',
        chatId: 6134,
        lastMessage: 'Batman es chido',
        imgRoute:
            'https://pyxis.nymag.com/v1/imgs/b5a/d4d/c120db24570b112d634e5b52c251aeb111-26-teen-titans-go-1.rhorizontal.w700.jpg'),
    ChatContact(
        contactName: 'Iron Man',
        chatId: 3428,
        lastMessage: 'jfaiefasd',
        imgRoute:
            'https://img-cdn.hipertextual.com/files/2019/12/hipertextual-primer-trailer-iron-man-2020-2019702779.jpg?strip=all&lossy=1&quality=70&resize=740%2C490&ssl=1'),
    ChatContact(
        contactName: 'Luffy',
        chatId: 3302,
        lastMessage: 'jfeialsdfjaefasdfi',
        imgRoute:
            'https://www.alfabetajuega.com/wp-content/uploads/2019/10/alfabetajuega-one-piece-luffy-28102019-770x433.jpg'),
    ChatContact(
        contactName: 'El Puerco',
        chatId: 2006,
        lastMessage: 'Cui... estoy gordo',
        imgRoute:
            'https://us.123rf.com/450wm/cthoman/cthoman1506/cthoman150600377/41655167-un-jabal%C3%AD-de-dibujos-animados-haciendo-karate-en-un-gi-.jpg?ver=6'),
    ChatContact(
        contactName: 'Alexander Hamilton',
        chatId: 5685,
        lastMessage: 'Te veo al rato...',
        imgRoute:
            'https://image.cnbcfm.com/api/v1/image/103686018-GettyImages-510501068.jpg?v=1529471738&w=1400&h=950'),
  ];
}
