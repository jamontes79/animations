import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({Key? key, required this.initialDurationInSeconds})
      : super(key: key);
  final int initialDurationInSeconds;
  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _pendingTime,
                style: Theme.of(context).textTheme.headline3,
              ),
              ElevatedButton(
                onPressed: () {
                  _controller.reverse(from: 1);
                },
                child: const Text(
                  'Start Counter',
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.initialDurationInSeconds),
    );
    _controller.addStatusListener((status) {
      debugPrint(status.toString());
    });
  }

  String get _pendingTime {
    final value = _controller.duration! * _controller.value;

    return value.toString();
  }
}
