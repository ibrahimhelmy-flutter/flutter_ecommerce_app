import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/models.dart';

import 'product_cart.dart';

class ProductCarsouleList extends StatelessWidget {
 final  List<Product> products;
  const ProductCarsouleList({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      child: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 5),
              child: ProductCard(product: products[index],widthVactor: 2.5,),
            );
          }),
    );
  }
}
