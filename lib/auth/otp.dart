import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:securent/auth/sign_up2.dart';
import 'package:securent/onbording/color.dart';
import 'package:securent/onbording/onbordingData.dart';

class Otp extends StatefulWidget {
  const Otp({super.key, required this.email});

  final String email;

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final pageController = PageController();
  final controller = Onbordingdata();
  int currentIndex = 1;
  String otp = '';
  Timer? _timer;
  int _countDown = 30;
  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  void dispose() {
    super.dispose();
    _timer!.cancel();
  }

  void startTime() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_countDown > 0) {
          _countDown--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  Widget buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          controller.items.length,
          (index) => AnimatedContainer(
              margin: EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: currentIndex == index ? primaryColor : Colors.grey),
              height: 7,
              width: currentIndex == index ? 40 : 15,
              duration: Duration(
                milliseconds: 700,
              ))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "OTP Verification",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.close,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 5),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Input the 6-digit code sent to",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      " ${widget.email}",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.all(10),
                width: double.infinity,
                child: OTPTextField(
                  outlineBorderRadius: 10,
                  fieldStyle: FieldStyle.box,
                  length: 6,
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: 60,
                  style: TextStyle(fontSize: 17),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                // padding: EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Text(
                      "Resend Code",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      // "27",
                      " ${_countDown.toString()}",
                      style: TextStyle(
                          fontSize: 18,
                          color: primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 210,
              ),
              buildDots(),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35, right: 30),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Sigup2()));
                  },
                  child: Container(
                    width: double.infinity,
                    // color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 358,
                        height: 48,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            "Verity OTP",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
