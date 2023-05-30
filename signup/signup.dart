import 'package:flutter/material.dart';
import 'package:flutter_application_1/atributs/mybutton.dart';
import 'package:flutter_application_1/atributs/mytextfield.dart';
import 'package:flutter_application_1/dashboard/home.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'signin.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  TextEditingController _email = TextEditingController();
  TextEditingController _nomor = TextEditingController();
  TextEditingController _sandi = TextEditingController();
  TextEditingController _ulangsandi = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
                      "Daftar Akun",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ),
                  MyTF(
                      txt: "Email",
                      inpType: TextInputType.emailAddress,
                      width: 276,
                      height: 46,
                      tr: 8,
                      tl: 8,
                      br: 8,
                      bl: 8,
                      fs: 15,
                      ot: false,
                      controller: _email),
                  Padding(
                    padding: const EdgeInsets.only(top: 17),
                    child: MyTF(
                      txt: "Nomor Telepon",
                      inpType: TextInputType.phone,
                      width: 276,
                      height: 46,
                      tr: 8,
                      tl: 8,
                      br: 8,
                      bl: 8,
                      fs: 15,
                      ot: false,
                      controller: _nomor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 17, bottom: 17),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 3),
                          child: MyTF(
                            txt: "Sandi",
                            inpType: TextInputType.text,
                            width: 135,
                            height: 46,
                            tr: 8,
                            tl: 8,
                            br: 8,
                            bl: 8,
                            fs: 15,
                            ot: true,
                            controller: _sandi,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: MyTF(
                            txt: "Ulang Sandi",
                            inpType: TextInputType.text,
                            width: 135,
                            height: 46,
                            tr: 8,
                            tl: 8,
                            br: 8,
                            bl: 8,
                            fs: 15,
                            ot: true,
                            controller: _ulangsandi,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text("By clicking this form, you agree"),
                  Text("wiht our Privacy Policy and"),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 17),
                    child: Text("Terms & Conditions"),
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
                            .createUserWithEmailAndPassword(
                                email: _email.text, password: _sandi.text)
                            .then((value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHome()));
                        }).onError((error, stackTrace) {
                          showAlertDialog(BuildContext context) {
                            // set up the button
                            Widget okButton = TextButton(
                              child: Text("OK"),
                              onPressed: () {},
                            );

                            // set up the AlertDialog
                            AlertDialog alert = AlertDialog(
                              title: Text("Error!"),
                              content: Text(
                                  "Masukkan email dan sandi dengan benar!"),
                              actions: [
                                okButton,
                              ],
                            );

                            // show the dialog
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert;
                              },
                            );
                          }
                        });
                      },
                      child: Text(
                        "Daftar",
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
                ],
              ),
            ),
          ],
        ));
  }
}
