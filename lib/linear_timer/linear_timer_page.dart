import 'package:animations/linear_timer/widgets/linear_timer_widget.dart';
import 'package:flutter/material.dart';

class LinearTimerPage extends StatelessWidget {
  const LinearTimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Linear Timer'),
      ),
      body: const LinearTimer(
        width: 300,
        durationInSeconds: 10,
      ),
    );
  }
}
