part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState {}

class CartInitial extends CartState {}

class CartSuccessState extends CartState {
  final List<ProductDataModel> cartItem;

  CartSuccessState({required this.cartItem});
}

class CartRemovedActionState extends CartActionState {
  final List<ProductDataModel> cartItem;

  CartRemovedActionState({required this.cartItem});
}