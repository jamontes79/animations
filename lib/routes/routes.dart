import 'package:animations/ball/animated_ball_page.dart';
import 'package:animations/circular_timer/presentation/circular_timer_page.dart';
import 'package:animations/linear_timer/linear_timer_page.dart';
import 'package:animations/menu/menu_page.dart';
import 'package:animations/shimmer/shimmer_effect_page.dart';
import 'package:animations/timer/timer_page.dart';
import 'package:animations/widget_transitions/widget_transitions_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static const String menuPage = '';
  static const String animatedBall = 'ball';
  static const String circularTimer = 'circularTimer';
  static const String timer = 'timer';
  static const String linearTimer = 'linearTimer';
  static const String shimmerEffect = 'shimmerEffect';
  static const String widgetTransitions = 'widgetTransitions';
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
      case linearTimer:
        return MaterialPageRoute(
          builder: (_) => const LinearTimerPage(
            key: Key('linear_timer_page'),
          ),
        );
      case shimmerEffect:
        return MaterialPageRoute(
          builder: (_) => const ShimmerEffectPage(
            key: Key('shimmer_effect_page'),
          ),
        );
      case widgetTransitions:
        return MaterialPageRoute(
          builder: (_) => const WidgetTransitionsPage(
            key: Key('widget_transitions_page'),
          ),
        );
      default:
        throw const FormatException('Route not found');
    }
  }
}
