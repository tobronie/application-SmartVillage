import 'package:desa/routes.dart';
import 'package:desa/screens/login/loginscreens.dart';
import 'package:desa/theme.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MaterialApp(
    title: "Smart Village",
    theme: theme(),
    initialRoute: LoginScreens.routeName,
    routes: routes,
    debugShowCheckedModeBanner: false,
  ));
}
