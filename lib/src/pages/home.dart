import 'package:flutter/material.dart';

import '../models/chat_field.dart';
import '../models/chat_model.dart';
import '../widgets/chat_bubble.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final chatModels = [
    ChatModel(text: 'Texto ssoskos'),
    ChatModel(text: 'Texto ssoskosd3 2d 23d 23 d23', isSender: false),
    ChatModel(text: 'Texto ssoskosd3 2d 23d 23 d23 dsad d', isSender: false),
  ];

  bool isLoading = false;

  void _senderMessage(String message) {
    setState(() {
      chatModels.insert(0, ChatModel(text: 'Texto ssoskos'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('flutterGPT'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Align(
            child: Icon(
              Icons.rocket,
              size: 300,
              color: Colors.grey[200],
            ),
          ),
          ListView.builder(
            padding: const EdgeInsets.only(
              bottom: 80,
            ),
            reverse: true,
            itemCount: chatModels.length,
            itemBuilder: (context, index) {
              return ChatBubble(model: chatModels[index]);
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ChatField(
              sendEnabled: !isLoading,
              onMessage: _senderMessage,
            ),
          ),
          if (isLoading)
            const Align(
              alignment: Alignment.bottomCenter,
              child: LinearProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
