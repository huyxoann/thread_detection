import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:thread_detection/config/route.dart';
import 'package:thread_detection/repository/link_repository_impl.dart';
import 'package:thread_detection/services/firebase_api.dart';
import 'package:thread_detection/services/noti_permission.dart';
import 'package:thread_detection/ui/theme.dart';
import 'package:thread_detection/viewmodel/link_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: "AIzaSyBNRTgjVX5ohiLNRzOtYKxqhpzjqHiIJXA",
      authDomain: "thread-detection-70a74.firebaseapp.com",
      projectId: "thread-detection-70a74",
      storageBucket: "thread-detection-70a74.firebasestorage.app",
      messagingSenderId: "151389378292",
      appId: "1:151389378292:web:898621cc19fb5f531270a1",
      measurementId: "G-XMYDWCPB6K",
    ));
  } else {
    await Firebase.initializeApp();
  }
  // FirebaseMessaging messaging = FirebaseMessaging.instance;
  // messaging.getToken().then((value) => print("token: $value"));

  // requestNotificationPermission();

  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   print("Message received: ${message.notification?.title}");
  // });

  await FirebaseApi().initNotifications();

  await Hive.initFlutter();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
        create: (_) => LinkViewmodel(linkRepository: LinkRepositoryImpl())),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = Theme.of(context).textTheme.apply(
          fontFamily: 'OpenSans',
        );

    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      routerConfig: router,
    );
  }
}
