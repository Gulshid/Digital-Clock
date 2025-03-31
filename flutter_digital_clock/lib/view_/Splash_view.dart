import 'package:flutter/material.dart';
import 'package:flutter_digital_clock/view_Model/Digital_Provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Hello',
              style: TextStyle(color: Colors.black, fontSize: 40.sp),
            ),
          ),
        ],
      ),
    );
  }
}
