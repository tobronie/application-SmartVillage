import 'package:desa/component/home/homecomponent.dart';
import 'package:desa/size_config.dart';
import 'package:flutter/material.dart';

class HomeScreens extends StatelessWidget{
  static String routeName = "/home";

  @override
  Widget build(BuildContext context){
    SizeConfig().init(context);

    return Scaffold(
      body: HomeComponent(),
    );
  }
}