import 'package:flutter/material.dart';
import 'package:health_plus/data/colors.dart';
import 'package:health_plus/services/notifications.dart';
import 'package:health_plus/services/notifications_channel.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;
  int status = 0;

  @override
  void initState() {
    createNotificationChannel();
    data = [
      _ChartData('Dia 1', 12),
      _ChartData('Dia 2', 10),
      _ChartData('Dia 3', 8),
      _ChartData('Dia 4', 12),
      _ChartData('Dia 5', 6)
    ];
    _tooltip = TooltipBehavior(enable: true);

    super.initState();
  }

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
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 64, left: 16),
                  child: Text(
                    "¡Hola Brandon!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 16, left: 16),
                      child: Text(
                        "¿Cómo te sientes el día de hoy?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            happyNotification();
                            setState(() {
                              if (status == 1) {
                                status = 0;
                              } else {
                                status = 1;
                              }
                            });
                          },
                          icon: Icon(Icons.sentiment_dissatisfied),
                          color: status == 1 ? Colors.red : Colors.white,
                        ),
                        IconButton(
                            onPressed: () {
                              normalNotification();
                              setState(() {
                                if (status == 2) {
                                  status = 0;
                                } else {
                                  status = 2;
                                }
                              });
                            },
                            icon: const Icon(Icons.sentiment_neutral),
                            color: status == 2 ? Colors.yellow : Colors.white),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                sadNotification();
                                if (status == 3) {
                                  status = 0;
                                } else {
                                  status = 3;
                                }
                              });
                            },
                            icon: Icon(Icons.sentiment_satisfied),
                            color: status == 3
                                ? Colors.greenAccent
                                : Colors.white),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Mi avance",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(minimum: 0, maximum: 20, interval: 1),
              tooltipBehavior: _tooltip,
              series: <ChartSeries<_ChartData, String>>[
                ColumnSeries<_ChartData, String>(
                    dataSource: data,
                    xValueMapper: (_ChartData data, _) => data.x,
                    yValueMapper: (_ChartData data, _) => data.y,
                    name: 'Cigarros consumidos',
                    color: ColorsHeathPlus.primaryColorDark)
              ]),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Publicaciones recientes",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                InkWell(
                  onTap: () {
                    LaunchToInternet.launchURL(
                        "https://aprende.com/blog/bienestar/salud/como-mejorar-tu-salud/");
                  },
                  child: SizedBox(
                    width: 250,
                    height: 200,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(
                                width: double.infinity,
                                height: 160,
                                child: Image.asset(
                                    "lib/assets/backgrownd_login.jpg")),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Cómo mejorar tus habitos para tener buena salud",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    LaunchToInternet.launchURL(
                        "https://www.forbes.com.mx/forbes-life/salud-mejorar-habitos-alimentarios-y-salud/");
                  },
                  child: SizedBox(
                    width: 250,
                    height: 250,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(
                                width: double.infinity,
                                height: 160,
                                child: Image.network(
                                    "https://csmfotografia.com/wp-content/uploads/2021/08/tipos-de-comida-saludable.jpg")),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Mejora tus habitos alimenticios",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    LaunchToInternet.launchURL(
                        "https://hospital.uillinois.edu/es/primary-and-specialty-care/servicios-de-psiquiatria/servicios-clinicos-para-adultos/trastornos-del-humor-y-ansiedad/trastornos-de-ansiedad");
                  },
                  child: SizedBox(
                    width: 250,
                    height: 250,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(
                                width: double.infinity,
                                height: 160,
                                child: Image.network(
                                    "https://as01.epimg.net/deporteyvida/imagenes/2020/03/02/portada/1583142327_324441_1583142752_noticia_normal_recorte1.jpg")),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Transtornos de ansiedad",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Text(
              "Servicios",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                GridView(
                    shrinkWrap: true,
                    primary: false,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    children: [
                      InkWell(
                        child: Card(
                          elevation: 10,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.network(
                                'https://www.gob.mx/cms/uploads/article/main_image/25704/iman_2.jpg'),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _makePhoneCall("911");
                          });
                        },
                      ),
                      InkWell(
                        child: Card(
                          elevation: 10,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.network(
                                'https://comisiondebusqueda.cdmx.gob.mx/storage/app/uploads/public/613/fc7/74e/thumb_471_640_360_0_0_crop.jpg'),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _makePhoneCall("56581111");
                          });
                        },
                      ),
                      InkWell(
                        child: Card(
                          elevation: 10,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.network(
                                'https://www.tlalpan.cdmx.gob.mx/wp-content/uploads/2021/07/Proteccion-civil-logo-gen.png'),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _makePhoneCall("56932222");
                          });
                        },
                      ),
                      InkWell(
                        child: Card(
                          elevation: 10,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.network(
                                'https://pbs.twimg.com/profile_images/1542843852003766272/X88520Cy_400x400.jpg'),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _makePhoneCall("8009112000");
                          });
                        },
                      ),
                    ])
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}

Future<void> _makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}

class LaunchToInternet {
  static launchURL(_url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}
