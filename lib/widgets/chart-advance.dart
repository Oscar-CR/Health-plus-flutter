import 'package:flutter/material.dart';
import 'package:health_plus/constants/colors.dart';
import 'package:health_plus/models/consume-days.dart';
import 'package:health_plus/widgets/alert-help.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class ChartAdvance extends StatefulWidget {
  const ChartAdvance({Key? key}) : super(key: key);

  @override
  State<ChartAdvance> createState() => ChartAdvanceState();
}

class ChartAdvanceState extends State<ChartAdvance> {
  List<ComsumeDay> consumeData = const [
    ComsumeDay('Dia 1', 1, 'Alcohol'),
    ComsumeDay('Dia 2', 0, 'Alcohol'),
    ComsumeDay('Dia 3', 0, 'Alcohol'),
    ComsumeDay('Dia 4', 0, 'Alcohol'),
    ComsumeDay('Dia 5', 2, 'Alcohol'),
    ComsumeDay('Dia 6', 3, 'Alcohol'),
    ComsumeDay('Dia 7', 1, 'Alcohol'),
  ];
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(minimum: 0, maximum: 10, interval: 1),
          tooltipBehavior: _tooltip,
          series: <ChartSeries<ComsumeDay, String>>[
            ColumnSeries<ComsumeDay, String>(
                dataSource: consumeData,
                xValueMapper: (ComsumeDay data, _) => data.day,
                yValueMapper: (ComsumeDay data, _) => data.consume,
                name: 'Consumo',
                color: ColorApp.primaryColorDark)
          ]),
    );
  }
}
