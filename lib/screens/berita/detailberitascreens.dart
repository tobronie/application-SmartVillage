import 'package:desa/component/berita/detailberitacomponent.dart';
import 'package:desa/size_config.dart';
import 'package:flutter/material.dart';

class DetailBeritaScreens extends StatelessWidget {
  static const String routeName = "/detailberita";

  final Map<String, dynamic> beritaData;

  DetailBeritaScreens({required this.beritaData});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: DetailBeritaComponent(beritaData: beritaData),
    );
  }
}
