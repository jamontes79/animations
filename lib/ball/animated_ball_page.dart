import 'package:flutter/material.dart';

class AnimatedBallPage extends StatefulWidget {
  const AnimatedBallPage({Key? key}) : super(key: key);

  @override
  State<AnimatedBallPage> createState() => _AnimatedBallPageState();
}

class _AnimatedBallPageState extends State<AnimatedBallPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Animation<double>? _positionAnimation;
  late Animation<double> _curve;
  bool _animationCompleted = false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      final height = MediaQuery.of(context).size.height;

      final end = height - 70 - kToolbarHeight;

      _curve = CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      );
      _positionAnimation = TweenSequence(
        [
          TweenSequenceItem<double>(
            tween: Tween(begin: 0, end: end),
            weight: 50,
          ),
          TweenSequenceItem<double>(
            tween: Tween(begin: end, end: end - 30),
            weight: 50,
          ),
          TweenSequenceItem<double>(
            tween: Tween(begin: end - 30, end: end),
            weight: 50,
          ),
          TweenSequenceItem<double>(
            tween: Tween(begin: end, end: end - 20),
            weight: 50,
          ),
          TweenSequenceItem<double>(
            tween: Tween(begin: end - 20, end: end),
            weight: 50,
          ),
          TweenSequenceItem<double>(
            tween: Tween(begin: end, end: end - 10),
            weight: 50,
          ),
          TweenSequenceItem<double>(
            tween: Tween(begin: end - 10, end: end),
            weight: 50,
          ),
        ],
      ).animate(_curve);
    });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationCompleted = true;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Ball'),
        actions: [
          IconButton(
            onPressed: () {
              if (_animationCompleted) {
                _controller.reset();
                _animationCompleted = false;
              }
            },
            icon: const Icon(
              Icons.refresh,
            ),
          ),
          IconButton(
            onPressed: () {
              _controller.forward();
            },
            icon: const Icon(
              Icons.play_arrow,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, _) {
              return Positioned(
                top: _positionAnimation != null ? _positionAnimation!.value : 0,
                left: 50,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
