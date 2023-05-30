import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/atributs/mybutton.dart';
import 'package:flutter_application_1/forgotpassword/newpassword.dart';

class FixPassword extends StatelessWidget {
  const FixPassword({super.key});

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
              Center(child: Text("Dimohon untuk mengisi Kode Verifikasi")),
              Center(child: Text("yang telah kami kirim Via Email")),
              Padding(
                padding: const EdgeInsets.only(bottom: 22, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [MyCode(), MyCode(), MyCode(), MyCode()],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 22),
                child: TextButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const PhoneNumber())
                    // );
                  },
                  child: Text(
                    "Kirim Kode Kembali",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              MyButton(
                  txt: "Verifikasi",
                  fs: 14,
                  onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => NewPassword()));
                      },
                  width: 276,
                  height: 49,
                  tr: 8,
                  tl: 8,
                  br: 8,
                  bl: 8),
            ],
          ),
        ),
      ],
    ));
  }
}

class MyCode extends StatelessWidget {
  const MyCode({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(height: 50, width: 63),
      child: TextField(
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
        ],
        style: TextStyle(fontSize: 25),
        textAlign: TextAlign.center,
        obscuringCharacter: "*",
        obscureText: true,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(214, 214, 214, 1)),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(214, 214, 214, 1)),
              borderRadius: BorderRadius.all(Radius.circular(8))),
        ),
      ),
    );
  }
}
