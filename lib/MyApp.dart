import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthittestapp/Dashboard.dart';
import 'package:healthittestapp/LandingPage.dart';

import 'LoginPage.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark
      ),
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white
        ),
        home: LandingPage(),
        debugShowCheckedModeBanner: false,
      initialRoute: '/Splash',
        routes: {
          '/Splash': (context) => const LandingPage(),
          '/Dash': (context)=> const Dashboard(),
          '/Login': (context)=> const Login()
        },
      ),
    );
  }
}
