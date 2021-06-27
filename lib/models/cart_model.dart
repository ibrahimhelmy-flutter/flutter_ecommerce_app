import 'package:equatable/equatable.dart';

import 'product_model.dart';

class CartModel extends Equatable {
  final List<Product> products;
 const CartModel({this.products=const<Product>[]});

  double get _subtotal =>
      products.fold(0, (total, current) => total + current.price);

  double _deleveryFee(subtotal) {
    if (subtotal >= 30) {
      return 0.0;
    } else {
      return 10;
    }
  }

  String _freeDeleverymessage(subtotal) {
    if (subtotal >= 30) {
      return "You Have Free Delevery";
    } else {
      double missing = 30.0 - subtotal;
      return "Add \$ ${missing.toStringAsFixed(2)} For Free Delevery ";
    }
  }

  double _total(subtotal, deleveryfee) {
    return subtotal + deleveryfee(subtotal);
  }

  String get subtotalString => _subtotal.toStringAsFixed(2);
  String get totalString => _total(_subtotal, _deleveryFee).toStringAsFixed(2);
  String get delveryFreeString => _deleveryFee(_subtotal).toStringAsFixed(2);
  String get freeDeleverymessage => _freeDeleverymessage(_subtotal);

  @override
  List<Object?> get props => [products];
}
