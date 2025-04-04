import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_digital_clock/Routes/RoutesName.dart';
import 'package:flutter_digital_clock/view_/Clock_view1.dart';
import 'package:flutter_digital_clock/view_/Clock_view2.dart';
import 'package:flutter_digital_clock/view_/Shimmer_view.dart';
import 'package:flutter_digital_clock/view_/Splash_view.dart';
import 'package:flutter_digital_clock/view_/bottom_bar_view.dart';

class Routes {
  static Route<dynamic> genrateRoute(RouteSettings hello) {
    switch (hello.name) {
      case Routesname.splash_view:
        {
          return MaterialPageRoute(
            builder: (BuildContext context) => SplashView(),
          );
        }

      case Routesname.shimmer_view:
        {
          return MaterialPageRoute(
            builder: (BuildContext context) => ShimmerView(),
          );
        }

      case Routesname.Digital_clock:
        {
          return MaterialPageRoute(
            builder: (BuildContext context) => DigitalClock(),
          );
        }

      case Routesname.Analoge_clock:
        {
          return MaterialPageRoute(builder: (BuildContext context) => AnalogeClock());
        }

      case Routesname.bottom_bar_view:
        {
          return MaterialPageRoute(
            builder: (BuildContext context) => BottomBarView(),
          );
        }

      default:
        {
          return MaterialPageRoute(
            builder:
                (_) => Scaffold(body: Center(child: Text('no route found'))),
          );
        }
    }
  }
}
