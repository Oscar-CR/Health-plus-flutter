import 'package:flutter/material.dart';
import 'package:health_plus/constants/colors.dart';
import 'package:health_plus/constants/services.dart';
import 'package:health_plus/constants/strings.dart';
import 'package:health_plus/models/problem.dart';
import 'package:health_plus/views/user/account.dart';
import 'package:health_plus/widgets/card-service.dart';
import 'package:health_plus/widgets/chart-advance.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<Services> problemService = StringsServices().problemServiceList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.person),
          tooltip: 'User',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AccountPage()),
            );
          },
        ),
      ]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16, top: 16, bottom: 8),
            child: Text(
              'Seguimiento de Consumo',
              style: TextStyle(
                fontSize: 16.00,
              ),
            ),
          ),
          const ChartAdvance(
            comsumeList: [],
          ),
          /* const Padding(
            padding: EdgeInsets.only(left: 16, top: 16),
            child: Text(
              'Comunidad',
              style: TextStyle(
                fontSize: 16.00,
              ),
            ),
          ), */
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16),
            child: Text(
              StringsApp.homeServicesTitle,
              style: const TextStyle(
                fontSize: 16.00,
              ),
            ),
          ),
          Container(
            color: ColorApp.backgroundColorLight,
            child: Row(
              children: [
                Expanded(
                    child: SizedBox(
                  width: double.infinity,
                  height: 180,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(0),
                    itemCount: problemService.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CardService(
                          name: problemService[index].name,
                          phone: problemService[index].phone,
                          image: problemService[index].image);
                    },
                  ),
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
