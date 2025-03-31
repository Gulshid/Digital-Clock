import 'package:flutter/material.dart';
import 'package:flutter_digital_clock/view_Model/Digital_Provider.dart';
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
    final ProDigital = Provider.of<DigitalProvider>(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text('hello', style: TextStyle(color: Colors.black, fontSize: 30.sp),),),
            Center(child: Text(ProDigital.current_time, style: TextStyle(color: Colors.black, fontSize: 40.sp),)),
          
        ],
      ),
    );
  }
}
