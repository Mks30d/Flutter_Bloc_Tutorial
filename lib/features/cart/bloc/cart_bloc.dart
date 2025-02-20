import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_tutorial/data/cart_items.dart';
import 'package:flutter_bloc_tutorial/features/cart/ui/cart.dart';
import 'package:meta/meta.dart';

import '../../home/models/home_product_data_model.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<RemoveFromCartEvent>(removeFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItem: cartItems));
  }

  FutureOr<void> removeFromCartEvent(
      RemoveFromCartEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.productDataModel);
    emit(CartSuccessState(cartItem: cartItems));  // --- OR ---
    emit(CartRemovedActionState(cartItem: cartItems));
    //get your cartItems
    // check is your product model there in cartItem -> always true
    // run a function to remove that product model from that cartItem
    // emit removedCartItemState
  }
}
