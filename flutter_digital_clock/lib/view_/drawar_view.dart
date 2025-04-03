import 'package:flutter/material.dart';
import 'package:flutter_digital_clock/view_Model/switch_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Clock_Drawar extends StatefulWidget {
  const Clock_Drawar({super.key});

  @override
  State<Clock_Drawar> createState() => _Clock_DrawarState();
}

class _Clock_DrawarState extends State<Clock_Drawar> {
  @override
  Widget build(BuildContext context) {
    final provi = Provider.of<SwitchProvider>(context);
    return Drawer(
      backgroundColor: provi.isDarkMode? Colors.black: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      width: 250.w,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: Colors.deepOrangeAccent,
            ),

            accountName: Text('Gulshid Zada'),
            accountEmail: Text('gulshidzada1111@gmail.com'),
          ),

          DrawerHeader(
            child: Column(
              children: [
                Text(
                  'Digital and Analoge Clock',
                  style: TextStyle(color: provi.isDarkMode? Colors.white: Colors.black),
                ),
                SizedBox(height: 20.h),
                Icon(Icons.punch_clock, color: provi.isDarkMode? Colors.white: Colors.black),
              ],
            ),
          ),

          ListTile(
            leading: Icon(Icons.light_mode, color:  provi.isDarkMode? Colors.white: Colors.black),
            title: Text(
              'Switch On/Off ',
              style: TextStyle(color:  provi.isDarkMode? Colors.white: Colors.black),
            ),
            trailing: Switch(
              activeColor: Colors.blue,
              inactiveTrackColor: const Color.fromARGB(255, 215, 214, 214),
              inactiveThumbColor: Colors.white,
              activeTrackColor: Colors.yellow,
              value: provi.isDarkMode,
              onChanged: (bool va) {
                provi.toggleTheme();
              },
            ),
          ),
        ],
      ),
    );
  }
}
