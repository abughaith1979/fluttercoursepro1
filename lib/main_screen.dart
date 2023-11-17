import 'package:flutter/material.dart';
import 'package:police/model/item.dart';

import 'package:police/widgets/filter.dart';
import 'package:police/widgets/header.dart';
import 'package:police/widgets/main_item_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

//https://redowls.gumroad.com/l/FreeRestaurantPOS

class _MainScreenState extends State<MainScreen> {
  List<Item> itemsList = [
    Item(
      offerPrice: 0,
      desc: "Spicy Checken",
      rate: 3.2,
      kcal: 900,
      protiens: "17,9",
      carbo: "10,8",
      fiber: "1,9",
      image: "1",
      name: "White Chicken",
      price: 18.3,
    ),
    Item(
      offerPrice: 3.2,
      desc: "Spicy Checken",
      rate: 1.2,
      kcal: 110,
      protiens: "13,9",
      carbo: "1,8",
      fiber: "0,9",
      image: "2",
      name: "Black Chicken",
      price: 1.3,
    ),
    Item(
      offerPrice: 5.1,
      desc: "Spicy Checken",
      rate: 8.2,
      kcal: 311,
      protiens: "17,9",
      carbo: "5,8",
      fiber: "1,7",
      image: "3",
      name: "Red Chicken",
      price: 5.1,
    ),
    Item(
      offerPrice: 0,
      desc: "Spicy Checken",
      rate: 3.2,
      kcal: 500,
      protiens: "17,9",
      carbo: "10,8",
      fiber: "1,3",
      image: "4",
      name: "Green Chicken",
      price: 8.2,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            HeaderView(price: totalPrice().toStringAsFixed(2)),
            const FilterView(),
            Expanded(
              child: ListView.builder(
                  itemCount: itemsList.length,
                  itemBuilder: (ctx, index) {
                    return MainItemView(
                      item: itemsList[index],
                      onChange: () {
                        setState(() {});
                      },
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  double totalPrice() {
    double totalPrice = 0;

    for (var item in itemsList) {
      if (item.qty > 0) {
        totalPrice = totalPrice + (item.qty * item.price);
      }
    }

    return totalPrice;
  }
}
