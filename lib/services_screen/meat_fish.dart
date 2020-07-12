import 'package:flutter/material.dart';
import 'package:hello_mart/screens/product_details/product_details.dart';

class MeatFishServiceProviderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This page have no Service Providers Screen.
    return ProductDetails(
      serviceProviderName: "Hello Mart",
      tabNames: [
        "FISH",
        "MEAT",
      ],
    );
  }
}
