import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_mart/bloc/app_state_bloc.dart';
import 'package:hello_mart/screens/profile_screen/profile_screen.dart';
import 'package:hello_mart/utils/const_colors.dart';

class ProductDetails extends StatefulWidget {
  final String serviceName;

  const ProductDetails({Key key, this.serviceName}) : super(key: key);

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
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  height: screenHeight * 0.04,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        BlocProvider.of<AppStateBloc>(context).add(ChangeScreen(0));
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 30.0,
                      ),
                    ),
                  ),
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
                TabBar(
                    controller: _tabController,
                    tabs: ["VEGETABLES", "FRUITS", "DESERTS"].map((e) => Tab(text: e)).toList())
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
