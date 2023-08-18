import 'dart:async';

import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  void TimeTick() {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/Login');
    });
  }

  @override
  void initState() {
  TimeTick();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "HealthITtestApp",
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
