import 'package:flutter/material.dart';
import 'package:police/model/item.dart';
import 'package:police/widgets/add_to_cart.dart';
import 'package:police/widgets/chart.dart';
import 'package:police/widgets/discount.dart';
import 'package:police/widgets/properties.dart';
import 'package:police/widgets/qty.dart';
import 'package:police/widgets/rating.dart';

class MainItemView extends StatelessWidget {
  final Item item;
  final Function onChange;
  const MainItemView({super.key, required this.item, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 16),
      child: Container(
        height: 170,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset(
                  "swaar/pizza${item.image}.png",
                  width: 145,
                ),
                item.offerPrice > 0
                    ? DiscountView(
                        offerPrice: item.offerPrice,
                      )
                    : Container(),
                item.qty > 0
                    ? QtyView(
                        qty: item.qty,
                      )
                    : Container(),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25),
                Text(
                  item.name,
                  style: const TextStyle(color: Color(0xFF515F65), fontSize: 20, fontWeight: FontWeight.w300),
                ),
                Text(
                  item.desc,
                  style: const TextStyle(color: Color(0xFF515F65), fontSize: 12),
                ),
                const SizedBox(height: 10),
                RatingView(rate: item.rate),
                const SizedBox(height: 16),
                AddToCartView(
                  price: item.price,
                  qty: item.qty,
                  onMinus: () {
                    item.qty = item.qty - 1;
                    onChange();
                  },
                  onPlus: () {
                    item.qty = item.qty + 1;
                    onChange();
                  },
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25),
                ChartView(kcal: item.kcal),
                ProperatiesView(title: "Proteins", value: item.protiens),
                ProperatiesView(title: "Carbohydrate", value: item.carbo),
                ProperatiesView(title: "Fiber", value: item.fiber),
              ],
            ),
            const SizedBox(width: 5)
          ],
        ),
      ),
    );
  }
}
