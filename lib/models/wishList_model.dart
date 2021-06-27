import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce_app/models/models.dart';

class WishListModel extends Equatable {
  final List<Product> products;

  const WishListModel({this.products=const<Product>[]});

  @override
  List<Object?> get props => [products];
}
