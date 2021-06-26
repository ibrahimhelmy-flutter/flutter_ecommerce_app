import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/blocs/wislList/wishlist_bloc.dart';
import 'package:flutter_ecommerce_app/config/App_route.dart';
import 'package:flutter_ecommerce_app/config/them.dart';
import 'package:flutter_ecommerce_app/screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_)=>WishlistBloc()..add(StartWishListEvent()))

    ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: HomeScreen.routeName,
        //home: HomeScreen(),
      ),
    );
  }
}
