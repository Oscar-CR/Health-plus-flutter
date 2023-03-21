import 'package:flutter/material.dart';
import 'package:health_plus/constants/adictions.dart';
import 'package:health_plus/constants/colors.dart';
import 'package:health_plus/models/advance.dart';
import 'package:health_plus/widgets/card-adiction.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => AccountPageState();
}

class AccountPageState extends State<AccountPage> {
  List<Adiction> adictionList = StringsAdictions().adictionList;
  final _formKey = GlobalKey<FormState>();
  late String _email;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mi Cuenta')),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                const Text(
                  'Iniciar sesión o registarse',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Ingrese su email',
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: ColorApp.primaryColorNormal, width: 2.0),
                    ),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Este campo no puede estar vacio' : null,
                  onSaved: (value) => _email = value.toString(),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Ingrese su contraseña',
                    labelText: 'Contraseña',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: ColorApp.primaryColorNormal, width: 2.0),
                    ),
                  ),
                  obscureText: true,
                  validator: (value) =>
                      value!.isEmpty ? 'Este campo no puede estar vacio' : null,
                  onSaved: (value) => _password = value.toString(),
                ),
                const Padding(padding: EdgeInsets.only(top: 24)),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text('INICIAR SESION')),
                ),
                const Padding(padding: EdgeInsets.only(top: 24)),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          side: const BorderSide(
                            width: 2.0,
                            color: ColorApp.primaryColorDark,
                          ),
                          backgroundColor: ColorApp.backgroundColorLight,
                          foregroundColor: ColorApp.primaryColorDark),
                      onPressed: () {},
                      child: const Text('REGISTRARSE')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
