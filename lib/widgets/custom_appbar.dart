import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/screens/screens.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Container(
        color: Colors.black,
        padding: EdgeInsets.all(20),
        child: Text(title,
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: Colors.white)),
      ),
      iconTheme: IconThemeData(color: Colors.black),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, WishListScreen.routeName);
            },
            icon: Icon(
              Icons.favorite,
              color: Colors.black,
            ))
      ],
    );
  }

  @override
  
  Size get preferredSize => Size.fromHeight(50);
}
