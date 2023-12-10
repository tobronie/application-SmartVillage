import 'package:desa/component/custom_surfix_icon.dart';
import 'package:desa/component/default_button_custom_color.dart';
import 'package:desa/screens/register/registrasiscreens.dart';
import 'package:desa/screens/home/homescreens.dart';
import 'package:desa/services/firebase_auth_service.dart';
import 'package:desa/size_config.dart';
import 'package:desa/utils/constans.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInForm createState() => _SignInForm();
}

class _SignInForm extends State<SignInForm> {
  final TextEditingController txtEmail = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();

  final firebaseAuthService _authService = firebaseAuthService();

  bool? remember = true;

  @override
  void dispose() {
    txtEmail.dispose();
    txtPassword.dispose();
    super.dispose();
  }

  void login() async {
    String email = txtEmail.text;
    String password = txtPassword.text;
    
    User? user = await _authService.loginUpWithEmailandPassword(email, password, context);

    if(user != null){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login Succes"),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreens()));
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login Failed"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  FocusNode focusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(children: [
        buildEmail(),
        SizedBox(height: getProportionateScreenHeight(20)),
        buildPassword(),
        SizedBox(height: getProportionateScreenHeight(20)),
        Row(
          children: [
            Checkbox(
                value: remember,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                }),
            Text("Yakin ingin Masuk?"),
            Spacer(),
            GestureDetector(
              onTap: () {},
              child: Text(
                "Lupa Password",
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            )
          ],
        ),
        DefaultButtonCustomeColor(
          color: kPrimaryColor,
          text: "MASUK",
          press: () {
            login();
          },
        ),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RegisterScreens.routeName);
          },
          child: Text(
            "Belum Punya Akun ? Daftar Disini",
            style: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
      ]),
    );
  }

  //Email
  TextFormField buildEmail() {
    return TextFormField(
      controller: txtEmail,
      keyboardType: TextInputType.emailAddress,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'Masukkan Email Anda',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg")),
    );
  }

  //pasword
  TextFormField buildPassword() {
    return TextFormField(
      controller: txtPassword,
      obscureText: true,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'password',
          hintText: 'Masukkan Password Anda',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg")),
    );
  }
}
