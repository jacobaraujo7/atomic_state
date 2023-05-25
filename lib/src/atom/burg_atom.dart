import 'package:atomic_state/src/models/burg_model.dart';
import 'package:rx_notifier/rx_notifier.dart';

// atoms
final burgs = RxList<BurgModel>([]);
final burgLoading = RxNotifier(true);

// actions
final fetchBurgs = RxNotifier.action();
final addBurg = RxNotifier<BurgModel?>(null);
