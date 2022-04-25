import 'package:animations/circular_timer/presentation/widgets/circular_timer_widget.dart';
import 'package:flutter/material.dart';

class CircularTimerPage extends StatelessWidget {
  const CircularTimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Circular Timer'),
      ),
      body: CircularTimer(
        size: 150,
        taskNotCompletedColor: Theme.of(context).indicatorColor,
        taskCompletedColor: Theme.of(context).colorScheme.secondary,
        initialDuration: 5,
      ),
    );
  }
}
