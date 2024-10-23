import 'package:flutter/material.dart';
import 'package:securent/model/product.dart';
import 'package:securent/onbording/color.dart';
import 'package:securent/onbording/onbordingData.dart';
import 'package:securent/screen/bottomn.dart';
import 'package:securent/screen/home.dart';

class Detailpage extends StatefulWidget {
  const Detailpage({super.key, required this.product});
  final Product product;

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  final pageController = PageController();
  final controller = Onbordingdata();
  int currentIndex = 0;

  Widget _room({
    required image,
    required name,
  }) {
    return Column(
      children: [
        Image.asset(
          image,
          height: 50,
          width: 50,
        ),
        Text(name),
      ],
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
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // color: Colors.black,
                height: 390,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        widget.product.image,
                      ),
                      fit: BoxFit.cover),
                ),
                child: Container(
                  padding: EdgeInsets.only(bottom: 350, left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => Bottomn()));
                        },
                        color: primaryColor,
                        icon: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: primaryColor,
                        ),
                      ),
                      IconButton.filledTonal(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              buildDots(),
              SizedBox(
                height: 10,
              ),
              Card(
                margin: EdgeInsets.all(8),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 190,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // padding: EdgeInsets.only(left: 16),
                          child: Text(
                            widget.product.name,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          // padding: EdgeInsets.only(left: 16),
                          child: Row(
                            children: [
                              Text(
                                widget.product.price,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Text(
                                "Yearly",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          // padding: EdgeInsets.only(left: 16),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: Color(0xff525866),
                              ),
                              Text(
                                widget.product.location,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _room(
                                image: "images/hotel1.png",
                                name: "Bedroom: 4",
                              ),
                              VerticalDivider(
                                endIndent: 10,
                                indent: 10,
                              ),
                              _room(
                                image: "images/hotel1.png",
                                name: "Bath: 5",
                              ),
                              VerticalDivider(
                                endIndent: 10,
                                indent: 10,
                                thickness: 2,
                              ),
                              _room(
                                image: "images/car.png",
                                name: "parking: 2",
                              ),
                              VerticalDivider(
                                endIndent: 10,
                                indent: 10,
                              ),
                              _room(
                                image: "images/hotel1.png",
                                name: "Gym",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(13),
                child: Text(
                  "Decription",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Card(
                margin: EdgeInsets.all(8),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.description,
                        style: TextStyle(
                            color: Color(0xff525866),
                            // fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(13),
                child: Text(
                  "Landlord",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Card(
                child: Container(
                  height: 90,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(8),
                        child: CircleAvatar(
                          radius: 40,
                          child: Image(
                            image: AssetImage("images/Avatar.png"),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Dolapo Williams",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Container(
                              child: Row(
                            children: [
                              Image.asset(
                                "images/star.png",
                                height: 20,
                                width: 20,
                              ),
                              Image.asset(
                                "images/star.png",
                                height: 20,
                                width: 20,
                              ),
                              Image.asset(
                                "images/star.png",
                                height: 20,
                                width: 20,
                              ),
                              Image.asset(
                                "images/star.png",
                                height: 20,
                                width: 20,
                              ),
                              Image.asset(
                                "images/unstar.png",
                                height: 20,
                                width: 20,
                              ),
                            ],
                          ))
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Image.asset(
                          "images/back.png",
                          height: 30,
                          width: 30,
                        ),
                      ),
                      VerticalDivider(
                        endIndent: 10,
                        indent: 10,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Image.asset(
                          "images/Frame3.png",
                          height: 60,
                          width: 60,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Image.asset(
                          "images/Frame1.png",
                          height: 60,
                          width: 60,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
