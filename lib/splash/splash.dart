// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:securent/onbordingpage.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  initTimer() {
    Timer(const Duration(seconds: 3), () async {
      Navigator.push(
          context, MaterialPageRoute(builder: (c) => Onbordingpage()));
    });
  }

  @override
  void initState() {
    super.initState();
    initTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfb002369),
      body: Center(
        child: Container(
          height: 53,
          width: 204,
          child: Image.asset(
            "images/logo.png",
          ),
        ),
      ),
    );
  }
}
