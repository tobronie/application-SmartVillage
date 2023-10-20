import 'package:desa/component/berita/beritacomponent.dart';
import 'package:desa/size_config.dart';
import 'package:flutter/material.dart';

class BeritaScreens extends StatelessWidget{
  static String routeName = "/berita";

  @override
  Widget build(BuildContext context){
    SizeConfig().init(context);

    return Scaffold(
      body: BeritaComponent(),
    );
  }
}