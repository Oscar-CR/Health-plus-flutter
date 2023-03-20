import 'package:health_plus/models/help.dart';
import 'package:health_plus/models/problem.dart';

class StringsServices {
  final List<Services> problemServiceList = [
    const Services(
        "Emergencias", "911", "lib/assets/emergency-medical-team.png"),
    const Services(
        "Cruz Roja", "53951111", "lib/assets/emergency-medical-support.png"),
    const Services("Bomberos", "57683700",
        "lib/assets/fire-workers-on-fire-emergency-alert-moving-towards-vehicle.png"),
    const Services("Bomberos", "57683700",
        "lib/assets/fire-workers-on-fire-emergency-alert-moving-towards-vehicle.png"),
    const Services("Locatel", "56581111", "lib/assets/find-location.png"),
    const Services("Fuga de Gas", "53532763",
        "lib/assets/girl-calling-fire-emergency-service-due-to-fire-in-kitchen.png")
  ];
}
