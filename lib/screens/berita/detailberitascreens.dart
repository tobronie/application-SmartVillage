import 'package:desa/component/berita/detailberitacomponent.dart';
import 'package:desa/size_config.dart';
import 'package:flutter/material.dart';

class DetailBeritaScreens extends StatelessWidget{
  static String routeName = "/detailberita";

  @override
  Widget build(BuildContext context){
    SizeConfig().init(context);

    return Scaffold(
      body: DetailBeritaComponent(),
    );
  }
}