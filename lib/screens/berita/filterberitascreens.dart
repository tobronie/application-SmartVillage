import 'package:desa/component/berita/filterberitacomponent.dart';
import 'package:desa/size_config.dart';
import 'package:flutter/material.dart';

class FilterBeritaScreens extends StatelessWidget{
  static String routeName = "/filter_berita";

  @override
  Widget build(BuildContext context){
    SizeConfig().init(context);

    return Scaffold(
      body: FilterBeritaComponent(),
    );
  }
}