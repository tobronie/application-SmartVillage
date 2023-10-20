import 'package:desa/component/akun/akuncomponent.dart';
import 'package:desa/size_config.dart';
import 'package:flutter/material.dart';

class AkunScreens extends StatelessWidget{
  static String routeName = "/akun";

  @override
  Widget build(BuildContext context){
    SizeConfig().init(context);

    return Scaffold(
      body: AkunComponent(),
    );
  }
}