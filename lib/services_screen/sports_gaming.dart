import 'package:flutter/material.dart';
import 'package:hello_mart/screens/product_details/product_details.dart';
import 'package:hello_mart/screens/service_providers_screen/service_providers_screen.dart';
import 'package:hello_mart/utils/screen_const.dart';

class SportsGamingServiceProviderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ServiceProvidersScreen(
      serviceName: "Sports & Gaming Accessories",
      nextScreen: ScreenConst.SPORTS_GAMING,
    );
  }
}

class SportsGamingProductProviderScreen extends StatelessWidget {
  final String storeName;

  const SportsGamingProductProviderScreen({Key key, this.storeName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ProductDetails(serviceProviderName: storeName, selectionType: SelectionType.ADD, tabNames: [
      "ALL",
      "CRICKET ITEMS",
      "FOOTBALL ITEMS",
      "PS4 & PS3 GAMING CONSOLE",
    ]);
  }
}
