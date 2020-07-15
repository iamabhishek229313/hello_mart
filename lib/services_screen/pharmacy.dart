// NEW PAGE SHOULD BE INTO+ROUCED>
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_mart/bloc/app_state_bloc.dart';
import 'package:hello_mart/core/MyClipper_basic.dart';
import 'package:hello_mart/core/bottom_nav_bar.dart';
import 'package:hello_mart/screens/profile_screen/profile_screen.dart';
import 'package:hello_mart/utils/const_colors.dart';

class PharmacyServiceProviderScreen extends StatefulWidget {
  @override
  _PharmacyServiceProviderScreenState createState() => _PharmacyServiceProviderScreenState();
}

class _PharmacyServiceProviderScreenState extends State<PharmacyServiceProviderScreen> {
  GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  bool _validate = false;

  TextEditingController _searchProductsController = TextEditingController();

  _changeScreen(int index) {
    BlocProvider.of<AppStateBloc>(context).add(ChangeScreen(index));
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: screenHeight - topPadding - AppBar().preferredSize.height,
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pharmacy",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold, color: kGreyDark, fontSize: 28.0),
                        ),
                        SizedBox(
                          height: screenHeight * 0.025,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 8.0,
                          ),
                          height: screenHeight * 0.06,
                          child: TextField(
                            controller: _searchProductsController,
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
                        Expanded(
                            child: Column(
                          children: [
                            Expanded(
                                flex: 12,
                                child: ListView.builder(
                                    itemCount: 6,
                                    itemBuilder: (BuildContext context, int index) {
                                      return Container(
                                        height: screenHeight * 0.1,
                                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: Container(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Aceteminophen",
                                                    style: TextStyle(
                                                        fontSize: 15.0, fontWeight: FontWeight.w600, color: kGreyDark),
                                                  ),
                                                  Text(
                                                    "INR 700",
                                                    style: TextStyle(
                                                        fontSize: 15.0, fontWeight: FontWeight.w600, color: kGreyDark),
                                                  ),
                                                ],
                                              ),
                                            )),
                                            Container(
                                              width: MediaQuery.of(context).size.width * 0.25,
                                              margin: const EdgeInsets.only(top: 10.0),
                                              padding: const EdgeInsets.symmetric(vertical: 4.0),
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade600,
                                                  borderRadius: BorderRadius.circular(20.0)),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  InkWell(
                                                    onTap: () {},
                                                    child: Icon(
                                                      Icons.minimize,
                                                      color: kPrimaryDark,
                                                    ),
                                                  ),
                                                  Text("ADD"),
                                                  InkWell(
                                                    onTap: () {},
                                                    child: Icon(
                                                      Icons.minimize,
                                                      color: kPrimaryDark,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    })),
                            Expanded(
                                flex: 3,
                                child: Container(
                                  child: Column(
                                    children: [
                                      Expanded(
                                          child: Container(
                                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                                        child: RaisedButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context, MaterialPageRoute(builder: (_) => RequestForMedicineScreen()));
                                          },
                                          color: kPrimaryDark,
                                          elevation: 0.0,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                                          child: Text(
                                            "Request For Medicine",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600, color: Colors.black, fontSize: 16.0),
                                          ),
                                        ),
                                      )),
                                      Expanded(
                                          child: Container(
                                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                                        child: RaisedButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context, MaterialPageRoute(builder: (_) => TrackRequestedMedicine()));
                                          },
                                          color: kPrimaryDark,
                                          elevation: 0.0,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                                          child: Text(
                                            "Track Requested Medicine",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600, color: Colors.black, fontSize: 16.0),
                                          ),
                                        ),
                                      )),
                                    ],
                                  ),
                                ))
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
                BottomNavBar()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RequestForMedicineScreen extends StatefulWidget {
  @override
  _RequestForMedicineScreenState createState() => _RequestForMedicineScreenState();
}

