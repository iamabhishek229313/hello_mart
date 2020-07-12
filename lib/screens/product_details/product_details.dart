import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_mart/bloc/app_state_bloc.dart';
import 'package:hello_mart/screens/profile_screen/profile_screen.dart';
import 'package:hello_mart/utils/const_colors.dart';

class ProductDetails extends StatefulWidget {
  final String serviceProviderName;
  final List<String> tabNames;
  const ProductDetails({Key key, @required this.serviceProviderName, @required this.tabNames}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> with TickerProviderStateMixin {
  _changeScreen(int index) {
    BlocProvider.of<AppStateBloc>(context).add(ChangeScreen(index));
  }

  TextEditingController _searchProductsController = TextEditingController();
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabNames.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
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
                // Container(
                //   height: screenHeight * 0.04,
                //   child: Align(
                //     alignment: Alignment.centerLeft,
                //     child: InkWell(
                //       onTap: () {
                //         BlocProvider.of<AppStateBloc>(context).add(ChangeScreen(0));
                //       },
                //       child: Icon(
                //         Icons.arrow_back,
                //         size: 30.0,
                //       ),
                //     ),
                //   ),
                // ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.serviceProviderName,
                      maxLines: 1,
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
                TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    indicatorWeight: 3.0,
                    indicatorColor: kPrimaryDark,
                    tabs: widget.tabNames
                        .map((e) => Tab(
                                child: Text(
                              e,
                              style: TextStyle(color: kGreyDark, fontSize: 15.0, fontWeight: FontWeight.w500),
                            )))
                        .toList()),
                Expanded(
                    child: TabBarView(
                        controller: _tabController,
                        children: List.generate(
                          widget.tabNames.length,
                          (index) => Container(
                            child: Stack(
                              children: [
                                ListView.builder(
                                    itemCount: 5,
                                    physics: BouncingScrollPhysics(),
                                    itemBuilder: (BuildContext context, int index) {
                                      return Container(
                                        height: screenHeight * 0.10,
                                        margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius: BorderRadius.circular(5.0),
                                                    child: Container(
                                                      height: screenHeight * 0.09,
                                                      width: screenHeight * 0.09,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(5.0),
                                                        color: Colors.indigo,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: MediaQuery.of(context).size.width * 0.1,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        "Asus Laptop",
                                                        maxLines: 2,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: TextStyle(
                                                            color: kGreyDark,
                                                            fontSize: 18.0,
                                                            fontWeight: FontWeight.w500),
                                                      ),
                                                      Text(
                                                        "₹" + 999.toString(),
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                            color: kGreyDark,
                                                            fontSize: 18.0,
                                                            fontWeight: FontWeight.w500),
                                                      ),
                                                      Text(
                                                        1.toString() + " Kg",
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                            color: kPrimaryGrey,
                                                            fontSize: 17.0,
                                                            fontWeight: FontWeight.w400),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context).size.width * 0.3,
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

                        // Container(
                        //   child: Stack(
                        //     children: [
                        //       ListView.builder(
                        //           itemCount: 10,
                        //           physics: BouncingScrollPhysics(),
                        //           itemBuilder: (BuildContext context, int index) {
                        //             return Container(
                        //               height: screenHeight * 0.12,
                        //               margin: const EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0),
                        //               child: Material(
                        //                 elevation: 5.0,
                        //                 shadowColor: Colors.grey.shade50,
                        //                 child: Row(
                        //                   crossAxisAlignment: CrossAxisAlignment.start,
                        //                   children: [
                        //                     Expanded(
                        //                       child: Row(
                        //                         children: [
                        //                           ClipRRect(
                        //                             borderRadius: BorderRadius.circular(5.0),
                        //                             child: Container(
                        //                               height: screenHeight * 0.12,
                        //                               width: screenHeight * 0.12,
                        //                               decoration: BoxDecoration(
                        //                                 borderRadius: BorderRadius.circular(5.0),
                        //                                 color: Colors.indigo,
                        //                               ),
                        //                             ),
                        //                           ),
                        //                           SizedBox(
                        //                             width: MediaQuery.of(context).size.width * 0.1,
                        //                           ),
                        //                           Column(
                        //                             crossAxisAlignment: CrossAxisAlignment.start,
                        //                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //                             children: [
                        //                               Text(
                        //                                 "Asus Laptop",
                        //                                 maxLines: 2,
                        //                                 overflow: TextOverflow.ellipsis,
                        //                                 style: TextStyle(
                        //                                     color: kGreyDark, fontSize: 18.0, fontWeight: FontWeight.w500),
                        //                               ),
                        //                               Text(
                        //                                 "₹" + 999.toString(),
                        //                                 maxLines: 1,
                        //                                 style: TextStyle(
                        //                                     color: kGreyDark, fontSize: 18.0, fontWeight: FontWeight.w500),
                        //                               ),
                        //                               Text(
                        //                                 1.toString() + " Kg",
                        //                                 maxLines: 1,
                        //                                 style: TextStyle(
                        //                                     color: kPrimaryGrey, fontSize: 17.0, fontWeight: FontWeight.w400),
                        //                               ),
                        //                             ],
                        //                           ),
                        //                         ],
                        //                       ),
                        //                     ),
                        //                     Container(
                        //                       width: MediaQuery.of(context).size.width * 0.3,
                        //                       margin: const EdgeInsets.only(top: 10.0),
                        //                       padding: const EdgeInsets.symmetric(vertical: 4.0),
                        //                       decoration:
                        //                           BoxDecoration(color: kGreyDark, borderRadius: BorderRadius.circular(20.0)),
                        //                       child: Row(
                        //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //                         children: [
                        //                           InkWell(
                        //                             onTap: () {},
                        //                             child: Icon(
                        //                               Icons.minimize,
                        //                               color: kPrimaryDark,
                        //                             ),
                        //                           ),
                        //                           Text("Add"),
                        //                           InkWell(
                        //                             onTap: () {},
                        //                             child: Icon(
                        //                               Icons.minimize,
                        //                               color: kPrimaryDark,
                        //                             ),
                        //                           )
                        //                         ],
                        //                       ),
                        //                     )
                        //                   ],
                        //                 ),
                        //               ),
                        //             );
                        //           }),
                        //       Align(
                        //         alignment: Alignment.bottomCenter,
                        //         child: Container(
                        //           height: screenHeight * 0.05,
                        //           decoration: BoxDecoration(
                        //               gradient: LinearGradient(
                        //                   colors: [Colors.white10, Colors.white54],
                        //                   stops: [0.0, 1.0],
                        //                   begin: Alignment.topCenter,
                        //                   end: Alignment.bottomCenter)),
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        ))
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
