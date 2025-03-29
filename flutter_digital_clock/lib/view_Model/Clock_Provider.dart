import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

class ClockProvider  with ChangeNotifier{
   String _currentTime = '';
  late Timer _timer;

  String get currentTime => _currentTime;

  ClockViewModel() {
    _initializeClock();
  }

  void _initializeClock() {
    _updateTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateTime();
    });
  }

  void _updateTime() {
    final now = DateTime.now();
    _currentTime = '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}';
    _saveTimeToLocalDatabase(_currentTime);
    notifyListeners();
  }

  void _saveTimeToLocalDatabase(String time) {
    final box = Hive.box('clockBox');
    box.put('lastTime', time);

      }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}