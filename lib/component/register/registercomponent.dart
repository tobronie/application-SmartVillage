import 'package:desa/component/register/registerform.dart';
import 'package:desa/size_config.dart';
import 'package:desa/utils/constans.dart';
import 'package:flutter/widgets.dart';

class RegisterComponent extends StatefulWidget {
  @override
  _RegisterComponent createState() => _RegisterComponent();
}

class _RegisterComponent extends State<RegisterComponent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenHeight(20)),
            child: SingleChildScrollView(
                child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Register!",
                          style: mTitleStyle,
                        )
                      ]),
                ),
                SizedBox(
                  height: 20,
                ),
                SignUpForm()
              ],
            )),
          ),
        ),
      ),
    );
  }
}
