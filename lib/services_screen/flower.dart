import 'package:flutter/material.dart';
import 'package:hello_mart/screens/product_details/product_details.dart';

class FlowerServiceProviderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This page have no Service Providers Screen.
    return ProductDetails(
      serviceProviderName: "Flowers",
      tabNames: [
        "CATEGORY 1",
        "CATEGORY 2",
        "CATEGORY 3",
        "CATEGORY 4",
        "CATEGORY 5",
        "CATEGORY 6",
      ],
    );
  }
}
