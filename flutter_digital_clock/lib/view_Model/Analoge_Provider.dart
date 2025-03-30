import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_digital_clock/model_/Clock_model.dart';

class AnalogeProvider with ChangeNotifier {
  late ClockModel _clockModel;
  Timer? _timer;

  //getter
  ClockModel get clockModel => _clockModel;

  // function for all function load
  AnalogeProvider() {
    _clockModel = ClockModel(CurrentTime: DateTime.now());
    _startClock();
  }

  //function for timer start

  void _startClock() {
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      _clockModel = ClockModel(CurrentTime: DateTime.now());
      notifyListeners();
    });
  }

  //Dispose

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
