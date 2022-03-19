import 'dart:math';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class LineChartSeries {
  final int hour;
  final int price;

  LineChartSeries(this.hour, this.price);
}

class LineChart extends StatelessWidget {
  final String id;
  final Color chartColor;

  const LineChart(this.id, this.chartColor, {Key? key}) : super(key: key);

  _generateRandomData(int dataSamples, int maxDelta, int baseValue) {
    Random rng = Random();
    List<LineChartSeries> data = [];

    for (var i = 0; i < dataSamples; i++) {
      data.add(LineChartSeries(i, rng.nextInt(maxDelta) + baseValue));
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    List<LineChartSeries> data = _generateRandomData(20, 5000, 4000);

    List<charts.Series<LineChartSeries, int>> series = [
      charts.Series(
          id: id,
          colorFn: (_, __) => charts.ColorUtil.fromDartColor(chartColor),
          data: data,
          domainFn: (LineChartSeries series, _) => series.hour,
          measureFn: (LineChartSeries series, _) => series.price),
    ];

    return charts.LineChart(
      series,
      animate: true,
      domainAxis: const charts.NumericAxisSpec(
          showAxisLine: false, renderSpec: charts.NoneRenderSpec()),
      primaryMeasureAxis:
          const charts.NumericAxisSpec(renderSpec: charts.NoneRenderSpec()),
    );
  }
}
