part of 'cart_bloc.dart';

abstract class CartEvent {}

class CartInitialEvent extends CartEvent {

}

class RemoveFromCartEvent extends CartEvent {
  final ProductDataModel productDataModel;

  RemoveFromCartEvent({required this.productDataModel});
}