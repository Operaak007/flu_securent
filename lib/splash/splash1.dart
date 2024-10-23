import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:securent/auth/sign_in.dart';
import 'package:securent/auth/sign_up1.dart';
import 'package:securent/onbording/color.dart';

class Splash1 extends StatefulWidget {
  const Splash1({super.key});

  @override
  State<Splash1> createState() => _Splash1State();
}

class _Splash1State extends State<Splash1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            image: AssetImage(
              "images/backgroup2.JPG",
            ),
            fit: BoxFit.cover,
            height: double.infinity,
            // width: double.infinity,
            // width: 500,
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
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 482,
                ),
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        "images/logo.png",
                        height: 53,
                        width: 204,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "One app for all your housing needs.",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 140,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => Sigin()));
                      },
                      child: Container(
                        width: 358,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            "Log in",
                            style: TextStyle(
                                fontSize: 16,
                                color: primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "OR",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => Sigup1()));
                      },
                      child: Container(
                        width: 358,
                        height: 48,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Create an Account",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    // Container(
                    //   padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    //   child: Divider(
                    //       thickness: 1,
                    //       height: 4,
                    //       // indent: 220,
                    //       endIndent: 200,
                    //       color: Colors.white),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
