import 'package:flutter/material.dart';
import 'package:flutter_digital_clock/Routes/RoutesName.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerView extends StatefulWidget {
  const ShimmerView({super.key});

  @override
  State<ShimmerView> createState() => _ShimmerViewState();
}

class _ShimmerViewState extends State<ShimmerView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Routesname.bottom_bar_view);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(11, (index) {
            return Shimmer.fromColors(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      height: 45.h,
                      width: 45.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 10.w,),
                      Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      height: 45.h,
                      width: 45.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                      SizedBox(width: 10.w,),
                      Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      height: 45.h,
                      width: 45.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),

                    
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      height: 45.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
            );
          }),
        ),
      ),
    );
  }
}
