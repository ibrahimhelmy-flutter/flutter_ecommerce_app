import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/models.dart';
import 'package:flutter_ecommerce_app/screens/catalog/catalog_screen.dart';

class HeroCarsouleCard extends StatelessWidget {
  Category? category;
  Product? product;
  HeroCarsouleCard({Key? key, this.category, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (product == null) {
          Navigator.pushNamed(context, CatalogScreen.routeName,arguments: category);
        }
      },
      child: Container(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  Image.network(
                      category != null ? category!.imgurl : product!.imgUrl,
                      fit: BoxFit.cover,
                      width: 1000.0),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Text(
                        category != null ? category!.name : "",
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
