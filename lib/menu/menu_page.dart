import 'package:animations/routes/routes.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RouteGenerator.animatedBall,
                  );
                },
                child: const Text('Animated Ball'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RouteGenerator.timer,
                  );
                },
                child: const Text('Timer'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RouteGenerator.circularTimer,
                  );
                },
                child: const Text('Circular Timer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
