import 'package:flutter/material.dart';
import 'package:hello_mart/screens/product_details/product_details.dart';
import 'package:hello_mart/screens/service_providers_screen/service_providers_screen.dart';
import 'package:hello_mart/utils/screen_const.dart';

class SaloonServiceProviderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ServiceProvidersScreen(
      serviceName: "Saloon",
      nextScreen: ScreenConst.SALOON,
    );
  }
}

class SaloonProductProviderScreen extends StatelessWidget {
  final String storeName;

  const SaloonProductProviderScreen({Key key, this.storeName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ProductDetails(serviceProviderName: storeName, selectionType: SelectionType.BOOK, tabNames: [
      "ALL",
      "CUTTING",
      "FACIAL",
      "FACE SCRUB",
      "HAIR STRAIGHTENING",
    ]);
  }
}
