import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Initialize the data sourcefinal
  List<ChartData> chartData = <ChartData>[
    ChartData('Jan', 35.53),
    ChartData('Feb', 46.06),
    ChartData('Mar', 46.06),
    ChartData('Apr', 50.86),
    ChartData('May', 60.89),
    ChartData('Jun', 70.27),
    ChartData('Jul', 75.65),
    ChartData('Aug', 74.70),
    ChartData('Sep', 65.91),
    ChartData('Oct', 54.28),
    ChartData('Nov', 46.33),
    ChartData('Dec', 35.71),
  ];

  @override
  Widget build(BuildContext context) {
    final List<Color> color = <Color>[];
    color.add(Colors.deepOrange[50]!);
    color.add(Colors.deepOrange[200]!);
    color.add(Colors.deepOrange);
    final List<double> stops = <double>[];
    stops.add(0.0);
    stops.add(0.5);
    stops.add(1.0);
    final LinearGradient gradientColors =
        LinearGradient(colors: color, stops: stops);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(),
        series: <ChartSeries<ChartData, String>>[
          AreaSeries<ChartData, String>(
            dataSource: chartData,
            // Apply the gradient to the area series

            gradient: gradientColors,
            onCreateShader: (ShaderDetails details) {
              return ui.Gradient.linear(details.rect.bottomLeft,
                  details.rect.bottomRight, const <Color>[
                Color.fromRGBO(116, 182, 194, 1),
                Color.fromRGBO(75, 189, 138, 1),
                Color.fromRGBO(75, 189, 138, 1),
                Color.fromRGBO(255, 186, 83, 1),
                Color.fromRGBO(255, 186, 83, 1),
                Color.fromRGBO(194, 110, 21, 1),
                Color.fromRGBO(194, 110, 21, 1),
                Color.fromRGBO(116, 182, 194, 1),
              ], <double>[
                0.1,
                0.1,
                0.4,
                0.4,
                0.7,
                0.7,
                0.9,
                0.9
              ]);
            },
            xValueMapper: (ChartData sales, _) => sales.x,
            yValueMapper: (ChartData sales, _) => sales.y,
          )
        ],
      )),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final num y;
}
