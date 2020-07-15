import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_mart/bloc/app_state_bloc.dart';
import 'package:hello_mart/core/MyClipper_basic.dart';
import 'package:hello_mart/core/bottom_nav_bar.dart';
import 'package:hello_mart/screens/profile_screen/profile_screen.dart';
import 'package:hello_mart/screens/state_wrapper.dart';
import 'package:hello_mart/utils/const_colors.dart';

class TokenServiceProviderScreen extends StatefulWidget {
  @override
  _TokenServiceProviderScreenState createState() => _TokenServiceProviderScreenState();
}

class _TokenServiceProviderScreenState extends State<TokenServiceProviderScreen> {
  GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  bool _validate = false;

  TextEditingController _hospitalController = TextEditingController();

  TextEditingController _doctorController = TextEditingController();

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
                          Text(
                            "Token",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold, color: kGreyDark, fontSize: 28.0),
                          ),
                          SizedBox(
                            height: screenHeight * 0.05,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Select Hospital",
                                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: kGreyDark),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.01,
                                  ),
                                  TextFormField(
                                    controller: _hospitalController,
                                    autovalidate: _validate,
                                    validator: (value) => value.isEmpty ? "Enter Hospital Name" : null,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: screenHeight * 0.05,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Select Doctor",
                                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: kGreyDark),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.01,
                                  ),
                                  TextFormField(
                                    controller: _doctorController,
                                    autovalidate: _validate,
                                    validator: (value) => value.isEmpty ? "Enter Doctor Details" : null,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: screenHeight * 0.05,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Select Date",
                                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: kGreyDark),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.01,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "24 June 2020",
                                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: kGreyDark),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Icon(Icons.keyboard_arrow_down),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: screenHeight * 0.05,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Select Time",
                                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: kGreyDark),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.01,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "11:59 AM",
                                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: kGreyDark),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Icon(Icons.keyboard_arrow_down),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: screenHeight * 0.05,
                              ),
                              Align(
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
                                    elevation: 2.0,
                                    color: kPrimaryDark,
                                    child: Text(
                                      "Book & Pay",
                                      style:
                                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0, color: Colors.black),
                                    ),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
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
