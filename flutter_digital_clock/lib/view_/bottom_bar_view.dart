import 'package:flutter/material.dart';
import 'package:flutter_digital_clock/view_/Clock_view1.dart';
import 'package:flutter_digital_clock/view_/Clock_view2.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView({super.key});

  @override
  State<BottomBarView> createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {
  @override
  Widget build(BuildContext context) {
    List Pages=[
      DigitalClock(),
      AnalogeClock(),
    ]
    return Scaffold(
      body: pages[]
    );
  }
}