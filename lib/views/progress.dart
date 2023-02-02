import 'package:flutter/material.dart';
import 'package:health_plus/data/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Progress extends StatefulWidget {
  const Progress({Key? key}) : super(key: key);
  @override
  _ProgressState createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;
  late List<_ChartData> data2;
  late TooltipBehavior _tooltip2;
  @override
  void initState() {
    data = [
      _ChartData('Dia 1', 12),
      _ChartData('Dia 2', 10),
      _ChartData('Dia 3', 8),
      _ChartData('Dia 4', 12),
      _ChartData('Dia 5', 6)
    ];

    data2 = [
      _ChartData('Dia 1', 2),
      _ChartData('Dia 2', 1),
      _ChartData('Dia 3', 0),
      _ChartData('Dia 4', 2),
      _ChartData('Dia 5', 2),
      _ChartData('Dia 6', 0),
      _ChartData('Dia 7', 0),
      _ChartData('Dia 8', 1),
      _ChartData('Dia 9', 0),
    ];
    _tooltip = TooltipBehavior(enable: true);
    _tooltip2 = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          backgroundColor: ColorsHeathPlus.primaryColorNormal,
          child: const Icon(Icons.add),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 140,
                color: ColorsHeathPlus.primaryColorDark,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 64, left: 16),
                      child: Text(
                        "Mi Avance",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Consumo de cigarros",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  primaryYAxis:
                      NumericAxis(minimum: 0, maximum: 20, interval: 1),
                  tooltipBehavior: _tooltip,
                  series: <ChartSeries<_ChartData, String>>[
                    ColumnSeries<_ChartData, String>(
                        dataSource: data,
                        xValueMapper: (_ChartData data, _) => data.x,
                        yValueMapper: (_ChartData data, _) => data.y,
                        name: 'Cigarros consumidos',
                        color: ColorsHeathPlus.primaryColorDark)
                  ]),
              const Padding(
                padding: EdgeInsets.only(left: 8, right: 8, top: 12),
                child: Text(
                  "Consumo de alcohol",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  primaryYAxis:
                      NumericAxis(minimum: 0, maximum: 5, interval: 1),
                  tooltipBehavior: _tooltip2,
                  series: <ChartSeries<_ChartData, String>>[
                    ColumnSeries<_ChartData, String>(
                        dataSource: data2,
                        xValueMapper: (_ChartData data, _) => data.x,
                        yValueMapper: (_ChartData data, _) => data.y,
                        name: 'Alcohol consumido',
                        color: ColorsHeathPlus.primaryColorDark)
                  ]),
            ],
          ),
        ));
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
