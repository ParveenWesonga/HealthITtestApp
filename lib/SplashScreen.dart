import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
        child:Image.asset('assets/images/logo.jpeg',width: MediaQuery.of(context).size.width *0.35,)
      ),
    );
  }
}
