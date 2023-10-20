import 'package:desa/component/register/registercomponent.dart';
import 'package:desa/size_config.dart';
import 'package:flutter/material.dart';

class RegisterScreens extends StatelessWidget {
  static String routeName = "/sign_up";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: null,
      body: RegisterComponent(),
    );
  }
}