class _RequestForMedicineScreenState extends State<RequestForMedicineScreen> {
  TextEditingController _medicineNameController = TextEditingController();
  bool _validate = false;
  GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  _changeScreen(int index) {
    BlocProvider.of<AppStateBloc>(context).add(ChangeScreen(index));
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: screenHeight - topPadding - AppBar().preferredSize.height,
            child: Column(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Request For Medicine",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold, color: kGreyDark, fontSize: 28.0),
                      ),
                      SizedBox(
                        height: screenHeight * 0.1,
                      ),
                      Form(
                        key: _fromKey,
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Medicine Name",
                                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: kGreyDark),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.01,
                                ),
                                TextFormField(
                                  controller: _medicineNameController,
                                  autovalidate: _validate,
                                  validator: (value) => value.isEmpty ? "Enter Medicine Name" : null,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: screenHeight * 0.05,
                            ),
                            Align(
                              child: Container(
                                height: screenHeight * 0.04,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0)),
                                child: RaisedButton(
                                  onPressed: () {
                                    if (_fromKey.currentState.validate()) {
                                      // Do something .
                                    } else {
                                      _validate = true;
                                      setState(() {});
                                    }
                                  },
                                  elevation: 1.0,
                                  color: kPrimaryDark,
                                  child: Text(
                                    "Upload Prescription",
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0, color: Colors.black),
                                  ),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.05,
                            ),
                            Container(
                              height: screenHeight * 0.06,
                              padding: const EdgeInsets.symmetric(vertical: 6.0),
                              color: Colors.grey.shade300,
                              child: Container(
                                color: Colors.white,
                                width: double.maxFinite,
                                child: InkWell(
                                  onTap: () {},
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(Icons.border_color, color: Colors.grey.shade300),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        "Any instructions?",
                                        style: TextStyle(color: Colors.grey, fontSize: 12.0),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.05,
                            ),
                            Align(
                              child: Container(
                                height: screenHeight * 0.055,
                                width: MediaQuery.of(context).size.width * 0.65,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
                                child: RaisedButton(
                                  onPressed: () {
                                    if (_fromKey.currentState.validate()) {
                                      // Do something .
                                    } else {
                                      _validate = true;
                                      setState(() {});
                                    }
                                  },
                                  elevation: 0.0,
                                  color: kPrimaryDark,
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21.0, color: Colors.black),
                                  ),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
                BottomNavBar()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TrackRequestedMedicine extends StatefulWidget {
  @override
  _TrackRequestedMedicineState createState() => _TrackRequestedMedicineState();
}

class _TrackRequestedMedicineState extends State<TrackRequestedMedicine> {
  _changeScreen(int index) {
    BlocProvider.of<AppStateBloc>(context).add(ChangeScreen(index));
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: screenHeight - topPadding - AppBar().preferredSize.height,
            child: Column(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Track Requested Medicine",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold, color: kGreyDark, fontSize: 28.0),
                      ),
                      SizedBox(
                        height: screenHeight * 0.05,
                      ),
                      Expanded(
                          child: ListView.builder(
                              itemCount: 2,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  height: screenHeight * 0.18,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Request no: E0035",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontWeight: FontWeight.bold, color: kGreyDark, fontSize: 24.0),
                                      ),
                                      Text(
                                        "Your amount will be displayed here",
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                            TextStyle(fontWeight: FontWeight.w400, color: Colors.grey, fontSize: 14.0),
                                      ),
                                      Text(
                                        "INR 500",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontWeight: FontWeight.bold, color: kGreyDark, fontSize: 24.0),
                                      ),
                                      Container(
                                        height: screenHeight * 0.04,
                                        width: MediaQuery.of(context).size.width * 0.4,
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0)),
                                        child: RaisedButton(
                                          onPressed: () {},
                                          elevation: 0.0,
                                          color: kPrimaryDark,
                                          child: Text(
                                            "Pay Now",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold, fontSize: 14.0, color: Colors.black),
                                          ),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }))
                    ],
                  ),
                )),
                BottomNavBar()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
