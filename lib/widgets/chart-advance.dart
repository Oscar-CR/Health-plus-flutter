import 'package:flutter/material.dart';
import 'package:health_plus/constants/colors.dart';
import 'package:health_plus/models/consume.dart';
import 'package:health_plus/widgets/alert-help.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class ChartAdvance extends StatefulWidget {
  const ChartAdvance({Key? key, required this.comsumeList}) : super(key: key);

  final List<Consume> comsumeList;

  @override
  State<ChartAdvance> createState() => ChartAdvanceState();
}

class ChartAdvanceState extends State<ChartAdvance> {
  late TooltipBehavior _tooltip;
  late List<Consume> consummedList;
  @override
  void initState() {
    _tooltip = TooltipBehavior(enable: true);
    consummedList = widget.comsumeList;
    print('Datos consumidos');
    print(consummedList.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(minimum: 0, maximum: 10, interval: 1),
          tooltipBehavior: _tooltip,
          series: <ChartSeries<Consume, String>>[
            ColumnSeries<Consume, String>(
                dataSource: consummedList,
                xValueMapper: (Consume data, _) => data.day,
                yValueMapper: (Consume data, _) => int.parse(data.consume),
                name: 'Consumo',
                color: ColorApp.primaryColorDark)
          ]),
    );
  }
}
