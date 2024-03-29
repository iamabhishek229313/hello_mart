import 'package:flutter/material.dart';
import 'package:hello_mart/screens/product_details/product_details.dart';
import 'package:hello_mart/screens/service_providers_screen/service_providers_screen.dart';
import 'package:hello_mart/utils/screen_const.dart';

class CarWashServiceProviderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ServiceProvidersScreen(
      serviceName: "Car Wash",
      nextScreen: ScreenConst.CARWASH,
    );
  }
}

class CarWashProductProviderScreen extends StatelessWidget {
  final String storeName;

  const CarWashProductProviderScreen({Key key, this.storeName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ProductDetails(serviceProviderName: storeName, selectionType: SelectionType.BOOK, tabNames: [
      "ALL",
      "CAR WASH",
      "DIESEL WASH",
      "CERAMIC",
      "TEFLON",
    ]);
  }
}
