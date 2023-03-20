import 'package:flutter/material.dart';
import 'package:health_plus/constants/adictions.dart';
import 'package:health_plus/models/advance.dart';
import 'package:health_plus/widgets/card-adiction.dart';

class AdvancePage extends StatefulWidget {
  const AdvancePage({super.key, required this.title});

  final String title;

  @override
  State<AdvancePage> createState() => AdvancePageState();
}

class AdvancePageState extends State<AdvancePage> {
  List<Adiction> adictionList = StringsAdictions().adictionList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.person),
          tooltip: 'User',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Aqui va la vista de usuario')));
          },
        ),
      ]),
      body: Column(
        children: [
          Expanded(
              child: SizedBox(
            width: double.infinity,
            height: 180,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(0),
              itemCount: adictionList.length,
              itemBuilder: (BuildContext context, int index) {
                return CardAdiction(
                    problem: adictionList[index].problem,
                    description: adictionList[index].description);
              },
            ),
          )),
        ],
      ),
    );
  }
}
