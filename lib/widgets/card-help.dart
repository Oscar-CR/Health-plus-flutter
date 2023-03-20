import 'package:flutter/material.dart';
import 'package:health_plus/models/help.dart';
import 'package:health_plus/widgets/alert-help.dart';

class CardHelp extends StatefulWidget {
  const CardHelp({Key? key, required this.help, required this.context})
      : super(key: key);

  final List<Help> help;
  final BuildContext context;

  @override
  State<CardHelp> createState() => CardHelpState();
}

class CardHelpState extends State<CardHelp> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        HelpAlertDialog.showHelpAlertDialog(widget.context, widget.help);
      },
      child: SizedBox(
        width: double.infinity,
        height: 120,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 12, top: 12, bottom: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.65,
                          height: 45,
                          child: Text(widget.help[0].name,
                              style: const TextStyle(
                                  fontSize: 14.00, fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.fade),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.65,
                          child: Text(widget.help[0].address,
                              style: const TextStyle(
                                fontSize: 12.00,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.fade),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: 60,
                    child: const FittedBox(
                        fit: BoxFit.contain,
                        child: Image(
                          image: AssetImage('lib/assets/conadic_logo.jpg'),
                        )),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
