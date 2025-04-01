import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_digital_clock/view_/Clock_view1.dart';
import 'package:flutter_digital_clock/view_/Clock_view2.dart';
import 'package:flutter_digital_clock/view_Model/Digital_Provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView({super.key});

  @override
  State<BottomBarView> createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<DigitalProvider>(context);
    List Pages = [DigitalClock(), AnalogeClock()];
    return Scaffold(
      body: Pages[pro.index],

      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.r),
          topLeft: Radius.circular(20.r),
        ),
        child: CurvedNavigationBar(
          height: 45.h,
          color: Colors.deepPurple,
          backgroundColor: Colors.blueAccent,
          onTap: (index) {
            pro.set_currentIndex(index);
          },
          items: [
            Icon(Icons.lock_clock, size: 30.sp, color: Colors.white,),
            Icon(Icons.punch_clock, size: 30.sp, color: Colors.white,),
          ],
        ),
      ),
    );
  }
}
