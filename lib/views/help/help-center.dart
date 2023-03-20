import 'package:flutter/material.dart';
import 'package:health_plus/constants/helpInformation.dart';
import 'package:health_plus/models/help.dart';
import 'package:health_plus/views/help/help-recycler.dart';

class HelpCenterPage extends StatefulWidget {
  const HelpCenterPage({super.key, required this.title});

  final String title;

  @override
  State<HelpCenterPage> createState() => HelpCenterPageState();
}

class HelpCenterPageState extends State<HelpCenterPage> {
  List<Help> cdmxHelpList = StringsHelpInformation().cdmxHelpList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person),
            tooltip: 'User',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Aqui va la vista de usuario')));
            },
          ),
        ],
        bottom: TabBar(
            isScrollable: true,
            unselectedLabelColor: Colors.white.withOpacity(0.3),
            indicatorColor: Colors.white,
            tabs: const [
              Tab(
                child: Text('CDMX'),
              ),
              Tab(
                child: Text('Estado de México'),
              ),
              Tab(
                child: Text('Aguas Calientes'),
              ),
              Tab(
                child: Text('Baja Califonia'),
              ),
              Tab(
                child: Text('Baja California Sur'),
              ),
              Tab(
                child: Text('Campeche'),
              ),
              Tab(
                child: Text('Chiapas'),
              ),
              Tab(
                child: Text('Chihuahua'),
              ),
              Tab(
                child: Text('Coahuila de Zaragoza'),
              ),
              Tab(
                child: Text('Colima'),
              ),
              Tab(
                child: Text('Durango'),
              ),
              Tab(
                child: Text('Guanajuato'),
              ),
              Tab(
                child: Text('Guerrero'),
              ),
              Tab(
                child: Text('Hidalgo'),
              ),
              Tab(
                child: Text('Jalisco'),
              ),
            ]),
      ),
      body: TabBarView(
        children: [
          HelpRecyclerPage(
            helpList: cdmxHelpList,
          ),
          HelpRecyclerPage(
            helpList: cdmxHelpList,
          ),
          HelpRecyclerPage(
            helpList: cdmxHelpList,
          ),
          HelpRecyclerPage(
            helpList: cdmxHelpList,
          ),
          HelpRecyclerPage(
            helpList: cdmxHelpList,
          ),
          HelpRecyclerPage(
            helpList: cdmxHelpList,
          ),
          HelpRecyclerPage(
            helpList: cdmxHelpList,
          ),
          HelpRecyclerPage(
            helpList: cdmxHelpList,
          ),
          HelpRecyclerPage(
            helpList: cdmxHelpList,
          ),
          HelpRecyclerPage(
            helpList: cdmxHelpList,
          ),
          HelpRecyclerPage(
            helpList: cdmxHelpList,
          ),
          HelpRecyclerPage(
            helpList: cdmxHelpList,
          ),
          HelpRecyclerPage(
            helpList: cdmxHelpList,
          ),
          HelpRecyclerPage(
            helpList: cdmxHelpList,
          ),
          HelpRecyclerPage(
            helpList: cdmxHelpList,
          ),
        ],
      ),
    );
  }
}
