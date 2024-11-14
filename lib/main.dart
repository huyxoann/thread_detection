import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:thread_detection/config/route.dart';
import 'package:thread_detection/ui/theme.dart';

void main() async {
  await Hive.initFlutter();

  runApp(const MyApp());
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
