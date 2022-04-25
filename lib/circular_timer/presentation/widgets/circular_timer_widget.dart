import 'package:animations/circular_timer/presentation/custom_timer_painter.dart';
import 'package:flutter/material.dart';

class CircularTimer extends StatefulWidget {
  const CircularTimer({
    Key? key,
    required this.size,
    required this.taskNotCompletedColor,
    required this.taskCompletedColor,
    required this.initialDuration,
  }) : super(key: key);
  final double size;
  final Color taskNotCompletedColor;
  final Color taskCompletedColor;
  final int initialDuration;
  @override
  State<CircularTimer> createState() => _CircularTimerState();
}

class _CircularTimerState extends State<CircularTimer>
    with TickerProviderStateMixin {
  late AnimationController controller;

  String get timerString {
    late Duration duration;
    if (!controller.isAnimating) {
      duration = controller.duration!;
    } else {
      duration = (controller.duration!) * controller.value;
    }
    return '${duration.inMinutes.toString().padLeft(2, '0')}:'
        '${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  Color get taskCompletedColor {
    if (!controller.isAnimating) {
      return widget.taskCompletedColor;
    }
    final duration = (controller.duration!) * controller.value;
    if (duration.inSeconds <= 3) {
      return Colors.red;
    }
    return widget.taskCompletedColor;
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.initialDuration),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return FloatingActionButton.extended(
            onPressed: () {
              if (controller.isAnimating) {
                controller.stop();
              } else {
                controller.reverse(
                  from: controller.value == 0.0 ? 1.0 : controller.value,
                );
              }
            },
            icon: Icon(
              controller.isAnimating ? Icons.pause : Icons.play_arrow,
            ),
            label: Text(
              controller.isAnimating ? 'Pause' : 'Play',
            ),
          );
        },
      ),
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: SizedBox(
                height: widget.size,
                child: Align(
                  alignment: FractionalOffset.center,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: CustomPaint(
                            painter: CustomTimerPainter(
                              progress: controller.value,
                              taskNotCompletedColor:
                                  widget.taskNotCompletedColor,
                              taskCompletedColor: taskCompletedColor,
                            ),
                          ),
                        ),
                        Align(
                          alignment: FractionalOffset.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                timerString,
                                style: TextStyle(
                                  fontSize: widget.size / 4,
                                  color: widget.taskCompletedColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
