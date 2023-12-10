import 'package:desa/routes.dart';
import 'package:desa/screens/loading/onboardingscreens.dart';
import 'package:desa/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      appId: '1:31841678849:android:5aa738bc80ed4f12197200',
      apiKey: 'AIzaSyDcx6Gb3yrSupvLZJ_iKUNpSSVUTXgkbh8',
      messagingSenderId: '31841678849',
      projectId: 'smart-village-desa',
    ),

  );

  runApp(MaterialApp(
    title: "Smart Village",
    theme: theme(),
    // initialRoute: LoginScreens.routeName,
    initialRoute: OnBoardingScreens_.routeName,
    routes: routes,
    debugShowCheckedModeBanner: false,
  ));
}