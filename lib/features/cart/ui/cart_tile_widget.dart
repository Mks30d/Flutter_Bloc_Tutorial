import 'package:flutter/material.dart';
import 'package:flutter_bloc_tutorial/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_tutorial/features/home/models/home_product_data_model.dart';

import '../bloc/cart_bloc.dart';

class CartTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;

  const CartTileWidget(
      {super.key, required this.productDataModel, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.only(left: 8, right: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(11),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // width: 200,
              height: 150,
              // child: Image.network(productDataModel.imageUrl),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(productDataModel.imageUrl)),
              ),
            ),
            Text(productDataModel.id + ". " + productDataModel.name),
            Text(productDataModel.description),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$ " + productDataModel.price.toString()),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          cartBloc.add(RemoveFromCartEvent(
                            productDataModel: productDataModel
                          ));
                        },
                        icon: Icon(Icons.shopping_cart)),
                    IconButton(
                        onPressed: () {
                          // homeBloc.add(HomeProductWishlistButtonClickedEvent(
                          //     clickedProduct: productDataModel));
                        },
                        icon: Icon(Icons.favorite_outline_rounded))
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 11,
            )
          ],
        ),
      ),
    );
  }
}
