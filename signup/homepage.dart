import 'package:flutter/material.dart';
import 'package:flutter_application_1/atributs/mybutton.dart';
import 'package:flutter_application_1/atributs/mytextbutton.dart';
import 'package:flutter_application_1/signup/signup.dart';
import '../atributs/button.dart';
import 'signin.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomePage2();
  }
}

class HomePage2 extends StatelessWidget {
  final Gradient gradient;

  const HomePage2({
    Key? key,
    this.gradient = const LinearGradient(colors: [
      Color.fromRGBO(255, 145, 16, 1),
      Color.fromRGBO(251, 214, 115, 1)
    ]),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("images/cube.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        new Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 78),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Barterin",
                  style: TextStyle(
                    fontSize: 61,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Aplikasi Barter No. 1 Di Indonesia",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        new Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignIn()));
                    },
                    child: Text(
                      "Mulai",
                      style: TextStyle(fontSize: 14),
                    ),
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        minimumSize: Size(100, 50),
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  "Belum Punya Akun?",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
                MytextButton(
                  txt: "Daftar Sekarang",
                  cls: SignUp(),
                  clr: Colors.white,
                  fs: 30,
                  fw: FontWeight.bold,
                  td: TextDecoration.none,
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
