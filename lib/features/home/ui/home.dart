import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/features/cart/ui/cart.dart';
import 'package:flutter_bloc_tutorial/features/home/ui/product_tile_widget.dart';
import 'package:flutter_bloc_tutorial/features/wishlist/ui/wishlist.dart';

import '../bloc/home_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //====================================
  Widget loadedStateWidget() {
    print("loadedStateWidget");
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
  }

  // as soon as app open, we want to add initial event
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

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
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Center(child: CircularProgressIndicator());
          case HomeLoadedState:
            final successState = state as HomeLoadedState;
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
              body: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (context, index) {
                    return ProductTileWidget(
                        productDataModel: successState.products[index]);
                  }),
            );
          case HomeErrorState:
            return Scaffold(
              body: Center(
                child: Text("Error!!!"),
              ),
            );
          default:
            return SizedBox();
        }

        // return Scaffold(
        //
        //   appBar: AppBar(
        //     title: Text("Flutter Bloc"),
        //     // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        //     backgroundColor: Colors.teal,
        //     foregroundColor: Colors.white,
        //     actions: [
        //       IconButton(
        //           onPressed: () {
        //             homeBloc.add(HomeWishlistButtonNavigateEvent());
        //           },
        //           icon: Icon(Icons.favorite_border)),
        //       IconButton(
        //           onPressed: () {
        //             homeBloc.add(HomeCartButtonNavigateEvent());
        //           },
        //           icon: Icon(Icons.shopping_cart_outlined))
        //     ],
        //   ),
        //   body: Placeholder(),
        // );
      },
    );
  }
}
