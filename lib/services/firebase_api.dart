import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> handler(RemoteMessage message) async {
  print('onBackgroundMessage: $message');
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();

    print('FCM Token: $fcmToken');
    FirebaseMessaging.onBackgroundMessage(handler);
  }
}
