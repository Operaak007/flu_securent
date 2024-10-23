import 'package:flutter/material.dart';
import 'package:securent/auth/new.dart';
import 'package:securent/auth/otp.dart';
import 'package:securent/auth/sign_in.dart';
import 'package:securent/auth/sign_up1.dart';
import 'package:securent/auth/sign_up2.dart';
import 'package:securent/detailpage.dart';
import 'package:securent/onbordingpage.dart';
import 'package:securent/screen/bottomn.dart';
import 'package:securent/screen/home.dart';
import 'package:securent/splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // ignore: prefer_const_constructors
      home: Splash(),
    );
  }
}
