import 'package:flutter/material.dart';
import 'package:hello_mart/utils/screen_const.dart';

class GridItem {
  @required
  final String title;
  @required
  final String imageUrl;
  @required
  final ScreenConst screenConst;
  GridItem(this.title, this.imageUrl, this.screenConst);
}

List<GridItem> gridItemsViewLess = [
  GridItem('Hello Mart', 'assets/icons/grocery.png', ScreenConst.HELLOMART),
  GridItem('Bakery', 'assets/icons/dessert.png', ScreenConst.BAKERY),
  GridItem('Stationery', 'assets/icons/stationery.png', ScreenConst.STATIONERY),
  GridItem('Food', 'assets/icons/fast-food.png', ScreenConst.FOOD),
  GridItem('Ice Cream/Pastries/Cake', 'assets/icons/baking.png', ScreenConst.ICE_CREAM),
  GridItem('Car Wash', 'assets/icons/car-wash.png', ScreenConst.CARWASH),
  GridItem('Meat/Fish', 'assets/icons/protein.png', ScreenConst.MEAT_FISH),
  GridItem('Dry Fruits', 'assets/icons/almond.png', ScreenConst.DRY_FRUITS),
  GridItem('View More', 'assets/icons/view_more.png', ScreenConst.VIEWMORE),
];

List<GridItem> gridItemsViewMore = [
  GridItem('Laundry', 'assets/icons/laundry.png', ScreenConst.LAUNDRY),
  GridItem('Electric Bill', 'assets/icons/electric_bill.png', ScreenConst.ELECTRIC_BILL),
  GridItem('Sports & Gaming Accessories', 'assets/icons/paintball.png', ScreenConst.SPORTS_GAMING),
  GridItem('Token', 'assets/icons/economy.png', ScreenConst.TOKEN),
  GridItem('Saloon', 'assets/icons/beauty-saloon.png', ScreenConst.SALOON),
  GridItem('Flower', 'assets/icons/flower.png', ScreenConst.FLOWER),
  GridItem('Pharmacy', 'assets/icons/pharmacy.png', ScreenConst.PAHRMACY),
  GridItem('Mobile & Electronic Service Mart', 'assets/icons/repair.png', ScreenConst.MOBILE_ELECTRONICS),
  GridItem('Medical Services', 'assets/icons/coronavirus.png', ScreenConst.MEDICAL_SERVICES),
];
