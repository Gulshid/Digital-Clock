import 'package:flutter/material.dart';
import 'package:flutter_digital_clock/view_Model/Clock_Provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DigitalClock extends StatefulWidget {
  const DigitalClock({super.key});

  @override
  State<DigitalClock> createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  @override
  Widget build(BuildContext context) {
    final Provider_model = Provider.of<ClockProvider>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text(Provider_model.currentTime, style: TextStyle(

            color: Colors.black, fontSize: 40.sp, fontWeight: FontWeight.bold,
          ),),),

          Center(child: Text('hello',style: TextStyle(

            color: Colors.black, fontSize: 40.sp, fontWeight: FontWeight.bold,
          ), ),)

        ],
      ));
  }
}
