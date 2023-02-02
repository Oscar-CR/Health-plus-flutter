import 'package:flutter/material.dart';
import 'package:health_plus/data/colors.dart';
import 'package:lottie/lottie.dart';

class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    "Mis Mensajes",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 64),
              child: Column(
                children: [
                  SizedBox(
                      width: 250,
                      child: Lottie.asset('lib/assets/crocodile.json')),
                  Text("Sin mensajes disponibles")
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
