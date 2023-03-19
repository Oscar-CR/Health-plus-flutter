import 'package:flutter/material.dart';
import 'package:health_plus/constants/strings.dart';
import 'package:health_plus/widgets/card-service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              StringsApp.homeWelcome,
              style:
                  const TextStyle(fontSize: 20.00, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 16, bottom: 0),
            color: Colors.white,
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
                    itemCount: 20,
                    itemBuilder: (BuildContext context, int index) {
                      return const CardService(
                          name: 'Nombre',
                          phone: '5555',
                          image: 'lib/assets/heart-care.png');
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
