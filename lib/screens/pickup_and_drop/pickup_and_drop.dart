import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_mart/bloc/app_state_bloc.dart';
import 'package:hello_mart/core/MyClipper_basic.dart';
import 'package:hello_mart/screens/profile_screen/profile_screen.dart';
import 'package:hello_mart/utils/const_colors.dart';

class PickUpAndDrop extends StatefulWidget {
  @override
  _PickUpAndDropState createState() => _PickUpAndDropState();
}

class _PickUpAndDropState extends State<PickUpAndDrop> {
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
                            "Pickup and Drop",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold, color: kGreyDark, fontSize: 28.0),
                          ),
                          SizedBox(
                            height: screenHeight * 0.05,
                          ),
                          Container(
                            height: screenHeight * 0.35,
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Stack(
                                      children: [
                                        Align(
                                          child: VerticalDivider(
                                            thickness: 2.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Align(
                                          child: Column(
                                            children: [
                                              Container(
                                                height: screenHeight * 0.03,
                                                width: screenHeight * 0.03,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(20.0),
                                                    border: Border.all(width: 5.0, color: kGreyDark),
                                                    color: Colors.white),
                                              ),
                                              Spacer(),
                                              Container(
                                                height: screenHeight * 0.03,
                                                width: screenHeight * 0.03,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(20.0),
                                                    border: Border.all(width: 5.0, color: kGreyDark),
                                                    color: Colors.white),
                                              ),
                                              Spacer(),
                                              Container(
                                                height: screenHeight * 0.03,
                                                width: screenHeight * 0.03,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(20.0),
                                                    border: Border.all(width: 5.0, color: kGreyDark),
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    )),
                                Expanded(
                                    flex: 8,
                                    child: Column(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Pickup Address",
                                              style: TextStyle(
                                                  fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.grey),
                                            ),
                                            TextFormField(
                                              controller: _hospitalController,
                                              autovalidate: _validate,
                                              validator: (value) => value.isEmpty ? "Enter pickup location" : null,
                                              decoration: InputDecoration(
                                                  hintText: "Search pickup location",
                                                  suffixIcon: Icon(
                                                    Icons.search,
                                                    color: Colors.grey,
                                                  )),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Dilvery address",
                                              style: TextStyle(
                                                  fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.grey),
                                            ),
                                            TextFormField(
                                              controller: _hospitalController,
                                              autovalidate: _validate,
                                              validator: (value) => value.isEmpty ? "Enter delivery address" : null,
                                              decoration: InputDecoration(
                                                  hintText: "Search Delivery location",
                                                  suffixIcon: Icon(
                                                    Icons.search,
                                                    color: Colors.grey,
                                                  )),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Select package contents",
                                              style: TextStyle(
                                                  fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.grey),
                                            ),
                                            TextFormField(
                                              controller: _hospitalController,
                                              autovalidate: _validate,
                                              validator: (value) => value.isEmpty ? "Enter package contents" : null,
                                              decoration: InputDecoration(
                                                  hintText: "eg. Food, Documents",
                                                  suffixIcon: Icon(
                                                    Icons.search,
                                                    color: Colors.grey,
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.06,
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
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Icon(Icons.border_color, color: Colors.grey.shade300),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      "Any instructions? Ex: Don't ring the doorbell",
                                      style: TextStyle(color: Colors.grey, fontSize: 12.0),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.06,
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
                                elevation: 0.0,
                                color: kPrimaryDark,
                                child: Text(
                                  "Confirm Order",
                                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0, color: Colors.black),
                                ),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                              ),
                            ),
                          )
                          // Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //   children: [
                          // Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     Text(
                          //       "Select Hospital",
                          //       style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: kGreyDark),
                          //     ),
                          //     SizedBox(
                          //       height: screenHeight * 0.01,
                          //     ),
                          //     TextFormField(
                          //       controller: _hospitalController,
                          //       autovalidate: _validate,
                          //       validator: (value) => value.isEmpty ? "Enter Hospital Name" : null,
                          //     ),
                          //   ],
                          // ),
                          //     SizedBox(
                          //       height: screenHeight * 0.05,
                          //     ),
                          //     Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         Text(
                          //           "Select Doctor",
                          //           style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: kGreyDark),
                          //         ),
                          //         SizedBox(
                          //           height: screenHeight * 0.01,
                          //         ),
                          //         TextFormField(
                          //           controller: _doctorController,
                          //           autovalidate: _validate,
                          //           validator: (value) => value.isEmpty ? "Enter Doctor Details" : null,
                          //         ),
                          //       ],
                          //     ),
                          //     SizedBox(
                          //       height: screenHeight * 0.05,
                          //     ),
                          //     Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         Text(
                          //           "Select Date",
                          //           style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: kGreyDark),
                          //         ),
                          //         SizedBox(
                          //           height: screenHeight * 0.01,
                          //         ),
                          //         Row(
                          //           mainAxisSize: MainAxisSize.min,
                          //           children: [
                          //             Text(
                          //               "24 June 2020",
                          //               style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: kGreyDark),
                          //             ),
                          //             SizedBox(
                          //               width: 10.0,
                          //             ),
                          //             InkWell(
                          //               onTap: () {},
                          //               child: Icon(Icons.keyboard_arrow_down),
                          //             )
                          //           ],
                          //         )
                          //       ],
                          //     ),
                          //     SizedBox(
                          //       height: screenHeight * 0.05,
                          //     ),
                          //     Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         Text(
                          //           "Select Time",
                          //           style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: kGreyDark),
                          //         ),
                          //         SizedBox(
                          //           height: screenHeight * 0.01,
                          //         ),
                          //         Row(
                          //           mainAxisSize: MainAxisSize.min,
                          //           children: [
                          //             Text(
                          //               "11:59 AM",
                          //               style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: kGreyDark),
                          //             ),
                          //             SizedBox(
                          //               width: 10.0,
                          //             ),
                          //             InkWell(
                          //               onTap: () {},
                          //               child: Icon(Icons.keyboard_arrow_down),
                          //             )
                          //           ],
                          //         )
                          //       ],
                          //     ),
                          //     SizedBox(
                          //       height: screenHeight * 0.05,
                          //     ),
                          //     Align(
                          //       child: Container(
                          //         height: screenHeight * 0.06,
                          //         width: MediaQuery.of(context).size.width * 0.6,
                          //         decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0)),
                          //         child: RaisedButton(
                          //           onPressed: () {
                          //             if (_fromKey.currentState.validate()) {
                          //               // Do something .
                          //             } else {
                          //               _validate = true;
                          //               setState(() {});
                          //             }
                          //           },
                          //           elevation: 2.0,
                          //           color: kPrimaryDark,
                          //           child: Text(
                          //             "Book & Pay",
                          //             style:
                          //                 TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0, color: Colors.black),
                          //           ),
                          //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                          //         ),
                          //       ),
                          //     )
                          //   ],
                          // )
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
