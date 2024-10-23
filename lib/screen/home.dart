import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:securent/data/productdata.dart';
import 'package:securent/onbording/color.dart';
import 'package:securent/widget/product.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget _container({required name}) {
    return Container(
      width: 125.67,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        border: Border.all(
          color: Color(0xff0A0D1408),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            name,
            style: TextStyle(
                color: Color(
                  0xff525866,
                ),
                fontSize: 16),
          ),
          SizedBox(
            width: 5,
          ),
          Image.asset(
            "images/vector1.png",
            height: 30,
            width: 20,
            color: primaryColor,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 177,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  primaryColor.withOpacity(0.10),
                  const Color.fromARGB(255, 194, 193, 193).withOpacity(0.9),
                  const Color.fromARGB(255, 194, 193, 193).withOpacity(0.9),
                  primaryColor.withOpacity(0.9),
                  primaryColor.withOpacity(0.9),
                  primaryColor.withOpacity(0.9),
                  primaryColor.withOpacity(0.9),
                  primaryColor.withOpacity(0.9),
                  primaryColor.withOpacity(0.9),
                ], end: Alignment.topRight, begin: Alignment.bottomRight),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 70, left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "images/vector3.png",
                          height: 30,
                          width: 40,
                        ),
                        Text(
                          "Find a Home",
                          style: TextStyle(
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Image.asset(
                          "images/vector4.png",
                          height: 20,
                          width: 40,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10, left: 16, right: 16),
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Color(0xffffffff))),
                        filled: true,
                        fillColor: Color(0xffffffff),
                        contentPadding: EdgeInsets.symmetric(vertical: 20),
                        hintText: "  Search for a property",
                        suffixIcon: Container(
                          margin: EdgeInsets.all(13.0),
                          child: Image.asset(
                            "images/vector2.png",
                            height: 10,
                            width: 10,
                          ),
                        ),
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xffffffff)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _container(name: "Location"),
                  SizedBox(
                    width: 10,
                  ),
                  _container(name: "Price"),
                  SizedBox(
                    width: 10,
                  ),
                  _container(name: "Type"),
                ],
              ),
            ),
            GridView.builder(
                shrinkWrap: true,
                itemCount: products.length,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.7,
                    mainAxisSpacing: 16),
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: products[index],
                  );
                })
          ],
        ),
      ),
    );
  }
}
