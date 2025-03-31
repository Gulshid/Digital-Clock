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
      body: Column(
        children: List.generate(10, (index) {
          return Shimmer.fromColors(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              height: 50.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.white,
              ),
            ),
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
          );
        }),
      ),
    );
  }
}
