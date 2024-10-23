import 'package:flutter/material.dart';
import 'package:securent/onbording/color.dart';
import 'package:securent/onbording/onbordingData.dart';
import 'package:securent/splash/splash1.dart';

class Onbordingpage extends StatefulWidget {
  const Onbordingpage({super.key});

  @override
  State<Onbordingpage> createState() => _OnbordingpageState();
}

class _OnbordingpageState extends State<Onbordingpage> {
  final controller = Onbordingdata();
  final pageController = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [body(), buildDots(), button()],
      ),
    );
  }

  Widget body() {
    return Expanded(
      child: Center(
        child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            itemCount: controller.items.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 100),
                    child: Image.asset(controller.items[currentIndex].image),
                    // width: 301.19,
                    // height: 200,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    controller.items[currentIndex].title,
                    style: TextStyle(
                      color: Color(0xfb002369),
                      fontWeight: FontWeight.bold,
                      fontSize: 38,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Text(
                      textAlign: TextAlign.center,
                      controller.items[currentIndex].das,
                      style: TextStyle(fontSize: 16, color: Color(0xff151515)),
                    ),
                  )
                ],
              );
            }),
      ),
    );
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
              width: currentIndex == index ? 30 : 7,
              duration: Duration(
                milliseconds: 700,
              ))),
    );
  }

  Widget button() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        width: 380,
        height: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: primaryColor),
        child: TextButton(
          onPressed: () {
            setState(() {
              currentIndex != controller.items.length - 1
                  ? currentIndex++
                  : Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Splash1()));
            });
          },
          child: Text(
            currentIndex == controller.items.length - 1 ? 'Continue' : "Next",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ));
  }
}
