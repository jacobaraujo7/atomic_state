import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

import 'src/pages/home.dart';
import 'src/reducers/chat_reducer.dart';

final reducer = ChatReducer();

void main() {
  reducer;
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
      theme: ThemeData(useMaterial3: true),
      home: const HomePage(),
    );
  }
}
