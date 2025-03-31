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

    final paintCircle =
        Paint()
          ..color = Colors.black
          ..style = PaintingStyle.stroke
          ..strokeWidth = 4;

    final paintHourHand =
        Paint()
          ..color = Colors.blue
          ..strokeWidth = 6
          ..strokeCap = StrokeCap.round;

    final paintMinuteHand =
        Paint()
          ..color = Colors.green
          ..strokeWidth = 4
          ..strokeCap = StrokeCap.round;

    final paintSecondHand =
        Paint()
          ..color = Colors.red
          ..strokeWidth = 2
          ..strokeCap = StrokeCap.round;

    // Draw clock circle
    canvas.drawCircle(center, radius, paintCircle);

    // Calculate angles for hands
    final hourAngle =
        (currentTime.hour % 12 + currentTime.minute / 60) * 30 * pi / 180;
    final minuteAngle =
        (currentTime.minute + currentTime.second / 60) * 6 * pi / 180;
    final secondAngle = currentTime.second * 6 * pi / 180;

    // Draw hour hand
    canvas.drawLine(
      center,
      Offset(
        center.dx + radius * 0.5 * cos(hourAngle - pi / 2),
        center.dy + radius * 0.5 * sin(hourAngle - pi / 2),
      ),
      paintHourHand,
    );

    // Draw minute hand
    canvas.drawLine(
      center,
      Offset(
        center.dx + radius * 0.7 * cos(minuteAngle - pi / 2),
        center.dy + radius * 0.7 * sin(minuteAngle - pi / 2),
      ),
      paintMinuteHand,
    );

    // Draw second hand
    canvas.drawLine(
      center,
      Offset(
        center.dx + radius * 0.9 * cos(secondAngle - pi / 2),
        center.dy + radius * 0.9 * sin(secondAngle - pi / 2),
      ),
      paintSecondHand,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
