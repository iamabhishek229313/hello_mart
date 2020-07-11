import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_mart/bloc/app_state_bloc.dart';
import 'package:hello_mart/screens/product_details/product_details.dart';
import 'package:hello_mart/screens/profile_screen/profile_screen.dart';
import 'package:hello_mart/utils/const_colors.dart';

class ServiceProvidersScreen extends StatefulWidget {
  final String serviceName;

  const ServiceProvidersScreen({Key key, this.serviceName}) : super(key: key);

  @override
  _ServiceProvidersScreenState createState() => _ServiceProvidersScreenState();
}

class _ServiceProvidersScreenState extends State<ServiceProvidersScreen> with TickerProviderStateMixin {
  _changeScreen(int index) {
    BlocProvider.of<AppStateBloc>(context).add(ChangeScreen(index));
  }

  TextEditingController _searchProductsController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
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
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.serviceName,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold, color: kGreyDark, fontSize: 28.0),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 8.0,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                        hintText: 'Search for Products/Store',
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
                  child: Container(
                    child: Stack(
                      children: [
                        ListView.builder(
                            itemCount: 10,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                height: screenHeight * 0.12,
                                margin: const EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => ProductDetails(
                                                  serviceProviderName: "Anonmyous",
                                                )));
                                  },
                                  child: Material(
                                    elevation: 5.0,
                                    borderRadius: BorderRadius.circular(5.0),
                                    shadowColor: Colors.grey.shade50,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.01,
                                        ),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(5.0),
                                          child: Container(
                                            height: screenHeight * 0.12,
                                            width: screenHeight * 0.12,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5.0),
                                              color: Colors.indigo,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.03,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "KERELA STORE".toUpperCase(),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: kGreyDark, fontSize: 24.0, fontWeight: FontWeight.w500),
                                              ),
                                              Text(
                                                "Perumba SM Complex, Payynpur",
                                                maxLines: 2,
                                                style: TextStyle(
                                                    color: Colors.grey.shade400,
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w400),
                                              ),
                                              Text(
                                                "Time : " + "9:00am to 10:00pm",
                                                maxLines: 1,
                                                style: TextStyle(
                                                    color: Colors.grey.shade500,
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: screenHeight * 0.05,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.white10, Colors.white54],
                                    stops: [0.0, 1.0],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
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
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileScreen()))),
                    IconButton(icon: Icon(Icons.home), onPressed: () => _changeScreen(0)),
                    IconButton(icon: Icon(Icons.shopping_cart), onPressed: () => _changeScreen(2))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
