import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:health_plus/constants/adictions.dart';
import 'package:health_plus/constants/colors.dart';
import 'package:health_plus/models/advance.dart';
import 'package:health_plus/models/consume.dart';
import 'package:health_plus/views/user/account.dart';
import 'package:health_plus/widgets/chart-advance.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdvancePage extends StatefulWidget {
  const AdvancePage({super.key, required this.title});

  final String title;

  @override
  State<AdvancePage> createState() => AdvancePageState();
}

class AdvancePageState extends State<AdvancePage> {
  List<Adiction> adictionList = StringsAdictions().adictionList;
  final _formKey = GlobalKey<FormState>();

  List<Consume> consummedList = [];
  @override
  void initState() {
    super.initState();
  }

  String listKey = "consummed";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.person),
          tooltip: 'User',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AccountPage()),
            );
          },
        ),
      ]),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Seguimiento diario',
                style: TextStyle(fontSize: 20),
              ),
              ChartAdvance(comsumeList: consummedList),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      showHelpAlertDialog(context);
                    },
                    child: const Text('AGREGAR REGISTRO'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showHelpAlertDialog(BuildContext context) {
    final _dialogFormKey = GlobalKey<FormState>();
    final _type = TextEditingController();
    final _consummed = TextEditingController();

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)), //this right here
            child: Form(
              key: _dialogFormKey,
              child: Container(
                height: 340,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Crear nuevo registro',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: TextFormField(
                          controller: _type,
                          decoration: const InputDecoration(
                            hintText: 'Alcohol, tabaco, etc.',
                            labelText: 'Tipo de consumo',
                            labelStyle: TextStyle(color: Colors.black),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorApp.primaryColorNormal,
                                  width: 2.0),
                            ),
                          ),
                          validator: (value) => value!.isEmpty
                              ? 'Este campo no puede estar vacio'
                              : null,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: TextFormField(
                          controller: _consummed,
                          decoration: const InputDecoration(
                            hintText: 'Ejemplo: 1, 2',
                            labelText: 'Cantidad Consumida',
                            labelStyle: TextStyle(color: Colors.black),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorApp.primaryColorNormal,
                                  width: 2.0),
                            ),
                          ),
                          validator: (value) => value!.isEmpty
                              ? 'Este campo no puede estar vacio'
                              : null,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, top: 32),
                        child: SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_dialogFormKey.currentState!.validate()) {
                                consummedList.add(Consume(
                                    'Dia',
                                    _consummed.text.toString(),
                                    _type.text.toString()));

                                Navigator.pop(context);
                              }
                            },
                            child: const Text('AGREGAR REGISTRO'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  /* void storeStringList(List<Consume> list) async {
    
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(listKey,  list.join() list);
  }

  Future<List<String>?> getStringList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(listKey);
  } */
}
