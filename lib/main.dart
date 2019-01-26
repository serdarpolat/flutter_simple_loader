import 'dart:math';
import 'package:flutter/material.dart';
import 'package:a_simple_loader/radial_bar.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loading',
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 15),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF292929),
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: List.generate(10, (int i) {
              return AnimatedBuilder(
                animation: controller,
                child: Container(
                  width: 20.0 + (i * 14),
                  height: 20.0 + (i * 14),
                  child: RadialProgressbar(
                    trackWidth: 0.0,
                    progressWidth: 4.0,
                    trackColor: Colors.transparent,
                    progressPercent: 0.50,
                    progressColor:
                        i % 2 == 0 ? Color(0xFFFD4AD4) : Color(0xFF2BC3ED),
                  ),
                ),
                builder: (BuildContext context, child) => Transform.rotate(
                      child: child,
                      angle: controller.value * 2.0 * pi * (i + 1),
                    ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
