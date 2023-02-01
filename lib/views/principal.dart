import 'package:flutter/material.dart';
import 'package:health_plus/views/home.dart';
import 'package:health_plus/views/messages.dart';
import 'package:health_plus/views/progress.dart';

class Principal extends StatefulWidget {
  const Principal({
    Key? key,
  }) : super(key: key);

  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
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
          primaryColor: Colors.green,
          primaryColorLight: Colors.lightGreen,
          primaryColorDark: Colors.green[800],
          hoverColor: Colors.green,
        ),
        home: DefaultTabController(
            length: 15,
            child: Scaffold(
              /* appBar: AppBar(
                    backgroundColor: Colors.green,

                title: Text(_title),
              ), */
              body: _selectedIndex == 0
                  ? const Messages()
                  : _selectedIndex == 1
                      ? const Home()
                      : const Progress(),
              bottomNavigationBar: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.message),
                    label: 'Mensajes',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Iinicio',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite),
                    label: 'Mi avance',
                  ),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: Colors.green,
                onTap: _onItemTapped,
              ),
            )));
  }
}
