import 'package:atomic_state/src/models/chat_model.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final ChatModel model;
  const ChatBubble({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    if (model.isSender) {
      return BubbleSpecialThree(
        text: model.text,
        color: const Color(0xFF1B97F3),
        tail: false,
        textStyle: const TextStyle(color: Colors.white, fontSize: 16),
        isSender: model.isSender,
      );
    }

    return BubbleSpecialThree(
      text: model.text,
      color: const Color(0xFFE8E8EE),
      tail: false,
      isSender: model.isSender,
    );
  }
}
