import 'package:flutter/material.dart';
import 'package:hello_mart/screens/product_details/product_details.dart';
import 'package:hello_mart/utils/screen_const.dart';

class FlowerServiceProviderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This page have no Service Providers Screen.
    return ProductDetails(
      serviceProviderName: "Flowers",
      selectionType: SelectionType.ADD,
      tabNames: [
        "ALL",
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
