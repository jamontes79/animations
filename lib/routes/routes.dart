import 'package:animations/ball/animated_ball_page.dart';
import 'package:animations/circular_timer/presentation/circular_timer_page.dart';
import 'package:animations/menu/menu_page.dart';
import 'package:animations/timer/timer_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static const String menuPage = '';
  static const String animatedBall = 'ball';
  static const String circularTimer = 'circularTimer';
  static const String timer = 'timer';

  static Route<MaterialPageRoute> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case menuPage:
        return MaterialPageRoute(
          builder: (_) => const MenuPage(
            key: Key('menu_page'),
          ),
        );
      case animatedBall:
        return MaterialPageRoute(
          builder: (_) => const AnimatedBallPage(
            key: Key('animated_ball_page'),
          ),
        );
      case circularTimer:
        return MaterialPageRoute(
          builder: (_) => const CircularTimerPage(
            key: Key('circular_timer_page'),
          ),
        );
      case timer:
        return MaterialPageRoute(
          builder: (_) => const TimerPage(
            key: Key('timer_page'),
          ),
        );
      default:
        throw const FormatException('Route not found');
    }
  }
}
