import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name, caegory, imgUrl;
  final double price;
  final bool isRecommended, isPopular;

  Product({
    required this.name,
    required this.caegory,
    required this.imgUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
  });

  @override
  List<Object?> get props =>
      [name, caegory, imgUrl, price, isPopular, isRecommended];
  static List<Product> products = [
    Product(
      name: "Soft Drink #1",
      caegory: "Soft Drink",
      imgUrl:
          "https://images.unsplash.com/photo-1581006852262-e4307cf6283a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80",
      price: 5,
      isRecommended: true,
      isPopular: true,
    ),

        Product(
      name: "Soft Drink #2",
      caegory: "Soft Drink",
      imgUrl:
          "https://images.unsplash.com/photo-1610873167013-2dd675d30ef4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=244&q=80",
      price: 6,
      isRecommended: false,
      isPopular: false,
    ),

        Product(
      name: "Soft Drink #1",
      caegory: "Soft Drink",
      imgUrl:
          "https://images.unsplash.com/photo-1543253687-c931c8e01820?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=401&q=80",
      price: 7,
      isRecommended: true,
      isPopular: true,
    ),

            Product(
      name: "Smoothies #1",
      caegory: "Smoothies",
      imgUrl:
          "https://images.unsplash.com/photo-1505252585461-04db1eb84625?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=352&q=80",
      price: 20,
      isRecommended: true,
      isPopular: true,
    ),


    
            Product(
      name: "Smoothies #2",
      caegory: "Smoothies",
      imgUrl:
          "https://images.unsplash.com/photo-1506458961255-571f40df5aad?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=334&q=80",
      price: 20,
      isRecommended: false,
      isPopular: true,
    ),
  ];
}
