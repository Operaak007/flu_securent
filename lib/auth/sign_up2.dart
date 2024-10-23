import 'package:awesome_top_snackbar/awesome_top_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:securent/auth/sign_in.dart';
import 'package:securent/onbording/color.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:securent/onbording/onbordingData.dart';

class Sigup2 extends StatefulWidget {
  const Sigup2({super.key});

  @override
  State<Sigup2> createState() => _Sigup2State();
}

class _Sigup2State extends State<Sigup2> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _confirmcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool obserText = true;

  final pageController = PageController();
  final controller = Onbordingdata();
  int currentIndex = 2;

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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Create Password",
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
                            color: primaryColor,
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
                          "Enter a unique password to secure your account",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 20),
                      hintText: "Password",
                      prefixIcon: Icon(
                        IconlyLight.lock,
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
                  SizedBox(
                    height: 10,
                  ),
                  FlutterPwValidator(
                      defaultColor: Colors.grey,
                      successColor: Colors.green,
                      failureColor: Colors.red,
                      uppercaseCharCount: 1,
                      normalCharCount: 1,
                      specialCharCount: 1,
                      width: 460,
                      height: 150,
                      minLength: 8,
                      onSuccess: () {},
                      controller: _controller),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 20),
                      hintText: "Confirm Password",
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
                      prefixIcon: Icon(
                        IconlyLight.lock,
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
                  Text(
                    "Select User Type",
                    style: TextStyle(color: Color(0xff0E121B)),
                  ),
                  Row(
                    children: [
                      Radio(value: 1, groupValue: 2, onChanged: (value) {}),
                      Text(
                        "Landlord",
                        style: TextStyle(
                            color: Color(0xff525866),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Radio(value: 1, groupValue: 2, onChanged: (value) {}),
                      Text(
                        "Tenant",
                        style: TextStyle(
                            color: Color(0xff525866),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  buildDots(),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: GestureDetector(
                        onTap: () {
                          showSnackBarFun();

                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => Sigin()));
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
                              "Submit",
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  showSnackBarFun() {
    SnackBar snackBar = SnackBar(
      content: Column(
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Color(0xff002369CC),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Column(
              children: [
                Container(
                  height: 5,
                  width: double.infinity,
                  color: Colors.green,
                ),
                Row(
                  children: [
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(left: 50),
                        child: Image(
                          image: AssetImage("images/re.png"),
                        ),
                      ),
                    ),
                    Text(
                      "Your Account was created successfully",
                      style: TextStyle(fontSize: 14, color: Color(0xffFFFFFF)),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: primaryColor,
      dismissDirection: DismissDirection.up,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 100,
          left: 10,
          right: 10),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
