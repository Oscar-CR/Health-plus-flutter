import 'dart:math';

import 'package:flutter/material.dart';

class CardProblem extends StatefulWidget {
  const CardProblem(
      {Key? key, required this.problem, required this.description})
      : super(key: key);

  final String problem;
  final String description;

  @override
  State<CardProblem> createState() => CardProblemState();
}

class CardProblemState extends State<CardProblem> {
  int colorNumber = Random().nextInt(6);
  Color color = const Color(0XFFB7BEFF);
  @override
  void initState() {
    if (colorNumber == 2) {
      color = const Color(0XFF8ACBB7);
    }
    if (colorNumber == 3) {
      color = const Color(0XFFF2D791);
    }
    if (colorNumber == 4) {
      color = const Color(0XFFFF9C9C);
    }
    if (colorNumber == 5) {
      color = const Color(0XFFF1A3E0);
    }
    if (colorNumber == 6) {
      color = const Color(0XFFD0ABFF);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 120,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Text(
                          widget.problem,
                          style: const TextStyle(
                              fontSize: 16.00, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        widget.description,
                        style: const TextStyle(
                          fontSize: 12.00,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  color: color,
                  padding: const EdgeInsets.all(20.0),
                  child: const SizedBox(
                    width: 60,
                    height: 60,
                    child: FittedBox(
                        fit: BoxFit.contain,
                        child: Image(
                          image: AssetImage('lib/assets/heart-care.png'),
                        )),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
