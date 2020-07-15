import 'package:flutter/material.dart';
import 'package:hello_mart/screens/product_details/product_details.dart';
import 'package:hello_mart/utils/screen_const.dart';

class MeatFishServiceProviderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This page have no Service Providers Screen.
    return ProductDetails(
      serviceProviderName: "Meat/Fish",
      selectionType: SelectionType.ADD,
      tabNames: [
        "ALL",
        "FISH",
        "MEAT",
      ],
    );
  }
}
