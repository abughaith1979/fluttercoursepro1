import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HeaderView extends StatelessWidget {
  final String price;
  const HeaderView({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('dd MMMM yyyy');

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.menu, size: 30),
                  Text(
                    "Today, ${formatter.format(now)}",
                    style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 12),
                  ),
                  const Icon(Icons.search, size: 30),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network(
                    "https://pngimg.com/d/pizza_PNG44071.png",
                    width: 100,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Total Amount"),
                      const SizedBox(height: 5),
                      Text("\$ $price"),
                      const SizedBox(height: 5),
                      Container(
                        height: 40,
                        width: 150,
                        decoration: const BoxDecoration(
                            color: Colors.black, borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: const Center(
                          child: Text(
                            "Pay",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
