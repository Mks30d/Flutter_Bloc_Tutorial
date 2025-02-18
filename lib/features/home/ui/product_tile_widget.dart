import 'package:flutter/material.dart';
import 'package:flutter_bloc_tutorial/features/home/models/home_product_data_model.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  const ProductTileWidget({super.key, required this.productDataModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Card(), Text("data")
        ],
      ),
    );
  }
}
