import 'package:atomic_state/src/models/chat_model.dart';
import 'package:rx_notifier/rx_notifier.dart';

// atoms
final chatsState = RxList<ChatModel>([]);
final chatLoading = RxNotifier(false);

// action
final sendMessageAction = RxNotifier<String>('');
