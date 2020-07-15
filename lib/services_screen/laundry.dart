import 'package:flutter/material.dart';
import 'package:hello_mart/screens/product_details/product_details.dart';
import 'package:hello_mart/screens/service_providers_screen/service_providers_screen.dart';
import 'package:hello_mart/utils/screen_const.dart';

class LaundryServiceProviderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ServiceProvidersScreen(
      serviceName: "Laundry",
      nextScreen: ScreenConst.LAUNDRY,
    );
  }
}

class LaundryProductProviderScreen extends StatelessWidget {
  final String storeName;

  const LaundryProductProviderScreen({Key key, this.storeName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ProductDetails(serviceProviderName: storeName, selectionType: SelectionType.BOOK, tabNames: [
      "ALL",
      "JEANS",
      "COTTON",
      "SILK",
      "WOOLEN MATERIAL",
    ]);
  }
}
