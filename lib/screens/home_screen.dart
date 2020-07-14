import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:hello_mart/screens/product_details/product_details.dart';
import 'package:hello_mart/screens/service_providers_screen/service_providers_Screen.dart';
import 'package:hello_mart/services_screen/bakery.dart';
import 'package:hello_mart/services_screen/car_wash.dart';
import 'package:hello_mart/services_screen/dry_fruits.dart';
import 'package:hello_mart/services_screen/electric_bill.dart';
import 'package:hello_mart/services_screen/flower.dart';
import 'package:hello_mart/services_screen/food.dart';
import 'package:hello_mart/services_screen/hello_mart.dart';
import 'package:hello_mart/services_screen/ice_cream.dart';
import 'package:hello_mart/services_screen/laundry.dart';
import 'package:hello_mart/services_screen/meat_fish.dart';
import 'package:hello_mart/services_screen/medical_services.dart';
import 'package:hello_mart/services_screen/mobile_electronics.dart';
import 'package:hello_mart/services_screen/pharmacy.dart';
import 'package:hello_mart/services_screen/saloon.dart';
import 'package:hello_mart/services_screen/sports_gaming.dart';
import 'package:hello_mart/services_screen/stationery.dart';
import 'package:hello_mart/services_screen/token.dart';
import 'package:hello_mart/services_screen/view_more.dart';
import 'package:hello_mart/utils/const_colors.dart';
import 'package:hello_mart/utils/const_image_data.dart';
import 'package:hello_mart/utils/screen_const.dart';
import 'package:location/location.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Location _location = new Location();
  TextEditingController _searchController = TextEditingController();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  _loadLocation() async {
    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await _location.getLocation();
    final coordinates = new Coordinates(_locationData.latitude, _locationData.longitude);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    return "${first.featureName}, ${first.subLocality}, ${first.adminArea}".toString();
  }

  _JumpToNextScreen(Widget nextScreen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => nextScreen));
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: _loadLocation(),
            builder: (BuildContext context, snapshot) {
              if (!snapshot.hasData) return _loadingState();
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        LocationText(
                          snapshot: snapshot,
                        ),
                        SizedBox(
                          height: screenHeight * 0.2,
                          width: double.maxFinite,
                          child: CarouselSlider(
                            options: CarouselOptions(
                                autoPlay: true,
                                autoPlayInterval: Duration(milliseconds: 2400),
                                autoPlayAnimationDuration: Duration(milliseconds: 800),
                                enlargeCenterPage: true),
                            items: _banners.map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                      width: MediaQuery.of(context).size.width * 0.8,
                                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                                      decoration:
                                          BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10.0),
                                        child: Image.asset(
                                          i,
                                          fit: BoxFit.cover,
                                        ),
                                      ));
                                },
                              );
                            }).toList(),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 8.0,
                          ),
                          height: screenHeight * 0.055,
                          child: TextField(
                            controller: _searchController,
                            cursorColor: kPrimaryGrey,
                            style: TextStyle(
                              color: kGreyDark,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                            ),
                            decoration: InputDecoration(
                                hintText: 'Search for products',
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      color: kPrimaryDark,
                                      width: 1.2,
                                    )),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: kPrimaryGrey,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      color: kPrimaryGrey,
                                      width: 1.1,
                                    ))),
                          ),
                        ),
                        Container(
                          height: screenHeight * 0.1,
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          width: double.maxFinite,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              'assets/images/sale_banner2.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.006,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: GridView.count(
                        crossAxisCount: 3,
                        childAspectRatio: 1.0,
                        children: List.generate(gridItemsViewLess.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              switch (gridItemsViewLess[index].screenConst) {
                                case ScreenConst.FOOD:
                                  _JumpToNextScreen(FoodServiceProviderScreen());
                                  break;
                                case ScreenConst.BAKERY:
                                  _JumpToNextScreen(BakeryServiceProviderScreen());
                                  break;
                                case ScreenConst.CARWASH:
                                  _JumpToNextScreen(CarWashServiceProviderScreen());
                                  break;
                                case ScreenConst.DRY_FRUITS:
                                  _JumpToNextScreen(DryFruitsServiceProviderScreen());
                                  break;
                                case ScreenConst.ICE_CREAM:
                                  _JumpToNextScreen(IceCreamPastriesServiceProviderScreen());
                                  break;
                                case ScreenConst.STATIONERY:
                                  _JumpToNextScreen(StationeryServiceProviderScreen());
                                  break;
                                case ScreenConst.HELLOMART:
                                  _JumpToNextScreen(HomeMartServiceProviderScreen());
                                  break;
                                case ScreenConst.MEAT_FISH:
                                  _JumpToNextScreen(MeatFishServiceProviderScreen());
                                  break;
                                case ScreenConst.VIEWMORE:
                                  _JumpToNextScreen(ViewMoreServiceProviderScreen());
                                  break;
                              }
                            },
                            child: Container(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Material(
                                    elevation: 8.0,
                                    shadowColor: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Container(
                                      padding: EdgeInsets.all(screenHeight * 0.02),
                                      height: screenHeight * 0.09,
                                      width: screenHeight * 0.09,
                                      decoration:
                                          BoxDecoration(color: kGreyDark, borderRadius: BorderRadius.circular(10.0)),
                                      child: Image.asset(
                                        gridItemsViewLess[index].imageUrl,
                                        color: kPrimaryDark,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.01,
                                  ),
                                  Text(
                                    gridItemsViewLess[index].title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontWeight: FontWeight.bold, color: kGreyDark),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }

  List<String> _banners = [
    "assets/images/sale_banner.jpg",
    "assets/images/sale_banner3.png",
    "assets/images/sale_banner4.png",
    "assets/images/sale_banner5.jpg",
  ];

  Center _loadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Loading Location",
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}

class LocationText extends StatelessWidget {
  LocationText({Key key, this.snapshot}) : super(key: key);
  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        children: [
          Icon(
            Icons.location_on,
            size: 20.0,
          ),
          Text(snapshot.data, style: TextStyle(fontSize: 14.0, color: kGreyDark, fontWeight: FontWeight.w600)),
          InkWell(
            onTap: () {},
            child: Icon(
              Icons.keyboard_arrow_down,
              size: 22.0,
            ),
          ),
        ],
      ),
    );
  }
}
