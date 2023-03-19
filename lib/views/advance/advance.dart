import 'package:flutter/material.dart';
import 'package:health_plus/widgets/card-problem.dart';

class AdvancePage extends StatefulWidget {
  const AdvancePage({super.key, required this.title});

  final String title;

  @override
  State<AdvancePage> createState() => AdvancePageState();
}

class AdvancePageState extends State<AdvancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: const [
          CardProblem(problem: 'Drogadiccion', description: 'Drga')
        ],
      ),
    );
  }
}
