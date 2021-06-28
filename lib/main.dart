import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/blocs/cart/cart_bloc.dart';
import 'package:flutter_ecommerce_app/blocs/langBloc/lang_bloc.dart';
import 'package:flutter_ecommerce_app/blocs/wislList/wishlist_bloc.dart';
import 'package:flutter_ecommerce_app/config/App_route.dart';
import 'package:flutter_ecommerce_app/config/them.dart';
import 'package:flutter_ecommerce_app/screens/screens.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'config/lang/applocal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(StartWishListEvent())),
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
        BlocProvider(create: (_) => LangBloc()..add(LangStart())),
      ],
      child: BlocBuilder<LangBloc, LangState>(
        builder: (context, state) {
          if (state is LangInitial) {
            return CircularProgressIndicator();
          } else if (state is LangLoaded) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: theme(),
              debugShowCheckedModeBanner: false,
              onGenerateRoute: AppRouter.onGenerateRoute,
              initialRoute: HomeScreen.routeName,
              //home: HomeScreen(),
              localizationsDelegates: [
                AppLocale.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate
              ],
              supportedLocales: [
                Locale("en", ""),
                Locale("ar", ""),
              ],
              locale: state.locale,
              localeResolutionCallback: (current, supportlocals) {
                if (current != null) {
                  for (Locale local in supportlocals) {
                    if (current.languageCode == local.languageCode) {
                      return current;
                    }
                  }
                }
                return supportlocals.first;
              },
            );
          }
          return Text("ddd");
        },
      ),
    );
  }
}
