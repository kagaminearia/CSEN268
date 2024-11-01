// lib/utils/stream_listenable.dart

import 'dart:async';
import 'package:flutter/foundation.dart';

class StreamListenable extends ChangeNotifier {
  late final StreamSubscription _subscription;

  StreamListenable(Stream stream) {
    _subscription = stream.listen((_) {
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
