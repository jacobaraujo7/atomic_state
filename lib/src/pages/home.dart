import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../atoms/chat_atom.dart';
import '../widgets/chat_bubble.dart';
import '../widgets/chat_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _sendMessage(String message) {
    sendMessageAction.value = message;
  }

  @override
  Widget build(BuildContext context) {
    context.select(() => [chatsState.length, chatLoading.value]);
    final isLoading = chatLoading.value;

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
            itemCount: chatsState.length,
            itemBuilder: (context, index) {
              return ChatBubble(model: chatsState[index]);
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ChatField(
              sendEnabled: !isLoading,
              onMessage: _sendMessage,
            ),
          ),
          if (isLoading)
            const Align(
              alignment: Alignment.topCenter,
              child: LinearProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
