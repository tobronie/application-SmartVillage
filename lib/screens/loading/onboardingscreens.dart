import 'package:desa/component/loading/onboarding.dart';
import 'package:desa/size_config.dart';
import 'package:flutter/material.dart';

class OnBoardingScreens_ extends StatelessWidget{
  static String routeName = "/onboarding";

  @override
  Widget build(BuildContext context){
    SizeConfig().init(context);

    return Scaffold(
      appBar: null,
      body: OnboardingScreens(),
    );
  }
}