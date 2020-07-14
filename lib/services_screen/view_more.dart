import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_mart/bloc/app_state_bloc.dart';
import 'package:hello_mart/core/MyClipper_basic.dart';
import 'package:hello_mart/screens/profile_screen/profile_screen.dart';
import 'package:hello_mart/services_screen/bakery.dart';
import 'package:hello_mart/services_screen/car_wash.dart';
import 'package:hello_mart/services_screen/dry_fruits.dart';
import 'package:hello_mart/services_screen/electric_bill.dart';
import 'package:hello_mart/services_screen/flower.dart';
import 'package:hello_mart/services_screen/food.dart';
import 'package:hello_mart/services_screen/hello_mart.dart';
import 'package:hello_mart/services_screen/ice_cream.dart';
import 'package:hello_mart/services_screen/laundry.dart';
import 'package:hello_mart/services_screen/meat_fish.dart';
import 'package:hello_mart/services_screen/medical_services.dart';
import 'package:hello_mart/services_screen/mobile_electronics.dart';
import 'package:hello_mart/services_screen/pharmacy.dart';
import 'package:hello_mart/services_screen/saloon.dart';
import 'package:hello_mart/services_screen/sports_gaming.dart';
import 'package:hello_mart/services_screen/stationery.dart';
import 'package:hello_mart/services_screen/token.dart';
import 'package:hello_mart/utils/const_colors.dart';
import 'package:hello_mart/utils/const_image_data.dart';
import 'package:hello_mart/utils/screen_const.dart';

class ViewMoreServiceProviderScreen extends StatefulWidget {
  @override
  _ViewMoreServiceProviderScreenState createState() => _ViewMoreServiceProviderScreenState();
}

class _ViewMoreServiceProviderScreenState extends State<ViewMoreServiceProviderScreen> {
  _changeScreen(int index) {
    BlocProvider.of<AppStateBloc>(context).add(ChangeScreen(index));
  }

  _JumpToNextScreen(Widget nextScreen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => nextScreen));
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
                  child: GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    physics: NeverScrollableScrollPhysics(),
                    children: List.generate(gridItemsViewMore.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          switch (gridItemsViewMore[index].screenConst) {
                            case ScreenConst.LAUNDRY:
                              _JumpToNextScreen(LaundryServiceProviderScreen());
                              break;
                            case ScreenConst.SPORTS_GAMING:
                              _JumpToNextScreen(SportsGamingServiceProviderScreen());
                              break;
                            case ScreenConst.FLOWER:
                              _JumpToNextScreen(FlowerServiceProviderScreen());
                              break;
                            case ScreenConst.TOKEN:
                              _JumpToNextScreen(TokenServiceProviderScreen());
                              break;
                            case ScreenConst.SALOON:
                              _JumpToNextScreen(SaloonServiceProviderScreen());
                              break;
                            case ScreenConst.ELECTRIC_BILL:
                              _JumpToNextScreen(ElectricBillServiceProviderScreen());
                              break;
                            case ScreenConst.MOBILE_ELECTRONICS:
                              _JumpToNextScreen(MobileAndElectronicServiceProviderScreen());
                              break;
                            case ScreenConst.MEDICAL_SERVICES:
                              _JumpToNextScreen(MedicalServicesServiceProviderScreen());
                              break;
                            case ScreenConst.PAHRMACY:
                              _JumpToNextScreen(PharmacyServiceProviderScreen());
                              break;
                          }
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
                                    gridItemsViewMore[index].imageUrl,
                                    color: kPrimaryDark,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: screenHeight * 0.01,
                              ),
                              Text(
                                gridItemsViewMore[index].title,
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
