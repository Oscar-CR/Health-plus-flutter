import 'package:flutter/material.dart';
import 'package:health_plus/constants/colors.dart';
import 'package:health_plus/models/consume.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartAdvance extends StatefulWidget {
  const ChartAdvance({Key? key}) : super(key: key);

  @override
  State<ChartAdvance> createState() => ChartAdvanceState();
}

class ChartAdvanceState extends State<ChartAdvance> {
  late TooltipBehavior _tooltip;
  late int newConsummedTotal;
  late int max;

  @override
  void initState() {
    _tooltip = TooltipBehavior(enable: true);
    newConsummedTotal = 0;
    max = 0;
    getTotal();
    super.initState();
  }

  getTotal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? contador = prefs.getInt('contador');
    setState(() {
      newConsummedTotal = contador!;
      max = newConsummedTotal + 10;
    });

    return contador;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          primaryYAxis:
              NumericAxis(minimum: 0, maximum: max.toDouble(), interval: 1),
          tooltipBehavior: _tooltip,
          series: <ChartSeries<Consume, String>>[
            ColumnSeries<Consume, String>(
                dataSource: [
                  Consume('1', newConsummedTotal.toString(), 'Consumido')
                ],
                xValueMapper: (Consume data, _) => data.day,
                yValueMapper: (Consume data, _) => newConsummedTotal,
                name: 'Consumo',
                color: ColorApp.primaryColorDark)
          ]),
    );
  }
}
