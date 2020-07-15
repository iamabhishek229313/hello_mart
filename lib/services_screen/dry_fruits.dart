import 'package:flutter/material.dart';
import 'package:hello_mart/screens/product_details/product_details.dart';
import 'package:hello_mart/screens/service_providers_screen/service_providers_screen.dart';
import 'package:hello_mart/utils/screen_const.dart';

class DryFruitsServiceProviderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ServiceProvidersScreen(
      serviceName: "Dry Fruits",
      nextScreen: ScreenConst.DRY_FRUITS,
    );
  }
}

class DryFruitsProductProviderScreen extends StatelessWidget {
  final String storeName;

  const DryFruitsProductProviderScreen({Key key, this.storeName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ProductDetails(serviceProviderName: storeName, tabNames: [
      "ALL",
      "DATES",
      "CASHEW NUTS",
      "ALMONDS",
      "WALNUTS",
    ]);
  }
}
