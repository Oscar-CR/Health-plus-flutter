import 'package:flutter/material.dart';
import 'package:health_plus/constants/colors.dart';
import 'package:health_plus/constants/strings.dart';
import 'package:health_plus/views/advance/advance.dart';
import 'package:health_plus/views/help/help-center.dart';
import 'package:health_plus/views/home/home.dart';

void main() {
  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({
    Key? key,
  }) : super(key: key);

  @override
  MainState createState() => MainState();
}

class MainState extends State<Main> {
  String _title = 'Inicio';
  int _selectedIndex = 1;

  bool isLike = false;
  bool loadingComment = false;

  List<String> titles = ["Mensajes", "Inicio", "Mi avance"];
  late String token = "";
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _title = titles[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: ColorApp.primaryColorNormal,
            primaryColorLight: ColorApp.primaryColorLight,
            primaryColorDark: ColorApp.primaryColorDark,
            hoverColor: Colors.green,
            backgroundColor: ColorApp.backgroundColorLight,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorApp.primaryColorNormal,
                  foregroundColor: Colors.white),
            ),
            appBarTheme:
                const AppBarTheme(backgroundColor: ColorApp.primaryColorDark)),
        home: DefaultTabController(
            length: 15,
            child: Scaffold(
              body: _selectedIndex == 0
                  ? HelpCenterPage(
                      title: StringsApp.buttonNavHelpCenter,
                    )
                  : _selectedIndex == 1
                      ? HomePage(
                          title: StringsApp.buttonNavHome,
                        )
                      : AdvancePage(
                          title: StringsApp.buttonNavAdvance,
                        ),
              bottomNavigationBar: BottomNavigationBar(
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.group),
                    label: StringsApp.buttonNavHelpCenter,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.home),
                    label: StringsApp.buttonNavHome,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.favorite),
                    label: StringsApp.buttonNavAdvance,
                  ),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: ColorApp.primaryColorDark,
                onTap: _onItemTapped,
              ),
            )));
  }
}
