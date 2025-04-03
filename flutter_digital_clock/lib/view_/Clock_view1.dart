import 'package:flutter/material.dart';
import 'package:flutter_digital_clock/view_Model/Digital_Provider.dart';
import 'package:flutter_digital_clock/view_Model/switch_provider.dart';
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
    final provi = Provider.of<SwitchProvider>(context);

    return Scaffold(
      backgroundColor:  provi.isDarkMode? Colors.black: Colors.teal,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Digital Clock',
              style: GoogleFonts.agbalumo(color:provi.isDarkMode? Colors.white: Colors.black, fontSize: 30.sp),
            ),
          ),

          SizedBox(height: 50.h,),
          Container(
            height: 180.h,
            width: 250.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.r),
                topRight: Radius.circular(25.r),
                bottomLeft: Radius.circular(25.r),
                bottomRight: Radius.circular(25.r),
              ),
              color: Colors.lightBlueAccent,
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

          Transform.translate(
            offset: Offset(0, -20),
        
            child: Container(
              height: 20.h,
              width: 300.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r),
                  bottomLeft: Radius.circular(35.r),
                  bottomRight: Radius.circular(35.r),
                ),

                color: Colors.lightBlue,
                boxShadow: [
                  // ignore: deprecated_member_use
                  BoxShadow(blurRadius: 5, spreadRadius: 6, color: Colors.grey.withOpacity(0.4))
                ]
              ),
            ),
          )

        ],
      ),
    );
  }
}
