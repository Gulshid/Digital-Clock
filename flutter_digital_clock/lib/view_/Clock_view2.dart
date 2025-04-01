import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_digital_clock/view_Model/Analoge_Provider.dart';
import 'package:provider/provider.dart';

class AnalogeClock extends StatelessWidget {
  const AnalogeClock({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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

    // Draw shadow for the clock circle
    final circlePath = Path()..addOval(Rect.fromCircle(center: center, radius: radius));
    // ignore: deprecated_member_use
    canvas.drawShadow(circlePath, Colors.grey.withOpacity(0.5), 8.0, false);

    // Paint for the clock circle
    final paintCircle = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    // Draw clock circle
    canvas.drawCircle(center, radius, paintCircle);

    for (int i = 1; i <= 12; i++) {
      TextStyle textStyle;
      if (i >= 1 && i <= 3) {
        textStyle = TextStyle(
          color: Colors.red, 
          fontSize: radius * 0.15, 
          fontWeight: FontWeight.bold,
        );
      } else if (i > 3 && i <= 6) {
        textStyle = TextStyle(
          color: Colors.blue, 
          fontSize: radius * 0.16,
          fontWeight: FontWeight.bold,
        );
      } else if (i > 6 && i <= 9) {
        textStyle = TextStyle(
          color: Colors.green,
          fontSize: radius * 0.14, 
          fontWeight: FontWeight.bold,
        );
      } else {
        textStyle = TextStyle(
          color: Colors.orange, 
          fontSize: radius * 0.15,
          fontWeight: FontWeight.bold,
        );
      }

      final angle = (i * 30) * pi / 180; 
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


    for (int i = 1; i <= 60; i++) {

      final angle = (i * 6) * pi / 180; 


      final needleStart = Offset(
        center.dx + (radius * 0.9) * cos(angle - pi / 2),
        center.dy + (radius * 0.9) * sin(angle - pi / 2),
      );

      final needleEnd = Offset(
        center.dx + (radius * 0.95) * cos(angle - pi / 2), 
        center.dy + (radius * 0.95) * sin(angle - pi / 2),
      );

      
      final paintNeedle = Paint()
        ..color = (i % 5 == 0) ? Colors.black : Colors.white 
        ..strokeWidth = (i % 5 == 0) ? 2 : 1; 

      canvas.drawLine(needleStart, needleEnd, paintNeedle);
    }


    final hourAngle =
        (currentTime.hour % 12 + currentTime.minute / 60) * 30 * pi / 180;
    final minuteAngle =
        (currentTime.minute + currentTime.second / 60) * 6 * pi / 180;
    final secondAngle = currentTime.second * 6 * pi / 180;

 
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


    canvas.drawLine(
      center,
      Offset(
        center.dx + radius * 0.4 * cos(hourAngle - pi / 2),
        center.dy + radius * 0.4 * sin(hourAngle - pi / 2),
      ),
      paintHourHand,
    );


    canvas.drawLine(
      center,
      Offset(
        center.dx + radius * 0.6 * cos(minuteAngle - pi / 2),
        center.dy + radius * 0.6 * sin(minuteAngle - pi / 2),
      ),
      paintMinuteHand,
    );

    canvas.drawLine(
      center,
      Offset(
        center.dx + radius * 0.8 * cos(secondAngle - pi / 2),
        center.dy + radius * 0.8 * sin(secondAngle - pi / 2),
      ),
      paintSecondHand,
    );

    final paintCenterDot = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, 5, paintCenterDot);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}