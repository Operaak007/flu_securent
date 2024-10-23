import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 0.1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.grey),
        ),
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("images/"))),
            )
          ],
        ),
      ),
    );
  }
}
