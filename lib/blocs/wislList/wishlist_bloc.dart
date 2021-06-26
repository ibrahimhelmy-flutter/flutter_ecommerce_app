import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce_app/models/models.dart';
import 'package:flutter_ecommerce_app/models/wishList_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading());

  @override
  Stream<WishlistState> mapEventToState(WishlistEvent event) async* {
    if (event is StartWishListEvent) {
      yield* _mapStartWishListToState();
    } else if (event is AddWishListEvent) {
      yield* _mapAddtWishListToState(event, state);
    } else if (event is RemoveWishListEvent) {
      yield* _mapRemoveWishListToState(event, state);
    }
  }

  Stream<WishlistState> _mapStartWishListToState() async* {
    yield WishlistLoading();
    try {
      yield WishlistLoaded();
    } catch (e) {}
  }

 Stream<WishlistState> _mapAddtWishListToState(event, state) async* {
    if (state is WishlistLoaded) {
      try {
        yield WishlistLoaded(
            wishList: WishList(
                products: List.from(state.wishList.products)
                  ..add(event.product)));
      } catch (e) {}
    }
  }

  Stream<WishlistState> _mapRemoveWishListToState(
      RemoveWishListEvent event, WishlistState state) async* {
    if (state is WishlistLoaded) {
      try {
        yield WishlistLoaded(
            wishList: WishList(
                products: List.from(state.wishList.products)
                  ..remove(event.product)));
      } catch (e) {}
    }
  }
}
