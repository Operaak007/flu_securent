// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:securent/auth/sign_up1.dart';
import 'package:securent/onbording/color.dart';
import 'package:securent/screen/bottomn.dart';
import 'package:securent/screen/home.dart';
import 'package:top_snackbar/top_snackbar.dart';
import 'package:securent/onbording/onbordingData.dart';
import 'package:awesome_top_snackbar/awesome_top_snackbar.dart';

class Sigin extends StatefulWidget {
  const Sigin({super.key});

  @override
  State<Sigin> createState() => _SiginState();
}

class _SiginState extends State<Sigin> {
  final pageController = PageController();
  final controller = Onbordingdata();
  int currentIndex = 0;

  TextEditingController passwordcontroller = new TextEditingController();
  TextEditingController phonecontroller = new TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool obserText = true;

  movetohome(BuildContext context) {
    if (_formkey.currentState!.validate()) {
      setState(() {});
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Bottomn()));
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  padding: EdgeInsets.only(top: 40),
                  width: 358,
                  height: 116,
                  child: Column(
                    children: [
                      Text(
                        "Welcome !",
                        style: TextStyle(
                            fontSize: 32,
                            color: primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        "Log in to your account",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 1000.21,
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
                          IntlPhoneField(
                            validator: (value) {
                              if (value!.number.isEmpty) {
                                return "phone be empty";
                              } else {
                                return null;
                              }
                            },
                            controller: phonecontroller,
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
                          Row(
                            children: [
                              Text(
                                "Login using Email",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: primaryColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "password connot be empty";
                              } else if (value.length < 8) {
                                return 'password length must be at least 8';
                              } else {
                                return null;
                              }
                            },
                            controller: passwordcontroller,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 20),
                              hintText: "Password",
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: primaryColor,
                              ),
                              suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      obserText = !obserText;
                                    });
                                    FocusScope.of(context).unfocus();
                                  },
                                  child: Icon(
                                      obserText == true
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.black)),
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.blue)),
                            ),
                          ),
                          Container(
                            height: 50,
                            // color: Colors.black,
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Radio(
                                        value: 1,
                                        groupValue: 2,
                                        onChanged: (value) {}),
                                    Text(
                                      "Remember me",
                                      style: TextStyle(
                                        color: Color(0xff0E121B),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                // SizedBox(
                                //   width: 140,
                                // ),
                                Text(
                                  "Forgot password",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 300,
                          ),
                          GestureDetector(
                            onTap: () {
                              movetohome(context);
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
                                  "Log in",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            // color: Colors.black,
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don’t have an account?",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) => Sigup1()));
                                  },
                                  child: Text("Sign up",
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
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
