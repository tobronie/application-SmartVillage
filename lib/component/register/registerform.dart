import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desa/component/custom_surfix_icon.dart';
import 'package:desa/component/default_button_custom_color.dart';
import 'package:desa/screens/login/loginscreens.dart';
import 'package:desa/services/firebase_auth_service.dart';
import 'package:desa/size_config.dart';
import 'package:desa/utils/constans.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpForm createState() => _SignUpForm();
}

class _SignUpForm extends State<SignUpForm> {
  final TextEditingController txtImageProfile = TextEditingController();
  final TextEditingController txtNamaLengkap = TextEditingController();
  final TextEditingController txtNIK = TextEditingController();
  final TextEditingController txtNoKK = TextEditingController();
  final TextEditingController txtAlamat = TextEditingController();
  final TextEditingController txtNoHandphone = TextEditingController();
  final TextEditingController txtEmail = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();

  final firebaseAuthService _authService = firebaseAuthService();

  bool? remember = true;

  @override
  void dispose() {
    txtNamaLengkap.dispose();
    txtImageProfile.dispose();
    txtNIK.dispose();
    txtNoKK.dispose();
    txtNoHandphone.dispose();
    txtAlamat.dispose();
    txtEmail.dispose();
    txtPassword.dispose();
    super.dispose();
  }

  void register() async {
    String namalengkap = txtNamaLengkap.text;
    String imageprofil = txtImageProfile.text;
    String nikktp = txtNIK.text;
    String nokk = txtNoKK.text;
    String alamat = txtAlamat.text;
    String nohp = txtNoHandphone.text;
    String email = txtEmail.text;
    String password = txtPassword.text;

    User? user =
        await _authService.signUpWithEmailandPassword(email, password, context);
    if (user != null) {
      try {
        FirebaseFirestore firestore = FirebaseFirestore.instance;

        String collectionPath = 'users';

        await firestore.collection(collectionPath).doc(user.email).set({
          'imageprofil': imageprofil,
          'nama_lengkap': namalengkap,
          'nik': nikktp,
          'no_kk': nokk,
          'alamat': alamat,
          'no_hp': nohp,
          'email': email,
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("User is successfully created"),
            backgroundColor: Colors.green));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreens()));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Tidak dapat menyimpan data pengguna"),
          backgroundColor: Colors.red,
        ));
      }
    }
  }

  FocusNode focusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30),
      child: Column(children: [
        buildNamaLengkap(),
        SizedBox(height: getProportionateScreenHeight(20)),
        buildNIK(),
        SizedBox(height: getProportionateScreenHeight(20)),
        buildNoKK(),
        SizedBox(height: getProportionateScreenHeight(20)),
        buildAlamat(),
        SizedBox(height: getProportionateScreenHeight(20)),
        buildNoHandphone(),
        SizedBox(height: getProportionateScreenHeight(20)),
        buildEmail(),
        SizedBox(height: getProportionateScreenHeight(20)),
        buildPassword(),
        SizedBox(height: getProportionateScreenHeight(20)),
        buildImage(),
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
            Text("Data Anda Pasti Aman"),
          ],
        ),
        DefaultButtonCustomeColor(
          color: kPrimaryColor,
          text: "DAFTAR",
          press: () {
            register();
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
      ),
    );
  }

  //Image
  TextFormField buildImage() {
    return TextFormField(
      controller: txtImageProfile,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'URL Foto Profil',
          hintText: 'Masukkan URL Foto Profil Network Anda',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Camera Icon.svg")),
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
  TextFormField buildAlamat() {
    return TextFormField(
      controller: txtAlamat,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Alamat',
          hintText: 'Masukkan Alamat Anda',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon:
              CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg")),
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
