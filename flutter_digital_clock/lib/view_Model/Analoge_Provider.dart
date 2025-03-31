import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_digital_clock/model_/Clock_model.dart';

class AnalogeProvider with ChangeNotifier {
  final ClockModel _clockModel;
  Timer? _timer;

  //getter
  DateTime get currentTime =>_clockModel.currentTime ;

  // function for all function load
  AnalogeProvider(this._clockModel) {
    _startClock();
  }

  //function for timer start

  void _startClock() {
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      _clockModel.update_time();
      notifyListeners();
    });
  }

  //Dispose

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }


   double getHourAngle() => (currentTime.hour % 12) * 30 + currentTime.minute * 0.5;
  double getMinuteAngle() => currentTime.minute * 6;
  double getSecondAngle() => currentTime.second * 6;
}
