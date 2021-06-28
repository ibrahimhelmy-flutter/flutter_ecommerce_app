import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/blocs/langBloc/lang_bloc.dart';
import 'package:flutter_ecommerce_app/config/lang/applocal.dart';
import 'package:flutter_ecommerce_app/models/category_model.dart';
import 'package:flutter_ecommerce_app/models/models.dart';
import 'package:flutter_ecommerce_app/widgets/product_carsoule_list.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  const HomeScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => HomeScreen(), settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: trans(context, "home_title"),),
      bottomNavigationBar: CustomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: CarouselSlider(
                options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 1.5,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    viewportFraction: 0.9),
                items: Category.categories.map((e) {
                  return HeroCarsouleCard(category: e);
                }).toList(),
              ),
            ),
            CustomSectionTitle(title: trans(context, "recommended")),
            ProductCarsouleList(
                products: Product.products
                    .where((element) => element.isRecommended)
                    .toList()),
            CustomSectionTitle(title: trans(context, "most_populer")),
            ProductCarsouleList(
                products: Product.products
                    .where((element) => element.isPopular)
                    .toList()),
          ],
        ),
      ),
    );
  }
}
