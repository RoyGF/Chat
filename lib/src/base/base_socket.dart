
import 'package:socket_io_client/socket_io_client.dart' as socketIO;

/// every Socket Class should be inherited from this class
abstract class BaseSocket {
  String url;
  socketIO.Socket socket;

  /// constructor
  BaseSocket({this.url});

  /// should be overriden by class
  Future<void> connect();

  /// should be overriden by class
  Future<void> onReceive(event, data);

  /// closes socket in case it is open
  void closeSocket() {
    if (socket != null) {
      socket.close();
    }
  }
}
