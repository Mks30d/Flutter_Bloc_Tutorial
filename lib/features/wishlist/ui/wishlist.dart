import 'package:flutter/material.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  void timeFunction() async{
    print("time started");
    await Future.delayed(Duration(seconds: 3));
    print("time ended");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: InkWell(
        onTap: () {
          timeFunction();
        },
        child: Container(
        ),
      ),
    );
  }
}
