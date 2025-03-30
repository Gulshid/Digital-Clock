import 'package:flutter/material.dart';
import 'package:flutter_digital_clock/view_Model/Analoge_Provider.dart';
import 'package:provider/provider.dart';

class AnalogeView extends StatefulWidget {
  const AnalogeView({super.key});

  @override
  State<AnalogeView> createState() => _AnalogeViewState();
}

class _AnalogeViewState extends State<AnalogeView> {
  @override
  Widget build(BuildContext context) {
    final Analoge_Provider = Provider.of<AnalogeProvider>(context).clockModel;
    return Scaffold(
      
    );
  }
}
