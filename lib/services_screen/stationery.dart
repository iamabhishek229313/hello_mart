import 'package:flutter/material.dart';
import 'package:hello_mart/screens/product_details/product_details.dart';
import 'package:hello_mart/screens/service_providers_screen/service_providers_screen.dart';
import 'package:hello_mart/utils/screen_const.dart';

class StationeryServiceProviderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ServiceProvidersScreen(
      serviceName: "Stationery",
      nextScreen: ScreenConst.STATIONERY,
    );
  }
}

class StationeryProductProviderScreen extends StatelessWidget {
  final String storeName;

  const StationeryProductProviderScreen({Key key, this.storeName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ProductDetails(serviceProviderName: storeName, selectionType: SelectionType.ADD, tabNames: [
      "ALL",
      "SCHOOL ITEMS",
      "OFFICE ITEMS",
      "PERSONAL ITEMS",
      "OTHERS",
    ]);
  }
}
