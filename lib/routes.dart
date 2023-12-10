import 'package:desa/screens/loading/onboardingscreens.dart';
import 'package:desa/screens/login/loginscreens.dart';
import 'package:desa/screens/register/registrasiscreens.dart';
import 'package:desa/screens/home/homescreens.dart';
import 'package:desa/screens/berita/beritascreens.dart';
import 'package:desa/screens/berita/detailberitascreens.dart';
import 'package:desa/screens/akun/akunscreens.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  OnBoardingScreens_.routeName: (context) => OnBoardingScreens_(),
  LoginScreens.routeName: (context) => LoginScreens(),
  RegisterScreens.routeName: (context) => RegisterScreens(),
  HomeScreens.routeName: (context) => HomeScreens(),
  BeritaScreens.routeName: (context) => BeritaScreens(),
  AkunScreens.routeName: (context) => AkunScreens(),
  DetailBeritaScreens.routeName: (context) {
    final beritaData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return DetailBeritaScreens(beritaData: beritaData);
  },
};
