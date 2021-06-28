import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/blocs/langBloc/lang_bloc.dart';
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
            )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButton(
            underline: SizedBox(),
           
            icon: Icon(
              Icons.language,
              color: Colors.black,
            ),
            items: [
              DropdownMenuItem(child: Text("العربية"), value: "ar"),
              DropdownMenuItem(child: Text("ُEnglish"), value: "en"),
            ],
            onChanged: (lan) {
              context.read<LangBloc>().add(LangChange(lan.toString()));
            },
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
