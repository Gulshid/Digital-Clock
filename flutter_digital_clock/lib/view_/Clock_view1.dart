import 'package:flutter/material.dart';
import 'package:flutter_digital_clock/view_Model/Digital_Provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
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
      backgroundColor: Colors.teal,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Digital Clock',
              style: GoogleFonts.agbalumo(color: Colors.white, fontSize: 30.sp),
            ),
          ),

          SizedBox(height: 50.h,),
          Container(
            height: 100.h,
            width: 250.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: Colors.lightGreenAccent,
            ),

            child: Center(
              child: Text(
                ProDigital.current_time,
                style: GoogleFonts.aBeeZee(
                  color: Colors.black,
                  fontSize: 40.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
