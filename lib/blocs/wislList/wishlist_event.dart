part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object> get props => [];
}

class StartWishListEvent extends WishlistEvent {}

class AddWishListEvent extends WishlistEvent {
  final Product product;

  AddWishListEvent(this.product);
  @override
  List<Object> get props => [product];

}
class RemoveWishListEvent extends WishlistEvent {
  final Product product;

 const RemoveWishListEvent(this.product);
  @override
  List<Object> get props => [product];

}