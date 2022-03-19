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
  final int dataSamples;
  final int maxDelta;

  const LineChart(this.id, this.chartColor, {Key? key, this.dataSamples = 20, this.maxDelta = 4000}) : super(key: key);

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
    List<LineChartSeries> data = _generateRandomData(dataSamples, 5000, maxDelta);

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
