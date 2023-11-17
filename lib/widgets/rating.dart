import 'package:flutter/material.dart';

class RatingView extends StatelessWidget {
  final double rate;
  const RatingView({super.key, required this.rate});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          "swaar/star.png",
          height: 13,
        ),
        const SizedBox(width: 5),
        Text(
          "$rate",
          style: const TextStyle(fontSize: 10),
        ),
      ],
    );
  }
}
