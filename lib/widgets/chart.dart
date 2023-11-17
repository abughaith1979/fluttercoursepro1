import 'package:circular_chart_flutter/circular_chart_flutter.dart';
import 'package:flutter/material.dart';

class ChartView extends StatelessWidget {
  final int kcal;
  const ChartView({super.key, required this.kcal});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedCircularChart(
          key: GlobalKey<AnimatedCircularChartState>(),
          size: const Size(50, 50),
          initialChartData: <CircularStackEntry>[
            CircularStackEntry(
              <CircularSegmentEntry>[
                CircularSegmentEntry(
                  (kcal / 10).toDouble(),
                  Colors.green,
                ),
                CircularSegmentEntry(
                  (1000 - (kcal / 10)).toDouble(),
                  Colors.grey[300],
                ),
              ],
            ),
          ],
          chartType: CircularChartType.Radial,
          edgeStyle: SegmentEdgeStyle.round,
          percentageValues: true,
        ),
        Positioned(
          top: 13,
          left: 16,
          child: Column(
            children: [
              Text(
                "$kcal",
                style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
              const Text(
                "kcal",
                style: TextStyle(color: Color(0xFF515F65), fontSize: 6),
              ),
            ],
          ),
        )
      ],
    );
  }
}
