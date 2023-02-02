import 'package:flutter/material.dart';
import 'package:health_plus/data/colors.dart';
import 'package:health_plus/services/notifications_channel.dart';
import 'package:health_plus/views/principal.dart';
import 'package:health_plus/views/login.dart';

void main() {
  runApp((const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<MyApp> {
  String log = "";

  @override
  void initState() {
    createNotificationChannel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login',
        theme: ThemeData(
            primaryColor: ColorsHeathPlus.primaryColorNormal,
            primaryColorDark: ColorsHeathPlus.primaryColorDark,
            primaryColorLight: ColorsHeathPlus.primaryColorLight,
            primarySwatch: Colors.green),
        home: Scaffold(body: log.isEmpty ? Login() : const Principal()));
  }
}
