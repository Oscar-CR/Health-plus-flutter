import 'dart:math';

import 'package:flutter/material.dart';
import 'package:health_plus/constants/colors.dart';
import 'package:health_plus/services/launch.dart';

class CardService extends StatefulWidget {
  const CardService(
      {Key? key, required this.name, required this.phone, required this.image})
      : super(key: key);

  final String name;
  final String phone;
  final String image;

  @override
  State<CardService> createState() => CardServiceState();
}

class CardServiceState extends State<CardService> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        width: 200,
        height: 120,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SizedBox(
                      width: 120,
                      height: 120,
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: Image(
                            image: AssetImage(widget.image),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Center(child: Text(widget.name)),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 8,
                    child: Container(
                      color: ColorApp.primaryColorNormal,
                    ),
                  )
                ],
              )),
        ),
      ),
      onTap: () {
        makePhoneCall(widget.phone);
      },
    );
  }
}
