class ClockModel {
   DateTime CurrentTime;
  ClockModel({required this.CurrentTime});

  double get hourAngle =>
      (CurrentTime.hour % 12) * 30 + (CurrentTime.minute * 0.5);

  double get minuteAngle => CurrentTime.minute * 6;
  double get secondAngle => CurrentTime.second * 6;
}
