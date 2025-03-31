import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_digital_clock/view_Model/Analoge_Provider.dart';
import 'package:provider/provider.dart';

class AnalogeClock extends StatelessWidget {
  const AnalogeClock({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Analog Clock")),
      body: Center(
        child: Consumer<AnalogeProvider>(
          builder: (context, clockViewModel, child) {
            final currentTime = clockViewModel.currentTime;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: AspectRatio(
                aspectRatio: 1,
                child: CustomPaint(
                  size: const Size(300, 300),
                  painter: ClockPainter(currentTime),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


class ClockPainter extends CustomPainter {
  final DateTime currentTime;

  ClockPainter(this.currentTime);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final paintCircle = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final paintHourHand = Paint()
      ..color = Colors.blue
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;

    final paintMinuteHand = Paint()
      ..color = Colors.green
      ..strokeWidth = 4
        ..strokeCap = StrokeCap.round;

    final paintSecondHand = Paint()
      ..color = Colors.red
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    final paintCenterDot = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    // Draw clock circle
    canvas.drawCircle(center, radius, paintCircle);

     for (int i = 1; i <= 12; i++) {
      TextStyle textStyle;
      if (i >= 1 && i <= 3) {
        textStyle = TextStyle(
          color: Colors.red, // Color for 1 to 3
          fontSize: radius * 0.2, // Size for 1 to 3
          fontWeight: FontWeight.bold,
        );
      } else if (i > 3 && i <= 6) {
        textStyle = TextStyle(
          color: Colors.blue, // Color for 4 to 6
          fontSize: radius * 0.18, // Size for 4 to 6
          fontWeight: FontWeight.bold,
        );
      } else if (i > 6 && i <= 9) {
        textStyle = TextStyle(
          color: Colors.green, // Color for 7 to 9
          fontSize: radius * 0.16, // Size for 7 to 9
          fontWeight: FontWeight.bold,
        );
      } else {
        textStyle = TextStyle(
            color: Colors.orange, // Color for 10 to 12
          fontSize: radius * 0.14, // Size for 10 to 12
          fontWeight: FontWeight.bold,
        );
      }

       final angle = (i * 30) * pi / 180; // Convert hour to angle
      final numberOffset = Offset(
        center.dx + (radius * 0.85) * cos(angle - pi / 2),
        center.dy + (radius * 0.85) * sin(angle - pi / 2),
      );

      final textSpan = TextSpan(
        text: i.toString(),
        style: textStyle,
      );

      final textPainter = TextPainter(
        text: textSpan,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();
      final textOffset = Offset(
        numberOffset.dx - textPainter.width / 2,
        numberOffset.dy - textPainter.height / 2,
      );

        textPainter.paint(canvas, textOffset);
    }

    // Calculate angles for hands
    final hourAngle =
        (currentTime.hour % 12 + currentTime.minute / 60) * 30 * pi / 180;
    final minuteAngle =
        (currentTime.minute + currentTime.second / 60) * 6 * pi / 180;
    final secondAngle = currentTime.second * 6 * pi / 180;


   canvas.drawLine(
      center,
      Offset(
        center.dx + radius * 0.4 * cos(hourAngle - pi / 2),
        center.dy + radius * 0.4 * sin(hourAngle - pi / 2),
      ),
      paintHourHand,
    );

    // Draw minute hand
    canvas.drawLine(
      center,
      Offset(
        center.dx + radius * 0.6 * cos(minuteAngle - pi / 2),
        center.dy + radius * 0.6 * sin(minuteAngle - pi / 2),
      ),
      paintMinuteHand,
    );

    // Draw second hand
    canvas.drawLine(
      center,
      Offset(
        center.dx + radius * 0.8 * cos(secondAngle - pi / 2),
        center.dy + radius * 0.8 * sin(secondAngle - pi / 2),
      ),
      paintSecondHand,
    );

    // Draw center dot
    canvas.drawCircle(center, 5, paintCenterDot);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}