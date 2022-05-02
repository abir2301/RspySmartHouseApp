import 'dart:async';
import 'dart:math' as math;
import 'package:app/DataBase/trafic.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartDetails extends StatefulWidget {
  const ChartDetails({Key? key}) : super(key: key);

  @override
  _ChartDetailsState createState() => _ChartDetailsState();
}

class _ChartDetailsState extends State<ChartDetails> {
  late List<LiveData> chartData;
  late ChartSeriesController _chartSeriesController;
  List<LiveData> getChartData() {
    return <LiveData>[
      LiveData(0, 42),
      LiveData(1, 47),
      LiveData(2, 43),
      LiveData(3, 49),
      LiveData(4, 54),
      LiveData(5, 41),
      LiveData(6, 58),
      LiveData(7, 51),
      LiveData(8, 98),
      LiveData(9, 41),
      LiveData(10, 53),
      LiveData(11, 72),
      LiveData(12, 86),
      LiveData(13, 52),
      LiveData(14, 94),
      LiveData(15, 92),
      LiveData(16, 86),
      LiveData(17, 72),
      LiveData(18, 94)
    ];
  }

  @override
  void initState() {
    chartData = getChartData();
    Timer.periodic(const Duration(seconds: 1), updateDataSource);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SfCartesianChart(
                series: <LineSeries<LiveData, int>>[
          LineSeries<LiveData, int>(
            onRendererCreated: (ChartSeriesController controller) {
              _chartSeriesController = controller;
            },
            dataSource: chartData,
            color: const Color.fromRGBO(192, 108, 132, 1),
            xValueMapper: (LiveData trafic, _) => trafic.time,
            yValueMapper: (LiveData trafic, _) => trafic.speed,
          )
        ],
                primaryXAxis: NumericAxis(
                    majorGridLines: const MajorGridLines(width: 0),
                    edgeLabelPlacement: EdgeLabelPlacement.shift,
                    interval: 3,
                    title: AxisTitle(text: 'Day (day)')),
                primaryYAxis: NumericAxis(
                    axisLine: const AxisLine(width: 0),
                    majorTickLines: const MajorTickLines(size: 0),
                    title: AxisTitle(text: 'Sensor  (trafic )')))));
  }

  int time = 19;
  void updateDataSource(Timer timer) {
    chartData.add(LiveData(time++, (math.Random().nextInt(60) + 30)));
    chartData.removeAt(0);
    _chartSeriesController.updateDataSource(
        addedDataIndex: chartData.length - 1, removedDataIndex: 0);
  }
}

int time = 19;

class LiveData {
  LiveData(this.time, this.speed);
  final int time;
  final num speed;
}
