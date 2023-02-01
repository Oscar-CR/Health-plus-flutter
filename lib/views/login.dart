import 'package:flutter/material.dart';
import 'package:health_plus/data/colors.dart';
import 'package:health_plus/views/home.dart';
import 'package:health_plus/views/principal.dart';

class Login extends StatefulWidget {
  Login({Key? key, this.validator}) : super(key: key);
  String? validator;

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  late String _email;
  late String _password;
  String _errorMessage = '';

  bool boolTrue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                color: ColorsHeathPlus.primaryColorDark,
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 400,
                      child: Align(
                        alignment: const Alignment(0, 30),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SizedBox(
                              width: double.infinity,
                              height: 360,
                              child: Card(
                                  child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 16),
                                    child: Text(
                                      "Health Plus",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        left: 16, right: 16, top: 16),
                                    child: SizedBox(
                                        width: double.infinity,
                                        child: Text(
                                          'Correo',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 16),
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                            hintText: 'Ingrese su email',
                                            icon: Icon(
                                              Icons.mail,
                                            )),
                                        validator: (value) => value!.isEmpty
                                            ? 'Este campo no puede estar vacio'
                                            : null,
                                        onSaved: (value) =>
                                            _email = value.toString(),
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        left: 16, right: 16, top: 24),
                                    child: SizedBox(
                                        width: double.infinity,
                                        child: Text(
                                          'Contraseña',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 16),
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        hintText: 'Ingrese su contraseña',
                                        icon: Icon(
                                          Icons.lock,
                                        ),
                                      ),
                                      obscureText: true,
                                      validator: (value) => value!.isEmpty
                                          ? 'Este campo no puede estar vacio'
                                          : null,
                                      onSaved: (value) =>
                                          _password = value.toString(),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 32, left: 16, right: 16),
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                          onPressed: () => {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const Principal()))
                                              },
                                          child: Text("INICIAR SESION")),
                                    ),
                                  )
                                ],
                              ))),
                        ),
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
