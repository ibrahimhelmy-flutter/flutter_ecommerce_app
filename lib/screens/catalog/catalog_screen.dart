import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/config/lang/applocal.dart';
import 'package:flutter_ecommerce_app/models/category_model.dart';
import 'package:flutter_ecommerce_app/models/models.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';

  final Category category;
  const CatalogScreen({Key? key, required this.category}) : super(key: key);

  static Route route({required Category category}) {
    return MaterialPageRoute(
        builder: (_) => CatalogScreen(
              category: category,
            ),
        settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    List<Product> allProductoFCat = Product.products
        .where((element) => element.caegory == category.name)
        .toList();
    print(allProductoFCat);

    return Scaffold(
      appBar: CustomAppBar(title: trans(context,"catalog_title")),
      bottomNavigationBar: CustomNavBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            itemCount: allProductoFCat.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1.15),
            itemBuilder: (context, i) {
              return Center(child: ProductCard(product: allProductoFCat[i],widthVactor: 2.2,));
            }),
      ),
    );
  }
}
