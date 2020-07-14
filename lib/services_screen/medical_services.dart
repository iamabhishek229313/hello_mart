import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_mart/bloc/app_state_bloc.dart';
import 'package:hello_mart/core/MyClipper_basic.dart';
import 'package:hello_mart/screens/profile_screen/profile_screen.dart';
import 'package:hello_mart/utils/const_colors.dart';

class MedicalServicesServiceProviderScreen extends StatefulWidget {
  @override
  _MedicalServicesServiceProviderScreenState createState() => _MedicalServicesServiceProviderScreenState();
}

class _MedicalServicesServiceProviderScreenState extends State<MedicalServicesServiceProviderScreen> {
  GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  bool _validate = false;

  TextEditingController _typeController = TextEditingController();
  TextEditingController _patientNameController = TextEditingController();
  TextEditingController _placeContoller = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

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
                  child: Form(
                    key: _fromKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Medical Services",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.bold, color: kGreyDark, fontSize: 28.0),
                            ),
                          ),
                          Expanded(
                            flex: 9,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  flex: 7,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Service Type",
                                            style: TextStyle(
                                                fontSize: 16.0, fontWeight: FontWeight.w500, color: kGreyDark),
                                          ),
                                          TextFormField(
                                            controller: _typeController,
                                            autovalidate: _validate,
                                            decoration: InputDecoration(
                                                suffixIcon: Icon(Icons.search), hintText: 'Search Service Type'),
                                            validator: (value) => value.isEmpty ? "Enter Valid Service type" : null,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Patient Name",
                                            style: TextStyle(
                                                fontSize: 16.0, fontWeight: FontWeight.w500, color: kGreyDark),
                                          ),
                                          TextFormField(
                                            controller: _patientNameController,
                                            autovalidate: _validate,
                                            validator: (value) => value.isEmpty ? "Enter Patient name" : null,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Place",
                                            style: TextStyle(
                                                fontSize: 16.0, fontWeight: FontWeight.w500, color: kGreyDark),
                                          ),
                                          TextFormField(
                                            controller: _placeContoller,
                                            autovalidate: _validate,
                                            validator: (value) => value.isEmpty ? "Enter Place" : null,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Age",
                                            style: TextStyle(
                                                fontSize: 16.0, fontWeight: FontWeight.w500, color: kGreyDark),
                                          ),
                                          TextFormField(
                                            controller: _ageController,
                                            autovalidate: _validate,
                                            keyboardType: TextInputType.number,
                                            validator: (value) => value.isEmpty ? "Enter age" : null,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Phone Number",
                                            style: TextStyle(
                                                fontSize: 16.0, fontWeight: FontWeight.w500, color: kGreyDark),
                                          ),
                                          TextFormField(
                                            controller: _phoneNumberController,
                                            autovalidate: _validate,
                                            keyboardType: TextInputType.number,
                                            validator: (value) => value.isEmpty ? "Enter your Pickup Address" : null,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Align(
                                    child: Container(
                                      height: screenHeight * 0.06,
                                      width: MediaQuery.of(context).size.width * 0.6,
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
                                        elevation: 0.0,
                                        color: kPrimaryDark,
                                        child: Text(
                                          "Submit",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500, fontSize: 18.0, color: Colors.black),
                                        ),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipPath(
                      clipper: MyClipper(),
                      child: Container(
                        margin: EdgeInsets.only(bottom: screenHeight * 0.01),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey.shade300,
                            boxShadow: [BoxShadow(offset: Offset(1.0, 2.0), color: kPrimaryDark, blurRadius: 3.0)]),
                        height: screenHeight * 0.08,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    icon: Icon(
                                      Icons.person,
                                      size: 32.0,
                                    ),
                                    onPressed: () =>
                                        Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileScreen()))),
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    _changeScreen(0);
                                  },
                                  child: Icon(
                                    Icons.home,
                                    size: screenHeight * 0.065,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    icon: Icon(
                                      Icons.shopping_cart,
                                      size: 32.0,
                                    ),
                                    onPressed: () => _changeScreen(2)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MobileAndElectronicServiceScreen extends StatefulWidget {
  @override
  _MobileAndElectronicServiceScreenState createState() => _MobileAndElectronicServiceScreenState();
}

class _MobileAndElectronicServiceScreenState extends State<MobileAndElectronicServiceScreen> {
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
                        "Mobile & Electronic Services",
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipPath(
                      clipper: MyClipper(),
                      child: Container(
                        margin: EdgeInsets.only(bottom: screenHeight * 0.01),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey.shade300,
                            boxShadow: [BoxShadow(offset: Offset(1.0, 2.0), color: kPrimaryDark, blurRadius: 3.0)]),
                        height: screenHeight * 0.08,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    icon: Icon(
                                      Icons.person,
                                      size: 32.0,
                                    ),
                                    onPressed: () =>
                                        Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileScreen()))),
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    _changeScreen(0);
                                  },
                                  child: Icon(
                                    Icons.home,
                                    size: screenHeight * 0.065,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    icon: Icon(
                                      Icons.shopping_cart,
                                      size: 32.0,
                                    ),
                                    onPressed: () => _changeScreen(2)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
