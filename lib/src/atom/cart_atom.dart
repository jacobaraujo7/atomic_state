// atom
import 'package:rx_notifier/rx_notifier.dart';

import '../models/burg_model.dart';

// atom
final cartBurgs = RxList<BurgModel>([]);
final finalValue = RxNotifier<String>('R\$ 0.00');

// action
final removeBurg = RxNotifier<BurgModel?>(null);
final cleanCart = RxNotifier.action();
