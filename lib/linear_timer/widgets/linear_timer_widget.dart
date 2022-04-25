import 'package:animations/linear_timer/linear_timer_painter.dart';
import 'package:flutter/material.dart';

class LinearTimer extends StatefulWidget {
  const LinearTimer({
    Key? key,
    required this.width,
    required this.durationInSeconds,
  }) : super(key: key);
  final double width;
  final int durationInSeconds;
  @override
  State<LinearTimer> createState() => _LinearTimerState();
}

class _LinearTimerState extends State<LinearTimer>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: widget.durationInSeconds,
      ),
    );
    _controller.reverse(from: 1);
  }

  Duration get pendingTime {
    return _controller.duration! * _controller.value;
  }

  bool get lastSeconds {
    return pendingTime.inSeconds <= 3;
  }

  Color get getColor {
    if (lastSeconds) {
      return Colors.red;
    }
    return Colors.green;
  }

  String get timeString {
    return '${pendingTime.inMinutes.toString().padLeft(2, '0')}:'
        '${pendingTime.inSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: widget.width,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            return Stack(
              children: [
                Positioned.fill(
                  child: CustomPaint(
                    painter: CustomLinearTimerPainter(
                      progress: _controller.value,
                      displayBackground: lastSeconds,
                      taskCompletedColor: getColor,
                      taskNotCompletedColor: Colors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Text(
                    timeString,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: lastSeconds
                              ? Colors.white
                              : Theme.of(context).textTheme.bodyText1?.color,
                        ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
