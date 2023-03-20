import 'package:flutter/material.dart';
import 'package:health_plus/constants/colors.dart';
import 'package:health_plus/constants/strings.dart';
import 'package:health_plus/models/help.dart';
import 'package:health_plus/services/launch.dart';

class HelpAlertDialog {
  static showHelpAlertDialog(BuildContext context, List<Help> help) {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 120.0,
                      color: ColorApp.primaryColorNormal,
                      child: Align(
                        alignment: const Alignment(0, -1),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    help[0].name,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                    maxLines: 3,
                                    overflow: TextOverflow.fade,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16),
                                    child: Text(
                                      help[0].population,
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.white),
                                      maxLines: 2,
                                      overflow: TextOverflow.fade,
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.only(left: 16, right: 8, top: 16),
                        child: Text(
                          "Dirección:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 2, bottom: 4),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            help[0].address,
                            maxLines: 5,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.only(left: 16, right: 8, top: 16),
                        child: Text(
                          "Municipio:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 2, bottom: 4),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            help[0].municipality,
                            maxLines: 5,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.only(left: 16, right: 8, top: 16),
                        child: Text(
                          "Modelo de Ayuda:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 2, bottom: 4),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            help[0].helpModel,
                            maxLines: 5,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.only(left: 16, right: 8, top: 16),
                        child: Text(
                          "Duración de Tratamiento:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 2, bottom: 4),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            help[0].duration,
                            maxLines: 5,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.only(left: 16, right: 8, top: 16),
                        child: Text(
                          "Precio:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 2, bottom: 4),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            help[0].price,
                            maxLines: 5,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.only(left: 16, right: 8, top: 16),
                        child: Text(
                          "Numero de Contacto:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 2, bottom: 4),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            help[0].phone,
                            maxLines: 5,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              makePhoneCall(help[0].phone);
                            },
                            child: Text(StringsApp.alertHelpButton),
                          )),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
