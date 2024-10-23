import 'package:flutter/material.dart';
import 'package:securent/data/productdata.dart';
import 'package:securent/onbording/color.dart';
import 'package:securent/widget/favouritedata.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 10, left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "images/vector3.png",
                      height: 30,
                      width: 40,
                      color: primaryColor,
                    ),
                    Text(
                      "Favourite",
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Image.asset(
                      "images/vector4.png",
                      height: 20,
                      width: 40,
                      color: primaryColor,
                    ),
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
                    return Favouritedata(
                      product: products[index],
                    );
                  })
            ],
          ),
        ],
      ),
    );
  }
}
