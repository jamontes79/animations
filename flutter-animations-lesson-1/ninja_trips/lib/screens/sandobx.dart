import 'package:flutter/material.dart';

class Sandbox extends StatefulWidget {
  const Sandbox({Key? key}) : super(key: key);

  @override
  State<Sandbox> createState() => _SandboxState();
}

class _SandboxState extends State<Sandbox> {
  double _margin = 0;
  double _opacity = 1;
  double _width = 200;
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        margin: EdgeInsets.all(_margin),
        width: _width,
        color: _color,
        duration: Duration(
          seconds: 1,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                setState(() {
                  _margin = 50;
                });
              },
              child: Text('animate margin'),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  _color = Colors.teal;
                });
              },
              child: Text('animate color'),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  _width = 400;
                });
              },
              child: Text('animate width'),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  _opacity = 0;
                });
              },
              child: Text('animate opacity'),
            ),
            AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(
                seconds: 2,
              ),
              child: Text(
                'Hide me',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
