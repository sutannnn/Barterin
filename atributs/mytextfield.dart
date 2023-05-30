// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyTF extends StatefulWidget {
  const MyTF({
    Key? key,
    required this.txt,
    required this.ot,
    required this.inpType,
    required this.width,
    required this.height,
    required this.tr,
    required this.tl,
    required this.br,
    required this.bl,
    required this.fs,
    required this.controller,
  }) : super(key: key);

  final String txt;
  final bool  ot;
  final TextInputType inpType;
  final double width;
  final double height;
  final double tr;
  final double tl;
  final double br;
  final double bl;
  final double fs;
  final TextEditingController controller;

  @override
  State<MyTF> createState() => _MyTFState(txt, inpType, width, height, tr, tl, br, bl, fs, ot, controller);
}

class _MyTFState extends State<MyTF> {
  _MyTFState(this.txt, this.inpType, this.width, this.height, this.tr, this.tl, this.br, this.bl, this.fs, this.ot, this.controller);

  final String txt;
  final bool  ot;
  final TextInputType inpType;
  final double width;
  final double height;
  final double tr;
  final double tl;
  final double br;
  final double bl;
  final double fs;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(height: height, width: width),
      child: TextField(
        controller: controller,
        obscureText: ot,
        keyboardType: inpType,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: txt,
          labelStyle:
              TextStyle(color: Color.fromRGBO(157, 154, 154, 1), fontSize: fs),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(214, 214, 214, 1)),
              borderRadius: BorderRadius.only(topRight: Radius.circular(tr), topLeft: Radius.circular(tl), bottomLeft: Radius.circular(bl), bottomRight: Radius.circular(br))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(214, 214, 214, 1)),
              borderRadius: BorderRadius.only(topRight: Radius.circular(tr), topLeft: Radius.circular(tl), bottomLeft: Radius.circular(bl), bottomRight: Radius.circular(br))),
        ),
      ),
    );
  }
}
