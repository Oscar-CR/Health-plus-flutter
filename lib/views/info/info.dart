import 'package:flutter/material.dart';
import 'package:health_plus/constants/colors.dart';
import 'package:flutter_walkthrough_screen/flutter_walkthrough_screen.dart';
import 'package:health_plus/main.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => InfoPageState();
}

class InfoPageState extends State<InfoPage> {
  final List<OnbordingData> list = const [
    OnbordingData(
      image: AssetImage('lib/assets/centros_de_ayuda.gif'),
      titleText: Text("Centro de Ayuda",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24)),
      descText: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
            "Puedes localizar centros de ayuda verificados por estado, consultar los costos y ubicación.",
            style: TextStyle(color: Colors.white, fontSize: 16)),
      ),
    ),
    OnbordingData(
      image: AssetImage('lib/assets/home.gif'),
      titleText: Text("Inicio",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24)),
      descText: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
            "Muestra tu progreso de consumo, asi como acceso directo a los servicios de emergencia mas comunes",
            style: TextStyle(color: Colors.white, fontSize: 16)),
      ),
    ),
    OnbordingData(
      image: AssetImage('lib/assets/seguimiento_diario.gif'),
      titleText: Text(
        "Seguimiento Diario",
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24),
      ),
      descText: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
            "Almacena los registros de tu avance diario, los cuales puedes añadir mediante el boton de 'AGREGAR REGISTRO'.",
            style: TextStyle(color: Colors.white, fontSize: 16)),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroScreen(
      onbordingDataList: list,
      gradient: const LinearGradient(colors: [
        ColorApp.primaryColorDark,
        ColorApp.primaryColorDark,
        ColorApp.primaryColorDark,
        ColorApp.primaryColorDark
      ]),
      colors: const [
        //list of colors for per pages
        Colors.white,
        Colors.red,
      ],
      pageRoute: MaterialPageRoute(
        builder: (context) => const Main(),
      ),
      nextButton: const Text(
        "Siguiente",
        style: TextStyle(
          color: Colors.yellow,
        ),
      ),
      lastButton: const Text(
        "Entendido",
        style: TextStyle(
          color: Colors.yellow,
        ),
      ),
      skipButton: const Text(
        "Saltar",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      selectedDotColor: Colors.yellow,
      unSelectdDotColor: Colors.white,
    );
  }
}
