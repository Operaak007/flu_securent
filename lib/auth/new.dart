import 'package:flutter/material.dart';
import 'package:securent/onbording/color.dart';

class New extends StatefulWidget {
  const New({super.key});

  @override
  State<New> createState() => _NewState();
}

class _NewState extends State<New> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _appBar(),
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
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Container(
                height: 900,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.black),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(),
                    TextFormField(),
                    TextFormField(),
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        color: const Color.fromARGB(255, 162, 41, 41),
                        child: Row(
                          children: [],
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
    );
  }

  PreferredSize _appBar() {
    return PreferredSize(
        preferredSize: Size.fromWidth(150),
        child: Container(
          decoration: _boxDecoration(),
          child: Column(
            children: [],
          ),
        ));
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
        gradient: LinearGradient(
            colors: [primaryColor, Colors.white],
            begin: Alignment.bottomRight,
            end: Alignment.bottomLeft));
  }
}
