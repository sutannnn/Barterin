import 'package:flutter/material.dart';
import 'package:flutter_application_1/atributs/mybutton.dart';
import 'package:flutter_application_1/atributs/mytextbutton.dart';
import 'package:flutter_application_1/atributs/mytextfield.dart';
import 'package:flutter_application_1/dashboard/home.dart';
import 'package:flutter_application_1/forgotpassword/phonenumber.dart';
import 'package:flutter_application_1/signup/signup.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  Future<InitializationStatus> _initGoogleMobileAds() {
    // TODO: Initialize Google Mobile Ads SDK
    return MobileAds.instance.initialize();
  }

  final TextEditingController _email = TextEditingController();
  final TextEditingController _sandi = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: new Stack(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("images/bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            new Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100, left: 7),
                    child: Text(
                      "Barterln",
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 46, bottom: 17),
                    child: Text(
                      "Masuk Akun",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ),
                  MyTF(
                    txt: "Email/No Telepon",
                    inpType: TextInputType.emailAddress,
                    width: 276,
                    height: 46,
                    tr: 8,
                    tl: 8,
                    br: 8,
                    bl: 8,
                    fs: 15,
                    ot: false,
                    controller: _email,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 17),
                      child: MyTF(
                        txt: "Kata Sandi",
                        inpType: TextInputType.text,
                        width: 276,
                        height: 46,
                        tr: 8,
                        tl: 8,
                        br: 8,
                        bl: 8,
                        fs: 15,
                        ot: true,
                        controller: _sandi,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(right: 185, bottom: 25),
                    child: MytextButton(
                        txt: "Lupa sandi?",
                        cls: PhoneNumber(),
                        clr: Colors.black,
                        fs: 15,
                        fw: FontWeight.normal,
                        td: TextDecoration.underline),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromRGBO(255, 145, 16, 1),
                              Color.fromRGBO(251, 214, 115, 1)
                            ]),
                        borderRadius: BorderRadius.circular(8)),
                    child: ElevatedButton(
                      onPressed: () {
                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: _email.text, password: _sandi.text)
                            .then((value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHome()));
                        }).onError((error, stackTrace) {
                          print("Email atau password salah!");
                        });
                      },
                      child: Text(
                        "Masuk",
                        style: TextStyle(fontSize: 14),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          minimumSize: Size(276, 49),
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 37, bottom: 17),
                    child: Text("- Atau daftar menggunakan -"),
                  ),
                  SignInButton(
                    Buttons.Facebook,
                    mini: false,
                    onPressed: () {},
                  ),
                  Divider(
                    color: Colors.transparent,
                  ),
                  SignInButton(
                    Buttons.Google,
                    mini: false,
                    onPressed: () {},
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Tidak punya akun?",
                          style: TextStyle(fontSize: 15),
                        ),
                        MytextButton(
                            txt: "Daftar Sekarang",
                            cls: SignUp(),
                            clr: Colors.black,
                            fs: 15,
                            fw: FontWeight.bold,
                            td: TextDecoration.none)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
