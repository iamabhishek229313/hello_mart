import 'package:flutter/material.dart';
import 'package:hello_mart/screens/product_details/product_details.dart';
import 'package:hello_mart/screens/service_providers_screen/service_providers_screen.dart';
import 'package:hello_mart/utils/screen_const.dart';

class IceCreamPastriesServiceProviderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ServiceProvidersScreen(
      serviceName: "Ice Cream/Pastries/Cake",
      nextScreen: ScreenConst.ICE_CREAM,
    );
  }
}

class IceCreamPastriesProductProviderScreen extends StatelessWidget {
  final String storeName;

  const IceCreamPastriesProductProviderScreen({Key key, this.storeName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ProductDetails(serviceProviderName: storeName, selectionType: SelectionType.ADD, tabNames: [
      "ALL",
      "CAKE",
      "PASTRIES",
      "ICECREAM",
    ]);
  }
}
