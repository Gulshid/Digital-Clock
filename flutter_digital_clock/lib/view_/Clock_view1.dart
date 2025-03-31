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
    final Pro_Digital = Provider.of<DigitalProvider>(context);

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10.r),
        ),

        child: Center(child: Text(Pro_Digital.current_time, style: TextStyle(color: Colors.white, fontSize: 40.sp),)),
      ),
    );
  }
}
