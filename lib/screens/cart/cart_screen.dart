import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/blocs/cart/cart_bloc.dart';
import 'package:flutter_ecommerce_app/models/models.dart';
import 'package:flutter_ecommerce_app/screens/screens.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cartScreen';

  const CartScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => CartScreen(), settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "cart Screen"),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Container(
            height: 60,
            child: Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () {},
                  child: Text(
                    "GO TO CHECKOUT",
                    style: Theme.of(context).textTheme.headline4,
                  )),
            ),
          ),
        ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CartLoaded) {
              return SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              CartModel().freeDeleverymessage,
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, HomeScreen.routeName);
                                },
                                child: Text(
                                  "Add More Items",
                                  style: Theme.of(context).textTheme.headline3,
                                ))
                          ],
                        ),

                        ...state.cartModel.products
                            .map((e) => CarProductCard(product: e))
                            .toList()
                        // CarProductCard(product: Product.products[0]),
                        // CarProductCard(product: Product.products[1]),
                      ]),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 50),
                            child: Column(
                              children: [
                                Divider(thickness: 2),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("SUBTOTAl",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5),
                                    Text("\$ ${state.cartModel.subtotalString}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5)
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("DELEVERY FEE",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5),
                                    Text("\$ ${state.cartModel.delveryFreeString}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5)
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Stack(children: [
                            Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width / 1.1,
                              color: Colors.black.withAlpha(50),
                            ),
                            Positioned(
                              top: 5,
                              left: 5,
                              child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width / 1.1 -
                                    10,
                                color: Colors.black,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("Total",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3!
                                            .copyWith(color: Colors.white)),
                                    Text("\$ ${state.cartModel.totalString}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3!
                                            .copyWith(color: Colors.white)),
                                  ],
                                ),
                              ),
                            )
                          ]),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Text("ther is Wrong Error");
            }
          },
        ));
  }
}
