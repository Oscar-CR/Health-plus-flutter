import 'package:flutter/material.dart';
import 'package:health_plus/models/help.dart';
import 'package:health_plus/widgets/card-help.dart';
import 'package:health_plus/widgets/card-adiction.dart';

class HelpRecyclerPage extends StatefulWidget {
  const HelpRecyclerPage({super.key, required this.helpList});

  final List<Help> helpList;

  @override
  State<HelpRecyclerPage> createState() => HelpRecyclerPageState();
}

class HelpRecyclerPageState extends State<HelpRecyclerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            itemCount: widget.helpList.length,
            itemBuilder: (BuildContext context, int index) {
              return CardHelp(
                help: [
                  Help(
                      widget.helpList[index].name,
                      widget.helpList[index].municipality,
                      widget.helpList[index].address,
                      widget.helpList[index].phone,
                      widget.helpList[index].population,
                      widget.helpList[index].helpModel,
                      widget.helpList[index].duration,
                      widget.helpList[index].price)
                ],
              );
            },
          ),
        )),
      ],
    ));
  }
}
