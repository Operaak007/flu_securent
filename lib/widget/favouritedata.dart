import 'package:flutter/material.dart';
import 'package:securent/detailpage.dart';
import 'package:securent/model/product.dart';
import 'package:securent/onbording/color.dart';

class Favouritedata extends StatelessWidget {
  const Favouritedata({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0.1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 190,
            alignment: Alignment.topRight,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    product.image,
                  ),
                  fit: BoxFit.cover),
            ),
            child: IconButton.filledTonal(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite,
                  color: Color(0xffFF6875),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    product.name,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "₦${product.price}",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          TextSpan(
                            text: "Yearly",
                            style: TextStyle(color: Color(0xff525866)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Color(0xff525866),
                      ),
                      Text(
                        product.location,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
