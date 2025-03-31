import 'package:flutter/material.dart';
import 'package:flutter_digital_clock/Routes/Routes.dart';
import 'package:flutter_digital_clock/Routes/RoutesName.dart';
import 'package:flutter_digital_clock/model_/Clock_model.dart';
import 'package:flutter_digital_clock/view_Model/Analoge_Provider.dart';
import 'package:flutter_digital_clock/view_Model/Digital_Provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('clockBox'); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => DigitalProvider()),
            ChangeNotifierProvider(create: (_)=> AnalogeProvider(ClockModel())),
          ],

          child: Builder(
            builder: (BuildContext context) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Digital Clock',
                theme: ThemeData(
                  applyElevationOverlayColor: true,
                  brightness: Brightness.light,
                  appBarTheme: AppBarTheme(color: Colors.blue),
                  primarySwatch: Colors.blue,
                  textTheme: Typography.englishLike2018.apply(
                    fontSizeFactor: 1.sp,
                  ),
                ),
                initialRoute: Routesname.splash_view,
                onGenerateRoute: Routes.genrateRoute,
              );
            },
          ),
        );
      },
    );
  }
}