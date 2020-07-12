import 'package:flutter/material.dart';
import 'package:hello_mart/screens/product_details/product_details.dart';
import 'package:hello_mart/screens/service_providers_screen/service_providers_screen.dart';
import 'package:hello_mart/utils/screen_const.dart';

class FoodServiceProviderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ServiceProvidersScreen(
      serviceName: "Food",
      nextScreen: ScreenConst.FOOD,
    );
  }
}

class FoodProductProviderScreen extends StatelessWidget {
  final String storeName;

  const FoodProductProviderScreen({Key key, this.storeName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ProductDetails(serviceProviderName: storeName, tabNames: [
      "NON-VEG",
      "VEG",
      "BURGER",
      "NOODLES",
      "VEVERAGE",
    ]);
  }
}
