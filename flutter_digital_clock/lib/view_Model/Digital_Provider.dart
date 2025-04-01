import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_digital_clock/Routes/RoutesName.dart';
import 'package:hive/hive.dart';

class DigitalProvider with ChangeNotifier {
  //make provider for Splash Screen
  bool _loading = false;

  bool get loading => _loading;

  //set the laoding
  void set_load(bool value) {
    _loading = value;
    notifyListeners();
  }

  //Future functiion to delayed in few sec
  void Splash(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Routesname.shimmer_view);
    });
  }

  //function for load all the functions for splash screen
  void load_Splash_Screen(BuildContext context) {
    set_load(false);
    Splash(context);
    set_load(true);
  }

  //Make Provider for Clock_view
  String _current_time = '';

  late Timer _timer;

  String get current_time => _current_time;

  //function for load all the functions of clock view
  DigitalProvider() {
    initialize();
  }

  //function to initialize in timer
  void initialize() {
    Update_time();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      Update_time();
    });
  }

  //function for update time
  void Update_time() {
    final now = DateTime.now();
    _current_time =
        '${now.hour.toString().padLeft(2, '0')} : ${now.minute.toString().padLeft(2, '0')} : ${now.second.toString().padLeft(2, '0')} ';
    save_data(_current_time);
    notifyListeners();
  }

  //function for save the data in database of hive
  void save_data(String time) {
    final box = Hive.box('ClockBox');
    box.put('lastTime', time);
  }

  //function for dispose timer
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
//Bottom Bar Navigation from one screen to another
  //current index
  int _index=0;
  int get index=>_index;


  //set the current index
  void set_currentIndex(int value){
    _index=value;
    notifyListeners();
  }
}
