

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/blocs/wislList/wishlist_bloc.dart';

import 'package:flutter_ecommerce_app/widgets/widgets.dart';

class WishListScreen extends StatelessWidget {
  static const String routeName = '/WishListScreen';

  const WishListScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => WishListScreen(),
        settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "WishList Screen"),
        bottomNavigationBar: CustomNavBar(),
        body: BlocBuilder<WishlistBloc,WishlistState>(builder: (context, State) {
          if (State is WishlistLoaded) {
            return GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                itemCount: State.wishList.products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, childAspectRatio: 2.4),
                itemBuilder: (context, i) {
                  return Center(
                      child: ProductCard(
                    product: State.wishList.products[i],
                    widthVactor: 1.1,
                    leftPosition: MediaQuery.of(context).size.width / 3,
                    isWishList: true,
                  ));
                });
          } else if (State is WishlistLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (State is WishlistErorr) {
            return Center(
              child: Text("Eror"),
            );
          }
          return Text("data");
        }));
  }
}
