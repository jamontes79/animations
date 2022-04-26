import 'dart:math';

import 'package:flutter/material.dart';

class WidgetTransitionsPage extends StatefulWidget {
  const WidgetTransitionsPage({Key? key}) : super(key: key);

  @override
  State<WidgetTransitionsPage> createState() => _WidgetTransitionsPageState();
}

class _WidgetTransitionsPageState extends State<WidgetTransitionsPage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Transitions'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.reverse(from: 1);
          setState(() {
            _counter = _counter == 0 ? 1 : 0;
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
      body: AnimatedBuilder(
        animation: _controller,
        child: _buildBody(),
        builder: (BuildContext context, Widget? child) {
          return Transform.rotate(
            angle: 2 * _controller.value * pi,
            child: Transform.translate(
              offset: Offset(-_controller.value * -width, 0),
              child: child,
            ),
          );
        },
      ),
    );
  }

  Widget _buildBody() {
    if (_counter == 0) {
      return Center(
        child: Container(
          color: Colors.red,
          height: 500,
        ),
      );
    } else {
      return Center(
        child: Container(
          color: Colors.blue,
          height: 500,
        ),
      );
    }
  }
}
