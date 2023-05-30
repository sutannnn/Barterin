import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  const MyButton({super.key, required this.txt, required this.width, required this.height, required this.tr, required this.tl, required this.br, required this.bl, required this.fs, required this.onTap});
  
  final String txt;
  final double fs;
  final double width;
  final double height;
  final double tr;
  final double tl;
  final double br;
  final double bl;
  final Function onTap;

  @override
  State<MyButton> createState() => _MyButtonState(txt, width, height, tr, tl, br, bl, fs, onTap);
}

class _MyButtonState extends State<MyButton> {
  _MyButtonState(this.txt, this.width, this.height, this.tr, this.tl, this.br, this.bl, this.fs, this.onTap);
  
  final String txt;
  final double fs;
  final double width;
  final double height;
  final double tr;
  final double tl;
  final double br;
  final double bl;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(255, 145, 16, 1),
                Color.fromRGBO(251, 214, 115, 1)
              ]),
          borderRadius: BorderRadius.only(topRight: Radius.circular(tr), topLeft: Radius.circular(tl), bottomLeft: Radius.circular(bl), bottomRight: Radius.circular(br))),
      child: ElevatedButton(
        onPressed: () {
          onTap;
        },
        child: Text(txt, style: TextStyle(fontSize: fs),),
        style: ElevatedButton.styleFrom(
          elevation: 0,
            minimumSize: Size(width, height),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topRight: Radius.circular(tr), topLeft: Radius.circular(tl), bottomLeft: Radius.circular(bl), bottomRight: Radius.circular(br)),
            )),
      ),
    );
  }
}
