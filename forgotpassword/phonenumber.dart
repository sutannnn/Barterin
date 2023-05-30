
import 'package:flutter/material.dart';
import 'package:flutter_application_1/atributs/mybutton.dart';
import 'package:flutter_application_1/forgotpassword/fixpassword2.dart';
import '../atributs/mytextbutton.dart';
import '../atributs/mytextfield.dart';
import 'email.dart';

class PhoneNumber extends StatelessWidget {
  PhoneNumber({super.key});
  
  TextEditingController _nomor = TextEditingController();

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
                  "Lupa Sandi",
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
                  child: Image(image: AssetImage('images/duck.jpg')),
                ),
              ),
              MyTF(txt: "Nomor Telepon", inpType: TextInputType.phone, width: 276, height: 46, tr: 8, tl: 8, br: 8, bl: 8, fs: 15, ot: false, controller: _nomor,),
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 30),
                child: Container(
                  width: 264,
                  height: 46,
                  child: Text(
                    "Dimohon untuk masukkan nomor untuk mendapatkan kode verifikasi",
                    style: TextStyle(
                      fontSize: 15
                    ),
                  )
                ),
              ),
              MyButton(txt: "Kirim Kode", fs: 14, onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => FixPassword2()));
                      }, width: 276, height: 49, tr: 8, tl: 8, br: 8, bl: 8),
              Padding(
                padding: const EdgeInsets.only(top: 37),
                child: MytextButton(txt: "Coba Dengan Email?", cls: Email(), clr: Colors.black, fs: 15, fw: FontWeight.bold, td: TextDecoration.none),
              ),
            ],
          ),
        ),
      ],
    )
    );
  }
}