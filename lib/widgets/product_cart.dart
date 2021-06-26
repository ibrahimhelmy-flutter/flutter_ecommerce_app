import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/blocs/wislList/wishlist_bloc.dart';
import 'package:flutter_ecommerce_app/models/models.dart';
import 'package:flutter_ecommerce_app/screens/product/product_screen.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthVactor, leftPosition;
  final bool isWishList;
  const ProductCard(
      {Key? key,
      required this.product,
      required this.widthVactor,
      this.leftPosition = 5,
      this.isWishList = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthVactor;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProductScreen.routeName,
            arguments: product);
      },
      child: Stack(
        children: [
          Container(
            height: 150,
            width: widthValue,
            child: Image.network(
              product.imgUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              top: 60,
              left: leftPosition,
              child: Container(
                width: widthValue - 5 - leftPosition,
                height: 80,
                decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
              )),
          Positioned(
              top: 65,
              left: leftPosition + 5,
              child: Container(
                width: widthValue - 15 - leftPosition,
                height: 70,
                decoration: BoxDecoration(color: Colors.black),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            "\$ ${product.price}",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          )),
                      isWishList
                          ? BlocBuilder<WishlistBloc, WishlistState>(
                              builder: (context, state) {
                                return IconButton(
                                    onPressed: () {
                                      context
                                          .read<WishlistBloc>()
                                          .add(RemoveWishListEvent(product));
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ));
                              },
                            )
                          : Container()
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
