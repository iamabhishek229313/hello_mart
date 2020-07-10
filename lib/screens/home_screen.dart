import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:hello_mart/utils/const_colors.dart';
import 'package:location/location.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Location _location = new Location();
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
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: FutureBuilder(
                future: _loadLocation(),
                builder: (BuildContext context, snapshot) {
                  if (!snapshot.hasData) return _loadingState();
                  return ListView(
                    children: [
                      LocationText(
                        snapshot: snapshot,
                      ),
                    ],
                  );
                })),
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
