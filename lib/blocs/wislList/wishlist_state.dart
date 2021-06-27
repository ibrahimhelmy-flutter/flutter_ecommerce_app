part of 'wishlist_bloc.dart';

abstract class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object> get props => [];
}

class WishlistLoading extends WishlistState {}

class WishlistLoaded extends WishlistState {
  final WishListModel wishList;

  WishlistLoaded({this.wishList = const WishListModel()});

  @override
  List<Object> get props => [wishList];
}

class WishlistErorr extends WishlistState {}
