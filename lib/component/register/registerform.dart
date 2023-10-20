import 'package:desa/component/custom_surfix_icon.dart';
import 'package:desa/component/default_button_custom_color.dart';
import 'package:desa/screens/login/loginscreens.dart';
import 'package:desa/size_config.dart';
import 'package:desa/utils/constans.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpForm createState() => _SignUpForm();
}

class _SignUpForm extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? namalengkap;
  String? nikktp;
  String? nokk;
  int? nohandphone;
  String? email;
  String? password;
  bool? remember = false;

  TextEditingController txtNamaLengkap = TextEditingController(),
      txtNIK = TextEditingController(),
      txtNoKK = TextEditingController(),
      txtNoHandphone = TextEditingController(),
      txtEmail = TextEditingController(),
      txtPassword = TextEditingController();

  FocusNode focusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(children: [
        buildNamaLengkap(),
        SizedBox(height: getProportionateScreenHeight(30)),
        buildNIK(),
        SizedBox(height: getProportionateScreenHeight(30)),
        buildNoKK(),
        SizedBox(height: getProportionateScreenHeight(30)),
        buildNoHandphone(),
        SizedBox(height: getProportionateScreenHeight(30)),
        buildEmail(),
        SizedBox(height: getProportionateScreenHeight(30)),
        buildPassword(),
        SizedBox(height: getProportionateScreenHeight(30)),
        Row(
          children: [
            Checkbox(
                value: remember,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                }),
            Text("Data Anda Pasti Aman"),
          ],
        ),
        DefaultButtonCustomeColor(
          color: kPrimaryColor,
          text: "DAFTAR",
          press: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  title: Text(
                    "Konfirmasi",
                    style: mTitleStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  content: Text(
                      "Selamat, Anda sudah menjadi bagian dari Smart Village.\nSilahkan klik lanjut untuk beralih ke menu Login"),
                  actions: <Widget>[
                    TextButton(
                      child: Text(
                        "Lanjut",
                        style: mTitleStyle.copyWith(
                          fontSize: 14,
                          color: Colors.blue,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.pushNamed(context, LoginScreens.routeName);
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, LoginScreens.routeName);
          },
          child: Text(
            "Sudah Punya Akun ? Masuk Disini",
            style: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
      ]),
    );
  }

  //Nama Lengkap
  TextFormField buildNamaLengkap() {
    return TextFormField(
      controller: txtNamaLengkap,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Nama Lengkap',
          hintText: 'Masukkan Nama Lengkap Anda',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg")),
    );
  }

  //NIK KTP
  TextFormField buildNIK() {
    return TextFormField(
      controller: txtNIK,
      keyboardType: TextInputType.number,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'NIK KTP',
          hintText: 'Masukkan NIK KTP Anda',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/card.svg")),
    );
  }

  //No KK
  TextFormField buildNoKK() {
    return TextFormField(
      controller: txtNoKK,
      keyboardType: TextInputType.number,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'No KK',
          hintText: 'Masukkan No KK Anda',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/card.svg")),
    );
  }

  //No Handphone
  TextFormField buildNoHandphone() {
    return TextFormField(
      controller: txtNoHandphone,
      keyboardType: TextInputType.number,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'No Handphone',
          hintText: 'Masukkan No Handphone Anda',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon:
              CustomSurffixIcon(svgIcon: "assets/icons/call_black.svg")),
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
