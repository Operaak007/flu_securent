// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:securent/auth/otp.dart';
import 'package:securent/auth/sign_in.dart';
import 'package:securent/onbording/color.dart';
import 'package:securent/onbording/onbordingData.dart';

class Sigup1 extends StatefulWidget {
  const Sigup1({
    super.key,
  });

  @override
  State<Sigup1> createState() => _Sigup1State();
}

class _Sigup1State extends State<Sigup1> {
  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    final controller = Onbordingdata();
    int currentIndex = 0;

    TextEditingController emailcontroller = new TextEditingController();
    TextEditingController phonecontroller = new TextEditingController();
    final _formkey = GlobalKey<FormState>();

    movetohome(BuildContext context) {
      if (_formkey.currentState!.validate()) {
        setState(() {});
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Otp(
                  email: emailcontroller.text,
                )));
      }
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

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "images/backgroup2.JPG",
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  // ignore: prefer_const_literals_to_create_immutables
                  colors: [
                    Color(0xfb002369),
                    Color(0xfb002369).withOpacity(1),
                    Color(0xfb002369).withOpacity(0.70),
                    Color(0xfb002369).withOpacity(.70),
                  ],
                  end: Alignment.topCenter,
                  begin: Alignment.bottomCenter),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 358,
                  height: 116,
                  child: Column(
                    children: [
                      Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 32,
                            color: primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        "Create a new account\n with email or Phone numbe",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 1000.12,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Container(
                    padding: EdgeInsets.only(top: 20, left: 16, right: 16),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: emailcontroller,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Email connot be empty";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 20),
                              hintText: "Email Address",
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: primaryColor,
                              ),
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.blue)),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          IntlPhoneField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 20),
                              labelText: 'Phone Number',
                              labelStyle: const TextStyle(
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(),
                              ),
                            ),
                            initialCountryCode: 'NG',
                            onChanged: (phone) {
                              print(phone.completeNumber);
                            },
                          ),
                          Container(
                            child: Row(
                              children: [
                                Radio(
                                    value: 0,
                                    groupValue: 1,
                                    onChanged: (value) {}),
                                Text(
                                  "I agree to the Terms & Condition and Privacy \nPolicy of SecuRent.",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 80,
                          ),
                          buildDots(),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              movetohome(context);
                              // Navigator.of(context).pushReplacement(
                              //     MaterialPageRoute(
                              //         builder: (context) => Otp()));
                            },
                            child: Container(
                              width: 358,
                              height: 48,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  "Send OTP",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => Sigin()));
                            },
                            child: Container(
                              // color: Colors.black,
                              width: double.infinity,
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 80, right: 80, top: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Already have an account?",
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Text("Sign in",
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
