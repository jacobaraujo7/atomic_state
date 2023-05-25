import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

import 'src/pages/home.dart';

void main() {
  runApp(const RxRoot(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.red,
        brightness: Brightness.dark,
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/cart': (context) => const HomePage(),
      },
    );
  }
}
