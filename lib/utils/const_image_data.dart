import 'package:flutter/material.dart';

class GridItem {
  @required
  final String title;
  @required
  final String imageUrl;
  GridItem(this.title, this.imageUrl);
}

List<GridItem> gridItems = [
  GridItem('Hello Mart', 'assets/icons/grocery.png'),
  GridItem('Bakery', 'assets/icons/dessert.png'),
  GridItem('Stationery', 'assets/icons/stationery.png'),
  GridItem('Food', 'assets/icons/fast-food.png'),
  GridItem('Ice Cream/Pastries/Cake', 'assets/icons/baking.png'),
  GridItem('Car Wash', 'assets/icons/car-wash.png'),
  GridItem('Meat/Fish', 'assets/icons/protein.png'),
  GridItem('Dry Fruits', 'assets/icons/almond.png'),
  GridItem('View More', 'assets/icons/more_dots.png'),
  GridItem('Laundry', 'assets/icons/laundry.png'),
  GridItem('Electric Bill', 'assets/icons/electric_bill.png'),
  GridItem('Sports & Gaming Accessories', 'assets/icons/paintball.png'),
  GridItem('Token', 'assets/icons/economy.png'),
  GridItem('Saloon', 'assets/icons/beauty-saloon.png'),
  GridItem('Flower', 'assets/icons/flower.png'),
  GridItem('Pharmacy', 'assets/icons/pharmacy.png'),
  GridItem('Mobile & Electronic Service Mart', 'assets/icons/repair.png'),
  GridItem('Medical Services', 'assets/icons/coronavirus.png'),
];
