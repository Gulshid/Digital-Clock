import 'package:flutter/material.dart';
import 'package:flutter_digital_clock/view_Model/Digital_Provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
   void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DigitalProvider>(context, listen: false).load_Splash_Screen(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [


          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.asset('assets/table-clock_15447155.png', fit: BoxFit.fill, height: 150.h, width: 150.w,),
          ),

          Center(
            child: Text(
              'Clock App',
              style: GoogleFonts.agbalumo(color: Colors.black, fontSize: 30.sp),
            ),
          ),

          SpinKitPianoWave(color: Colors.deepPurple, size: 50.sp,)


        ],
      ),
    );
  }
}
