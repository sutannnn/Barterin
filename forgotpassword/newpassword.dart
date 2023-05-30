
import 'package:flutter/material.dart';
import 'package:flutter_application_1/atributs/mybutton.dart';
import 'package:flutter_application_1/atributs/mytextfield.dart';
import '../signup/signin.dart';

class NewPassword extends StatelessWidget {
  NewPassword({super.key});
  TextEditingController _sandi = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
    body: new Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(image: new AssetImage("images/bg.png"), fit: BoxFit.cover,),
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
                padding: const EdgeInsets.only(top: 46, bottom: 40),
                child: Text(
                  "Verifikasi",
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: new Container(
                  width: 130,
                  height: 120,
                  child: Image(image: AssetImage('images/lock.png')),
                ),
              ),
              MyTF(txt: "Sandi Baru", inpType: TextInputType.text, width: 276, height: 46, tr: 8, tl: 8, br: 8, bl: 8, fs: 15, ot: true, controller: _sandi,),
              Padding(
                padding: const EdgeInsets.only(top: 35, bottom: 35),
                child: MyTF(txt: "Ulang Sandi", inpType: TextInputType.text, width: 276, height: 46, tr: 8, tl: 8, br: 8, bl: 8, fs: 15, ot: true, controller: _sandi,)
              ),
              MyButton(txt: "Simpan", fs: 14, onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
                      }, width: 276, height: 49, tr: 8, tl: 8, br: 8, bl: 8),
            ],
          ),
        ),
      ],
    )
    );
  }
}