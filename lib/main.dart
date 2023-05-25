import 'package:atomic_state/src/module.dart';
import 'package:atomic_state/src/reducers/burg_reducer.dart';
import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:uno/uno.dart';

import 'src/pages/home.dart';
import 'src/services/burg_service.dart';

void main() {
  injector.addInstance(Uno());
  injector.add(BurgService.new);
  injector.addSingleton(BurgReducer.new);
  injector.commit();

  runApp(const RxRoot(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      },
    );
  }
}
