import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_mart/bloc/app_state_bloc.dart';
import 'package:hello_mart/screens/profile_screen/profile_screen.dart';
import 'package:hello_mart/utils/const_colors.dart';

class ElectricBillServiceProviderScreen extends StatefulWidget {
  @override
  _ElectricBillServiceProviderScreenState createState() => _ElectricBillServiceProviderScreenState();
}

class _ElectricBillServiceProviderScreenState extends State<ElectricBillServiceProviderScreen> {
  GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  bool _validate = false;

  TextEditingController _consumerNoController = TextEditingController();

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
                            "Electric Bill",
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
                                    "Enter Consumer No.",
                                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: kGreyDark),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.01,
                                  ),
                                  TextFormField(
                                    controller: _consumerNoController,
                                    autovalidate: _validate,
                                    validator: (value) => value.isEmpty ? "Enter Valid Consumer No." : null,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: screenHeight * 0.05,
                              ),
                              Align(
                                child: Container(
                                  height: screenHeight * 0.04,
                                  width: MediaQuery.of(context).size.width * 0.4,
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
                                      "Upload Bill",
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0, color: Colors.black),
                                    ),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                                  ),
                                ),
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
                                      "Submit",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0,
                                          color: Colors.black,
                                          letterSpacing: 1.1),
                                    ),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: screenHeight * 0.08,
                              ),
                              Align(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Want to track your Bill?",
                                      style: TextStyle(
                                          fontSize: 20.0, color: Colors.grey.shade400, fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context, MaterialPageRoute(builder: (_) => ElectricBillsScreen()));
                                      },
                                      child: Text(
                                        "Click Here",
                                        style:
                                            TextStyle(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
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
                    child: Container(
                      height: screenHeight * 0.08,
                      color: Colors.pink,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              icon: Icon(Icons.person),
                              onPressed: () =>
                                  Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileScreen()))),
                          IconButton(icon: Icon(Icons.home), onPressed: () => _changeScreen(0)),
                          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () => _changeScreen(2))
                        ],
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

class ElectricBillsScreen extends StatefulWidget {
  @override
  _ElectricBillsScreenState createState() => _ElectricBillsScreenState();
}

class _ElectricBillsScreenState extends State<ElectricBillsScreen> {
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
                        "Electric Bill",
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
                    child: Container(
                      height: screenHeight * 0.08,
                      color: Colors.pink,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              icon: Icon(Icons.person),
                              onPressed: () =>
                                  Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileScreen()))),
                          IconButton(icon: Icon(Icons.home), onPressed: () => _changeScreen(0)),
                          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () => _changeScreen(2))
                        ],
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
