import 'package:desa/component/login/logincomponent.dart';
import 'package:desa/size_config.dart';
import 'package:flutter/material.dart';

class LoginScreens extends StatelessWidget{
  static String routeName = "/sign_in";

  @override
  Widget build(BuildContext context){
    SizeConfig().init(context);

    return Scaffold(
      appBar: null,
      body: LoginComponent(),
    );
  }
}