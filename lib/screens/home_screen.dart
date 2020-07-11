import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:hello_mart/screens/product_details/product_details.dart';
import 'package:hello_mart/utils/const_colors.dart';
import 'package:hello_mart/utils/const_image_data.dart';
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
                        Container(
                            height: screenHeight * 0.2,
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.grey)),
                        Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 8.0,
                          ),
                          height: screenHeight * 0.06,
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
                            height: screenHeight * 0.12,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.grey)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.006,
                  ),
                  Expanded(
                    child: GridView.builder(
                        itemCount: gridItems.length,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ProductDetails(
                                            serviceName: gridItems[index].title,
                                          )));
                            },
                            child: Container(
                              //color: Colors.primaries[Random().nextInt(12)],
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
                                        gridItems[index].imageUrl,
                                        color: kPrimaryDark,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.01,
                                  ),
                                  Text(
                                    gridItems[index].title,
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
                ],
              );
            }),
      ),
    );
  }

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
