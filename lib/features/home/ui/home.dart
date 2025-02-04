import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/features/cart/ui/cart.dart';
import 'package:flutter_bloc_tutorial/features/wishlist/ui/wishlist.dart';

import '../bloc/home_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) {
        return current is HomeActionState;
      },
      buildWhen: (previous, current) {
        return current is! HomeActionState;
      },
      listener: (context, state) {
        if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return Wishlist();
            },
          ));
        } else if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Cart();
          }));
        }
      },
      builder: (context, state) {
        return Scaffold(

          appBar: AppBar(
            title: Text("Flutter Bloc"),
            // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            actions: [
              IconButton(
                  onPressed: () {
                    homeBloc.add(HomeWishlistButtonNavigateEvent());
                  },
                  icon: Icon(Icons.favorite_border)),
              IconButton(
                  onPressed: () {
                    homeBloc.add(HomeCartButtonNavigateEvent());
                  },
                  icon: Icon(Icons.shopping_cart_outlined))
            ],
          ),
          body: Placeholder(),
        );
      },
    );
  }
}
